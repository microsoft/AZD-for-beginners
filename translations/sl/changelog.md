# Zapis sprememb - AZD For Beginners

## Uvod

Ta zapis sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD For Beginners. Uporabljamo načela semantičnega verzioniranja in vzdržujemo ta dnevnik, da pomagamo uporabnikom razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z ogledom tega zapisa sprememb boste:
- Ostali obveščeni o novih funkcijah in dodani vsebini
- Razumeli izboljšave obstoječe dokumentacije
- Spremljali popravke napak in korekcije za zagotavljanje točnosti
- Spremljali razvoj učnih gradiv skozi čas

## Učni rezultati

Po pregledu vnosov v zapis sprememb boste lahko:
- Prepoznali novo vsebino in vire, ki so na voljo za učenje
- Razumeli, katere razdelke so posodobili ali izboljšali
- Načrtovali svojo učno pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.18.0] - 2026-03-16

#### AZD AI CLI ukazi, preverjanje vsebine in razširitev predlog
**Ta različica dodaja pokritost ukazov `azd ai`, `azd extension` in `azd mcp` v vseh poglavjih, povezanih z AI, popravlja zlomljene povezave in zastarelo kodo v agents.md, posodablja cheat sheet in prenovi razdelek Primeri predlog z validiranimi opisi in novimi Azure AI AZD predlogami.**

