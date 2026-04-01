# Pakeitimų žurnalas - AZD For Beginners

## Įvadas

Šis pakeitimų žurnalas dokumentuoja visus reikšmingus pakeitimus, atnaujinimus ir patobulinimus AZD For Beginners saugykloje. Mes vadovaujamės semantinio verzionavimo principais ir tvarkome šį žurnalą, kad padėtume vartotojams suprasti, kas pasikeitė tarp versijų.

## Mokymosi tikslai

Peržiūrėję šį pakeitimų žurnalą, jūs:
- Būsite informuoti apie naujas funkcijas ir turinio papildymus
- Suprasite pagerinimus esamoje dokumentacijoje
- Seksite klaidų taisymus ir pataisas, kad būtų užtikrintas tikslumas
- Seksite mokymosi medžiagos raidą laikui bėgant

## Mokymosi rezultatai

Po pakeitimų žurnalo įrašų peržiūros jūs galėsite:
- Nustatyti naują turinį ir išteklius, prieinamus mokymuisi
- Suprasti, kurios skiltys buvo atnaujintos arba patobulintos
- Planuoti savo mokymosi kelią remiantis naujausia medžiaga
- Teikti atsiliepimus ir pasiūlymus būsimoms patobulinimams

## Versijų istorija

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Ši versija tęsia AZD 1.23 validacijos peržiūrą su pradedantiesiems skirtu dokumentacijos tikslinimu: ji paaiškina AZD pirmą autentifikavimo gairę, prideda vietinius diegimo patikrinimo skriptus, patikrina svarbiausias komandas pagal veikiantį AZD CLI ir pašalina paskutines pasenusias komandų nuorodas anglų kalba už pakeitimų žurnalo ribų.**

#### Added
- **🧪 Pradedančiajam skirti diegimo patikrinimo skriptai** su `validate-setup.ps1` ir `validate-setup.sh`, kad besimokantieji galėtų patvirtinti reikalingus įrankius prieš pradedant 1 skyrių
- **✅ Išankstiniai diegimo patikrinimo žingsniai** pagrindiniame README ir Chapter 1 README, kad trūkstami išankstiniai reikalavimai būtų aptikti prieš `azd up`

#### Changed
- **🔐 Autentifikavimo gairės pradedantiesiems** dabar nuosekliai traktuoja `azd auth login` kaip pagrindinį kelią AZD darbo eigai, o `az login` nurodomas kaip neprivalomas, nebent Azure CLI komandos yra naudojamos tiesiogiai
- **📚 1 skyriaus įsdiegimo eiga** dabar nukreipia besimokančiuosius patikrinti jų vietinę aplinką prieš diegimą, autentifikavimą ir pirmuosius diegimo žingsnius
- **🛠️ Patikros žinutės** dabar aiškiai atskiria blokinius reikalavimus nuo neprivalomų Azure CLI įspėjimų pradedantiesiems, naudojantiems tik AZD
- **📖 Konfigūracijos, trikčių šalinimo ir pavyzdžių dokumentai** dabar aiškiai atskiria privalomą AZD autentifikaciją ir neprivalomą Azure CLI prisijungimą, kur anksčiau abu buvo pateikti be konteksto

#### Fixed
- **📋 Likusios anglų šaltinio komandų nuorodos** atnaujintos į dabartines AZD formas, įskaitant `azd config show` čekyje ir `azd monitor --overview`, kai buvo numatoma Azure Portal apžvalgos gairė
- **🧭 1 skyriaus pradedančiųjų teiginiai** sušvelninti, kad nebūtų peržengiamas pažadas dėl garantuotos be-klaidų ar automatinio atstatymo įvykdymo visuose šablonuose ir Azure ištekliuose
- **🔎 Veikianti CLI patikra** patvirtino esamą palaikymą komandoms `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ir `azd down --force --purge`

#### Files Updated
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

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**Ši versija atlieka dokumentacijos validacijos patikrą prieš `azd` `1.23.12`, atnaujina pasenusius AZD komandų pavyzdžius, atnaujina AI modelių gaires į dabartinius numatytuosius nustatymus ir išplečia dirbtuvių instrukcijas ne tik GitHub Codespaces, bet ir dev konteineriams bei vietiniams klonams.**

#### Added
- **✅ Validacijos pastabos pagrindiniuose skyriuose ir dirbtuvių dokumentacijoje**, kad besimokantieji matytų testuotą AZD bazinę versiją, jei naudoja naujesnes arba senesnes CLI versijas
- **⏱️ Diegimo laukimo laiko gairės** ilgai trunkančioms AI programų diegimo operacijoms naudojant `azd deploy --timeout 1800`
- **🔎 Plėtinio apžiūros žingsniai** su `azd extension show azure.ai.agents` AI darbo eigos dokumentuose
- **🌐 Išplėsta dirbtuvių aplinkos gaires** apimančias GitHub Codespaces, dev konteinerius ir vietinius klonavimus su MkDocs

#### Changed
- **📚 Skyriaus intro README** dabar nuosekliai nurodo validaciją prieš `azd 1.23.12` skyriuose: foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting ir production
- **🛠️ AZD komandų nuorodos** atnaujintos į dabartines formas dokumentuose:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` arba `azd env get-value(s)` priklausomai nuo konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kai norima Application Insights apžvalgos
- **🧪 Provision peržiūros pavyzdžiai** supaprastinti į dabartinį palaikomą naudojimą, pvz., `azd provision --preview` ir `azd provision --preview -e production`
- **🧭 Dirbtuvių eiga** atnaujinta, kad besimokantieji galėtų atlikti laboratorijas Codespaces, dev konteineryje arba vietiniame klone, o ne manyti, kad vykdymas yra tik Codespaces
- **🔐 Autentifikavimo gairės** dabar teikia prioritetą `azd auth login` AZD darbo eigoms, o `az login` laikomas neprivalomu, kai tiesiogiai naudojamos Azure CLI komandos

#### Fixed
- **🪟 Windows diegimo komandos** normalizuotos prie dabartinio `winget` paketo rašybos diegimo gairėje
- **🐧 Linux diegimo gairės** ištaisytos, kad būtų išvengta nepalaikomų paskirstymo specifinių `azd` paketų tvarkytuvų nurodymų ir vietoje to būtų nurodyti leidimo artefaktai, kai tinkama
- **📦 AI modelių pavyzdžiai** atnaujinti nuo senesnių numatytųjų, tokių kaip `gpt-35-turbo` ir `text-embedding-ada-002`, į dabartinius pavyzdžius, pvz., `gpt-4.1-mini`, `gpt-4.1` ir `text-embedding-3-large`
- **📋 Diegimo ir diagnostikos fragmentai** ištaisyti, kad naudotų dabartines aplinkos ir būsenos komandas žurnaluose, skriptuose ir trikčių šalinimo žingsniuose
- **⚙️ GitHub Actions gairės** atnaujintos iš `Azure/setup-azd@v1.0.0` į `Azure/setup-azd@v2`
- **🤖 MCP/Copilot sutikimo gairės** atnaujintos iš `azd mcp consent` į `azd copilot consent list`

#### Improved
- **🧠 AI skyriaus gairės** dabar geriau paaiškina peržiūros jautrų `azd ai` elgesį, nuomos (tenant) specifinį prisijungimą, esamą plėtinių naudojimą ir atnaujintas modelių diegimo rekomendacijas
- **🧪 Dirbtuvių instrukcijos** dabar naudoja realistiškesnius versijų pavyzdžius ir aiškesnę aplinkos nustatymo kalbą praktinėms laboratorijoms
- **📈 Gamybos ir trikčių šalinimo dokumentai** dabar geriau atitinka dabartines stebėjimo, atsarginio modelio ir kaštų lygių pavyzdžių gaires

#### Files Updated
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

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Ši versija prideda `azd ai`, `azd extension` ir `azd mcp` komandų aprėptį visuose su AI susijusiuose skyriuose, ištaiso sulūžusias nuorodas ir pasenusią kodą agents.md, atnaujina čekį ir pertvarko Pavyzdžių šablonų skiltį su patikrintais aprašymais bei naujais Azure AI AZD šablonais.**

