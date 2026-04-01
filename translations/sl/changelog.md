# Dnevnik sprememb - AZD For Beginners

## Uvod

Ta dnevnik sprememb dokumentira vse opazne spremembe, posodobitve in izboljšave v repozitoriju AZD For Beginners. Sledimo načelom semantičnega verzioniranja in vzdržujemo ta zapis, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z ogledom tega dnevnika sprememb boste:
- Ostali obveščeni o novih funkcijah in dodatkih vsebin
- Razumeli izboljšave obstoječe dokumentacije
- Sledili popravkom napak in korekcijam za zagotavljanje natančnosti
- Spremljali razvoj učnih gradiv skozi čas

## Pričakovani rezultati učenja

Po pregledu vnosov v dnevniku sprememb boste lahko:
- Prepoznali novo vsebino in vire, ki so na voljo za učenje
- Razumeli, katere razdelke so posodobili ali izboljšali
- Načrtovali svojo učno pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.19.1] - 2026-03-27

#### Poenostavitev uvajanja za začetnike, validacija nastavitve in čiščenje končnih AZD ukazov
**Ta različica sledi pregledu validacije AZD 1.23 z začetniško usmerjenim pregledom dokumentacije: pojasnjuje vodnik za avtentikacijo z osrednjo rabo AZD, dodaja lokalne skripte za validacijo nastavitve, preverja ključne ukaze z živo AZD CLI in odstrani zadnje zastarele sklice na ukaze iz angleškega izvora izven dnevnika sprememb.**

#### Dodano
- **🧪 Skripte za validacijo začetne nastavitve** z `validate-setup.ps1` in `validate-setup.sh`, da se učenci lahko prepričajo o prisotnosti potrebnih orodij pred začetkom 1. poglavja
- **✅ Koraki za preverjanje nastavitve na začetku** v root README in Chapter 1 README, da se manjkajoče predpogoje zazna pred `azd up`

#### Spremenjeno
- **🔐 Navodila za avtentikacijo za začetnike** zdaj dosledno obravnavajo `azd auth login` kot glavno pot za AZD delovne tokove, pri čemer je `az login` izpostavljen kot opcija, razen če se Azure CLI ukazi uporabljajo neposredno
- **📚 Uvodni potek v 1. poglavju** zdaj usmerja učence, da pred namestitvijo, avtentikacijo in prvimi koraki nameščanja najprej validirajo svojo lokalno nastavitev
- **🛠️ Sporočila validatorja** zdaj jasno ločijo blokirne zahteve od opcijskih opozoril Azure CLI za pot, namenjeno le začetnikom z AZD
- **📖 Konfiguracijska, razhroščevalna in primerna dokumentacija** zdaj razlikuje med zahtevano AZD avtentikacijo in opcijskim prijavljanjem v Azure CLI tam, kjer sta bila prej predstavljena brez konteksta

#### Popravljeno
- **📋 Preostali sklici na ukaze v angleškem izvirniku** posodobljeni na trenutno AZD obliko, vključno z `azd config show` v preverilnem listu in `azd monitor --overview` tam, kjer je bil mišljen vodnik za pregled v Azure Portalu
- **🧭 Trditve za začetnike v 1. poglavju** omiljene, da se izogne pretiranemu obljubljanju zagotovljenega delovanja brez napak ali avtomatske povrnitve za vse predloge in Azure vire
- **🔎 Validacija v živo z CLI** potrdila trenutno podporo za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` in `azd down --force --purge`

#### Datoteke posodobljene
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

#### Validacija AZD 1.23.12, razširitev okolja delavnice in osvežitev AI modelov
**Ta različica izvaja pregled dokumentacije v skladu z `azd` `1.23.12`, posodablja zastarele primere ukazov AZD, osvežuje smernice za AI modele na trenutne privzete nastavitve ter širi navodila za delavnico onkraj GitHub Codespaces tako, da podpirajo tudi dev containere in lokalne klone.**

#### Dodano
- **✅ Opombe o validaciji v jedrnih poglavjih in dokumentih delavnice** za jasno navedbo testirane osnovne različice AZD za učence, ki uporabljajo novejše ali starejše CLI gradnje
- **⏱️ Smernice za časovno omejitev nameščanja** za dolgotrajna nameščanja AI aplikacij z uporabo `azd deploy --timeout 1800`
- **🔎 Koraki za inšpekcijo razširitev** z `azd extension show azure.ai.agents` v dokumentaciji delovnega toka AI
- **🌐 Širša navodila za okolje delavnice** zajemajo GitHub Codespaces, dev containere in lokalne klone z MkDocs

#### Spremenjeno
- **📚 Uvodni README-i poglavij** zdaj dosledno navajajo validacijo proti `azd 1.23.12` v poglavjih foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting in production
- **🛠️ Sklici na AZD ukaze** posodobljeni na trenutne oblike v celotni dokumentaciji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ali `azd env get-value(s)` glede na kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kjer je mišljen pregled Application Insights
- **🧪 Primeri predogleda zagotavljanja** poenostavljeni v trenutno podprto rabo, kot je `azd provision --preview` in `azd provision --preview -e production`
- **🧭 Potek delavnice** posodobljen, da lahko udeleženci zaključijo vaje v Codespaces, dev containerju ali lokalnem klonu, namesto da se predpostavlja izvajanje samo v Codespaces
- **🔐 Navodila za avtentikacijo** zdaj dajejo prednost `azd auth login` za AZD delovne tokove, pri čemer je `az login` prikazan kot opcija, kadar se uporabljajo ukazi Azure CLI neposredno

#### Popravljeno
- **🪟 Ukazi za namestitev na Windows** normalizirani na trenutno uporabo zapisovanja paketov `winget` v vodiču za namestitev
- **🐧 Navodila za namestitev na Linux** popravljena, da se izognejo nepodprtim distro-specifičnim navodilom za paketnike `azd` in namesto tega kažejo na izdane artefakte, kjer je primerno
- **📦 Primeri AI modelov** osveženi iz starejših privzetih, kot so `gpt-35-turbo` in `text-embedding-ada-002`, na trenutne primere, kot so `gpt-4.1-mini`, `gpt-4.1` in `text-embedding-3-large`
- **📋 Odseki za nameščanje in diagnostiko** popravljeni, da uporabljajo trenutne ukaze za okolje in stanje v dnevnikih, skriptah in korakih za odpravljanje težav
- **⚙️ Navodila za GitHub Actions** posodobljena iz `Azure/setup-azd@v1.0.0` v `Azure/setup-azd@v2`
- **🤖 Navodila glede MCP/Copilot soglasja** posodobljena iz `azd mcp consent` v `azd copilot consent list`

#### Izboljšano
- **🧠 Poglavje o AI** zdaj bolje pojasnjuje obnašanje `azd ai` občutljivo na predogled, prijavo, specifično za najemnika, uporabo trenutnih razširitev in posodobljena priporočila za nameščanje modelov
- **🧪 Navodila delavnice** zdaj uporabljajo bolj realistične primere različic in jasnejši jezik za nastavitev okolja za praktične vaje
- **📈 Dokumenti za proizvodnjo in odpravljanje težav** so zdaj bolj usklajeni s trenutnim spremljanjem, rezervnimi modeli in primeri stroškovnih stopenj

#### Datoteke posodobljene
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

#### AZD AI CLI ukazi, validacija vsebine in širitev predlog
**Ta različica dodaja pokritost ukazov `azd ai`, `azd extension` in `azd mcp` v vseh poglavjih, povezanih z AI, popravi pokvarjene povezave in zastarelo kodo v agents.md, posodobi preverilni list in preuredi razdelek Primeri predlog z validiranimi opisi in novimi Azure AI AZD predlogami.**

#### Dodano
- **🤖 Pokritost AZD AI CLI** v 7 datotekah (prej le v 8. poglavju):
  - `docs/chapter-01-foundation/azd-basics.md` — Novo poglavje "Extensions and AI Commands", ki uvaja `azd extension`, `azd ai agent init` in `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s primerjalno tabelo (predloga proti manifest pristopu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podpoglavji "AZD Extensions for Foundry" in "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Hitri začetek zdaj prikazuje poti nameščanja tako na osnovi predloge kot manifestov
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Razdelek Deploy zdaj vključuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podpoglavje "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Novo poglavje "AI & Extensions Commands" z `azd extension`, `azd ai agent init`, `azd mcp` in `azd infra generate`
- **📦 Nove AZD AI primerne predloge** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG klepet z Blazor WebAssembly, Semantic Kernel in podporo za glasovno klepetanje
  - **azure-search-openai-demo-java** — Java RAG klepet z uporabo Langchain4J z možnostmi nameščanja na ACA/AKS
  - **contoso-creative-writer** — Večagentna aplikacija za ustvarjalno pisanje z uporabo Azure AI Agent Service, Bing Grounding in Prompty
  - **serverless-chat-langchainjs** — Serverless RAG z uporabo Azure Functions + LangChain.js + Cosmos DB in lokalno podporo Ollama za razvoj
  - **chat-with-your-data-solution-accelerator** — Poslovni RAG pospeševalnik z upravljalskim portalom, integracijo v Teams in možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Večagentna referenčna aplikacija za orkestracijo MCP s strežniki v .NET, Python, Java in TypeScript
  - **azd-ai-starter** — Minimalna Bicep predloga za infrastrukturo Azure AI
  - **🔗 Povezava do Awesome AZD AI Galerije** — Sklic na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ predlog)