#### Dodano
- **🤖 Pokritost AZD AI CLI** v 7 datotekah (prej samo v Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Novo poglavje "Extensions and AI Commands", ki uvaja `azd extension`, `azd ai agent init` in `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Možnost 4: `azd ai agent init` s tabelo primerjave (pristop s predlogo proti manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Podpoglavji "AZD Extensions for Foundry" in "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Hitri začetek zdaj prikazuje poti nameščanja tako na osnovi predloge kot manifestov
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Razdelek Deploy zdaj vključuje možnost `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Podpoglavje "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Novo poglavje "AI & Extensions Commands" z `azd extension`, `azd ai agent init`, `azd mcp` in `azd infra generate`
- **📦 Nove AZD AI primerne predloge** v `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG klepet z Blazor WebAssembly, Semantic Kernel in podporo za glasovni klepet
  - **azure-search-openai-demo-java** — Java RAG klepet, ki uporablja Langchain4J z možnostmi nameščanja ACA/AKS
  - **contoso-creative-writer** — Večagentna aplikacija za ustvarjalno pisanje, ki uporablja Azure AI Agent Service, Bing Grounding in Prompty
  - **serverless-chat-langchainjs** — Brezstrežni RAG z uporabo Azure Functions + LangChain.js + Cosmos DB s podporo za lokalni razvoj z Ollama
  - **chat-with-your-data-solution-accelerator** — Podjetniški RAG pospeševalnik z administratorskim portalom, integracijo Teams in možnostmi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referenčna aplikacija za orkestracijo večagentnega MCP z strežniki v .NET, Python, Java in TypeScript
  - **azd-ai-starter** — Minimalna Bicep začetna predloga za Azure AI infrastrukturo
  - **🔗 Awesome AZD AI Gallery link** — Povezava na [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ predlog)

#### Popravljeno
- **🔗 agents.md navigacija**: povezave Prejšnje/Naslednje sedaj ustrezajo vrstnemu redu lekcij v README poglavja 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md zlomljene povezave**: `production-ai-practices.md` popravljeno v `../chapter-08-production/production-ai-practices.md` (3 pojavitve)
- **📦 agents.md zastarela koda**: Zamenjan `opencensus` z `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neveljaven API**: Premaknjen `max_tokens` iz `create_agent()` v `create_run()` kot `max_completion_tokens`
- **🔢 agents.md štetje tokenov**: Zamenjan grob ocenjeni `len//4` z `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Popravljene storitve iz "Cognitive Search + App Service" v "Azure AI Search + Azure Container Apps" (privzeti gostitelj spremenjen okt 2024)
- **contoso-chat**: Posodobljen opis, da se sklicuje na Azure AI Foundry + Prompty, v skladu z dejanskim naslovom repozitorija in tehnološko skladnostjo

#### Odstranjeno
- **ai-document-processing**: Odstranjena referenca na nefunkcionalno predlogo (repo ni javno dostopen kot AZD predloga)

#### Izboljšano
- **📝 agents.md vaje**: Vaja 1 zdaj prikazuje pričakovani izhod in korak `azd monitor`; Vaja 2 vključuje celotno registracijsko kodo `FunctionTool`; Vaja 3 zameji nejasna navodila z konkretnimi ukazi `prepdocs.py`
- **📚 agents.md viri**: Posodobljene povezave do dokumentacije na aktualne Azure AI Agent Service dokumente in hitri začetek
- **📋 agents.md tabela Naslednji koraki**: Dodana povezava do AI Workshop Lab za celovito pokritost poglavja

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

#### Izboljšana navigacija po tečaju
**Ta različica izboljša navigacijo v README.md za poglavja z razširjeno tabelo.**

#### Spremenjeno
- **Tabela zemljevida tečaja**: Izboljšana z neposrednimi povezavami do lekcij, ocenami trajanja in ocenami zahtevnosti
- **Čiščenje map**: Odstranjene odvečne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Preverjanje povezav**: Vse 21+ notranjih povezav v tabeli Zemljevid tečaja preverjene

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodablja sklice na izdelke v skladu s trenutno Microsoftovo blagovno znamko.**

#### Spremenjeno
- **Microsoft Foundry → Microsoft Foundry**: Vsi sklici posodobljeni v datotekah, ki niso prevodi
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno, da odraža trenutno blagovno znamko

#### Posodobljene datoteke
- `README.md` - Glavna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik za AI agente
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Stran delavnice
- `workshop/docs/index.md` - Indeks delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke z navodili delavnice

---

### [v3.15.0] - 2026-02-05

#### Velika prestrukturacija repozitorija: mape po poglavjih
**Ta različica prestrukturira dokumentacijo v namensko poimenovane mape poglavij za lažjo navigacijo.**

#### Preimenovanje map
Stare mape so bile zamenjane z mapami, oštevilčenimi po poglavjih:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano: `docs/chapter-05-multi-agent/`

#### Premestitev datotek
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
  - Cilji učenja in trajanje
  - Tabela lekcij z opisi
  - Ukazi za hiter začetek
  - Navigacija do drugih poglavij

#### Spremenjeno
- **🔗 Posodobljene vse notranje povezave**: 78+ poti posodobljenih v celotni dokumentaciji
- **🗺️ Glavni README.md**: Posodobljen Zemljevid tečaja z novo strukturo poglavij
- **📝 examples/README.md**: Posodobljene medsebojne reference na mape poglavij

#### Odstranjeno
- Stara struktura map (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Prestrukturacija repozitorija: navigacija po poglavjih
**Ta različica je dodala README datoteke za navigacijo po poglavjih (nadomeščeno z v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ta različica dodaja obsežen vodič za nameščanje AI agentov z Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Popoln vodič, ki zajema:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnih botov
  - Tri hitrozagonne agentne predloge (Foundry Agents, Prompty, RAG)
  - Arhitekturni vzorci agentov (en sam agent, RAG, večagentni)
  - Konfiguracija orodij in prilagoditve
  - Spremljanje in sledenje metrik
  - Stroškovne razmisleke in optimizacijo
  - Pogoste težave in kako jih odpraviti
  - Tri praktične vaje z merili uspeha

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hitri začetek**: Nameščanje agentov z `azd init --template get-started-with-ai-agents`
- **Arhitekturni vzorci**: Vizualne sheme vzorcev agentov
- **Konfiguracija**: Nastavitev orodij in spremenljivk okolja
- **Spremljanje**: Integracija Application Insights
- **Vaje**: Postopno praktično učenje (20–45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev okolja DevContainer
**Ta različica posodablja konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za izkušnjo učenja AZD.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljeno iz `python:3.12-bullseye` v `python:3.12-bookworm` (najnovejša Debian stabilna različica)
- **📛 Ime kontejnerja**: Preimenovano iz "Python 3" v "AZD for Beginners" za jasnost

#### Dodano
- **🔧 Nove funkcije razvojnega kontejnerja**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Prednastavljeni porti za pogost razvoj:
  - 8000 (predogled MkDocs)
  - 3000 (spletne aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-ji)

- **🧩 Nove razširitve za VS Code**:
  - `ms-python.vscode-pylance` - Izboljšan Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora za Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora za Docker
  - `ms-azuretools.vscode-bicep` - Podpora za jezik Bicep
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure virov
  - `yzhang.markdown-all-in-one` - Urejanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Lintanje Markdowna
  - `bierner.markdown-mermaid` - Podpora za Mermaid diagrame
  - `redhat.vscode-yaml` - Podpora za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Zgodovina Gita

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Python interpreter, oblikovanje ob shranjevanju in obrezovanje presledkov

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan vtičnik MkDocs minify
  - Dodan pre-commit za kakovost kode
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Popravljeno
- **Post-Create Command**: Zdaj preveri namestitev AZD in Azure CLI ob zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenova README, prijazna začetnikom
**Ta različica znatno izboljša README.md, da je bolj dostopen začetnikom, in dodaja ključne vire za razvijalce AI.**

#### Dodano
- **🆚 Primerjava Azure CLI in AZD**: Jasna razlaga, kdaj uporabiti katero orodje z praktičnimi primeri
- **🌟 Odlične AZD povezave**: Neposredne povezave do galerije skupnostnih predlog in virov za prispevke:
  - [Galerija Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ predlog, pripravljenih za razmestitev
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Prispevek skupnosti
- **🎯 Hiter začetek**: Poenostavljen odsek za začetek v 3 korakih (Namestitev → Prijava → Razmestitev)
- **📊 Tabela navigacije glede na izkušnje**: Jasna navodila, kje začeti glede na izkušnje razvijalca

#### Spremenjeno
- **README Structure**: Preurejena za postopno razkrivanje - ključne informacije na začetku
- **Introduction Section**: Prepisan za razlago "The Magic of `azd up`" za popolne začetnike
- **Removed Duplicate Content**: Odstranjen podvojen odsek za odpravljanje težav
- **Troubleshooting Commands**: Popravljena referenca `azd logs`, nadomeščena z veljavnim `azd monitor --logs`

#### Popravljeno
- **🔐 Authentication Commands**: Dodana `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Invalid Command References**: Odstranjen preostali `azd logs` iz razdelka za odpravljanje težav v README

#### Opombe
- **Scope**: Spremembe uporabljene v main README.md and resources/cheat-sheet.md
- **Target Audience**: Izboljšave so namenjene predvsem razvijalcem, novim v AZD

---

### [v3.10.0] - 2026-02-05

#### Posodobitev natančnosti ukazov Azure Developer CLI
**Ta različica odpravi neobstoječe AZD ukaze v dokumentaciji in zagotavlja, da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Popravljeno
- **🔧 Non-Existent AZD Commands Removed**: Celovita revizija in popravki neveljavnih ukazov:
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Obsežna prenova referenc ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije rollback in razmestitve
  - `docs/troubleshooting/debugging.md`: Popravljeni razdelki za analizo dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi za odpravljanje težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljen razdelek za odpravljanje napak AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za nadzorovanje
  - `docs/getting-started/first-project.md`: Posodobljeni primeri za nadzorovanje in odpravljanje napak
  - `docs/getting-started/installation.md`: Popravljeni primeri pomoči in različic
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za ogled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za odpravljanje napak agentov

- **📝 Version Reference Updated**:
  - `docs/getting-started/installation.md`: Spremenjena trdo kodirana različica `1.5.0` v generično `1.x.x` z povezavo na izdajami

#### Spremenjeno
- **Rollback Strategies**: Dokumentacija posodobljena za uporabo rollbacka na osnovi Gita (AZD nima vgrajenega rollbacka)
- **Log Viewing**: Zamenjane reference `azd logs` z `azd monitor --logs`, `azd monitor --live` in ukazi Azure CLI
- **Performance Section**: Odstranjeni neobstoječi zastavici za paralelne/incrementalne razmestitve, dodane veljavne alternative

#### Tehnični podatki
- **Veljavni AZD ukazi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavni azd monitor zastavici**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Verification**: Ukazi preverjeni glede na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dokončanje delavnice in posodobitev kakovosti dokumentacije
**Ta različica dokonča interaktivne module delavnice, odpravi vse pokvarjene povezave v dokumentaciji in izboljša splošno kakovost vsebine za razvijalce AI, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument z navodili za prispevke z:
  - Jasnimi navodili za poročanje o težavah in predlaganje sprememb
  - Standardi dokumentacije za novo vsebino
  - Smernicami za primer kode in konvencijami sporočil commita
  - Informacijami o sodelovanju skupnosti

#### Dokončano
- **🎯 Workshop Module 7 (Wrap-up)**: Popolnoma dokončan zaključni modul z:
  - Celovitim povzetkom dosežkov delavnice
  - Razdelkom ključnih obvladanih konceptov o AZD, predlogah in Microsoft Foundry
  - Priporočili za nadaljevanje učne poti
  - Izzivi delavnice z oceno zahtevnosti
  - Povezavami za povratne informacije skupnosti in podporo

- **📚 Workshop Module 3 (Deconstruct)**: Posodobljeni cilji učenja z:
  - Navodili za aktivacijo GitHub Copilot z MCP strežniki
  - Razumevanjem strukture AZD predloge mape
  - Organizacijskimi vzorci Infrastructure-as-Code (Bicep)
  - Navodili za praktične laboratorijske vaje

- **🔧 Workshop Module 6 (Teardown)**: Dokončano z:
  - Cilji za čiščenje virov in upravljanje stroškov
  - Uporabo `azd down` za varno deprovisioniranje infrastrukture
  - Navodili za obnovitev nežno izbrisanih kognitivnih storitev
  - Dodatnimi raziskovalnimi izzivi za GitHub Copilot in Azure Portal

#### Popravljeno
- **🔗 Popravek pokvarjenih povezav**: Rešeno 15+ pokvarjenih notranjih povezav v dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Popravljene poti do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljene poti do ai-model-deployment.md in production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamenjana neobstoječa cicd-integration.md z deployment-guide.md
  - `examples/retail-scenario.md`: Popravljene poti do FAQ in vodnika za odpravljanje težav
  - `examples/container-app/microservices/README.md`: Popravljene poti do domače strani tečaja in vodnika za razmestitev
  - `resources/faq.md` and `resources/glossary.md`: Posodobljene reference poglavja AI
  - `course-outline.md`: Popravljene reference do vodnika za inštruktorje in laboratorijskih vaj AI delavnice

- **📅 Banner statusa delavnice**: Posodobljen iz "Under Construction" v aktivni status delavnice s februarjem 2026
- **🔗 Navigacija delavnice**: Popravljene pokvarjene navigacijske povezave v workshop README.md, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Predstavitev delavnice**: Odstranjeno opozorilo "under construction", delavnica je zdaj dokončana in pripravljena za uporabo
- **Konsistentnost navigacije**: Zagotovljena pravilna medmodulska navigacija za vse module delavnice
- **Reference učne poti**: Posodobljene medpoglavne reference za pravilne microsoft-foundry poti

#### Preverjeno
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so dokončani s cilji učenja
- ✅ Navigacija med poglavji in moduli deluje pravilno
- ✅ Vsebina je primerna za razvijalce AI, ki uporabljajo Microsoft AZD
- ✅ Jezik prijazen začetnikom in ohranjena struktura
- ✅ CONTRIBUTING.md nudi jasna navodila za prispevke skupnosti

#### Tehnična implementacija
- **Link Validation**: Avtomatiziran PowerShell skript je preveril vse .md notranje povezave
- **Content Audit**: Ročni pregled popolnosti delavnice in primernosti za začetnike
- **Navigation System**: Uporabljeni konsistentni vzorci navigacije poglavij in modulov

#### Opombe
- **Scope**: Spremembe uporabljene samo v angleški dokumentaciji
- **Translations**: Mape s prevodi v tej različici niso posodobljene (avtomatiziran prevod bo sinhroniziran kasneje)
- **Workshop Duration**: Dokončana delavnica zdaj nudi 3-4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: nadzorovanje, varnost in vzorci več-agentnega usklajevanja
**Ta različica dodaja celovite lekcije ravni A o integraciji Application Insights, vzorcih avtentikacije in vzorcih več-agentnega usklajevanja za produkcijske razmestitve.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - AZD usmerjena razmestitev z avtomatskim provisioningom
  - Celovite Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojenim telemetrijskim zapisovanjem (1,200+ vrstic)
  - Vzorci nadzorovanja AI/LLM (sledenje tokenov/stroškov Microsoft Foundry modelov)
  - 6 Mermaid diagramov (arhitektura, distribuirano sledenje, tok telemetrije)
  - 3 praktične vaje (alarmske nastavitve, nadzorne plošče, AI nadzorovanje)
  - Primeri poizvedb Kusto in strategije za optimizacijo stroškov
  - Streaming metrik v živo in odpravljanje napak v realnem času
  - Čas učenja 40-50 minut s produkcijsko pripravljenimi vzorci

- **🔐 Lekcija o avtentikaciji in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci avtentikacije (connection strings, Key Vault, managed identity)
  - Celovite Bicep infrastrukturne predloge za varne razmestitve
  - Koda Node.js aplikacije z integracijo Azure SDK
  - 3 popolne vaje (omogočanje managed identity, user-assigned identity, rotacija Key Vault)
  - Najboljše prakse za varnost in RBAC konfiguracije
  - Vodnik za odpravljanje napak in analiza stroškov
  - Produkcijsko pripravljeni vzorci avtentikacije brez gesel

- **🤖 Lekcija o vzorcih usklajevanja več agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev usklajevanja (sekvenčno, paralelno, hierarhično, dogodkovno, konsenz)
  - Popolna implementacija orkestratorja (Python/Flask, 1,500+ vrstic)
  - 3 specializirane implementacije agentov (Research, Writer, Editor)
  - Integracija Service Bus za razvrščanje sporočil
  - Upravljanje stanja s Cosmos DB za distribuirane sisteme
  - 6 Mermaid diagramov, ki prikazujejo interakcije agentov
  - 3 napredne vaje (obravnava timeoutov, logika ponovnih poskusov, circuit breaker)
  - Razčlenitev stroškov ($240-565/month) z optimizacijskimi strategijami
  - Integracija Application Insights za nadzorovanje

#### Izboljšano
- **Pred-prodeployment poglavje**: Zdaj vključuje celovite vzorce za nadzorovanje in usklajevanje
- **Getting Started poglavje**: Izboljšano z profesionalnimi vzorci avtentikacije
- **Priprava za produkcijo**: Popolno pokritje od varnosti do opazljivosti
- **Curriculum**: Posodobljen za referenco do novih lekcij v poglavjih 3 in 6

#### Spremenjeno
- **Učni napredek**: Boljša integracija varnosti in nadzorovanja skozi celoten tečaj
- **Kakovost dokumentacije**: Dosledni A-grade standardi (95-97%) v novih lekcijah
- **Produkcijski vzorci**: Popolno end-to-end pokritje za podjetniške razmestitve

#### Izboljšano
- **Razvojna izkušnja**: Jasna pot od razvoja do nadzora v produkciji
- **Varnostni standardi**: Profesionalni vzorci za overjanje in upravljanje skrivnosti
- **Opazljivost**: Celovita integracija Application Insights z AZD
- **AI delovne obremenitve**: Specializirano spremljanje za Microsoft Foundry Models in večagentne sisteme

#### Preverjeno
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne odlomkov)
- ✅ Mermaid diagrami za vizualno učenje (19 skupaj v 3 lekcijah)
- ✅ Praktične vaje z verifikacijskimi koraki (skupaj 9)
- ✅ Produkcijsko pripravljene Bicep predloge, razmestljive z `azd up`
- ✅ Analiza stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje težav in najboljše prakse
- ✅ Kontrolne točke znanja z ukazi za preverjanje

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Celovit vodnik za nadzor
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne večagentne arhitekture
- **Splošna nova vsebina**: - Dosledni visoki standardi kakovosti