#### Added
- **🤖 AZD AI CLI aprėptis** per 7 failus (anksčiau tik 8 skyriuje):
  - `docs/chapter-01-foundation/azd-basics.md` — Nauja skiltis "Extensions and AI Commands", pristatanti `azd extension`, `azd ai agent init` ir `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Parinktis 4: `azd ai agent init` su palyginimo lentele (šablono vs manifestų požiūris)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — poskyriai "AZD Extensions for Foundry" ir "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start dabar rodo tiek šablonu, tiek manifestu paremtus diegimo kelius
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy skyriuje dabar yra `azd ai agent init` parinktis
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — poskyris "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nauja skiltis "AI & Extensions Commands" su `azd extension`, `azd ai agent init`, `azd mcp` ir `azd infra generate`
- **📦 Nauji AZD AI pavyzdžių šablonai** `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG pokalbis su Blazor WebAssembly, Semantic Kernel ir balso pokalbio palaikymu
  - **azure-search-openai-demo-java** — Java RAG pokalbis naudojant Langchain4J su ACA/AKS diegimo galimybėmis
  - **contoso-creative-writer** — Daugiagentė kūrybinio rašymo programa naudojanti Azure AI Agent Service, Bing Grounding ir Prompty
  - **serverless-chat-langchainjs** — Be serverio RAG naudojant Azure Functions + LangChain.js + Cosmos DB su Ollama vietinio vystymo palaikymu
  - **chat-with-your-data-solution-accelerator** — Verslo RAG akceleratorius su administravimo portalu, Teams integracija ir PostgreSQL/Cosmos DB parinktimis
  - **azure-ai-travel-agents** — Daugiagentė MCP orkestravimo atskaitos programa su serveriais .NET, Python, Java ir TypeScript
  - **azd-ai-starter** — Minimalus Azure AI infrastruktūros Bicep pradžios šablonas
  - **🔗 Awesome AZD AI Gallery link** — Nuoroda į [awesome-azd AI galeriją](https://azure.github.io/awesome-azd/?tags=ai) (80+ šablonų)

#### Fixed
- **🔗 agents.md navigacija**: Previous/Next nuorodos dabar atitinka 2 skyriaus README pamokų tvarką (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md sulūžusios nuorodos**: `production-ai-practices.md` ištaisytas į `../chapter-08-production/production-ai-practices.md` (3 vietos)
- **📦 agents.md pasenęs kodas**: Pakeistas `opencensus` į `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neteisingas API**: `max_tokens` perkeltas iš `create_agent()` į `create_run()` kaip `max_completion_tokens`
- **🔢 agents.md žetonų skaičiavimas**: Pakeistas grubus `len//4` vertinimas į `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ištaisyti servisai iš "Cognitive Search + App Service" į "Azure AI Search + Azure Container Apps" (numatytasis talpinimas pasikeitė 2024 m. spalio)
- **contoso-chat**: Atnaujintas aprašymas, kad būtų nurodytas Azure AI Foundry + Prompty, atitinkantis repozitorijaus faktinį pavadinimą ir technologijų rinkinį

#### Removed
- **ai-document-processing**: Pašalinta neveikianti šablono nuoroda (repo nėra viešai pasiekiamas kaip AZD šablonas)

#### Improved
- **📝 agents.md užduotys**: 1 užduotis dabar rodo tikėtiną išvestį ir `azd monitor` žingsnį; 2 užduotyje pateiktas pilnas `FunctionTool` registracijos kodas; 3 užduotis pakeičia neaiškias nuorodas konkrečiomis `prepdocs.py` komandomis
- **📚 agents.md ištekliai**: Atnaujinti dokumentacijos saitai į naujausią Azure AI Agent Service dokumentaciją ir greitojo paleidimo vadovą
- **📋 agents.md Tolimesnių žingsnių lentelė**: Pridėtas AI Workshop Lab saitas, kad būtų užtikrintas viso skyriaus aprėptis

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kursų navigacijos patobulinimas
**Ši versija patobulina README.md skyrių navigaciją su išplėstine lentelės forma.**

#### Pakeitimai
- **Kurso žemėlapio lentelė**: Išplėsta tiesioginiais pamokų saitais, trukmės įvertinimais ir sudėtingumo reitingais
- **Aplankų sutvarkymas**: Pašalinti pertekliniai seni aplankai (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Saitų tikrinimas**: Patikrinti visi 21+ vidiniai saitai Kurso žemėlapio lentelėje

### [v3.16.0] - 2026-02-05

#### Produkto pavadinimų atnaujinimai
**Ši versija atnaujina produkto nuorodas, kad atitiktų dabartinį Microsoft įvaizdį.**

#### Pakeitimai
- **Microsoft Foundry → Microsoft Foundry**: Visos nuorodos atnaujintos nevertimo failuose
- **Azure AI Agent Service → Foundry Agents**: Paslaugos pavadinimas atnaujintas, kad atspindėtų dabartinį prekės ženklą

#### Atnaujinti failai
- `README.md` - Pagrindinis kurso pristatymo puslapis
- `changelog.md` - Versijų istorija
- `course-outline.md` - Kurso struktūra
- `docs/chapter-02-ai-development/agents.md` - AI agentų vadovas
- `examples/README.md` - Pavyzdžių dokumentacija
- `workshop/README.md` - Dirbtuvių pristatymo puslapis
- `workshop/docs/index.md` - Dirbtuvių indeksas
- `workshop/docs/instructions/*.md` - Visi dirbtuvių instrukcijų failai

---

### [v3.15.0] - 2026-02-05

#### Reikšmingas saugyklos pertvarkymas: pavadinti aplankai pagal skyrius
**Ši versija pertvarko dokumentaciją į skirtas skyrių bylas, kad būtų lengviau naršyti.**

#### Pervadinimai aplankų
Seni aplankai buvo pakeisti į numeruotus skyrių aplankus:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Pridėta nauja: `docs/chapter-05-multi-agent/`

#### Failų migracija
| Failas | Iš | Į |
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

#### Pridėta
- **📚 Skyrių README failai**: Sukurti README.md kiekviename skyriaus aplanke su:
  - Mokymosi tikslai ir trukmė
  - Pamokų lentelė su aprašymais
  - Greito paleidimo komandos
  - Navigacija į kitus skyrius

#### Pakeitimai
- **🔗 Atnaujinti visi vidiniai saitai**: 78+ kelių atnaujintos visuose dokumentacijos failuose
- **🗺️ Pagrindinis README.md**: Atnaujintas Kurso žemėlapis su nauja skyrių struktūra
- **📝 examples/README.md**: Atnaujinti kryžminiai nuorodos į skyrių aplankus

#### Pašalinta
- Seni aplankų struktūros (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Saugyklos pertvarkymas: skyrių navigacija
**Ši versija pridėjo skyrių navigacijos README failus (vėliau pakeista v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Naujas AI agentų vadovas
**Šioje versijoje pridėtas išsamus vadovas AI agentų diegimui naudojant Azure Developer CLI.**

#### Pridėta
- **🤖 docs/microsoft-foundry/agents.md**: Išsamus vadovas apimantis:
  - Kas yra AI agentai ir kuo jie skiriasi nuo pokalbių robotų
  - Trijų greito paleidimo agentų šablonų pristatymas (Foundry Agents, Prompty, RAG)
  - Agentų architektūros šablonai (vienas agentas, RAG, keli agentai)
  - Įrankių konfigūracija ir pritaikymas
  - Stebėjimas ir metrikų sekimas
  - Sąnaudų apsvarstymai ir optimizavimas
  - Dažnos trikčių šalinimo scenarijos
  - Trys praktinės užduotys su sėkmės kriterijais

#### Turinys
- **Įvadas**: Agentų sąvokos pradedantiesiems
- **Greitas startas**: Diegti agentus su `azd init --template get-started-with-ai-agents`
- **Architektūros modeliai**: Grafikos agentų modeliams
- **Konfigūracija**: Įrankių nustatymas ir aplinkos kintamieji
- **Stebėjimas**: Application Insights integracija
- **Užduotys**: Laipsniškas praktinis mokymasis (20-45 minutės kiekviena)

---

### [v3.12.0] - 2026-02-05

#### DevContainer aplinkos atnaujinimas
**Ši versija atnaujina plėtros konteinerio konfigūraciją su šiuolaikinėmis naudoto įrankių ir geresniais numatytųjų nustatymų AZD mokymosi patirčiai.**

#### Pakeitimai
- **🐳 Bazinis vaizdas**: Atnaujinta iš `python:3.12-bullseye` į `python:3.12-bookworm` (naujausia Debian stabili versija)
- **📛 Konteinerio pavadinimas**: Pervadintas iš "Python 3" į "AZD for Beginners" aiškumui

#### Pridėta
- **🔧 Naujos Dev Container funkcijos**:
  - `azure-cli` su įjungta Bicep palaikymu
  - `node:20` (LTS versija AZD šablonams)
  - `github-cli` šablonų valdymui
  - `docker-in-docker` konteinerių programų diegimui

- **🔌 Portų persiuntimas**: Iš anksto sukonfigūruoti prievadai įprastam vystymui:
  - 8000 (MkDocs peržiūra)
  - 3000 (Web aplikacijos)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Naujos VS Code plėtiniai**:
  - `ms-python.vscode-pylance` - Pagerintas Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions palaikymas
  - `ms-azuretools.vscode-docker` - Docker palaikymas
  - `ms-azuretools.vscode-bicep` - Bicep kalbos palaikymas
  - `ms-azure-devtools.azure-resource-groups` - Azure resursų valdymas
  - `yzhang.markdown-all-in-one` - Markdown redagavimas
  - `DavidAnson.vscode-markdownlint` - Markdown lintinimas
  - `bierner.markdown-mermaid` - Mermaid diagramų palaikymas
  - `redhat.vscode-yaml` - YAML palaikymas (azure.yaml)
  - `eamodio.gitlens` - Git vizualizacija
  - `mhutchie.git-graph` - Git istorija

- **⚙️ VS Code nustatymai**: Pridėti numatyti nustatymai Python interpreter'io, formatavimo įrašymu ir tarpo simbolių šalinimu

- **📦 Atnaujintas requirements-dev.txt**:
  - Pridėtas MkDocs minify papildinys
  - Pridėtas pre-commit kodo kokybei
  - Pridėti Azure SDK paketai (azure-identity, azure-mgmt-resource)

#### Ištaisytas
- **Post-Create komanda**: Dabar tikrina AZD ir Azure CLI diegimą konteinerio paleidimo metu

---

### [v3.11.0] - 2026-02-05

#### README pritaikymas pradedantiesiems
**Ši versija ženkliai pagerina README.md, kad būtų draugiškesnė pradedantiesiems, ir prideda esminių išteklių AI kūrėjams.**

#### Pridėta
- **🆚 Azure CLI vs AZD palyginimas**: Aiškus paaiškinimas, kada naudoti kiekvieną įrankį su praktiniais pavyzdžiais
- **🌟 Nuostabūs AZD saitai**: Tiesioginiai saitai į bendruomenės šablonų galeriją ir prisidėjimo išteklius:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ pasiruošusių diegti šablonų
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Bendruomenės prisidėjimas
- **🎯 Greito paleidimo vadovas**: Supaprastintas 3 žingsnių pradžios skyrius (Įdiegti → Prisijungti → Diegti)
- **📊 Patirtimi pagrįsta navigacijos lentelė**: Aiškios gairės, kur pradėti pagal kūrėjo patirtį

#### Pakeitimai
- **README struktūra**: Perorganizuota, kad svarbiausia informacija būtų pateikta pirmiausia
- **Įvado skiltis**: Perrašyta, kad paaiškintų "The Magic of `azd up`" pradedantiesiems
- **Pašalintas dubliavimas**: Išmestas pasikartojantis trikčių šalinimo skyrius
- **Trikčių šalinimo komandos**: Ištaisytas `azd logs` nuorodų naudojimas, pakeista į galiojančias `azd monitor --logs`

#### Ištaisyta
- **🔐 Autentifikavimo komandos**: Pridėta `azd auth login` ir `azd auth logout` į cheat-sheet.md
- **Netikslūs komandų nuorodos**: Pašalintas likęs `azd logs` iš README trikčių šalinimo skyriaus

#### Pastabos
- **Taas**: Pakeitimai pritaikyti pagrindiniam README.md ir resources/cheat-sheet.md
- **Tikslinė auditorija**: Patobulinimai skirti kūrėjams, kurie yra nauji AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI komandų tikslumo atnaujinimas
**Ši versija ištaiso neegzistuojančias AZD komandas visuose dokumentacijos pavyzdžiuose, užtikrindama, kad visi kodo pavyzdžiai naudoja galiojančią Azure Developer CLI sintaksę.**

#### Ištaisytas
- **🔧 Neegzistuojančios AZD komandos pašalintos**: Išsami audito ir neteisingų komandų korekcija:
  - `azd logs` (nėra) → pakeista į `azd monitor --logs` arba Azure CLI alternatyvas
  - `azd service` subkomandos (nėra) → pakeista į `azd show` ir Azure CLI
  - `azd infra import/export/validate` (nėra) → pašalinta arba pakeista galiojančiais alternatyvomis
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` parametrai (nėra) → pašalinta
  - `azd provision --what-if/--rollback` parametrai (nėra) → atnaujinta naudoti `--preview`
  - `azd config validate` (nėra) → pakeista į `azd config list`
  - `azd info`, `azd history`, `azd metrics` (nėra) → pašalinta

- **📚 Failai atnaujinti su komandų korekcijomis**:
  - `resources/cheat-sheet.md`: Komandų vadovo iš esmės pertvarkymas
  - `docs/deployment/deployment-guide.md`: Ištaisyti atstatymo ir diegimo strategijų aprašymai
  - `docs/troubleshooting/debugging.md`: Ištaisyti žurnalo analizės skyriai
  - `docs/troubleshooting/common-issues.md`: Atnaujintos trikčių šalinimo komandos
  - `docs/troubleshooting/ai-troubleshooting.md`: Ištaisyta AZD trikčių šalinimo skiltis
  - `docs/getting-started/azd-basics.md`: Ištaisyti stebėjimo komandų pavyzdžiai
  - `docs/getting-started/first-project.md`: Atnaujinti stebėjimo ir derinimo pavyzdžiai
  - `docs/getting-started/installation.md`: Ištaisyti pagalbos ir versijų pavyzdžiai
  - `docs/pre-deployment/application-insights.md`: Ištaisyti žurnalų peržiūros pavyzdžiai
  - `docs/pre-deployment/coordination-patterns.md`: Ištaisyti agentų derinimo komandos

- **📝 Versijos nuoroda atnaujinta**:
  - `docs/getting-started/installation.md`: Pakeista užkoduota `1.5.0` versija į bendresnę `1.x.x` su nuoroda į leidimus

#### Pakeitimai
- **Atstatymo strategijos**: Dokumentacija atnaujinta naudoti Git pagrįstą atstatymą (AZD neturi vietinio atstatymo)
- **Žurnalų peržiūra**: Pakeistos `azd logs` nuorodos į `azd monitor --logs`, `azd monitor --live` ir Azure CLI komandas
- **Veikimo skyrius**: Pašalinti neegzistuojantys paralelinio/incremental diegimo parametrai ir pateikti galiojančias alternatyvas

#### Techninės smulkmenos
- **Galiojančios AZD komandos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Galiojančios azd monitor parinktys**: `--live`, `--logs`, `--overview`
- **Pašalintos funkcijos**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Pastabos
- **Patvirtinimas**: Komandos patikrintos pagal Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Dirbtuvių užbaigimas ir dokumentacijos kokybės atnaujinimas
**Ši versija užbaigia interaktyvius darbo modulius, ištaiso visas neveikiančias dokumentacijos nuorodas ir pagerina bendrą turinio kokybę AI kūrėjams, naudojantiems Microsoft AZD.**

#### Pridėta
- **📝 CONTRIBUTING.md**: Naujas indėlių taisyklių dokumentas su:
  - Aiškiomis instrukcijomis apie problemų raportavimą ir pakeitimų siūlymą
  - Dokumentacijos standartais naujam turiniui
  - Kodo pavyzdžių gairėmis ir įsipareigojimų žinučių konvencijomis
  - Informacija apie bendruomenės įsitraukimą

#### Užbaigta
- **🎯 Dirbtuvių modulis 7 (Apibendrinimas)**: Pilnai užbaigtas apibendrinimo modulis su:
  - Išsamiu darbo pasiekimų santraukos skyriumi
  - Pagrindinių įvaldytų koncepcijų skyriumi, apimančiu AZD, šablonus ir Microsoft Foundry
  - Rekomendacijomis, kaip tęsti mokymosi kelią
  - Dirbtuvių iššūkių užduotimis su sudėtingumo įvertinimais
  - Nuorodomis į bendruomenės atsiliepimus ir palaikymą

- **📚 Dirbtuvių modulis 3 (Išardymas)**: Atnaujinti mokymosi tikslai su:
  - GitHub Copilot aktyvavimo su MCP serveriais gairėmis
  - AZD šablonų aplankų struktūros supratimu
  - Infrastructure-as-code (Bicep) organizavimo modeliais
  - Praktinių darbų laboratorijos instrukcijomis

- **🔧 Dirbtuvių modulis 6 (Išardymas / Teardown)**: Užbaigtas su:
  - Ištekančių išteklių valymo ir išlaidų valdymo tikslais
  - `azd down` naudojimu saugiam infrastruktūros pašalinimui
  - Gairėmis, kaip atkurti minkštai ištrintas kognityvines paslaugas
  - Papildomais tyrinėjimo uždaviniais GitHub Copilot ir Azure Portal

#### Ištaisyta
- **🔗 Sugadintų nuorodų taisymai**: Išspręsta 15+ sugadintų vidinių dokumentacijos nuorodų:
  - `docs/ai-foundry/ai-model-deployment.md`: Ištaisyti keliai į microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Pataisyti keliai į ai-model-deployment.md ir production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pakeistas neegzistuojantis cicd-integration.md į deployment-guide.md
  - `examples/retail-scenario.md`: Ištaisyti FAQ ir trikčių šalinimo gairių keliai
  - `examples/container-app/microservices/README.md`: Pataisyti kurso pradžios ir diegimo gairių keliai
  - `resources/faq.md` ir `resources/glossary.md`: Atnaujintos AI skyriaus nuorodos
  - `course-outline.md`: Ištaisyti instruktoriaus vadovo ir AI dirbtuvių laboratorijos nuorodų keliai

- **📅 Dirbtuvių būsenos juosta**: Atnaujinta iš "Under Construction" į aktyvią dirbtuvių būseną su 2026 m. vasario data

- **🔗 Dirbtuvių navigacija**: Ištaisyti neveikiantys navigacijos saitai darbo README.md, kurie rodė į neegzistuojantį lab-1-azd-basics aplanką

#### Pakeista
- **Dirbtuvių pristatymas**: Pašalinta „vykdomas kūrimas“ įspėjimo žyma, dirbtuvės dabar pilnai paruoštos naudoti
- **Navigacijos nuoseklumas**: Užtikrinta, kad visi dirbtuvių moduliai turi tinkamą tarpusavio navigaciją
- **Mokymosi kelių nuorodos**: Atnaujintos skirsnių kryžminės nuorodos, kad naudotų teisingus microsoft-foundry kelius

#### Patvirtinta
- ✅ Visuose Anglų kalbos markdown failuose galiojančios vidinės nuorodos
- ✅ Dirbtuvių moduliai 0–7 yra užbaigti su mokymosi tikslais
- ✅ Navigacija tarp skyrių ir modulių veikia tinkamai
- ✅ Turinys tinka AI kūrėjams, naudojantiems Microsoft AZD
- ✅ Išlaikytas pradžiamokslis draugiškas kalbėjimo stilius ir struktūra
- ✅ CONTRIBUTING.md suteikia aiškias gairės bendruomenės indėliui

#### Techninis įgyvendinimas
- **Nuorodų tikrinimas**: Automatizuotas PowerShell scenarijus patikrino visas .md vidines nuorodas
- **Turinio auditas**: Rankinis dirbtuvių užbaigtumo ir pradinio tinkamumo peržiūra
- **Navigacijos sistema**: Taikyti nuoseklūs skirsnių ir modulių navigacijos šablonai

#### Pastabos
- **Apimtis**: Pakeitimai taikyti tik Anglų dokumentacijai
- **Vertimai**: Vertimų aplankai nebuvo atnaujinti šioje versijoje (automatizuotas vertimas bus sinchronizuotas vėliau)
- **Dirbtuvių trukmė**: Užbaigtos dirbtuvės suteikia 3–4 valandas praktinio mokymosi

---

### [v3.8.0] - 2025-11-19

#### Išplėstinė dokumentacija: stebėsena, saugumas ir daugiapolio agentų šablonai
**Ši versija prideda išsamius A lygio pamokų modulius apie Application Insights integraciją, autentifikacijos šablonus ir daugiapolio agentų koordinaciją gamybiniams diegimams.**

#### Pridėta
- **📊 Application Insights integracijos pamoka**: faile `docs/pre-deployment/application-insights.md`:
  - AZD orientuotas diegimas su automatiniu teikimu
  - Pilni Bicep šablonai Application Insights + Log Analytics
  - Veikiančios Python programos su pasirinktine telemetrija (1,200+ eilutės)
  - AI/LLM stebėjimo šablonai (Microsoft Foundry Models žetonų/kaštų sekimas)
  - 6 Mermaid diagramų (architektūra, paskirstytas trakas, telemetrijos srautai)
  - 3 praktinės užduotys (įspėjimai, prietaisų skydai, AI stebėsena)
  - Kusto užklausų pavyzdžiai ir optimizavimo strategijos kaštams
  - Gyvų metrikų srautas ir realaus laiko derinimas
  - 40–50 minučių mokymosi trukmė su gamybai paruoštais modeliais

- **🔐 Autentifikacijos ir saugumo šablonų pamoka**: faile `docs/getting-started/authsecurity.md`:
  - 3 autentifikacijos šablonai (prisijungimo eilutės, Key Vault, valdomoji tapatybė)
  - Pilni Bicep infrastruktūros šablonai saugiems diegimams
  - Node.js programos kodas su Azure SDK integracija
  - 3 pilnos užduotys (valdomos tapatybės įjungimas, vartotojui priskirta tapatybė, Key Vault rotacija)
  - Saugumo gerosios praktikos ir RBAC konfigūracijos
  - Trikčių šalinimo vadovas ir kaštų analizė
  - Gamybai paruošti be slaptažodžio autentifikacijos šablonai

- **🤖 Daugiapolio agentų koordinacijos šablonų pamoka**: faile `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinacijos šablonai (sekinis, lygiagretus, hierarchinis, įvykių valdomas, konsensusas)
  - Pilna orkestratoriaus paslaugos įgyvendinimas (Python/Flask, 1,500+ eilutės)
  - 3 specializuotos agentų įgyvendinimo pavyzdžiai (Tyrėjas, Rašytojas, Redaktorius)
  - Service Bus integracija žinučių eilėms
  - Cosmos DB būsena paskirstytoms sistemoms valdyti
  - 6 Mermaid diagramų, rodančių agentų sąveikas
  - 3 pažangios užduotys (laiko limitų valdymas, bandymai-perdaryti, saugiklio logika)
  - Kaštų suskirstymas ($240–565/mėn) su optimizavimo strategijomis
  - Application Insights integracija stebėsenai

#### Patobulinta
- **Pre-deployment skyrius**: Dabar apima išsamią stebėsenos ir koordinacijos šablonų medžiagą
- **Getting Started skyrius**: Praturtintas profesionaliais autentifikacijos šablonais
- **Gamybinis pasirengimas**: Pilnas aprėptis nuo saugumo iki observability
- **Kursų apžvalga**: Atnaujinta, kad nuorodotų naujas pamokas 3 ir 6 skyriuose

#### Pakeista
- **Mokymosi progresija**: Geresnė saugumo ir stebėsenos integracija per visą kursą
- **Dokumentacijos kokybė**: Nuoseklūs A lygio standartai (95–97%) per naujas pamokas
- **Gamybiniai šablonai**: Pilnas end-to-end aprėptis įmonių diegimams

#### Pagerinta
- **Kūrėjo patirtis**: Aiškus kelias nuo vystymo iki gamybinės stebėsenos
- **Saugumo standartai**: Profesionalūs autentifikacijos ir slaptumo valdymo šablonai
- **Observability**: Pilna Application Insights integracija su AZD
- **AI darbo krūviai**: Specializuota stebėsena Microsoft Foundry Models ir daugiapolio agentų sistemoms

#### Patvirtinta
- ✅ Visos pamokos apima pilnai veikantį kodą (ne fragmentai)
- ✅ Mermaid diagramų vizualiam mokymuisi (iš viso 19 per 3 pamokas)
- ✅ Praktinės užduotys su patikros žingsniais (iš viso 9)
- ✅ Gamybai paruošti Bicep šablonai diegiami per `azd up`
- ✅ Kaštų analizė ir optimizavimo strategijos
- ✅ Trikčių šalinimo vadovai ir geriausios praktikos
- ✅ Žinių patikros taškai su patikros komandomis

#### Dokumentacijos vertinimo rezultatai
- **docs/pre-deployment/application-insights.md**: - Išsami stebėsenos vadovas
- **docs/getting-started/authsecurity.md**: - Profesionalūs saugumo šablonai
- **docs/pre-deployment/coordination-patterns.md**: - Pažangios daugiapolio agentų architektūros
- **Bendras naujas turinys**: - Nuoseklūs aukštos kokybės standartai

#### Techninis įgyvendinimas
- **Application Insights**: Log Analytics + pasirinktinė telemetrija + paskirstytas stebėjimas
- **Autentifikacija**: Valdomoji tapatybė + Key Vault + RBAC šablonai
- **Daugiapolis agentas**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Stebėsena**: Gyvos metrikos + Kusto užklausos + įspėjimai + prietaisų skydai
- **Kaštų valdymas**: Atvaizdavimo strategijos, saugojimo politikos, biudžeto valdymas

### [v3.7.0] - 2025-11-19

#### Dokumentacijos kokybės patobulinimai ir naujas Microsoft Foundry Models pavyzdys
**Ši versija pagerina dokumentacijos kokybę visame saugykloje ir prideda pilną Microsoft Foundry Models diegimo pavyzdį su gpt-4.1 pokalbių sąsaja.**

#### Pridėta
- **🤖 Microsoft Foundry Models pokalbių pavyzdys**: Pilnas gpt-4.1 diegimas su veikiančiu įgyvendinimu faile `examples/azure-openai-chat/`:
  - Pilna Microsoft Foundry Models infrastruktūra (gpt-4.1 modelio diegimas)
  - Python komandų eilutės pokalbių sąsaja su pokalbio istorija
  - Key Vault integracija saugiam API rakto saugojimui
  - Žetonų naudojimo stebėjimas ir kaštų įvertinimas
  - Srautų ribojimas ir klaidų valdymas
  - Išsami README su 35–45 minučių diegimo vadovu
  - 11 gamybai paruoštų failų (Bicep šablonai, Python programa, konfigūracija)
- **📚 Dokumentacijos pratimai**: Pridėti praktiniai užsiėmimai prie konfigūracijos vadovo:
  - Užduotis 1: Daugiaaplinkio konfigūracija (15 minučių)
  - Užduotis 2: Slaptumų valdymo praktika (10 minučių)
  - Aiškūs sėkmės kriterijai ir patikros žingsniai
- **✅ Diegimo patikra**: Pridėtas patikros skyrius prie diegimo vadovo:
  - Sveikatos patikros procedūros
  - Sėkmės kriterijų kontrolinis sąrašas
  - Laukiami išvedimai visoms diegimo komandoms
  - Greito trikčių šalinimo nuorodos

#### Patobulinta
- **examples/README.md**: Atnaujintas iki A lygio kokybės (93%):
  - Pridėtas azure-openai-chat į visus atitinkamus skyrius
  - Vietinių pavyzdžių skaičius atnaujintas nuo 3 iki 4
  - Pridėtas į AI programų pavyzdžių lentelę
  - Integruota į Greito pradžios skyrių vidutinio lygio vartotojams
  - Pridėtas prie Microsoft Foundry šablonų skyriaus
  - Atnaujinta palyginimo matrica ir technologijų suradimo skyrius
- **Dokumentacijos kokybė**: Pagerėjo iš B+ (87%) iki A- (92%) visame docs aplanke:
  - Pridėti laukiamų išvedimų pavyzdžiai prie svarbių komandų pavyzdžių
  - Įtraukta patikros žingsnių už pakeitimus konfigūracijoje
  - Sustiprinta praktinė mokymosi dalis su realiais pratimais

#### Pakeista
- **Mokymosi progresija**: Geresnė AI pavyzdžių integracija vidutinio lygio besimokantiesiems
- **Dokumentacijos struktūra**: Veiksmingesnės užduotys su aiškiais rezultatais
- **Patikros procesas**: Pagrindinėse srautuose pridėti aiškūs sėkmės kriterijai

#### Pagerinta
- **Kūrėjo patirtis**: Microsoft Foundry Models diegimas dabar trunka 35–45 minutes (vietoj 60–90 sudėtingesnėms alternatyvoms)
- **Kaštų skaidrumas**: Aiškūs kaštų įverčiai ($50–200/mėn) Microsoft Foundry Models pavyzdžiui
- **Mokymosi kelias**: AI kūrėjams suteiktas aiškus pradžios taškas su azure-openai-chat
- **Dokumentacijos standartai**: Nuoseklūs laukiamų išvedimų ir patikros žingsnių pavyzdžiai

#### Patvirtinta
- ✅ Microsoft Foundry Models pavyzdys pilnai funkcionuoja naudojant `azd up`
- ✅ Visi 11 įgyvendinimo failų yra sintaksiškai teisingi
- ✅ README instrukcijos atitinka faktinę diegimo patirtį
- ✅ Dokumentacijos nuorodos atnaujintos daugiau nei 8 vietose
- ✅ Pavyzdžių indeksas tiksliai atspindi 4 vietinius pavyzdžius
- ✅ Nėra pasikartojančių išorinių nuorodų lentelėse
- ✅ Visos navigacijos nuorodos teisingos

#### Techninis įgyvendinimas
- **Microsoft Foundry Models architektūra**: gpt-4.1 + Key Vault + Container Apps modelis
- **Saugumas**: Paruošta valdomoji tapatybė, slaptumai saugomi Key Vault
- **Stebėsena**: Application Insights integracija
- **Kaštų valdymas**: Žetonų sekimas ir naudojimo optimizavimas
- **Diegimas**: Viena `azd up` komanda pilnam nustatymui

### [v3.6.0] - 2025-11-19

#### Didelis atnaujinimas: Container App diegimo pavyzdžiai
**Ši versija pristato išsamius, gamybai paruoštus konteinerizuotų programų diegimo pavyzdžius, naudojant Azure Developer CLI (AZD), su visa dokumentacija ir integracija į mokymosi kelią.**

#### Pridėta
- **🚀 Container App pavyzdžiai**: Nauji vietiniai pavyzdžiai faile `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Pilnas konteinerizuotų diegimų apžvalga, greitas pradžios vadovas, gamyba ir pažangūs modeliai
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Pradedantiesiems skirtas REST API su scale-to-zero, sveikatos patikromis, stebėsena ir trikčių šalinimu
  - [Microservices Architecture](../../examples/container-app/microservices): Gamybai paruoštas daugiaservisinis diegimas (API Vartai, Produktas, Užsakymas, Vartotojas, Pranešimai), asinchroninis žinučių valdymas, Service Bus, Cosmos DB, Azure SQL, paskirstytas stebėjimas, blue-green/canary diegimas
- **Geriausios praktikos**: Saugumas, stebėsena, kaštų optimizavimas ir CI/CD gairės konteinerizuotoms apkrovoms
- **Kodo pavyzdžiai**: Pilnas `azure.yaml`, Bicep šablonai ir daugiakalbės paslaugų įgyvendinimo versijos (Python, Node.js, C#, Go)
- **Testavimas ir trikčių šalinimas**: End-to-end testų scenarijai, stebėjimo komandos, trikčių šalinimo gairės

#### Pakeista
- **README.md**: Atnaujinta, kad būtų pristatyti ir susieti nauji konteinerinių programų pavyzdžiai skiltyje "Vietiniai pavyzdžiai – konteinerinės programos"
- **examples/README.md**: Atnaujinta, kad išryškintų konteinerių programų pavyzdžius, pridėtų palyginimo matricos įrašus ir atnaujintų technologijų/architektūros nuorodas
- **Course Outline & Study Guide**: Atnaujinta, kad atspindėtų naujus konteinerių programų pavyzdžius ir diegimo modelius atitinkamuose skyriuose

#### Patikrinta
- ✅ Visi nauji pavyzdžiai gali būti diegiami naudojant `azd up` ir atitinka geriausias praktikas
- ✅ Dokumentacijos kryžminės nuorodos ir navigacija atnaujinti
- ✅ Pavyzdžiai apima nuo pradedančiųjų iki pažengusių scenarijų, įskaitant gamybines mikroservisas

#### Pastabos
- **Scope**: Tik anglų kalbos dokumentacija ir pavyzdžiai
- **Next Steps**: Išplėsti su papildomais pažangiais konteinerių modeliais ir CI/CD automatizavimu būsimuose leidimuose

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Ši versija įgyvendina išsamų produkto pavadinimo pakeitimą iš "Microsoft Foundry" į "Microsoft Foundry" visuose anglų kalbos dokumentuose, atspindintį oficialų Microsoft prekės ženklo pakeitimą.**

#### Changed
- **🔄 Produkto pavadinimo atnaujinimas**: Visiškas prekės ženklo pakeitimas iš "Microsoft Foundry" į "Microsoft Foundry"
  - Atnaujintos visos nuorodos anglų kalbos dokumentacijoje `docs/` aplanke
  - Pervadintas aplankas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pervadintas failas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Iš viso: atnaujinta 23 turinio nuorodos 7 dokumentacijos failuose

- **📁 Aplankų struktūros pakeitimai**:
  - `docs/ai-foundry/` pervadintas į `docs/microsoft-foundry/`
  - Visos kryžminės nuorodos atnaujintos, kad atitiktų naują aplankų struktūrą
  - Navigacijos nuorodos patikrintos visuose dokumentuose

- **📄 Failų pervadinimai**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Visos vidinės nuorodos atnaujintos, kad nurodytų naują failo pavadinimą

#### Atnaujinti failai
- **Skyrių dokumentacija** (7 failai):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigacijos nuorodų atnaujinimai
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produkto pavadinimo nuorodos atnaujintos
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jau naudoja Microsoft Foundry (iš ankstesnių atnaujinimų)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 nuorodos atnaujintos (apžvalga, bendruomenės atsiliepimai, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 kryžminės nuorodos atnaujinimai
  - `docs/getting-started/first-project.md` - 2 skyriaus navigacijos nuorodos atnaujinimai
  - `docs/getting-started/installation.md` - 2 kito skyriaus nuorodos atnaujinimai
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 nuorodos atnaujintos (navigacija, Discord bendruomenė)
  - `docs/troubleshooting/common-issues.md` - 1 naršymo nuoroda atnaujinta
  - `docs/troubleshooting/debugging.md` - 1 naršymo nuoroda atnaujinta

- **Kurso struktūros failai** (2 failai):
  - `README.md` - 17 nuorodų atnaujinta (kurso apžvalga, skyriaus pavadinimai, šablonų skyrius, bendruomenės įžvalgos)
  - `course-outline.md` - 14 nuorodų atnaujinta (apžvalga, mokymosi tikslai, skyriaus ištekliai)

#### Patikrinta
- ✅ Nėra likusių "ai-foundry" aplankų kelių nuorodų anglų dokumentuose
- ✅ Nėra likusių "Microsoft Foundry" produkto pavadinimo nuorodų anglų dokumentuose
- ✅ Visos navigacijos nuorodos veikia su nauja aplankų struktūra
- ✅ Failų ir aplankų pervadinimai sėkmingai atlikti
- ✅ Kryžminės nuorodos tarp skyrių patikrintos

#### Pastabos
- **Scope**: Pakeitimai taikomi tik anglų kalbos dokumentacijai `docs/` aplanke
- **Translations**: Vertimų aplankai (`translations/`) nebuvo atnaujinti šioje versijoje
- **Workshop**: Seminaro medžiaga (`workshop/`) nebuvo atnaujinta šioje versijoje
- **Examples**: Pavyzdžių failai gali vis dar nurodyti seną pavadinimą (tai bus išspręsta būsimame atnaujinime)
- **External Links**: Išoriniai URL ir GitHub saugyklos nuorodos lieka nepakitusios

#### Migracijos vadovas prisidėjusiems
Jei turite vietines šakas arba dokumentaciją, nurodančią seną struktūrą:
1. Atnaujinkite aplankų nuorodas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atnaujinkite failų nuorodas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Pakeiskite produkto pavadinimą: "Microsoft Foundry" → "Microsoft Foundry"
4. Patikrinkite, ar visos vidinės dokumentacijos nuorodos vis dar veikia

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Ši versija pristato išsamią paramą naujai Azure Developer CLI peržiūros funkcijai ir pagerina seminaro naudotojo patirtį.**

#### Added
- **🧪 azd provision --preview funkcijos dokumentacija**: Išsami naujos infrastruktūros peržiūros galimybės apžvalga
  - Komandų nuoroda ir naudojimo pavyzdžiai greitajame vadove
  - Išsami integracija diegimo vadove su panaudojimo atvejais ir nauda
  - Išankstinio patikrinimo integracija saugesniam diegimo patikrinimui
  - Pradžios vadovo atnaujinimai su saugumą pirmiausia užtikrinančiomis diegimo praktikomis
- **🚧 Seminaro būsenos juosta**: Profesionali HTML juosta, rodanti seminaro kūrimo būseną
  - Gradientinis dizainas su statybos indikatoriais aiškiam vartotojo informavimui
  - Paskutinio atnaujinimo laiko žyma skaidrumui
  - Mobiliesiems pritaikytas dizainas visų įrenginių tipams

#### Enhanced
- **Infrastruktūros sauga**: Peržiūros funkcionalumas integruotas visoje diegimo dokumentacijoje
- **Išankstinis diegimo patikrinimas**: Automatizuoti scenarijai dabar apima infrastruktūros peržiūros testavimą
- **Kūrėjo darbo eiga**: Komandų sekos atnaujintos, kad apimtų peržiūrą kaip geriausią praktiką
- **Seminaro patirtis**: Aiškios vartotojo lūkesčių instrukcijos apie turinio kūrimo būseną

#### Changed
- **Diegimo geriausios praktikos**: Rekomenduojama peržiūra-pirmiausia darbo eiga
- **Dokumentacijos srautas**: Infrastruktūros patikrinimas perkeltas anksčiau mokymosi procese
- **Seminaro pateikimas**: Profesionali būsenos komunikacija su aiškiu kūrimo laiko grafiku

#### Improved
- **Saugumas pirmiausia**: Infrastruktūros pakeitimus dabar galima patikrinti prieš diegiant
- **Komandos bendradarbiavimas**: Peržiūros rezultatus galima pasidalinti peržiūrai ir patvirtinimui
- **Sąnaudų supratimas**: Geresnis išteklių kainų supratimas prieš teikiant resursus
- **Rizikos mažinimas**: Sumažintos diegimo klaidos per išankstinį patikrinimą

#### Technical Implementation
- **Daugiadokumentinė integracija**: Peržiūros funkcija dokumentuota per 4 pagrindinius failus
- **Komandų šablonai**: Nuosekli sintaksė ir pavyzdžiai visoje dokumentacijoje
- **Geriausios praktikos integracija**: Peržiūra įtraukta į patvirtinimo darbo eigas ir scenarijus
- **Vizualiniai indikatoriai**: Aiškūs NAUJI pažymėjimai funkcijoms, kad būtų lengviau rasti

#### Workshop Infrastructure
- **Būsenos komunikacija**: Profesionali HTML juosta su gradientiniu stiliumi
- **Naudotojo patirtis**: Aiški kūrimo būsena, užkertanti kelią nesusipratimams
- **Profesionalus pateikimas**: Išlaiko saugyklos patikimumą, nustatant aiškius lūkesčius
- **Laiko grafiko skaidrumas**: Paskutinio atnaujinimo data – 2025 m. spalis, siekiant atskaitomybės

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Ši versija pristato išsamią seminaro medžiagą su naršyklėje veikiančiomis interaktyviomis instrukcijomis ir struktūrizuotomis mokymosi kryptimis.**

#### Added
- **🎥 Interaktyvus seminaro vadovas**: Naršyklėje veikianti seminaro patirtis su MkDocs peržiūros galimybe
- **📝 Struktūruotos seminaro instrukcijos**: 7 žingsnių vadovas nuo atrankos iki pritaikymo
  - 0-Introduction: Seminaro apžvalga ir nustatymas
  - 1-Select-AI-Template: Šablonų paieška ir atrankos procesas
  - 2-Validate-AI-Template: Diegimo ir patikros procedūros
  - 3-Deconstruct-AI-Template: Šablono architektūros supratimas
  - 4-Configure-AI-Template: Konfigūracija ir pritaikymas
  - 5-Customize-AI-Template: Pažangesni pakeitimai ir iteracijos
  - 6-Teardown-Infrastructure: Išardymas ir išteklių valdymas
  - 7-Wrap-up: Santrauka ir tolesni žingsniai
- **🛠️ Seminaro įrankiai**: MkDocs konfigūracija su Material tema geresnei mokymosi patirčiai
- **🎯 Praktinis mokymosi kelias**: 3 žingsnių metodika (Atranka → Diegimas → Pritaikymas)
- **📱 GitHub Codespaces integracija**: Sklandi vystymo aplinkos paruošimo integracija

#### Enhanced
- **AI seminaro laboratorija**: Išplėsta su išsamia 2–3 val. struktūra
- **Seminaro dokumentacija**: Profesionali pateiktis su navigacija ir vaizdinėmis priemonėmis
- **Mokymosi pažanga**: Aiškios instrukcijos žingsnis po žingsnio nuo šablono pasirinkimo iki gamybinio diegimo
- **Kūrėjo patirtis**: Integruoti įrankiai sklandžiai vystymo eigai

#### Improved
- **Prieinamumas**: Naršyklės pagrindu veikianti sąsaja su paieška, kopijavimo funkcija ir temos perjungimu
- **Savarankiškas mokymasis**: Lanksti seminaro struktūra, pritaikoma skirtingam mokymosi tempui
- **Praktinis panaudojimas**: Realūs AI šablonų diegimo scenarijai
- **Bendruomenės integracija**: Discord integracija seminaro palaikymui ir bendradarbiavimui

#### Workshop Features
- **Įmontuota paieška**: Greita raktinių žodžių ir pamokų paieška
- **Kopijuoti kodo blokus**: Užvedimo ir kopijavimo funkcionalumas visiems kodo pavyzdžiams
- **Temos perjungimas**: Tamsus/šviesus režimas pagal pageidavimus
- **Vaizdiniai ištekliai**: Ekrano nuotraukos ir diagramos geresniam supratimui
- **Pagalbos integracija**: Tiesioginis Discord pasiekiamumas bendruomenės palaikymui

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Ši versija pristato išsamią skyriais pagrįstą mokymosi struktūrą su pagerinta navigacija visoje saugykloje.**

#### Added
- **📚 Skyriais pagrįsta mokymosi sistema**: Visas kursas pertvarkytas į 8 progresyvius mokymosi skyrius
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Išsami navigacijos sistema**: Nuoseklūs navigacijos antraštės ir poraštės visoje dokumentacijoje
- **🎯 Progresavimo stebėjimas**: Kurso užbaigimo kontrolinis sąrašas ir mokymosi patvirtinimo sistema
- **🗺️ Mokymosi kelio gairės**: Aiškūs įėjimo taškai skirtingiems patirties lygiams ir tikslams
- **🔗 Kryžminės nuorodos navigacija**: Susiję skyrių ir išankstinių reikalavimų ryšiai aiškiai pateikti

#### Enhanced
- **README struktūra**: Pertvarkyta į struktūruotą mokymosi platformą su skyriais
- **Dokumentacijos navigacija**: Kiekvienas puslapis dabar turi skyriaus kontekstą ir progresavimo gaires
- **Šablonų organizacija**: Pavyzdžiai ir šablonai susieti su atitinkamais mokymosi skyriais
- **Išteklių integracija**: Įtraukta triukų lapai, DUK ir studijų vadovai susiję su atitinkamais skyriais
- **Seminaro integracija**: Praktiniai laboratoriniai darbai priskirti keliems skyriams ir mokymosi tikslams

#### Changed
- **Mokymosi eiga**: Pereita nuo linijinės dokumentacijos prie lankstesnio skyriais pagrįsto mokymosi
- **Konfigūracijų vieta**: Konfigūracijų vadovas perkeliamas į Chapter 3 geresnei mokymosi eigai
- **AI turinio integracija**: Geresnė AI specifinio turinio integracija per visą mokymosi kelią
- **Gamybinis turinys**: Pažangūs modeliai sujungti į Chapter 8 verslo vartotojams

#### Improved
- **Vartotojo patirtis**: Aiškūs naršymo trupmenos ir skyriaus progresavimo indikatoriai
- **Prieinamumas**: Nuoseklūs navigacijos modeliai palengvina kurso naršymą
- **Profesionalus pateikimas**: Universitetinio lygio kurso struktūra tinkama akademiniam ir korporatyviniam mokymui
- **Mokymosi efektyvumas**: Trumpesnis laikas rasti atitinkamą turinį dėl pagerintos organizacijos

#### Technical Implementation
- **Navigacijos antraštės**: Standartizuota skyriaus navigacija daugiau nei 40 dokumentacijos failų
- **Poraštės navigacija**: Nuoseklus progresavimo vadovavimas ir skyriaus užbaigimo indikatoriai
- **Kryžminės nuorodos**: Išsami vidinių nuorodų sistema sujungiant susijusias koncepcijas
- **Skyriaus žemėlapis**: Šablonai ir pavyzdžiai aiškiai susieti su mokymosi tikslais

#### Study Guide Enhancement
- **📚 Išsami mokymosi tikslų struktūra**: Studijų vadovas pertvarkytas pagal 8 skyriaus sistemą
- **🎯 Skyriais pagrįstas vertinimas**: Kiekvienas skyrius turi konkrečius mokymosi tikslus ir praktines užduotis
- **📋 Progresavimo stebėjimas**: Savaitinis mokymosi planas su pamatuojamais rezultatais ir užduočių sąrašais
- **❓ Vertinimo klausimai**: Žinių patvirtinimo klausimai kiekvienam skyriui su profesiniais rezultatais
- **🛠️ Praktinės užduotys**: Praktinės veiklos su realiais diegimo scenarijais ir trikčių šalinimu
- **📊 Įgūdžių progresavimas**: Aiškus pereinamas laukas nuo pagrindinių koncepcijų iki verslo modelių su karjeros vystymosi fokusavimu
- **🎓 Sertifikavimo sistema**: Profesinis tobulėjimas ir bendruomenės pripažinimas
- **⏱️ Laiko valdymas**: Struktūruotas 10 savaičių mokymosi planas su etapų patvirtinimu

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Ši versija pagerina daugiaagentę mažmeninės prekybos sprendimą su geresniais agentų pavadinimais ir patobulinta dokumentacija.**

#### Changed
- **Daugiaagentės terminologijos atnaujinimas**: Pakeistas "Cora agent" į "Customer agent" visame mažmeninės prekybos daugiaagentės sprendime aiškesniam supratimui
- **Agentų architektūra**: Atnaujinta visa dokumentacija, ARM šablonai ir kodo pavyzdžiai, kad būtų nuoseklus "Customer agent" pavadinimas
- **Konfigūracijos pavyzdžiai**: Modernizuoti agentų konfigūracijos modeliai su atnaujintomis pavadinimų konvencijomis
- **Dokumentacijos nuoseklumas**: Užtikrinta, kad visos nuorodos naudotų profesionalius, aprašomuosius agentų pavadinimus

#### Enhanced
- **ARM Template Package**: Atnaujintas retail-multiagent-arm-template su Customer agent nuorodomis
- **Architecture Diagrams**: Atnaujintos Mermaid diagramos su atnaujintais agentų pavadinimais
- **Code Examples**: Python klasės ir įgyvendinimo pavyzdžiai dabar naudoja CustomerAgent pavadinimą
- **Environment Variables**: Atnaujinti visi diegimo skriptai, kad naudotų CUSTOMER_AGENT_NAME konvencijas

#### Patobulinta
- **Kūrėjų patirtis**: Aiškesnės agentų rolės ir atsakomybės dokumentacijoje
- **Produkcinė parengtis**: Geresnis suderinimas su įmonės pavadinimų konvencijomis
- **Mokymosi medžiaga**: Intuityvesnis agentų pavadinimų pasirinkimas mokomaisiais tikslais
- **Šablono naudojamumas**: Supaprastintas agentų funkcijų ir diegimo modelių supratimas

#### Techninės detalės
- Atnaujintos Mermaid architektūros diagramos su CustomerAgent nuorodomis
- Pakeisti CoraAgent klasės pavadinimai į CustomerAgent Python pavyzdžiuose
- Modifikuotos ARM šablono JSON konfigūracijos, kad naudotų agento tipą "customer"
- Atnaujinti aplinkos kintamieji iš CORA_AGENT_* į CUSTOMER_AGENT_* šablonus
- Atitaisyti visi diegimo komandos ir konteinerių konfigūracijos

### [v3.0.0] - 2025-09-12

#### Pagrindiniai pakeitimai - AI kūrėjų orientacija ir Microsoft Foundry integracija
**Ši versija transformuoja saugyklą į išsamų AI orientuotą mokymosi išteklių rinkinį su Microsoft Foundry integracija.**

#### Pridėta
- **🤖 AI-First Learning Path**: Visas pertvarkymas, prioritetą suteikiant AI kūrėjams ir inžinieriams
- **Microsoft Foundry Integration Guide**: Išsami dokumentacija, kaip sujungti AZD su Microsoft Foundry paslaugomis
- **AI Model Deployment Patterns**: Išsamus vadovas, apimantis modelio pasirinkimą, konfigūraciją ir gamybinio diegimo strategijas
- **AI Workshop Lab**: 2–3 valandų praktinis seminaras, skirtas AI programų konvertavimui į AZD diegtinas sprendimus
- **Production AI Best Practices**: Įmonei tinkami modeliai mastelio didinimui, stebėjimui ir AI krūvių apsaugai
- **AI-Specific Troubleshooting Guide**: Išsami trikčių šalinimo medžiaga Microsoft Foundry Models, Cognitive Services ir AI diegimo problemoms
- **AI Template Gallery**: Rinkinys Microsoft Foundry šablonų su sudėtingumo įvertinimais
- **Workshop Materials**: Pilna seminaro struktūra su praktiniais laboratoriniais darbais ir nuorodų medžiaga

#### Patobulinta
- **README Structure**: Orientuota į AI kūrėjus su 45% bendruomenės susidomėjimo duomenimis iš Microsoft Foundry Discord
- **Learning Paths**: Skirtas AI kūrėjų kelias greta tradicinių mokinių ir DevOps inžinierių maršrutų
- **Template Recommendations**: Pateikti AI šablonai, įskaitant azure-search-openai-demo, contoso-chat ir openai-chat-app-quickstart
- **Community Integration**: Išplėstas Discord bendruomenės palaikymas su AI specifinėmis kanalų ir diskusijų dalimis

#### Saugumas ir produkcinė orientacija
- **Managed Identity Patterns**: AI specifinė autentifikacija ir saugumo konfigūracijos
- **Cost Optimization**: Žetonų naudojimo stebėsena ir biudžeto valdymas AI krūviams
- **Multi-Region Deployment**: Strategijos pasauliniam AI programų diegimui
- **Performance Monitoring**: AI specifiniai metrikai ir Application Insights integracija

#### Dokumentacijos kokybė
- **Linear Course Structure**: Logiška eiga nuo pradedančiojo iki pažangaus AI diegimo modelių
- **Validated URLs**: Visos išorinės saugyklos nuorodos patikrintos ir prieinamos
- **Complete Reference**: Visos vidinės dokumentacijos nuorodos patikrintos ir veikia
- **Production Ready**: Įmonės diegimo modeliai su realaus pasaulio pavyzdžiais

### [v2.0.0] - 2025-09-09

#### Pagrindiniai pakeitimai - saugyklos pertvarkymas ir profesionalus patobulinimas
**Ši versija reiškia reikšmingą saugyklos struktūros ir turinio pateikimo pertvarkymą.**

#### Pridėta
- **Structured Learning Framework**: Visos dokumentacijos puslapiai dabar apima skyrius Introduction, Learning Goals ir Learning Outcomes
- **Navigation System**: Pridėtos Previous/Next pamokų nuorodos visuose dokumentuose, siekiant nurodyti mokymosi eigą
- **Study Guide**: Išsamus study-guide.md su mokymosi tikslais, praktikos užduotimis ir vertinimo medžiaga
- **Professional Presentation**: Pašalinti visi emocikonai, siekiant pagerinti prieinamumą ir profesionalią išvaizdą
- **Enhanced Content Structure**: Pagerintas mokymosi medžiagos organizavimas ir srautas

#### Pakeista
- **Documentation Format**: Standartizuota visa dokumentacija su nuoseklia mokymosi struktūra
- **Navigation Flow**: Įdiegta logiška eiga per visą mokymosi medžiagą
- **Content Presentation**: Pašalinti dekoratyviniai elementai vardan aiškios, profesionalios formos
- **Link Structure**: Atnaujintos visos vidinės nuorodos, palaikančios naują navigacijos sistemą

#### Patobulinta
- **Accessibility**: Pašalintos emocikonų priklausomybės, gerinant suderinamumą su ekrano skaitytuvais
- **Professional Appearance**: Švari, akademinio stiliaus pateiktis, tinkama įmoniniam mokymuisi
- **Learning Experience**: Struktūruotas požiūris su aiškiais tikslais ir rezultatais kiekvienai pamokai
- **Content Organization**: Geresnis loginis srautas ir ryšys tarp susijusių temų

### [v1.0.0] - 2025-09-09

#### Pradinis leidimas - Išsamus AZD mokymosi saugyklos rinkinys

#### Pridėta
- **Pagrindinė dokumentacijos struktūra**
  - Išsami pradžiamokslio vadovų serija
  - Išsami diegimo ir infrastruktūros parengimo dokumentacija
  - Išsamūs trikčių šalinimo ištekliai ir derinimo vadovai
  - Priešdiegiūrinės patikros įrankiai ir procedūros

- **Pradžios modulis**
  - AZD pagrindai: pagrindinės sąvokos ir terminologija
  - Įdiegimo vadovas: platformai pritaikytos nustatymų instrukcijos
  - Konfigūracijos vadovas: aplinkos nustatymas ir autentifikacija
  - Pirmojo projekto vadovas: žingsnis po žingsnio praktinis mokymasis

- **Diegimo ir infrastruktūros modulis**
  - Diegimo vadovas: išsami darbo eigos dokumentacija
  - Tiekimo vadovas: infrastruktūra kaip kodas su Bicep
  - Geriausios praktikos gamybiniam diegimui
  - Daugiapaslaugės architektūros modeliai

- **Priešdiegiūrinės patikros modulis**
  - Talpos planavimas: Azure resursų prieinamumo patikrinimas
  - SKU pasirinkimas: išsami paslaugų lygių gairė
  - Priešstartinės patikros: automatizuoti patikros skriptai (PowerShell ir Bash)
  - Sąnaudų vertinimo ir biudžeto planavimo įrankiai

- **Trikčių šalinimo modulis**
  - Dažnos problemos: dažnai pasitaikančios problemos ir sprendimai
  - Derinimo vadovas: sisteminės trikčių šalinimo metodikos
  - Išplėstinės diagnostikos technikos ir įrankiai
  - Veikimo stebėjimas ir optimizavimas

- **Ištekliai ir nuorodos**
  - Komandų atmintinė: greita nuoroda į svarbiausias komandas
  - Žodynėlis: išsami terminų ir santrumpų apibrėžtis
  - DUK: išsamūs atsakymai į dažniausiai užduodamus klausimus
  - Išorinės nuorodos ir bendruomenės ryšiai

- **Pavyzdžiai ir šablonai**
  - Paprasto žiniatinklio programos pavyzdys
  - Statinio tinklalapio diegimo šablonas
  - Konteinerių programos konfigūracija
  - Duomenų bazės integracijos modeliai
  - Mikropaslaugų architektūros pavyzdžiai
  - Serverless funkcijų įgyvendinimai

#### Funkcijos
- **Multi-Platform Support**: Diegimo ir konfigūracijos vadovai Windows, macOS ir Linux
- **Multiple Skill Levels**: Turinys skirtas nuo studentų iki profesionalių kūrėjų
- **Practical Focus**: Praktiniai pavyzdžiai ir realaus pasaulio scenarijai
- **Comprehensive Coverage**: Nuo pagrindinių sąvokų iki pažangių įmonės modelių
- **Security-First Approach**: Saugumo geriausios praktikos integruotos visur
- **Cost Optimization**: Gairės taupiems diegimams ir resursų valdymui

#### Dokumentacijos kokybė
- **Detailed Code Examples**: Praktiniai, patikrinti kodo pavyzdžiai
- **Step-by-Step Instructions**: Aiškios, veiksmo gairės
- **Comprehensive Error Handling**: Trikčių šalinimas dažnoms problemoms
- **Best Practices Integration**: Pramonės standartai ir rekomendacijos
- **Version Compatibility**: Atnaujinta pagal naujausias Azure paslaugas ir azd funkcijas

## Planuojami ateities patobulinimai

### Version 3.1.0 (Planned)
#### AI platformos išplėtimas
- **Multi-Model Support**: Integracijos modeliai Hugging Face, Azure Machine Learning ir pasirinktiems modeliams
- **AI Agent Frameworks**: Šablonai LangChain, Semantic Kernel ir AutoGen diegimams
- **Advanced RAG Patterns**: Vektorių duomenų bazių galimybės už Azure AI Search ribų (Pinecone, Weaviate ir kt.)
- **AI Observability**: Išplėstinė stebėsena modelio veikimui, žetonų naudojimui ir atsakymų kokybei

#### Kūrėjų patirtis
- **VS Code Extension**: Integruota AZD + Microsoft Foundry kūrimo patirtis
- **GitHub Copilot Integration**: AI padedama AZD šablonų generacija
- **Interactive Tutorials**: Praktinės programavimo užduotys su automatizuota validacija AI scenarijams
- **Video Content**: Papildomi vaizdo vadovėliai vizualiems besimokantiesiems, orientuoti į AI diegimus

### Version 4.0.0 (Planned)
#### Įmonės lygio AI modeliai
- **Governance Framework**: AI modelių valdymas, atitiktis ir audito grandinės
- **Multi-Tenant AI**: Modeliai keliems klientams aptarnauti su izoliuotomis AI paslaugomis
- **Edge AI Deployment**: Integracija su Azure IoT Edge ir konteinerių instancijomis
- **Hybrid Cloud AI**: Multi-cloud ir hibridiniai diegimo modeliai AI krūviams

#### Pažangios funkcijos
- **AI Pipeline Automation**: MLOps integracija su Azure Machine Learning pipeline'ais
- **Advanced Security**: Zero-trust modeliai, privatūs galiniai taškai ir pažangus grėsmių apsaugojimas
- **Performance Optimization**: Pažangus tuningas ir mastelio didinimo strategijos aukštos pralaidumo AI programoms
- **Global Distribution**: Turinys pristatymo ir edge kešavimo modeliai AI programoms

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Siūlomi papildymai - dabar įgyvendinti v3.0.0
- ✅ **AI-Focused Content**: Išsami Microsoft Foundry integracija (Įgyvendinta)
- ✅ **Interactive Tutorials**: Praktinis AI seminarų laboratorija (Įgyvendinta)
- ✅ **Advanced Security Module**: AI specifiniai saugumo modeliai (Įgyvendinta)
- ✅ **Performance Optimization**: AI krūvių tuningavimo strategijos (Įgyvendinta)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Smulkūs patobulinimai - kai kurie įgyvendinti dabartinėje versijoje
- ✅ **Additional Examples**: AI orientuoti diegimo scenarijai (Įgyvendinta)
- ✅ **Extended FAQ**: AI specifiniai klausimai ir trikčių šalinimas (Įgyvendinta)
- **Tool Integration**: Išplėsti IDE ir redaktorių integracijos vadovai
- ✅ **Monitoring Expansion**: AI specifinė stebėsena ir įspėjimo modeliai (Įgyvendinta)

#### Vis dar planuojama būsimam leidimui
- **Mobile-Friendly Documentation**: Reaguojantis dizainas mobiliajam mokymuisi
- **Offline Access**: Atsisiunčiamos dokumentacijos paketai
- **Enhanced IDE Integration**: VS Code plėtinys AZD + AI darbo eigoms
- **Community Dashboard**: Realaus laiko bendruomenės metrikos ir indėlių sekimas

## Kaip prisidėti prie pakeitimų žurnalo

### Pakeitimų pranešimas
Pridėdami pataisas prie šios saugyklos, įsitikinkite, kad pakeitimų žurnalo įrašai apima:

1. **Versijos numeris**: Pagal semantinį versijavimą (major.minor.patch)
2. **Data**: Leidimo arba atnaujinimo data formatu YYYY-MM-DD
3. **Kategorija**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Aiškus aprašymas**: Trumpas aprašymas, kas pasikeitė
5. **Poveikio įvertinimas**: Kaip pakeitimai paveiks esamus vartotojus

### Pakeitimų kategorijos

#### Pridėta
- Naujos funkcijos, dokumentacijos skyriai arba galimybės
- Nauji pavyzdžiai, šablonai arba mokymosi ištekliai
- Papildomi įrankiai, skriptai arba utilitai

#### Pakeista
- Esamos funkcionalumo arba dokumentacijos modifikacijos
- Atnaujinimai, siekiant pagerinti aiškumą arba tikslumą
- Turinio arba organizacijos pertvarkymas

#### Nusistovėjęs (Deprecated)
- Funkcijos arba požiūriai, kurie bus palaipsniui atsisakomi
- Dokumentacijos skyriai, planuojami pašalinti
- Metodai, turintys geresnių alternatyvų

#### Pašalinta
- Funkcijos, dokumentacija arba pavyzdžiai, kurie nebeaktualūs
- Pasenusi informacija arba nutraukti požiūriai
- Dubliuotas arba konsoliduotas turinys

#### Ištaisyta
- Dokumentacijos arba kodo klaidų pataisymai
- Praneštų problemų arba klaidų sprendimas
- Tikslumo arba funkcionalumo patobulinimai

#### Saugumas
- Su saugumu susiję patobulinimai arba pataisymai
- Geriausios saugumo praktikos atnaujinimai
- Saugumo spragų sprendimas

### Semantinio versijavimo gairės

#### Didžioji versija (X.0.0)
- Nukenksminantys pakeitimai, reikalaujantys vartotojo veiksmų
- Reikšmingas turinio ar organizacijos pertvarkymas
- Pakeitimai, keičiantys pagrindinį požiūrį ar metodiką

#### Mažesnė versija (X.Y.0)
- Naujos funkcijos arba turinio papildymai
- Patobulinimai, išlaikantys atgalinį suderinamumą
- Papildomi pavyzdžiai, įrankiai arba ištekliai

#### Taisyklė (X.Y.Z)
- Klaidų taisymai ir pataisymai
- Smulkūs patobulinimai esamam turiniui
- Paaiškinimai ir nedideli patobulinimai

## Bendruomenės atsiliepimai ir pasiūlymai

Aktyviai skatiname bendruomenės atsiliepimus, kad pagerintume šį mokymosi išteklių rinkinį:

### Kaip pateikti atsiliepimus
- **GitHub Issues**: Praneškite apie problemas arba pasiūlykite patobulinimus (AI specifiniai klausimai laukiami)
- **Discord Discussions**: Dalinkitės idėjomis ir bendraukite su Microsoft Foundry bendruomene
- **Pull Requests**: Tiesiogiai prisidėkite prie turinio patobulinimų, ypač AI šablonų ir vadovų
- **Microsoft Foundry Discord**: Dalyvaukite #Azure kanale diskusijoms apie AZD + AI
- **Community Forums**: Dalyvaukite platesnėse Azure kūrėjų diskusijose

### Atsiliepimų kategorijos
- **AI turinio tikslumas**: Pataisymai dėl AI paslaugų integracijos ir diegimo informacijos
- **Mokymosi patirtis**: Pasiūlymai dėl geresnio AI kūrėjo mokymosi eigos
- **Trūkstamas AI turinys**: Prašymai dėl papildomų AI šablonų, modelių arba pavyzdžių
- **Prieinamumas**: Patobulinimai įvairiems mokymosi poreikiams
- **AI įrankių integracija**: Pasiūlymai dėl geresnės AI kūrimo darbo eigos integracijos
- **Gamybiniai AI modeliai**: Prašymai dėl įmonės AI diegimo modelių

### Atsakymo įsipareigojimas
- **Issue Response**: Per 48 valandas dėl praneštų problemų
- **Feature Requests**: Įvertinimas per vieną savaitę
- **Community Contributions**: Peržiūra per vieną savaitę
- **Security Issues**: Nedelsiant prioritetizuojama su pagreitinamu atsaku

## Priežiūros tvarkaraštis

### Reguliarūs atnaujinimai
- **Mėnesinės peržiūros**: Turinys ir nuorodų tikrinimas
- **Ketvirtiniai atnaujinimai**: Reikšmingi turinio papildymai ir patobulinimai
- **Pusmetinės peržiūros**: Išsami pertvarka ir plėtra
- **Metiniai leidimai**: Didžiųjų versijų atnaujinimai su reikšmingais patobulinimais

### Stebėsena ir kokybės užtikrinimas
- **Automatizuoti testai**: Reguliarus kodo pavyzdžių ir nuorodų patikrinimas
- **Bendruomenės atsiliepimų integravimas**: Nuolatinis vartotojų pasiūlymų įtraukimas
- **Technologijų atnaujinimai**: Suderinamumas su naujausiomis Azure paslaugomis ir azd leidimais
- **Prieinamumo auditai**: Reguliarus įtraukios dizaino principų peržiūrėjimas

## Versijų palaikymo politika

### Esamos versijos palaikymas
- **Naujausia didžioji versija**: Pilnas palaikymas su reguliariais atnaujinimais
- **Ankstesnė didžioji versija**: Saugumo atnaujinimai ir kritinių klaidų taisymai 12 mėnesių
- **Senesnės versijos**: Tik bendruomenės palaikymas, jokių oficialių atnaujinimų

### Migracijos gairės
Kai išleidžiamos didžiosios versijos, mes teikiame:
- **Migracijos vadovai**: Žingsnis po žingsnio perėjimo instrukcijos
- **Suderinamumo pastabos**: Informacija apie pakeitimus, kurie nutraukia suderinamumą
- **Įrankių palaikymas**: skriptai arba įrankiai, padedantys migracijai
- **Bendruomenės palaikymas**: Specializuoti forumai migracijos klausimams

---

**Navigacija**
- **Ankstesnė pamoka**: [Studijų vadovas](resources/study-guide.md)
- **Kita pamoka**: Grįžti į [Pagrindinį README](README.md)

**Būkite informuoti**: Stebėkite šį saugyklą dėl pranešimų apie naujus leidimus ir svarbius mokymosi medžiagos atnaujinimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas originalioje kalboje turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingas interpretacijas, kilusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->