#### Popravljeno
- **🔗 Navigacija v agents.md**: Povezavi Previous/Next so zdaj usklajeni z vrstnim redom lekcij v README poglavja 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Pokvarjene povezave v agents.md**: `production-ai-practices.md` popravljeno v `../chapter-08-production/production-ai-practices.md` (3 pojavitve)
- **📦 Zastarela koda v agents.md**: `opencensus` zamenjan z `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neveljaven API v agents.md**: `max_tokens` premaknjen iz `create_agent()` v `create_run()` kot `max_completion_tokens`
- **🔢 Štetje žetonov v agents.md**: Grobo oceno `len//4` zamenjali z `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Popravljene storitve iz "Cognitive Search + App Service" v "Azure AI Search + Azure Container Apps" (privzeti gostitelj spremenjen okt 2024)
- **contoso-chat**: Posodobljen opis, da se sklicuje na Azure AI Foundry + Prompty, usklajeno s dejanskim naslovom in tehnologijo repozitorija

#### Odstranjeno
- **ai-document-processing**: Odstranjen sklic na nedelujočo predlogo (repozitorij ni javno dostopen kot AZD predloga)

#### Izboljšano
- **📝 agents.md vaje**: Vaja 1 zdaj prikazuje pričakovani izhod in korak `azd monitor`; Vaja 2 vključuje celotno kodo registracije `FunctionTool`; Vaja 3 zamenja nejasna navodila s konkretnimi ukazi `prepdocs.py`
- **📚 agents.md viri**: Posodobljene povezave do dokumentacije za trenutne Azure AI Agent Service docs in hitri začetek
- **📋 agents.md tabela Next Steps**: Dodana povezava AI Workshop Lab za popolno pokritost poglavja

#### Posodobljene datoteke
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Izboljšava navigacije po tečaju
**Ta različica izboljša navigacijo poglavij v README.md z izboljšano tabelo.**

#### Spremenjeno
- **Tabela Course Map**: Izboljšana s povezavami na posamezne lekcije, ocenami trajanja in ocenami kompleksnosti
- **Čiščenje map**: Odstranjene podvajajoče se stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Preverjanje povezav**: Overjenih vseh 21+ notranjih povezav v tabeli Course Map

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodobi sklice na izdelke v skladu s trenutnim Microsoftovim blagovnim znamčenjem.**

#### Spremenjeno
- **Microsoft Foundry → Microsoft Foundry**: Vsi sklici posodobljeni v ne-prevodnih datotekah
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno, da odraža trenutno blagovno znamko

#### Posodobljene datoteke
- `README.md` - Glavna začetna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik za AI agente
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Začetna stran delavnice
- `workshop/docs/index.md` - Indeks delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke z navodili za delavnico

---

### [v3.15.0] - 2026-02-05

#### Velika prestrukturacija repozitorija: mape po poglavjih
**Ta različica prestrukturira dokumentacijo v namensko razdeljene mape poglavij za lažjo navigacijo.**

#### Preimenovanje map
Stare mape so bile zamenjane z mapami, oštevilčenimi po poglavjih:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano novo: `docs/chapter-05-multi-agent/`

#### Migracije datotek
| Datoteka | Iz | V |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke poglavij**: Ustvarjen README.md v vsaki mapi poglavja z:
  - Cilji učenja in pričakovano trajanje
  - Tabela lekcij z opisi
  - Hitri začetni ukazi
  - Navigacija do drugih poglavij

#### Spremenjeno
- **🔗 Posodobljene vse notranje povezave**: 78+ poti posodobljenih po vseh datotekah
- **🗺️ Glavni README.md**: Posodobljen Course Map z novo strukturo poglavij
- **📝 examples/README.md**: Posodobljene medsebojne sklice na mape poglavij