#### Tehnična implementacija
- **Application Insights**: Log Analytics + prilagojena telemetrija + porazdeljeno sledenje
- **Overjanje**: Managed Identity + Key Vault + RBAC vzorci
- **Večagentno**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Žive meritve + Kusto poizvedbe + opozorila + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike hrambe, nadzor proračuna

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Microsoft Foundry Models
**Ta izdaja izboljšuje kakovost dokumentacije po celotnem repozitoriju in dodaja popoln primer razmestitve Microsoft Foundry Models z vmesnikom za klepet gpt-4.1.**

#### Dodano
- **🤖 Microsoft Foundry Models Primer klepeta**: Popolna razmestitev gpt-4.1 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Microsoft Foundry Models (razmestitev modela gpt-4.1)
  - Python vmesnik za klepet v ukazni vrstici z zgodovino pogovorov
  - Integracija s Key Vault za varno shranjevanje API ključev
  - Sledenje uporabi tokenov in ocena stroškov
  - Omejevanje hitrosti zahtev in obravnava napak
  - Celovit README z vodnikom po razmestitvi (35–45 minut)
  - 11 produkcijsko pripravljenih datotek (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Dokumentacijske vaje**: Dodane praktične vaje v vodnik za konfiguracijo:
  - Vaja 1: Konfiguracija za več okolij (15 minut)
  - Vaja 2: Vaja upravljanja skrivnosti (10 minut)
  - Jasna merila uspeha in koraki za preverjanje
- **✅ Preverjanje razmestitve**: Dodan razdelek za preverjanje v vodnik za razmestitev:
  - Postopki preverjanja stanja
  - Kontrolni seznam meril uspeha
  - Pričakovani izhodi za vse ukaze za razmestitev
  - Hiter referenčni vodnik za odpravljanje težav

#### Izboljšano
- **examples/README.md**: Posodobljen na kakovost razreda A (93%):
  - Dodano azure-openai-chat v vse ustrezne odseke
  - Posodobljeno število lokalnih primerov z 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v hitri začetek za vmesne uporabnike
  - Dodano v razdelek Microsoft Foundry Templates
  - Posodobljena primerjalna matrika in razdelki o tehnoloških ugotovitvah
- **Kakovost dokumentacije**: Izboljšana ocena B+ (87%) → A- (92%) v mapi docs:
  - Dodani pričakovani izhodi pri kritičnih primerih ukazov
  - Vključeni koraki za preverjanje sprememb konfiguracije
  - Izboljšano praktično učenje s praktičnimi vajami

#### Spremenjeno
- **examples/README.md**: Posodobljen, da vključuje in poveže nove primere aplikacij v kontejnerjih pod "Lokalni primeri - aplikacije v kontejnerjih"
- **examples/README.md**: Posodobljen za izpostavitev primerov aplikacij v kontejnerjih, dodajanje vnosa v primerjalno matriko in posodobitev referenc tehnologije/arhitekture
- **Course Outline & Study Guide**: Posodobljeno, da se sklicuje na nove primere aplikacij v kontejnerjih in vzorce razmestitve v ustreznih poglavjih

#### Preverjeno
- ✅ Vsi novi primeri razmestljivi z `azd up` in sledijo najboljšim praksam
- ✅ Medsebojno povezovanje dokumentacije in navigacija posodobljena
- ✅ Primeri zajemajo scenarije od začetniškega do naprednega nivoja, vključno s produkcijskimi mikrostoritvami

#### Opombe
- **Obseg**: Samo angleška dokumentacija in primeri
- **Naslednji koraki**: Razširiti z dodatnimi naprednimi vzorci za kontejnerje in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.6.0] - 2025-11-19

#### Velika posodobitev: Primeri razmestitve Container App
**Ta izdaja uvaja celovite, produkcijsko pripravljene primere razmestitve vsebovanih aplikacij z uporabo Azure Developer CLI (AZD), s popolno dokumentacijo in integracijo v učni načrt.**

#### Dodano
- **🚀 Primeri aplikacij v kontejnerjih**: Novi lokalni primeri v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Popoln pregled kontejneriziranih razmestitev, hitri začetek, produkcija in napredni vzorci
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Uporabniku prijazen REST API za začetnike z scale-to-zero, health probes, nadzorom in odpravljanjem napak
  - [Microservices Architecture](../../examples/container-app/microservices): Produkcijsko pripravljen večstoritevni razpored (API Gateway, Product, Order, User, Notification), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, porazdeljeno sledenje, blue-green/canary razmestitev
- Najboljše prakse: Varnost, nadzor, optimizacija stroškov in smernice za CI/CD za delovne obremenitve v kontejnerjih
- Vzorci kode: Popolni `azure.yaml`, Bicep predloge in večjezične implementacije storitev (Python, Node.js, C#, Go)
- Testiranje in odpravljanje napak: Scenariji končnega do konca testiranja, ukazi za nadzor, vodnik za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljen, da vključuje in pove nove primere aplikacij v kontejnerjih pod "Lokalni primeri - aplikacije v kontejnerjih"
- **examples/README.md**: Posodobljen za poudarjanje primerov aplikacij v kontejnerjih, dodajanje v primerjalno matriko in posodobitev referenc tehnologije/arhitekture
- **Načrt tečaja in študijski vodnik**: Posodobljeno, da se sklicuje na nove primere aplikacij v kontejnerjih in vzorce razmestitve v ustreznih poglavjih

#### Preverjeno
- ✅ Vsi novi primeri razmestljivi z `azd up` in sledijo najboljšim praksam
- ✅ Križne povezave dokumentacije in navigacija posodobljene
- ✅ Primeri pokrivajo scenarije od začetniških do naprednih, vključno s produkcijskimi mikrostoritvami

#### Opombe
- **Obseg**: Dokumentacija in primeri samo v angleščini
- **Naslednji koraki**: Razširitev z dodatnimi naprednimi vzorci za kontejnerje in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 2025-11-19

#### Preimenovanje izdelka: Microsoft Foundry
**Ta izdaja izvaja celovito spremembo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preimenovanje Microsofta.**

#### Spremenjeno
- **🔄 Posodobitev imena izdelka**: Celovito preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljene vse reference v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: 23 vsebinskih referenc posodobljenih v 7 datotekah dokumentacije

- **📁 Spremembe strukture map**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Vse križne reference posodobljene, da odražajo novo strukturo map
  - Navigacijske povezave preverjene v celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Vse notranje povezave posodobljene, da se sklicujejo na novo ime datoteke

#### Posodobljene datoteke
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 reference imena izdelka posodobljene
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference posodobljene (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 križne reference posodobljene
  - `docs/getting-started/first-project.md` - 2 navigacijski povezavi poglavij posodobljeni
  - `docs/getting-started/installation.md` - 2 povezavi na naslednje poglavje posodobljeni
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference posodobljene (navigacija, Discord skupnost)
  - `docs/troubleshooting/common-issues.md` - 1 navigacijska povezava posodobljena
  - `docs/troubleshooting/debugging.md` - 1 navigacijska povezava posodobljena

- **Datoteke strukture tečaja** (2 datoteki):
  - `README.md` - 17 referenc posodobljenih (pregled tečaja, naslovi poglavij, razdelek predlog, vpogledi skupnosti)
  - `course-outline.md` - 14 referenc posodobljenih (pregled, cilji učenja, viri poglavij)

#### Preverjeno
- ✅ Ni preostalih referenc poti "ai-foundry" v angleških dokumentih
- ✅ Ni preostalih sklicev na ime izdelka "Microsoft Foundry" v angleških dokumentih
- ✅ Vse navigacijske povezave delujejo s novo strukturo map
- ✅ Preimenovanja datotek in map uspešno zaključena
- ✅ Križne reference med poglavji preverjene

#### Opombe
- **Obseg**: Spremembe uporabljene samo v angleški dokumentaciji v mapi `docs/`
- **Prevodi**: Mape za prevode (`translations/`) v tej izdaji niso posodobljene
- **Delavnice**: Materiali delavnic (`workshop/`) v tej izdaji niso posodobljeni
- **Primeri**: Primeri datotek lahko še vedno vsebujejo sklice na staro poimenovanje (obravnavano v prihodnji posodobitvi)
- **Zunanje povezave**: Zunanji URL-ji in sklici na GitHub repozitorij ostajajo nespremenjeni

#### Vodnik za migracijo za sodelavce
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite reference map: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite reference datotek: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje dokumentacijske povezave še vedno delujejo

---

### [v3.4.0] - 2025-10-24

#### Izboljšave predogleda infrastrukture in validacije
**Ta izdaja uvaja celovito podporo za novo možnost predogleda v Azure Developer CLI in izboljšuje uporabniško izkušnjo delavnic.**

#### Dodano
- **🧪 azd provision --preview Dokumentacija funkcije**: Celovito pokritje nove zmožnosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v priročnem pregledu ukazov (cheat sheet)
  - Podrobna integracija v vodniku za provisioniranje z uporabnimi primeri in koristmi
  - Integracija pre-flight preverjanja za varnejšo validacijo razmestitve
  - Posodobitve vodnika za začetek z varnostjo na prvem mestu pri praksah razmestitve

#### Izboljšano
- **Varnost infrastrukture**: Funkcionalnost predogleda integrirana v celotno dokumentacijo razmestitve
- **Validacija pred razmestitvijo**: Avtomatizirani skripti zdaj vključujejo testiranje predogleda infrastrukture
- **Delovni tok razvijalca**: Posodobljeni zaporedji ukazov vključujejo predogled kot najboljšo prakso
- **Izkušnja delavnice**: Uporabnikom so jasna pričakovanja glede statusa razvoja vsebine

#### Spremenjeno
- **Najboljše prakse razmestitve**: Predogled-prvi delovni tok zdaj priporočeni pristop
- **Tok dokumentacije**: Validacija infrastrukture premaknjena prej v učni proces
- **Predstavitev delavnice**: Profesionalna komunikacija statusa z jasnim časovnim okvirom razvoja

#### Izboljšano
- **Pristop 'varnost na prvem mestu'**: Spremembe infrastrukture je zdaj mogoče preveriti pred razmestitvijo
- **Sodelovanje v timu**: Rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: Boljše razumevanje stroškov virov pred provisioniranjem
- **Zmanjševanje tveganj**: Manj napak pri razmestitvi z napredno validacijo

#### Tehnična implementacija
- **Več-dokumentna integracija**: Funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorec ukazov**: Konsistentna sintaksa in primeri v celotni dokumentaciji
- **Integracija najboljših praks**: Predogled vključen v validacijske delovne procese in skripte
- **Vizualni indikatorji**: Jasne oznake NOVE funkcije za lažje odkrivanje

#### Infrastruktura delavnice
- **Komunikacija statusa**: Profesionalni HTML pas z gradientnim slogom
- **Uporabniška izkušnja**: Jasen status razvoja preprečuje zmedenost
- **Profesionalna predstavitev**: Ohranja kredibilnost repozitorija in hkrati postavlja pričakovanja
- **Preglednost časovnice**: Zadnja posodobitev oktober 2025 za preglednost

### [v3.3.0] - 2025-09-24

#### Izboljšano gradivo delavnice in interaktivna učna izkušnja
**Ta izdaja uvaja celovito gradivo delavnic z interaktivnimi vodiči v brskalniku in strukturiranimi učnimi potmi.**

#### Dodano
- **🎥 Interaktivni vodnik delavnice**: Izkušnja delavnice v brskalniku z možnostjo predogleda MkDocs
- **📝 Strukturirana navodila delavnice**: 7-koračni vodeni učni načrt od odkrivanja do prilagoditve
  - 0-Introduction: Pregled delavnice in nastavitev
  - 1-Select-AI-Template: Postopek iskanja in izbire predlog
  - 2-Validate-AI-Template: Razmestitev in postopki preverjanja
  - 3-Deconstruct-AI-Template: Razumevanje arhitekture predloge
  - 4-Configure-AI-Template: Konfiguracija in prilagoditev
  - 5-Customize-AI-Template: Napredne spremembe in iteracije
  - 6-Teardown-Infrastructure: Čiščenje in upravljanje virov
  - 7-Wrap-up: Povzetek in nadaljnji koraki
- **🛠️ Workshop Tooling**: Konfiguracija MkDocs z Material temo za izboljšano učno izkušnjo
- **🎯 Hands-On Learning Path**: 3-koračna metodologija (Odkritje → Razmestitev → Prilagoditev)
- **📱 GitHub Codespaces Integration**: Brezhibna nastavitev razvojnega okolja

#### Izboljšano
- **AI Workshop Lab**: Razširjeno z obsežnim 2–3-urnim strukturiranim učnim programom
- **Workshop Documentation**: Profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- **Learning Progression**: Jasno navodilo korak za korakom od izbire predloge do uvajanja v produkcijo
- **Developer Experience**: Integrirana orodja za poenostavljene razvojne delovne tokove

#### Izboljšano
- **Accessibility**: Vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- **Self-Paced Learning**: Prilagodljiva struktura delavnice, ki ustreza različnim hitrostim učenja
- **Practical Application**: Resnični primeri razmestitve AI-predlog
- **Community Integration**: Povezava z Discordom za podporo in sodelovanje pri delavnici

#### Značilnosti delavnice
- **Built-in Search**: Hitro iskanje ključnih besed in lekcij
- **Copy Code Blocks**: Funkcija kopiranja s premikom miške za vse primere kode
- **Theme Toggle**: Podpora za temni/svetli način glede na preference
- **Visual Assets**: Posnetki zaslona in diagrami za boljše razumevanje
- **Help Integration**: Neposreden dostop do Discorda za podporo skupnosti

### [v3.2.0] - 2025-09-17

#### Velika prestrukturacija navigacije in sistem učenja temeljen na poglavjih
**Ta različica uvaja celovit sistem učenja, organiziran po poglavjih, z izboljšano navigacijo skozi celoten repozitorij.**

#### Dodano
- **📚 Chapter-Based Learning System**: Prestrukturiran celoten tečaj v 8 progresivnih učnih poglavij
  - Chapter 1: Osnove & Hitri začetek (⭐ - 30-45 min)
  - Chapter 2: Razvoj, usmerjen na AI (⭐⭐ - 1-2 uri)
  - Chapter 3: Konfiguracija & Avtentikacija (⭐⭐ - 45-60 min)
  - Chapter 4: Infrastruktura kot koda & Razmestitev (⭐⭐⭐ - 1-1.5 ure)
  - Chapter 5: Večagentne AI rešitve (⭐⭐⭐⭐ - 2-3 ure)
  - Chapter 6: Pre-deployment Validation & Planning (⭐⭐ - 1 ura)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 ure)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 ure)