#### Odstranjeno
- Stare mape (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Prestrukturiranje repozitorija: navigacija po poglavjih
**Ta različica je dodala README datoteke za navigacijo po poglavjih (kasneje nadomeščeno z v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodnik za AI agente
**Ta različica doda obsežen vodič za nameščanje AI agentov z Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Celovit vodič, ki pokriva:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnikov
  - Tri predloge za hitro začetek agentov (Foundry Agents, Prompty, RAG)
  - Vzorec arhitekture agentov (en sam agent, RAG, multi-agent)
  - Konfiguracija orodij in prilagoditve
  - Spremljanje in sledenje merilnikom
  - Stroškovne razmisleke in optimizacijo
  - Pogoste težave in odpravljanje napak
  - Tri praktične vaje s kriteriji uspeha

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hitri začetek**: Nameščanje agentov z `azd init --template get-started-with-ai-agents`
- **Arhitekturni vzorci**: Vizualne sheme vzorcev agentov
- **Konfiguracija**: Namestitev orodij in okoljske spremenljivke
- **Spremljanje**: Integracija Application Insights
- **Vaje**: Postopno praktično učenje (20–45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev okolja DevContainer
**Ta različica posodobi konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za izkušnjo učenja AZD.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljeno iz `python:3.12-bullseye` na `python:3.12-bookworm` (najbolj stabilna verzija Debian)
- **📛 Ime kontejnerja**: Preimenovano iz "Python 3" v "AZD for Beginners" za jasnost

#### Dodano
- **🔧 Nove funkcije Dev Container**:
  - `azure-cli` z omogočeno podporo za Bicep
  - `node:20` (LTS verzija za AZD predloge)
  - `github-cli` za upravljanje predlog
  - `docker-in-docker` za nameščanje container appov

- **🔌 Posredovanje vrat**: Prednastavljena vrata za pogosto razvojno rabo:
  - 8000 (predogled MkDocs)
  - 3000 (spletne aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-ji)

- **🧩 Nove razširitve VS Code**:
  - `ms-python.vscode-pylance` - Izboljšan Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora za Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora za Docker
  - `ms-azuretools.vscode-bicep` - Podpora za jezik Bicep
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure virov
  - `yzhang.markdown-all-in-one` - Urejanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Podpora za Mermaid diagrame
  - `redhat.vscode-yaml` - Podpora za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git-a
  - `mhutchie.git-graph` - Zgodovina Git-a

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Python interpreter, formatiranje ob shranjevanju in odstranjevanje belin

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan MkDocs minify vtičnik
  - Dodan pre-commit za kakovost kode
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Popravljeno
- **Ukaz po ustvarjanju**: Zdaj preveri namestitev AZD in Azure CLI ob zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenova README za začetnike
**Ta različica znatno izboljša README.md za lažjo dostopnost za začetnike in doda ključne vire za AI razvijalce.**

#### Dodano
- **🆚 Azure CLI vs AZD Primerjava**: Jasna razlaga, kdaj uporabiti katero orodje z praktičnimi primeri
- **🌟 Awesome AZD povezave**: Neposredne povezave do galerije predlogov in virov za prispevke skupnosti:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predlog za takojšnje nameščanje
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Prispevanje predlog skupnosti
- **🎯 Hitri začetek**: Poenostavljen 3-korak vodič (Namesti → Prijava → Namešči)
- **📊 Tabela navigacije glede na izkušnje**: Jasna smernica, kje začeti glede na raven razvijalca

#### Spremenjeno
- **Struktura README**: Preureditev za postopno razkrivanje - ključne informacije na vrhu
- **Uvodni razdelek**: Predelano razlago "Čarovnije `azd up`" za popolne začetnike
- **Odstranjena podvojena vsebina**: Odstranjen podvojen razdelek za odpravljanje napak
- **Ukazi za odpravljanje napak**: Popravljena referenca `azd logs` v `azd monitor --logs`

#### Popravljeno
- **🔐 Ukazi za avtentikacijo**: Dodani `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Neveljavne reference ukazov**: Odstranjen preostali `azd logs` iz razdelka za odpravljanje napak v README

#### Opombe
- **Obseg**: Spremembe uporabljene v glavnem README.md in resources/cheat-sheet.md
- **Ciljna publika**: Izboljšave namenjene razvijalcem, novim za AZD

---

### [v3.10.0] - 2026-02-05

#### Popravki ukazov Azure Developer CLI
**Ta različica popravi neobstoječe AZD ukaze po dokumentaciji, tako da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Popravljeno
- **🔧 Odstranjeni neobstoječi AZD ukazi**: Celovit pregled in popravki neveljavnih ukazov:
  - `azd logs` (ne obstaja) → zamenjano z `azd monitor --logs` ali alternativami Azure CLI
  - `azd service` podukazi (ne obstajajo) → zamenjano z `azd show` in Azure CLI
  - `azd infra import/export/validate` (ne obstaja) → odstranjeno ali zamenjano z veljavnimi alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne obstajajo) → odstranjene
  - `azd provision --what-if/--rollback` zastavice (ne obstajajo) → posodobljeno za uporabo `--preview`
  - `azd config validate` (ne obstaja) → zamenjano z `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne obstajajo) → odstranjeni

- **📚 Datoteke posodobljene z popravki ukazov**:
  - `resources/cheat-sheet.md`: Obsežna prenova referenc ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije rollback
  - `docs/troubleshooting/debugging.md`: Popravljeni razdelki za analizo dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi za odpravljanje težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljen razdelek za odpravljanje napak v AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za spremljanje
  - `docs/getting-started/first-project.md`: Posodobljeni primeri spremljanja in odpravljanja napak
  - `docs/getting-started/installation.md`: Popravljeni primeri pomoči in verzij
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za ogled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za odpravljanje napak agentov

- **📝 Posodobitev referenc verzij**: 
  - `docs/getting-started/installation.md`: Spremenjena trdo kodirana verzija `1.5.0` v generično `1.x.x` z povezavo na izdajne strani

#### Spremenjeno
- **Strategije rollback**: Dokumentacija posodobljena za uporabo rollbacka na podlagi Git (AZD nima nativnega rollbacka)
- **Ogled dnevnikov**: Reference `azd logs` zamenjane z `azd monitor --logs`, `azd monitor --live` in Azure CLI ukazi
- **Razdelek o zmogljivosti**: Odstranjene neobstoječe zastavice za vzporedno/incrementalno nameščanje, dodane veljavne alternative

#### Tehnični podatki
- **Veljavni AZD ukazi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavne zastavice ukaza azd monitor**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Preverjanje**: Ukazi preverjeni proti Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončanje delavnice in posodobitev kakovosti dokumentacije
**Ta različica dokonča interaktivne module delavnice, odpravi vse prekinjene dokumentacijske povezave in izboljša splošno kakovost vsebine za razvijalce AI, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument smernic za prispevke z:
  - Jasnimi navodili za poročanje o težavah in predlaganje sprememb
  - Standardi dokumentacije za novo vsebino
  - Smernicami za primere kode in konvencijami sporočil commitov
  - Informacijami o vključevanju skupnosti

#### Dokončano
- **🎯 Workshop Module 7 (Wrap-up)**: Popolnoma dokončan zaključni modul z:
  - Celovitim povzetkom dosežkov delavnice
  - Sekcijo ključnih pojmov, ki zajema AZD, predloge in Microsoft Foundry
  - Priporočili za nadaljevanje učne poti
  - Izzivi delavnice z oceno zahtevnosti
  - Povezavami za povratne informacije skupnosti in podporo

- **📚 Workshop Module 3 (Deconstruct)**: Posodobljeni učni cilji z:
  - Navodili za aktivacijo GitHub Copilot s strežniki MCP
  - Razumevanjem strukture map predlog AZD
  - Vzorec organizacije infrastrukture kot kode (Bicep)
  - Navodili za praktično laboratorijsko delo

- **🔧 Workshop Module 6 (Teardown)**: Dokončano z:
  - Cilji čiščenja virov in upravljanja stroškov
  - Uporabo `azd down` za varno razgradnjo infrastrukture
  - Navodili za obnovitev mehko izbrisanih kognitivnih storitev
  - Dodatnimi predlogi za raziskovanje GitHub Copilota in Azure Portala

#### Popravljeno
- **🔗 Popravljene prekinjene povezave**: Odpravljeno 15+ prekinjenih notranjih dokumentacijskih povezav:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljene poti do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljene poti do ai-model-deployment.md in production-ai-practices.md
  - `docs/getting-started/first-project.md`: Nadomeščen neobstoječi cicd-integration.md z deployment-guide.md
  - `examples/retail-scenario.md`: Popravljene poti do pogostih vprašanj in vodnika za odpravljanje težav
  - `examples/container-app/microservices/README.md`: Popravljene poti do domače strani tečaja in vodnika za nameščanje
  - `resources/faq.md` in `resources/glossary.md`: Posodobljene reference poglavja AI
  - `course-outline.md`: Popravljene reference inštruktorjev in laboratorijskih vaj AI

- **📅 Workshop Status Banner**: Posodobljena iz "Under Construction" v aktivno stanje delavnice z datumom februar 2026

- **🔗 Workshop Navigation**: Popravljene prekinjene navigacijske povezave v workshop README.md, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Predstavitev delavnice**: Odstranjeno opozorilo "under construction", delavnica je zdaj dokončana in pripravljena za uporabo
- **Konsistentnost navigacije**: Zagotovljeno, da imajo vsi moduli delavnice ustrezno medsebojno navigacijo
- **Reference učne poti**: Posodobljene medpoglavne reference za uporabo pravilnih microsoft-foundry poti

#### Preverjeno
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so dokončani z učnimi cilji
- ✅ Navigacija med poglavji in moduli deluje pravilno
- ✅ Vsebine so primerne za razvijalce AI, ki uporabljajo Microsoft AZD
- ✅ Ohranjena je jezikovna in strukturna prijaznost za začetnike
- ✅ CONTRIBUTING.md zagotavlja jasna navodila za prispevke skupnosti

#### Tehnična implementacija
- **Preverjanje povezav**: Samodejni PowerShell skript preveril vse notranje povezave v .md datotekah
- **Pregled vsebine**: Ročni pregled popolnosti delavnice in primernosti za začetnike
- **Navigacijski sistem**: Uporabljeni dosledni vzorci navigacije poglavij in modulov

#### Opombe
- **Obseg**: Spremembe uporabljene samo v angleški dokumentaciji
- **Prevodi**: Mape s prevodi v tej različici niso posodobljene (samodejni prevod bo sinhroniziran kasneje)
- **Trajanje delavnice**: Dokončana delavnica sedaj nudi 3-4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Spremljanje, varnost in vzorci za večagentno koordinacijo
**Ta različica dodaja obsežna A-ravni poučevanja o integraciji Application Insights, vzorcih overjanja in koordinacije več agentov za produkcijske namestitve.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - AZD-osredotočena namestitev z avtomatskim zagotavljanjem
  - Celotne Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojeno telemetrijo (1.200+ vrstic)
  - Vzorci spremljanja AI/LLM (sledenje tokenov/stroškov Microsoft Foundry Models)
  - 6 diagramov Mermaid (arhitektura, distribuirano sledenje, pretok telemetrije)
  - 3 praktične vaje (alarms, nadzorne plošče, spremljanje AI)
  - Primeri poizvedb Kusto in strategije optimizacije stroškov
  - Pretakanje metrik v živo in razhroščevanje v realnem času
  - 40–50 minut učenja z vzorci pripravljenimi za produkcijo

- **🔐 Lekcija o vzorcih overjanja in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci overjanja (connection strings, Key Vault, managed identity)
  - Celotne Bicep infrastrukturne predloge za varne namestitve
  - Node.js koda aplikacije z integracijo Azure SDK
  - 3 celovite vaje (omogočanje managed identity, user-assigned identity, rotacija Key Vault)
  - Najboljše varnostne prakse in konfiguracije RBAC
  - Vodnik za odpravljanje težav in analiza stroškov
  - Produkcijsko pripravljeni vzorci avtentikacije brez gesel

- **🤖 Lekcija o vzorcih koordinacije več agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (sekvenčni, vzporedni, hierarhični, dogodkovno voden, konsenz)
  - Celotna implementacija orchestrator storitve (Python/Flask, 1.500+ vrstic)
  - 3 specializirane implementacije agentov (Research, Writer, Editor)
  - Integracija Service Bus za čakalniške vrste sporočil
  - Upravljanje stanja v Cosmos DB za distribuirane sisteme
  - 6 diagramov Mermaid, ki prikazujejo interakcije agentov
  - 3 napredne vaje (obravnava časovnih omejitev, logika ponovitev, circuit breaker)
  - Pregled stroškov ($240-565/month) s strategijami optimizacije
  - Integracija Application Insights za spremljanje

#### Izboljšano
- **Poglavje Pred namestitvijo**: Zdaj vključuje obsežno spremljanje in vzorce koordinacije
- **Poglavje Začetek**: Izboljšano z profesionalnimi vzorci overjanja
- **Priprava za produkcijo**: Popolno pokritje od varnosti do opaznosti
- **Načrt tečaja**: Posodobljen z referencami na nove lekcije v poglavjih 3 in 6

#### Spremenjeno
- **Napredek učenja**: Boljša integracija varnosti in spremljanja skozi celoten tečaj
- **Kakovost dokumentacije**: Dosledni A-ravni standardi (95-97%) za nove lekcije
- **Produkcijski vzorci**: Popolno end-to-end pokritje za enterprise namestitve

#### Izboljšano
- **Izkušnja razvijalca**: Jasna pot od razvoja do produkcijskega spremljanja
- **Varnostni standardi**: Profesionalni vzorci za overjanje in upravljanje skrivnosti
- **Opaznost**: Popolna integracija Application Insights z AZD
- **Obremenitve AI**: Specializirano spremljanje za Microsoft Foundry Models in večagentne sisteme

#### Preverjeno
- ✅ Vse lekcije vključujejo delujočo kodo (ne le izvlečkov)
- ✅ Diagrami Mermaid za vizualno učenje (19 skupaj v 3 lekcijah)
- ✅ Praktične vaje z verifikacijskimi koraki (9 skupaj)
- ✅ Produkcijsko pripravljene Bicep predloge, ki jih je mogoče namestiti z `azd up`
- ✅ Analize stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje težav in najboljše prakse
- ✅ Preverjalne točke znanja z ukazi za preverjanje

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Celovit vodnik za spremljanje
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne večagentne arhitekture
- **Splošna nova vsebina**: - Dosledno visoki standardi kakovosti

#### Tehnična implementacija
- **Application Insights**: Log Analytics + prilagojena telemetrija + distribuirano sledenje
- **Avtentikacija**: Managed Identity + Key Vault + vzorci RBAC
- **Večagentno**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Spremljanje**: Metrike v živo + poizvedbe Kusto + opozorila + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike zadrževanja, kontrole proračuna

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Microsoft Foundry Models
**Ta različica izboljša kakovost dokumentacije po celotnem repozitoriju in doda popoln primer razmestitve Microsoft Foundry Models z vmesnikom za klepet gpt-4.1.**

#### Dodano
- **🤖 Primer klepetanja z Microsoft Foundry Models**: Popolna namestitev gpt-4.1 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Celotna infrastruktura Microsoft Foundry Models (namestitev modela gpt-4.1)
  - Python ukazno-vrstični klepet s shranjeno zgodovino pogovorov
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje uporabi tokenov in ocena stroškov
  - Omejevanje zahtev in obravnava napak
  - Celosten README z 35–45 minutnim vodnikom za namestitev
  - 11 datotek pripravljenih za produkcijo (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Vaje za dokumentacijo**: Dodane praktične vaje v vodnik konfiguracije:
  - Vaja 1: Konfiguracija za več okolij (15 minut)
  - Vaja 2: Vaja upravljanja skrivnosti (10 minut)
  - Jasna merila uspeha in koraki za preverjanje
- **✅ Preverjanje namestitve**: Dodana sekcija za verifikacijo v vodnik namestitve:
  - Postopki za preverjanje zdravstvenega stanja
  - Kontrolni seznam meril uspeha
  - Pričakovani izhodi za vse ukaze namestitve
  - Hiter pregled za odpravljanje težav

#### Izboljšano
- **examples/README.md**: Posodobljen na A-raven (93%):
  - Dodan azure-openai-chat v vse ustrezne razdelke
  - Posodobljeno število lokalnih primerov z 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v Hiter začetek za uporabnike s srednjo stopnjo znanja
  - Dodano v razdelek Microsoft Foundry predlog
  - Posodobljena primerjalna matrika in razdelki s tehnologijami
- **Kakovost dokumentacije**: Izboljšana iz B+ (87%) → A- (92%) v mapi docs:
  - Dodani pričakovani izhodi za ključne primere ukazov
  - Vključeni koraki preverjanja za spremembe konfiguracije
  - Izboljšano praktično učenje z uporabnimi vajami

#### Spremenjeno
- **Napredek učenja**: Boljša integracija AI primerov za uporabnike s srednjo stopnjo
- **Struktura dokumentacije**: Več konkretnih vaj z jasnimi rezultati
- **Postopek preverjanja**: Dodana jasna merila uspeha za ključne poteke dela

#### Izboljšano
- **Izkušnja razvijalca**: Namestitev Microsoft Foundry Models zdaj traja 35–45 minut (v primerjavi z 60–90 za kompleksne alternative)
- **Pregled stroškov**: Jasne ocene stroškov ($50-200/month) za primer Microsoft Foundry Models
- **Učna pot**: Razvijalci AI imajo jasen vhod z azure-openai-chat
- **Standardi dokumentacije**: Dosledni pričakovani izhodi in koraki preverjanja

#### Preverjeno
- ✅ Primer Microsoft Foundry Models popolnoma delujoč z `azd up`
- ✅ Vseh 11 implementacijskih datotek sintaktično pravilnih
- ✅ Navodila v README se ujemajo z dejansko izkušnjo namestitve
- ✅ Dokumentacijske povezave posodobljene na 8+ mestih
- ✅ Indeks primerov pravilno odraža 4 lokalne primere
- ✅ Brez podvojenih zunanjih povezav v tabelah
- ✅ Vse navigacijske reference pravilne

#### Tehnična implementacija
- **Arhitektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps vzorec
- **Varnost**: Pripravljeno za Managed Identity, skrivnosti v Key Vault
- **Spremljanje**: Integracija Application Insights
- **Upravljanje stroškov**: Sledenje tokenom in optimizacija uporabe
- **Namestitev**: En ukaz `azd up` za popolno nastavitev

### [v3.6.0] - 2025-11-19

#### Velika posodobitev: Primeri namestitve Container App
**Ta različica uvaja obsežne, za produkcijo pripravljene primere namestitve kontejnerskih aplikacij z uporabo Azure Developer CLI (AZD), z obsežno dokumentacijo in vključitvijo v učno pot.**

#### Dodano
- **🚀 Primeri Container App**: Novi lokalni primeri v `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Celovit pregled kontejneriziranih namestitev, hiter začetek, produkcija in napredni vzorci
  - [Preprost Flask API](../../examples/container-app/simple-flask-api): Prijazen REST API za začetnike z scale-to-zero, health probes, spremljanjem in odpravljanjem težav
  - [Arhitektura mikrostoritev](../../examples/container-app/microservices): Produkcijsko pripravljen večstoriten razpored (API Gateway, Product, Order, User, Notification), asinhrono posredovanje sporočil, Service Bus, Cosmos DB, Azure SQL, distribuirano sledenje, blue-green/canary nameščanje
- **Najboljše prakse**: Varnost, spremljanje, optimizacija stroškov in smernice CI/CD za kontejnerske obremenitve
- **Primeri kode**: Popoln `azure.yaml`, Bicep predloge in implementacije storitev v več jezikih (Python, Node.js, C#, Go)
- **Testiranje in odpravljanje težav**: Scenariji end-to-end testiranja, ukazi za spremljanje, vodnik za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljeno, da vključuje in poveže nove primere aplikacij v vsebnikih v razdelku "Lokalni primeri - Aplikacije v vsebnikih"
- **examples/README.md**: Posodobljeno, da izpostavi primere aplikacij v vsebnikih, doda vnose v matriko primerjav in posodobi sklice na tehnologije/arhitekturo
- **Course Outline & Study Guide**: Posodobljeno, da v ustreznih poglavjih sklicuje na nove primere aplikacij v vsebnikih in vzorce razmestitve

#### Validated
- ✅ Vsi novi primeri so razmestljivi z `azd up` in sledijo najboljšim praksam
- ✅ Prekrižne povezave in navigacija v dokumentaciji posodobljene
- ✅ Primeri zajemajo od začetnih do naprednih scenarijev, vključno s produkcijskimi mikrostoritvami

#### Notes
- **Scope**: samo dokumentacija in primeri v angleščini
- **Next Steps**: Razširiti z dodatnimi naprednimi vzorci za vsebnike in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Ta izdaja izvaja celovito spremembo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preimenovanje Microsofta.**

#### Changed
- **🔄 Posodobitev imena izdelka**: Popolno preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljene vse reference v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: 23 vsebinskih referenc posodobljenih v 7 dokumentacijskih datotekah

- **📁 Spremembe strukture map**:
  - Mapa `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Vse prekrižne reference posodobljene, da odražajo novo strukturo map
  - Navigacijske povezave preverjene v celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Vse notranje povezave posodobljene tako, da sklicujejo na novo ime datoteke

#### Updated Files
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 reference imena izdelka posodobljene
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference posodobljene (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 prekrižne povezave posodobljene
  - `docs/getting-started/first-project.md` - 2 navigacijski povezavi poglavij posodobljeni
  - `docs/getting-started/installation.md` - 2 povezavi za naslednja poglavja posodobljeni
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference posodobljene (navigacija, skupnost Discord)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijska povezava posodobljena
  - `docs/troubleshooting/debugging.md` - 1 navigacijska povezava posodobljena

- **Datoteke strukture tečaja** (2 datoteki):
  - `README.md` - 17 referenc posodobljenih (pregled tečaja, naslovi poglavij, razdelek s predlogami, vpogledi skupnosti)
  - `course-outline.md` - 14 referenc posodobljenih (pregled, učni cilji, viri poglavij)

#### Validated
- ✅ Ni preostalih sklicev na pot mape "ai-foundry" v angleških dokumentih
- ✅ Ni več sklicev na ime izdelka "Microsoft Foundry" v angleških dokumentih
- ✅ Vse navigacijske povezave delujejo z novo strukturo map
- ✅ Preimenovanja datotek in map uspešno dokončana
- ✅ Prekrižne reference med poglavji preverjene

#### Notes
- **Scope**: Spremembe uporabljene samo v angleški dokumentaciji v mapi `docs/`
- **Translations**: Mape za prevode (`translations/`) v tej izdaji niso posodobljene
- **Workshop**: Gradiva delavnice (`workshop/`) v tej izdaji niso posodobljena
- **Examples**: Datoteke primerov morda še vedno vsebujejo sklice na staro poimenovanje (bodo urejene v prihodnji posodobitvi)
- **External Links**: Zunanje URL-je in sklici na GitHub repozitorij ostajajo nespremenjeni

#### Migration Guide for Contributors
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite sklice na mape: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite sklice na datoteke: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje dokumentacijske povezave še vedno delujejo

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Ta izdaja uvaja celovito podporo za novo funkcijo predogleda Azure Developer CLI in izboljšuje uporabniško izkušnjo delavnice.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Celovito pokritje nove zmožnosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v priročniku s kratkimi navodili
  - Podrobna integracija v vodniku za provisioniranje z uporabo primerov in prednosti
  - Integracija predhodnih preverjanj za varnejšo validacijo razmestitve
  - Posodobitve vodiča za začetek z varnostno usmerjenimi praksami razmestitve
- **🚧 Workshop Status Banner**: Profesionalna HTML pasica, ki označuje stanje razvoja delavnice
  - Prelivni dizajn z indikacijami gradnje za jasno komunikacijo uporabnikom
  - Časovni žig zadnje posodobitve za preglednost
  - Mobilno odziven dizajn za vse vrste naprav

#### Enhanced
- **Varnost infrastrukture**: Funkcionalnost predogleda vključena po celotni dokumentaciji razmestitve
- **Pred-razmestitvena validacija**: Samodejni skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Razvijalni potek dela**: Posodobljeni zaporedji ukazov vključujejo predogled kot najboljšo prakso
- **Izkušnja delavnice**: Uporabnikom so jasno postavljena pričakovanja glede stanja vsebine

#### Changed
- **Priporočene prakse razmestitve**: Delovni tok z najprej predogledom je zdaj priporočeni pristop
- **Tok dokumentacije**: Validacija infrastrukture premaknjena prej v učni proces
- **Predstavitev delavnice**: Profesionalna komunikacija stanja z jasnim časovnim načrtom razvoja

#### Improved
- **Pristop, ki daje prednost varnosti**: Infrastrukturne spremembe je zdaj mogoče preveriti pred razmestitvijo
- **Sodelovanje ekipe**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred zagotavljanjem virov
- **Zmanjšanje tveganj**: Manj neuspehov pri razmestitvi z vnaprejšnjo validacijo

#### Technical Implementation
- **Večdokumentna integracija**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorec ukazov**: Dosledna sintaksa in primeri po celotni dokumentaciji
- **Vključevanje najboljših praks**: Predogled vključen v validacijske delovne tokove in skripte
- **Vizualni indikatorji**: Jasne oznake NOVE funkcije za lažje odkrivanje

#### Workshop Infrastructure
- **Komunikacija stanja**: Profesionalna HTML pasica s prelivnim slogom
- **Uporabniška izkušnja**: Jasno stanje razvoja delavnice preprečuje zmedo
- **Profesionalna predstavitev**: Ohranja verodostojnost repozitorija in hkrati postavlja pričakovanja
- **Transparentnost časovnice**: Oktober 2025 datum zadnje posodobitve za odgovornost

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Ta izdaja uvaja celovita gradiva delavnice z vodniki, interaktivnimi v brskalniku, in strukturiranimi učnimi potmi.**

#### Added
- **🎥 Interactive Workshop Guide**: Izkušnja delavnice v brskalniku s predogledom MkDocs
- **📝 Structured Workshop Instructions**: 7-stopenjska vodena učna pot od odkrivanja do prilagoditve
  - 0-Introduction: Pregled delavnice in nastavitev
  - 1-Select-AI-Template: Odkritje predloge in postopek izbire
  - 2-Validate-AI-Template: Postopki razmestitve in validacije
  - 3-Deconstruct-AI-Template: Razumevanje arhitekture predloge
  - 4-Configure-AI-Template: Konfiguracija in prilagoditev
  - 5-Customize-AI-Template: Napredne spremembe in iteracije
  - 6-Teardown-Infrastructure: Čiščenje in upravljanje virov
  - 7-Wrap-up: Povzetek in naslednji koraki
- **🛠️ Workshop Tooling**: Konfiguracija MkDocs s temo Material za izboljšano učilno izkušnjo
- **🎯 Hands-On Learning Path**: 3-stopenjska metodologija (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Nemotena nastavitev razvojnega okolja

#### Enhanced
- **AI Workshop Lab**: Razširjen z obsežno 2-3 urne strukturirane učne izkušnje
- **Workshop Documentation**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Learning Progression**: Jasna navodila korak za korakom od izbire predloge do razmestitve v produkcijo
- **Developer Experience**: Integrirano orodje za poenostavljene razvojne delovne tokove

#### Improved
- **Dostopnost**: Vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- **Učenje v lastnem tempu**: Prilagodljiva struktura delavnice, ki omogoča različne hitrosti učenja
- **Praktična uporaba**: Resnični primeri razmestitve AI predlog
- **Integracija skupnosti**: Integracija Discorda za podporo delavnice in sodelovanje

#### Workshop Features
- **Built-in Search**: Hitro iskanje ključnih besed in lekcij
- **Copy Code Blocks**: Funkcija kopiranja z lebdenjem za vse primere kode
- **Theme Toggle**: Podpora temnega/svetlega načina glede na preference
- **Visual Assets**: Posnetki zaslona in diagrami za boljše razumevanje
- **Help Integration**: Neposreden dostop do Discorda za podporo skupnosti

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Ta izdaja uvaja celovit učni sistem, temelječ na poglavjih, z izboljšano navigacijo po celotnem repozitoriju.**

#### Added
- **📚 Chapter-Based Learning System**: Prestrukturiran celoten tečaj v 8 progresivnih učnih poglavij
  - Chapter 1: Osnove & Hiter začetek (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Konfiguracija & Avtentikacija (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Rešitve večagentnega AI (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pred-razmestitvena validacija & Načrtovanje (⭐⭐ - 1 hour)
  - Chapter 7: Razhroščevanje & Odpravljanje napak (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Produkcija & Enterprise vzorci (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Celovit navigacijski sistem**: Dosledni navigacijski glave in noge po celotni dokumentaciji
- **🎯 Sledenje napredku**: Kontrolni seznam dokončanja tečaja in sistem verifikacije učenja
- **🗺️ Vodnik učne poti**: Jasne vstopne točke za različne ravni izkušenj in cilje
- **🔗 Prečnopovezavna navigacija**: Sorodna poglavja in predpogoji jasno povezani

#### Enhanced
- **README Structure**: Pretvorjen v strukturirano učilnico z organizacijo po poglavjih
- **Documentation Navigation**: Vsaka stran zdaj vključuje kontekst poglavja in navodila za napredovanje
- **Template Organization**: Primeri in predloge mapirane na ustrezna učna poglavja
- **Resource Integration**: Uporabne liste, pogosta vprašanja in učni vodniki povezani s pripadajočimi poglavji
- **Workshop Integration**: Vaje v delavnici mapirane na več učnih ciljev poglavij

#### Changed
- **Napredovanje učenja**: Premik iz linearne dokumentacije v fleksibilen sistem učenja po poglavjih
- **Postavitev konfiguracije**: Vodnik za konfiguracijo premaknjen kot Poglavje 3 za boljši učni potek
- **Vključevanje vsebin AI**: Boljša integracija vsebin, specifičnih za AI, skozi celotno učno pot
- **Vsebina za produkcijo**: Napredni vzorci konsolidirani v Poglavju 8 za podjetniške uporabnike

#### Improved
- **Uporabniška izkušnja**: Jasne navigacijske drobtinice in indikatorji napredka po poglavjih
- **Dostopnost**: Dosledni navigacijski vzorci za lažje premikanje po tečaju
- **Profesionalna predstavitev**: Struktura, podobna univerzitetni, primerna za akademsko in korporativno usposabljanje
- **Učinkovitost učenja**: Skrajšan čas iskanja relevantnih vsebin z izboljšano organizacijo

#### Technical Implementation
- **Navigacijski glavi**: Standardizirana poglavna navigacija v več kot 40 dokumentacijskih datotekah
- **Noga z navigacijo**: Dosledno vodstvo za napredovanje in indikatorji dokončanja poglavij
- **Prekrižno povezovanje**: Celovit sistem notranjih povezav, ki povezuje sorodne pojme
- **Preslikava poglavij**: Predloge in primeri jasno povezani z učnimi cilji

#### Study Guide Enhancement
- **📚 Celoviti učni cilji**: Učni vodnik prestrukturiran v skladu z 8-poglavnim sistemom
- **🎯 Ocena po poglavjih**: Vsako poglavje vključuje specifične učne cilje in praktične vaje
- **📋 Sledenje napredku**: Tedenski načrt učenja z merljivimi rezultati in kontrolnimi seznami dokončanja
- **❓ Vprašanja za ocenjevanje**: Vprašanja za preverjanje znanja za vsako poglavje z profesionalnimi cilji
- **🛠️ Praktične vaje**: Vaje z dejanskimi scenariji razmestitve in odpravljanja napak
- **📊 Napredovanje veščin**: Jasno napredovanje od osnov do podjetniških vzorcev z usmeritvijo k razvoju kariere
- **🎓 Okvir za certificiranje**: Izidi strokovnega razvoja in priznanja skupnosti
- **⏱️ Upravljanje časovnice**: Strukturiran 10-tedenski načrt učenja z validacijo mejnikov

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Ta izdaja izboljšuje večagentno maloprodajno rešitev z boljšo poimenovanjem agentov in izboljšano dokumentacijo.**

#### Changed
- **Terminologija več agentov**: Zamenjano "Cora agent" z "Customer agent" v celotni prodajni večagentni rešitvi za boljše razumevanje
- **Arhitektura agenta**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode, da uporabljajo dosledno poimenovanje "Customer agent"
- **Primeri konfiguracije**: Posodobljeni vzorci konfiguracije agentov z novimi konvencijami poimenovanja
- **Konsistentnost dokumentacije**: Zagotovljeno, da vse reference uporabljajo profesionalna, opisna imena agentov

#### Enhanced
- **ARM Template Package**: Posodobljen retail-multiagent-arm-template s referencami na Customer agent
- **Architecture Diagrams**: Osveženi Mermaid diagrami z posodobljenim poimenovanjem agentov
- **Code Examples**: Python razredi in primeri implementacij zdaj uporabljajo poimenovanje CustomerAgent
- **Environment Variables**: Posodobljeni vsi scenariji za nameščanje za uporabo konvencije CUSTOMER_AGENT_NAME

#### Improved
- **Developer Experience**: Bolj jasne vloge in odgovornosti agentov v dokumentaciji
- **Production Readiness**: Boljše usklajevanje z imenovalnimi konvencijami podjetij
- **Learning Materials**: Intuitivnejše poimenovanje agentov za izobraževalne namene
- **Template Usability**: Poenostavljeno razumevanje funkcij agentov in vzorcev nameščanja

#### Technical Details
- Posodobljeni Mermaid arhitekturni diagrami s referencami na CustomerAgent
- Zamenjana imena razredov CoraAgent z CustomerAgent v Python primerih
- Spremenjene ARM template JSON konfiguracije za uporabo vrste agenta "customer"
- Posodobljene environment spremenljivke iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osveženi vsi ukazi za nameščanje in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Ta različica preobrazi repozitorij v celovit učni vir, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Celovita preureditev, ki daje prednost AI razvijalcem in inženirjem
- **Microsoft Foundry Integration Guide**: Izčrpen vodnik za povezovanje AZD s storitvami Microsoft Foundry
- **AI Model Deployment Patterns**: Podroben vodič o izbiri modelov, konfiguraciji in strategijah nameščanja v produkcijo
- **AI Workshop Lab**: 2–3 urna praktična delavnica za pretvorbo AI aplikacij v rešitve, pripravljene za nameščanje z AZD
- **Production AI Best Practices**: Vzorci za podjetniško uporabo za skaliranje, nadzor in zavarovanje AI delovnih obremenitev
- **AI-Specific Troubleshooting Guide**: Izčrpen vodnik za odpravljanje težav s Microsoft Foundry Models, Cognitive Services in AI nameščanji
- **AI Template Gallery**: Izpostavljena zbirka Microsoft Foundry predlog z ocenami kompleksnosti
- **Workshop Materials**: Celovita struktura delavnice z laboratoriji in referenčnimi gradivi

#### Enhanced
- **README Structure**: Osredotočeno na AI razvijalce z 45% podatkom o zanimanju skupnosti iz Microsoft Foundry Discord
- **Learning Paths**: Namenjena pot AI razvijalca poleg tradicionalnih poti za študente in DevOps inženirje
- **Template Recommendations**: Izpostavljene AI predloge vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Community Integration**: Izboljšana podpora Discord skupnosti z AI-specifičnimi kanali in razpravami

#### Security & Production Focus
- **Managed Identity Patterns**: Avtentičnost in varnostne konfiguracije specifične za AI
- **Cost Optimization**: Sledenje uporabi žetonov in nadzori proračuna za AI delovne obremenitve
- **Multi-Region Deployment**: Strategije za globalno nameščanje AI aplikacij
- **Performance Monitoring**: Metrični podatki specifični za AI in integracija s Application Insights

#### Documentation Quality
- **Linear Course Structure**: Logičen napredek od začetnika do naprednih AI vzorcev nameščanja
- **Validated URLs**: Vse zunanje repozitorijske povezave preverjene in dostopne
- **Complete Reference**: Vse notranje dokumentacijske povezave preverjene in delujoče
- **Production Ready**: Vzorci za podjetja z realnimi primeri nameščanja

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebine.**

#### Added
- **Structured Learning Framework**: Vse strani dokumentacije zdaj vključujejo uvod, cilje učenja in izhode učenja
- **Navigation System**: Dodane povezave Prejšnji/Naslednji lekciji po vsej dokumentaciji za voden napredek učenja
- **Study Guide**: Celovit study-guide.md z učnimi cilji, vajami in ocenitvenimi gradivi
- **Professional Presentation**: Odstranjene vse ikone emoji za izboljšano dostopnost in profesionalni videz
- **Enhanced Content Structure**: Izboljšana organizacija in potek učnih gradiv

#### Changed
- **Documentation Format**: Standardizacija vse dokumentacije z dosledno strukturo, osredotočeno na učenje
- **Navigation Flow**: Uveden logični napredek skozi vsa učna gradiva
- **Content Presentation**: Odstranjene dekorativne elemente v prid jasni, profesionalni predstavitvi
- **Link Structure**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Improved
- **Accessibility**: Odstranitev odvisnosti od emoji za boljšo združljivost z bralniki zaslona
- **Professional Appearance**: Čista, akademska predstavitev primerna za podjetno učenje
- **Learning Experience**: Strukturiran pristop s čistimi cilji in izhodi za vsako lekcijo
- **Content Organization**: Boljši logični potek in povezava med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository
**Začetna izdaja - Celovit AZD učni repozitorij**

#### Added
- **Core Documentation Structure**
  - Celovit niz vodnikov za začetek dela
  - Izčrpna dokumentacija za nameščanje in provisioning
  - Podrobni viri za odpravljanje težav in vodniki za razhroščevanje
  - Orodja in postopki za preverjanje pred nameščanjem

- **Getting Started Module**
  - AZD Basics: Temeljni koncepti in terminologija
  - Installation Guide: Navodila za namestitev po platformah
  - Configuration Guide: Nastavitev okolja in avtentikacija
  - First Project Tutorial: Vodnik korak za korakom s praktičnim učenjem

- **Deployment and Provisioning Module**
  - Deployment Guide: Popolna dokumentacija delovnega toka nameščanja
  - Provisioning Guide: Infrastruktura kot koda z Bicep
  - Najboljše prakse za produkcijska nameščanja
  - Vzorci arhitektur z več storitvami

- **Pre-deployment Validation Module**
  - Capacity Planning: Preverjanje razpoložljivosti Azure virov
  - SKU Selection: Izčrpen vodič za izbiro nivojev storitev
  - Pre-flight Checks: Avtomatizirani validacijski skripti (PowerShell and Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Troubleshooting Module**
  - Common Issues: Pogosti problemi in rešitve
  - Debugging Guide: Sistematične metode odpravljanja težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Resources and References**
  - Command Cheat Sheet: Hiter pregled osnovnih ukazov
  - Glossary: Izčrpen slovar terminov in kratic
  - FAQ: Podrobni odgovori na pogosta vprašanja
  - Povezave do zunanjih virov in skupnostnih povezav

- **Examples and Templates**
  - Primer preproste spletne aplikacije
  - Predloga za namestitev statične spletne strani
  - Konfiguracija kontejnerske aplikacije
  - Vzorci integracije baze podatkov
  - Primeri mikroservisne arhitekture
  - Implementacije brezstrežnih funkcij

#### Features
- **Multi-Platform Support**: Navodila za namestitev in konfiguracijo za Windows, macOS in Linux
- **Multiple Skill Levels**: Vsebine zasnovane za študente do profesionalnih razvijalcev
- **Practical Focus**: Praktični primeri in scenariji iz resničnega sveta
- **Comprehensive Coverage**: Od osnovnih konceptov do naprednih podjetniških vzorcev
- **Security-First Approach**: Vgrajene varnostne najboljše prakse skozi vsebino
- **Cost Optimization**: Navodila za stroškovno učinkovita nameščanja in upravljanje virov

#### Documentation Quality
- **Detailed Code Examples**: Praktični, preizkušeni primeri kode
- **Step-by-Step Instructions**: Jasna, izvedljiva navodila
- **Comprehensive Error Handling**: Odpravljanje pogostih težav
- **Best Practices Integration**: Industrijski standardi in priporočila
- **Version Compatibility**: Posodobljeno z najnovejšimi Azure storitvami in funkcijami azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Vzorci integracije za Hugging Face, Azure Machine Learning in lastne modele
- **AI Agent Frameworks**: Predloge za LangChain, Semantic Kernel in AutoGen nameščanja
- **Advanced RAG Patterns**: Možnosti vektorskih baz podatkov onkraj Azure AI Search (Pinecone, Weaviate, itd.)
- **AI Observability**: Izboljšano spremljanje zmogljivosti modelov, uporabe žetonov in kakovosti odziva

#### Developer Experience
- **VS Code Extension**: Integrirana razvojna izkušnja AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-podprto generiranje AZD predlog
- **Interactive Tutorials**: Praktične vaje s samodejno validacijo za AI scenarije
- **Video Content**: Dopolnilni video vodiči za vizualne učence, osredotočeni na AI nameščanja

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Upravljanje modelov AI, skladnost in revizijske sledi
- **Multi-Tenant AI**: Vzorci za strežbo več strank z izoliranimi AI storitvami
- **Edge AI Deployment**: Integracija z Azure IoT Edge in container instances
- **Hybrid Cloud AI**: Vzorci za večoblačno in hibridno nameščanje AI delovnih obremenitev

#### Advanced Features
- **AI Pipeline Automation**: MLOps integracija z Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust vzorci, zasebni končni točki in napredno zaščito pred grožnjami
- **Performance Optimization**: Napredno prilagajanje in strategije skaliranja za visoko-pretočne AI aplikacije
- **Global Distribution**: Vzorec dostave vsebine in predpomnjenje na robu za AI aplikacije

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Celovita integracija Microsoft Foundry (Completed)
- ✅ **Interactive Tutorials**: Praktična AI delavnica (Completed)
- ✅ **Advanced Security Module**: AI-specifični varnostni vzorci (Completed)
- ✅ **Performance Optimization**: Strategije prilagajanja AI delovnih obremenitev (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Scenariji nameščanja, osredotočeni na AI (Completed)
- ✅ **Extended FAQ**: Vprašanja in odpravljanje težav, specifično za AI (Completed)
- **Tool Integration**: Izboljšani vodiči za integracijo IDE in urejevalnikov
- ✅ **Monitoring Expansion**: Razširitev za spremljanje in opozarjanje, specifična za AI (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Odzivna zasnova za mobilno učenje
- **Offline Access**: Prenosne pakete dokumentacije
- **Enhanced IDE Integration**: Razširitev VS Code za AZD + AI delovne tokove
- **Community Dashboard**: Metrični nadzor skupnosti v realnem času in spremljanje prispevkov

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Po semantičnem verzioniranju (major.minor.patch)
2. **Date**: Datum izdaje ali posodobitve v formatu YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Jedrnat opis, kaj se je spremenilo
5. **Impact Assessment**: Kako spremembe vplivajo na obstoječe uporabnike

### Change Categories

#### Added
- Nove funkcionalnosti, odseki dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripte ali utilitije

#### Changed
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebin ali organizacije

#### Deprecated
- Funkcije ali pristope, ki se postopoma umikajo
- Odseki dokumentacije načrtovani za odstranitev
- Metode, ki imajo boljše alternative

#### Removed
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali zastarele pristope
- Podvojena ali konsolidirana vsebina

#### Fixed
- Popravki napak v dokumentaciji ali kodi
- Rešitve prijavljenih težav ali problemov
- Izboljšave natančnosti ali funkcionalnosti

#### Security
- Varnostne izboljšave ali popravki
- Posodobitve najboljših praks glede varnosti
- Rešitve ranljivosti v varnosti

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrep uporabnika
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spreminjajo temeljni pristop ali metodologijo

#### Minor Version (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost nazaj
- Dodatni primeri, orodja ali viri

#### Patch Version (X.Y.Z)
- Popravki napak in korekcije
- Manjše izboljšave obstoječe vsebine
- Pojasnila in manjše nadgradnje

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Poročajte o težavah ali predlagajte izboljšave (AI-specifična vprašanja dobrodošla)
- **Discord Discussions**: Delite ideje in sodelujte s skupnostjo Microsoft Foundry
- **Pull Requests**: Neposredno prispevajte izboljšave vsebine, zlasti AI predlog in vodičev
- **Microsoft Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Community Forums**: Sodelujte v širših Azure razvijalskih razpravah

### Feedback Categories
- **AI Content Accuracy**: Popravki integracije AI storitev in informacij o nameščanju
- **Learning Experience**: Predlogi za izboljšanje učne poti za AI razvijalce
- **Missing AI Content**: Zahteve za dodatne AI predloge, vzorce ali primere
- **Accessibility**: Izboljšave za raznolike učne potrebe
- **AI Tool Integration**: Predlogi za boljšo integracijo razvojnih potekov AI
- **Production AI Patterns**: Zahteve za vzorce podjetniškega nameščanja AI

### Response Commitment
- **Issue Response**: V 48 urah za prijavljene težave
- **Feature Requests**: Pregled v enem tednu
- **Community Contributions**: Pregled v enem tednu
- **Security Issues**: Prioriteta z žurnim odzivom

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Preverjanje natančnosti vsebine in validacija povezav
- **Quarterly Updates**: Večji dodatki vsebin in izboljšave
- **Semi-Annual Reviews**: Celovite prestrukturiranja in nadgradnje
- **Annual Releases**: Glavne izdaje z znatnimi izboljšavami

### Monitoring and Quality Assurance
- **Automated Testing**: Redna validacija primerov kode in povezav
- **Community Feedback Integration**: Redno vključevanje uporabniških priporočil
- **Technology Updates**: Usmerjenost na najnovejše Azure storitve in izdaje azd
- **Accessibility Audits**: Redni pregledi za vključujoče oblikovanje

## Version Support Policy

### Current Version Support
- **Najnovejša glavna različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki za 12 mesecev
- **Starejše različice**: Samo podpora skupnosti, brez uradnih posodobitev

### Smernice za migracijo
Ko so izdane glavne različice, nudimo:
- **Vodniki za migracijo**: Navodila za prehod korak za korakom
- **Opombe o združljivosti**: Podrobnosti o nezdružljivih spremembah
- **Podpora orodij**: Skripte ali orodja za pomoč pri migraciji
- **Podpora skupnosti**: Namenski forumi za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Študijski vodnik](resources/study-guide.md)
- **Naslednja lekcija**: Vrni se na [Glavni README](README.md)

**Bodite na tekočem**: Spremljajte ta repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvorni različici naj se šteje za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->