- **📚 Comprehensive Navigation System**: Dosledna zaglavja in noge navigacije po vsej dokumentaciji
- **🎯 Progress Tracking**: Kontrolni seznam dokončanja tečaja in sistem preverjanja znanja
- **🗺️ Learning Path Guidance**: Jasne vstopne točke za različne stopnje izkušenj in cilje
- **🔗 Cross-Reference Navigation**: Sorodna poglavja in predpogoji jasno povezani

#### Izboljšano
- **README Structure**: Preoblikovana v strukturirano učno platformo z organizacijo po poglavjih
- **Documentation Navigation**: Vsaka stran zdaj vključuje kontekst poglavja in smernice za napredovanje
- **Template Organization**: Primeri in predloge dodeljeni ustreznim učnim poglavjem
- **Resource Integration**: Hitre reference, FAQ in študijski vodiči povezani z ustreznimi poglavji
- **Workshop Integration**: Praktične laboratorijske vaje dodeljene ciljem učenja v več poglavjih

#### Spremenjeno
- **Learning Progression**: Prešlo iz linearne dokumentacije v prilagodljivo učenje, organizirano po poglavjih
- **Configuration Placement**: Vodnik za konfiguracijo prestavljen v Poglavje 3 za boljši potek učenja
- **AI Content Integration**: Boljša integracija AI-specifičnih vsebin skozi celotno učno pot
- **Production Content**: Napredni vzorci združeni v Poglavju 8 za podjetniške udeležence

#### Izboljšano
- **User Experience**: Jasne navigacijske drobtinice in indikatorji napredka poglavij
- **Accessibility**: Dosledni vzorci navigacije za lažje premikanje po tečaju
- **Professional Presentation**: Struktura tečaja v slogu univerze, primerna za akademsko in podjetniško usposabljanje
- **Learning Efficiency**: Zmanjšan čas iskanja ustreznih vsebin zaradi izboljšane organizacije

#### Tehnična izvedba
- **Navigation Headers**: Standardizirana navigacija poglavij v več kot 40 dokumentacijskih datotekah
- **Footer Navigation**: Dosledne smernice za napredovanje in indikatorji dokončanja poglavij
- **Cross-Linking**: Celovit sistem notranjih povezav, ki povezuje sorodne koncepte
- **Chapter Mapping**: Predloge in primeri jasno povezani z učnimi cilji

#### Izboljšava študijskega vodiča
- **📚 Comprehensive Learning Objectives**: Študijski vodič prestrukturiran za uskladitev z 8-poglavnim sistemom
- **🎯 Chapter-Based Assessment**: Vsako poglavje vključuje specifične učne cilje in praktične vaje
- **📋 Progress Tracking**: Tedenski učni urnik z merljivimi rezultati in kontrolnimi seznami dokončanja
- **❓ Assessment Questions**: Vprašanja za preverjanje znanja za vsako poglavje s profesionalnimi izidi
- **🛠️ Practical Exercises**: Praktične aktivnosti z resničnimi scenariji razmestitve in odpravljanjem težav
- **📊 Skill Progression**: Jasno napredovanje od osnovnih konceptov do podjetniških vzorcev s poudarkom na razvoju kariere
- **🎓 Certification Framework**: Profesionalni razvojni izidi in sistem prepoznavanja v skupnosti
- **⏱️ Timeline Management**: Strukturiran 10-tedenski učni načrt z validacijo mejnikov

### [v3.1.0] - 2025-09-17

#### Izboljšane večagentne AI rešitve
**Ta različica izboljšuje večagentno maloprodajno rešitev z boljšim poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremenjeno
- **Multi-Agent Terminology**: Zamenjano "Cora agent" z "Customer agent" po celotni maloprodajni večagentni rešitvi za boljše razumevanje
- **Agent Architecture**: Posodobljena vsa dokumentacija, ARM predloge in primeri kode za uporabo doslednega poimenovanja "Customer agent"
- **Configuration Examples**: Modernizirani vzorci konfiguracije agentov z posodobljenimi konvencijami poimenovanja
- **Documentation Consistency**: Zagotovljeno, da vse reference uporabljajo profesionalna, opisna imena agentov

#### Izboljšano
- **ARM Template Package**: Posodobljen retail-multiagent-arm-template s sklici na Customer agent
- **Architecture Diagrams**: Osveženi Mermaid diagrami s posodobljenim poimenovanjem agentov
- **Code Examples**: Python razredi in primeri implementacije zdaj uporabljajo poimenovanje CustomerAgent
- **Environment Variables**: Posodobljeni vsi skripti za razmestitev za uporabo konvencij CUSTOMER_AGENT_NAME

#### Izboljšano
- **Developer Experience**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Production Readiness**: Boljše usklajevanje s podjetniškimi konvencijami poimenovanja
- **Learning Materials**: Bolj intuitivno poimenovanje agentov za izobraževalne namene
- **Template Usability**: Poenostavljeno razumevanje funkcij agentov in vzorcev razmestitve

#### Tehnični podatki
- Posodobljeni Mermaid arhitekturni diagrami s sklici na CustomerAgent
- Zamenjana imena razredov CoraAgent z CustomerAgent v Python primerih
- Spremenjene ARM predloge JSON konfiguracije za uporabo tipa agenta "customer"
- Posodobljene spremenljivke okolja iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osveženi vsi ukazi za razmestitev in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Velike spremembe - Poudarek na AI razvijalcih in integracija z Microsoft Foundry
**Ta različica preobrazi repozitorij v celovit učni vir, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Dodano
- **🤖 AI-First Learning Path**: Celovita prestrukturacija s prednostno obravnavo AI razvijalcev in inženirjev
- **Microsoft Foundry Integration Guide**: Celovita dokumentacija za povezovanje AZD z Microsoft Foundry storitvami
- **AI Model Deployment Patterns**: Podroben vodnik, ki pokriva izbiro modela, konfiguracijo in strategije razmestitve v produkcijo
- **AI Workshop Lab**: 2–3-urno praktično delavnico za pretvorbo AI aplikacij v rešitve, primerne za razmestitev z AZD
- **Production AI Best Practices**: Podjetju prijazni vzorci za skaliranje, spremljanje in zavarovanje AI delovnih obremenitev
- **AI-Specific Troubleshooting Guide**: Celovit vodič za odpravljanje težav pri Microsoft Foundry modelih, Cognitive Services in težavah pri razmestitvi AI
- **AI Template Gallery**: Izbrana zbirka Microsoft Foundry predlog z ocenami zahtevnosti
- **Workshop Materials**: Popolna struktura delavnice s praktičnimi laboratorijskimi vajami in referenčnimi materiali

#### Izboljšano
- **README Structure**: Osredotočeno na AI razvijalce s 45% podatki o interesu skupnosti iz Microsoft Foundry Discord
- **Learning Paths**: Namenjena pot AI razvijalca poleg tradicionalnih poti za študente in DevOps inženirje
- **Template Recommendations**: Priporočene AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Community Integration**: Izboljšana podpora skupnosti na Discordu s kanali in razpravami, specifičnimi za AI

#### Varnost in poudarek na produkciji
- **Managed Identity Patterns**: AI-specifične konfiguracije overjanja in varnosti
- **Cost Optimization**: Sledenje porabe tokenov in nadzor proračuna za AI delovne obremenitve
- **Multi-Region Deployment**: Strategije za globalno razmestitev AI aplikacij
- **Performance Monitoring**: AI-specifične meritve in integracija z Application Insights

#### Kakovost dokumentacije
- **Linear Course Structure**: Logično napredovanje od začetnika do naprednih vzorcev razmestitve AI
- **Validated URLs**: Vse zunanje povezave repozitorija preverjene in dostopne
- **Complete Reference**: Vse notranje povezave dokumentacije preverjene in funkcionalne
- **Production Ready**: Podjetju pripravljeni vzorci razmestitve z resničnimi primeri

### [v2.0.0] - 2025-09-09

#### Velike spremembe - Prestrukturiranje repozitorija in profesionalna izboljšava
**Ta različica predstavlja pomembno prenovo strukture repozitorija in predstavitve vsebin.**

#### Dodano
- **Structured Learning Framework**: Vse strani z dokumentacijo zdaj vključujejo razdelke Uvod, Cilji učenja in Učni izidi
- **Navigation System**: Dodane povezave Prejšnja/Naslednja lekcija po celotni dokumentaciji za vodeno napredovanje učenja
- **Study Guide**: Celovit study-guide.md z učnimi cilji, praktičnimi vajami in gradivi za ocenjevanje
- **Professional Presentation**: Odstranjeni vsi emoji za izboljšano dostopnost in profesionalen videz
- **Enhanced Content Structure**: Izboljšana organizacija in potek učnih gradiv

#### Spremenjeno
- **Documentation Format**: Standardizirana vsa dokumentacija z dosledno učno usmerjeno strukturo
- **Navigation Flow**: Uvedeno logično napredovanje skozi vsa učna gradiva
- **Content Presentation**: Odstranjeni dekorativni elementi v korist jasne, profesionalne postavitve
- **Link Structure**: Posodobljene vse notranje povezave za podporo novemu navigacijskemu sistemu

#### Izboljšano
- **Accessibility**: Odstranjene odvisnosti od emoji za boljšo združljivost s čitalniki zaslona
- **Professional Appearance**: Čista, akademska predstavitev, primerna za podjetniško učenje
- **Learning Experience**: Strukturiran pristop z jasnimi cilji in izidi za vsako lekcijo
- **Content Organization**: Boljši logični potek in povezave med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prvotna izdaja - Celovit učni repozitorij AZD

#### Dodano
- **Osnovna struktura dokumentacije**
  - Celotna serija uvodnih vodičev
  - Celovita dokumentacija za razmestitev in zagotavljanje infrastrukture
  - Podrobni viri za odpravljanje težav in vodiči za odpravljanje napak
  - Orodja in postopki za preverjanje pred razmestitvijo

- **Modul Začetek**
  - AZD Basics: Temeljni koncepti in terminologija
  - Installation Guide: Navodila za namestitev, specifična za platformo
  - Configuration Guide: Nastavitev okolja in overjanje
  - First Project Tutorial: Korak za korakom praktično učenje

- **Modul za razmestitev in zagotavljanje**
  - Deployment Guide: Celotna dokumentacija delovnega toka
  - Provisioning Guide: Infrastruktura kot koda z Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Modul preverjanja pred razmestitvijo**
  - Capacity Planning: Preverjanje razpoložljivosti virov Azure
  - SKU Selection: Celovite smernice za nivoje storitev
  - Pre-flight Checks: Avtomatizirani skripti za preverjanje (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Common Issues: Pogosto srečani problemi in rešitve
  - Debugging Guide: Sistematične metode za odpravljanje težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Viri in reference**
  - Hitri priročnik ukazov: Hitra referenca za bistvene ukaze
  - Glossary: Celovite razlage terminologije in okrajšav
  - FAQ: Podrobni odgovori na pogosta vprašanja
  - Zunanje povezave do virov in povezave s skupnostjo

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za razmestitev statične spletne strani
  - Konfiguracija aplikacije v kontejnerju
  - Vzorci integracije podatkovnih baz
  - Primeri mikroservisne arhitekture
  - Implementacije brezstrežnih funkcij

#### Značilnosti
- **Multi-Platform Support**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Multiple Skill Levels**: Vsebine namenjene od študentov do profesionalnih razvijalcev
- **Practical Focus**: Praktični primeri in resnični scenariji
- **Comprehensive Coverage**: Od osnovnih konceptov do naprednih podjetniških vzorcev
- **Security-First Approach**: Najboljše varnostne prakse vključene povsod
- **Cost Optimization**: Smernice za stroškovno učinkovite razmestitve in upravljanje virov

#### Kakovost dokumentacije
- **Detailed Code Examples**: Praktični, testirani primeri kode
- **Step-by-Step Instructions**: Jasna, izvedljiva navodila
- **Comprehensive Error Handling**: Odpravljanje težav za pogoste težave
- **Best Practices Integration**: Industrijski standardi in priporočila
- **Version Compatibility**: Posodobljeno z najnovejšimi Azure storitvami in funkcijami azd

## Načrtovane prihodnje izboljšave

### Verzija 3.1.0 (Načrtovana)
#### Razširitev AI platforme
- **Podpora več modelom**: Vzorce integracije za Hugging Face, Azure Machine Learning in lastne modele
- **Okviri za AI agente**: Predloge za uvajanje LangChain, Semantic Kernel in AutoGen
- **Napredni vzorci RAG**: Možnosti vektorskih baz podatkov poleg Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje uspešnosti modela, porabe tokenov in kakovosti odgovorov

#### Izkušnja razvijalca
- **Razširitev VS Code**: Integrirana izkušnja razvoja AZD + Microsoft Foundry
- **Integracija GitHub Copilot**: Generiranje AZD predlog z AI pomočjo
- **Interaktivni vodiči**: Praktične vaje kodiranja z avtomatizirano validacijo za AI scenarije
- **Video vsebine**: Dopolnilni video vodiči za vizualne učence, osredotočeni na uvajanje AI

### Različica 4.0.0 (Načrtovano)
#### Vzorci AI za podjetja
- **Okvir upravljanja**: Upravljanje AI modelov, skladnost in revizijske sledi
- **AI za več najemnikov**: Vzorci za postrežbo več strank z izoliranimi AI storitvami
- **Uvajanje AI na robu**: Integracija z Azure IoT Edge in instancami kontejnerjev
- **Hibridni oblačni AI**: Večoblačni in hibridni vzorci uvajanja za AI delovne obremenitve

#### Napredne funkcije
- **Avtomatizacija AI cevovodov**: MLOps integracija z Azure Machine Learning cevovodi
- **Napredna varnost**: Zero-trust vzorci, zasebni končni priključki in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredno nastavljanje in strategije skaliranja za AI aplikacije z visokim pretokom
- **Globalna distribucija**: Vzorci dostave vsebin in predpomnjenja na robu za AI aplikacije

### Različica 3.0.0 (Načrtovano) - Zamenjano s trenutno izdajo
#### Predlagani dodatki - Zdaj izvedeno v v3.0.0
- ✅ **Vsebine osredotočene na AI**: Celovita integracija Microsoft Foundry (Dokončano)
- ✅ **Interaktivni vodiči**: Praktična AI delavnica (Dokončano)
- ✅ **Modul napredne varnosti**: AI-specifični varnostni vzorci (Dokončano)
- ✅ **Optimizacija zmogljivosti**: Strategije nastavitve AI obremenitev (Dokončano)

### Različica 2.1.0 (Načrtovano) - Delno izvedeno v v3.0.0
#### Manjše izboljšave - Nekatere izvedene v trenutni izdaji
- ✅ **Dodatni primeri**: Scenariji uvajanja osredotočeni na AI (Dokončano)
- ✅ **Razširjen FAQ**: AI-specifična vprašanja in odpravljanje težav (Dokončano)
- **Integracija orodij**: Izboljšani vodiči za integracijo IDE in urejevalnikov
- ✅ **Razširjanje nadzora**: AI-specifični vzorci spremljanja in opozarjanja (Dokončano)

#### Še vedno načrtovano za prihodnjo izdajo
- **Dokumentacija prijazna za mobilne naprave**: Prilagodljiva zasnova za mobilno učenje
- **Dostop brez povezave**: Prenosni paketi dokumentacije
- **Izboljšana integracija IDE**: Razširitev VS Code za AZD + AI poteke dela
- **Nadzorna plošča skupnosti**: Meritve skupnosti v realnem času in sledenje prispevkom

## Prispevanje k dnevniku sprememb

### Prijavljanje sprememb
Ko prispevate v ta repozitorij, poskrbite, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: V skladu s semantičnim verzioniranjem (major.minor.patch)
2. **Datum**: Datum izdaje ali posodobitve v formatu YYYY-MM-DD
3. **Kategorija**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Jasen opis**: Jedrnat opis, kaj se je spremenilo
5. **Ocena vpliva**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Added
- Nove funkcije, razdelki dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripte ali pripomočki

#### Changed
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebine ali organizacije

#### Deprecated
- Funkcije ali pristopi, ki se umikajo
- Razdelki dokumentacije, ki jih je načrtovano odstraniti
- Metode, za katere obstajajo boljše alternative

#### Removed
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarele informacije ali pristopi, ki so bili odpisani
- Odvečna ali združena vsebina

#### Fixed
- Popravki napak v dokumentaciji ali kodi
- Reševanje prijavljenih težav ali problemov
- Izboljšave natančnosti ali funkcionalnosti

#### Security
- Izboljšave ali popravki, povezani z varnostjo
- Posodobitve najboljših varnostnih praks
- Reševanje varnostnih ranljivosti

### Smernice za semantično verzioniranje

#### Glavna različica (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrep uporabnika
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spremenijo temeljni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost z preteklimi različicami
- Dodatni primeri, orodja ali viri

#### Popravna različica (X.Y.Z)
- Popravki napak in korekture
- Manjše izboljšave obstoječe vsebine
- Pojasnila in manjše izboljšave

## Povratne informacije skupnosti in predlogi

### Kako podati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (AI-specifična vprašanja so dobrodošla)
- **Discord Discussions**: Delite ideje in sodelujte z Microsoft Foundry skupnostjo
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, zlasti AI predloge in vodiče
- **Microsoft Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Community Forums**: Sodelujte v širših razpravah razvijalcev Azure

### Kategorije povratnih informacij
- **Natančnost AI vsebin**: Popravki glede integracije AI storitev in informacij o uvajanju
- **Učna izkušnja**: Predlogi za izboljšano učno pot za AI razvijalce
- **Manjkajoče AI vsebine**: Zahteve po dodatnih AI predlogah, vzorcih ali primerih
- **Dostopnost**: Izboljšave za različne učne potrebe
- **Integracija AI orodij**: Predlogi za boljšo integracijo potekov dela pri razvoju AI
- **Produkcijski AI vzorci**: Zahteve po vzorcih uvajanja AI v podjetjih

### Zaveza glede odziva
- **Odziv na težave**: V roku 48 ur za prijavljene težave
- **Zahteve za funkcije**: Evalvacija v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Takojšnja prioriteta z pohitrim odzivom

## Razpored vzdrževanja

### Redne posodobitve
- **Mesečni pregledi**: Natančnost vsebine in preverjanje povezav
- **Kvartalne posodobitve**: Večji dodatki vsebine in izboljšave
- **Polletni pregledi**: Celovito prestrukturiranje in izboljšave
- **Letne izdaje**: Večje različice z pomembnimi izboljšavami

### Nadzor in zagotavljanje kakovosti
- **Avtomatizirano testiranje**: Redna validacija primerov kode in povezav
- **Integracija povratnih informacij skupnosti**: Redno vključevanje uporabniških predlogov
- **Tehnološke posodobitve**: Usmeritev z najnovejšimi Azure storitvami in izdajami azd
- **Revizije dostopnosti**: Redni pregledi za načela vključujočega oblikovanja

## Politika podpore različicam

### Podpora za trenutno različico
- **Zadnja glavna različica**: Popolna podpora z rednimi posodobitvami
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki za 12 mesecev
- **Zastarele različice**: Samo podpora skupnosti, brez uradnih posodobitev

### Smernice za migracijo
Ko so izdane glavne različice, zagotovimo:
- **Vodniki za migracijo**: Navodila za prehod korak za korakom
- **Opombe o združljivosti**: Podrobnosti o prelomnih spremembah
- **Podpora orodij**: Skripte ali pripomočki za pomoč pri migraciji
- **Podpora skupnosti**: Namenjeni forumi za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Vodnik za študij](resources/study-guide.md)
- **Naslednja lekcija**: Nazaj na [Glavni README](README.md)

**Ostanite obveščeni**: Spremljajte ta repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatski prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku naj velja za avtoritativni vir. Za kritične informacije priporočamo strokoven človeški prevod. Ne odgovarjamo za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->