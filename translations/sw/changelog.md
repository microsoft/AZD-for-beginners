# Changelog - AZD For Beginners

## Introduction

Hati hii ya mabadiliko inaandika mabadiliko yote muhimu, masasisho, na maboresho kwenye ghala la AZD For Beginners. Tunafuata kanuni za semantic versioning na tunahifadhi kumbukumbu hii kusaidia watumiaji kuelewa kilichobadilika kati ya toleo.

## Learning Goals

Kwa kupitia hati ya mabadiliko hii, utak:
- Kuwa na taarifa kuhusu vipengele vipya na nyongeza za yaliyomo
- Kuelewa maboresho yaliyofanywa kwenye nyaraka zilizopo
- Kufuatilia marekebisho ya hitilafu na marekebisho ili kuhakikisha usahihi
- Kufuatilia mabadiliko ya nyenzo za kujifunzia kwa muda

## Learning Outcomes

Baada ya kupitia rekodi za mabadiliko, utaweza:
- Kutambua yaliyomo na rasilimali mpya zinazopewa kujifunzia
- Kuelewa ni sehemu gani zimeboreshwa au kusasishwa
- Kupanga njia yako ya kujifunzia kulingana na nyenzo za hivi karibuni
- Kuchangia mrejesho na mapendekezo kwa maboresho ya baadaye

## Version History

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Toleo hili linaongeza ufunuo wa amri za `azd ai`, `azd extension`, na `azd mcp` katika sura zote zinazohusiana na AI, linafufua viungo vilivyovunjika na nambari zilizotenguka katika agents.md, linasasisha jopo la majibu ya haraka (cheat sheet), na kuboresha sehemu ya Example Templates kwa maelezo yaliothibitishwa na templeti mpya za Azure AI AZD.**

#### Added
- **🤖 AZD AI CLI coverage** across 7 files (previously only in Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section introducing `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` with comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now shows both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now includes `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section with `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat with Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat using Langchain4J with ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app using Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG using Azure Functions + LangChain.js + Cosmos DB with Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator with admin portal, Teams integration, and PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app with servers in .NET, Python, Java, and TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [Mkusanyiko wa awesome-azd wa AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` corrected to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replaced `opencensus` with `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Moved `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replaced rough `len//4` estimate with `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrected services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host changed Oct 2024)
- **contoso-chat**: Updated description to reference Azure AI Foundry + Prompty, matching the repo's actual title and tech stack

#### Removed
- **ai-document-processing**: Removed non-functional template reference (repo not publicly accessible as an AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now shows expected output and `azd monitor` step; Exercise 2 includes full `FunctionTool` registration code; Exercise 3 replaces vague guidance with concrete `prepdocs.py` commands
- **📚 agents.md resources**: Updated documentation links to current Azure AI Agent Service docs and quickstart
- **📋 agents.md Next Steps table**: Added AI Workshop Lab link for complete chapter coverage

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

#### Course Navigation Enhancement
**Toleo hili linaboreshwa kwa urambazaji wa README.md wa sura kwa muundo ulioimarishwa wa jedwali.**

#### Changed
- **Course Map Table**: Enhanced with direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Removed redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links in Course Map table verified

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Toleo hili linasasisha marejeo ya bidhaa kwa uandishi wa sasa wa chapa ya Microsoft.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references updated across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name updated to reflect current branding

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Toleo hili linapanga upya nyaraka kwa kuunda folda maalum za sura kwa urambazaji wazi zaidi.**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| File | From | To |
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

#### Added
- **📚 Chapter README files**: Created README.md in each chapter folder with:
  - Learning objectives and duration
  - Lesson table with descriptions
  - Quick start commands
  - Navigation to other chapters

#### Changed
- **🔗 Updated all internal links**: 78+ paths updated across all documentation files
- **🗺️ Main README.md**: Updated Course Map with new chapter structure
- **📝 examples/README.md**: Updated cross-references to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Toleo hili liliongeza faili za README za urambazaji wa sura (zilifutwa na v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Toleo hili linaongeza mwongozo kamili wa utumikishaji wa maajenti wa AI kwa kutumia Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide covering:
  - What AI agents are and how they differ from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises with success criteria

#### Content Structure
- **Introduction**: Agent concepts for beginners
- **Quick Start**: Deploy agents with `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams of agent patterns
- **Configuration**: Tool setup and environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Toleo hili linasasisha usanidi wa kontena ya maendeleo kwa zana za kisasa na chaguo bora kwa uzoefu wa kujifunzia AZD.**

#### Changed
- **🐳 Base Image**: Updated from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Renamed from "Python 3" to "AZD for Beginners" for clarity

#### Added
- **🔧 Vipengele Vipya vya Dev Container**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (toleo la LTS kwa tempeletti za AZD)
  - `github-cli` kwa usimamizi wa templeti
  - `docker-in-docker` kwa utekelezaji wa programu za kontena

- **🔌 Kupeleka Bandari (Port Forwarding)**: Bandari zilizosanikishwa awali kwa maendeleo ya kawaida:
  - 8000 (mapitio ya MkDocs)
  - 3000 (programu za wavuti)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Viongezeo Vipya vya VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense ya Python iliyoboreshwa
  - `ms-azuretools.vscode-azurefunctions` - msaada wa Azure Functions
  - `ms-azuretools.vscode-docker` - msaada wa Docker
  - `ms-azuretools.vscode-bicep` - msaada wa lugha ya Bicep
  - `ms-azure-devtools.azure-resource-groups` - usimamizi wa rasilimali za Azure
  - `yzhang.markdown-all-in-one` - uhariri wa Markdown
  - `DavidAnson.vscode-markdownlint` - ukaguzi wa Markdown (linting)
  - `bierner.markdown-mermaid` - msaada wa michoro ya Mermaid
  - `redhat.vscode-yaml` - msaada wa YAML (kwa azure.yaml)
  - `eamodio.gitlens` - uonyesho wa Git
  - `mhutchie.git-graph` - historia ya Git

- **⚙️ Mipangilio ya VS Code**: Imeongeza mipangilio za chaguo-msingi kwa tafsiri ya Python, ufomati wakati wa kuhifadhi, na kuondoa nafasi za ziada

- **📦 Imeboreshwa requirements-dev.txt**:
  - Imeongeza plugin ya MkDocs minify
  - Imeongeza pre-commit kwa ubora wa msimbo
  - Imeongeza vifurushi vya Azure SDK (azure-identity, azure-mgmt-resource)

#### Imerekebishwa
- **Amri ya Post-Create**: Sasa inathibitisha usakinishaji wa AZD na Azure CLI wakati kontena inapoanza

---

### [v3.11.0] - 2026-02-05

#### Uboreshaji wa README Urafiki kwa Waanzilishi
**Toleo hili limeboresha kwa kiasi kikubwa README.md ili liwe rahisi zaidi kwa waanzilishi na linaongeza rasilimali muhimu kwa watengenezaji wa AI.**

#### Imeongezwa
- **🆚 Ulinganisho wa Azure CLI na AZD**: Ufafanuzi wazi wa wakati wa kutumia kila chombo pamoja na mifano ya vitendo
- **🌟 Viungo Bora vya AZD**: Viungo vya moja kwa moja kwa jumba la templeti za jamii na rasilimali za mchango:
  - [Galeria Bora ya AZD](https://azure.github.io/awesome-azd/) - tempuleti 200+ tayari kutumika
  - [Wasilisha Templaiti](https://github.com/Azure/awesome-azd/issues) - mchango wa jamii
- **🎯 Mwongozo wa Kuanzisha Haraka**: Sehemu ya kuanza kwa hatua 3 iliyorahisishwa (Sakinisha → Ingia → Weka)
- **📊 Jedwali la Urambazaji Kulingana na Uzoefu**: Mwongozo wazi wa wapi pa kuanzia kulingana na uzoefu wa msanidi

#### Imebadilishwa
- **Muundo wa README**: Imepangwa upya kwa kufichua hatua kwa taratibu - taarifa muhimu kwanza
- **Sehemu ya Utangulizi**: Imeandikwa upya ili kuelezea "Uchawi wa `azd up`" kwa waanzilishi kabisa
- **Yaliyotolewa Mara mbili Yameondolewa**: Imetoa sehemu ya utatuzi iliyorudiwa
- **Amri za Utatuzi wa Shida**: Imerekebisha rejea ya `azd logs` ili itumie `azd monitor --logs` halali

#### Imerekebishwa
- **🔐 Amri za Uthibitisho**: Imeongeza `azd auth login` na `azd auth logout` kwenye cheat-sheet.md
- **Rejea za Amri Isizokuwa Sahihi**: Imetoa mabaki ya `azd logs` katika sehemu ya utatuzi ya README

#### Vidokezo
- **Eneo la utekelezaji**: Mabadiliko yalitekelezwa kwenye README.md kuu na resources/cheat-sheet.md
- **Walengwa**: Maboresho yalilenga hasa watengenezaji wapya wa AZD

---

### [v3.10.0] - 2026-02-05

#### Sasisho la Usahihi wa Amri za Azure Developer CLI
**Toleo hili linasahihisha amri za AZD zisizokuwepo katika nyaraka zote, kuhakikisha mifano yote ya msimbo inatumia sintaks sahihi ya Azure Developer CLI.**

#### Imerekebishwa
- **🔧 Amri za AZD Zisizokuwepo Zimetolewa**: Ukaguzi kamili na urekebishaji wa amri batili:
  - `azd logs` (haipo) → imebadilishwa na `azd monitor --logs` au mbadala za Azure CLI
  - vikundi ya amri za `azd service` (havipo) → imebadilishwa kwa `azd show` na Azure CLI
  - `azd infra import/export/validate` (havipo) → zimeondolewa au kubadilishwa kwa mbadala halali
  - bendera za `azd deploy --rollback/--incremental/--parallel/--detect-changes` (hazipo) → zimeondolewa
  - bendera za `azd provision --what-if/--rollback` (hazipo) → imesasishwa kutumia `--preview`
  - `azd config validate` (haipo) → imebadilishwa na `azd config list`
  - `azd info`, `azd history`, `azd metrics` (havipo) → zimeondolewa

- **📚 Faili Zilizosasishwa na Marekebisho ya Amri**:
  - `resources/cheat-sheet.md`: Marekebisho makubwa ya rejea za amri
  - `docs/deployment/deployment-guide.md`: Imeweka sawa mikakati ya rollback na uenezaji
  - `docs/troubleshooting/debugging.md`: Imerekebisha sehemu za uchambuzi wa logi
  - `docs/troubleshooting/common-issues.md`: Imeboresha amri za utatuzi
  - `docs/troubleshooting/ai-troubleshooting.md`: Imeweka sawa sehemu za ufuatiliaji wa AZD
  - `docs/getting-started/azd-basics.md`: Imeweka sawa amri za ufuatiliaji
  - `docs/getting-started/first-project.md`: Imebadilisha mifano ya ufuatiliaji na utatuzi
  - `docs/getting-started/installation.md`: Imeweka sawa msaada na mifano ya toleo
  - `docs/pre-deployment/application-insights.md`: Imeweka sawa amri za kuangalia logi
  - `docs/pre-deployment/coordination-patterns.md`: Imeweka sawa amri za ufuatiliaji wa wakala

- **📝 Marejeo ya Toleo Yameboreshwa**:
  - `docs/getting-started/installation.md`: Imebadilisha toleo lililotajwa moja kwa moja `1.5.0` kuwa `1.x.x` kwa kiungo cha releases

#### Imebadilishwa
- **Mikakati ya Rollback**: Nyaraka zimebadilishwa kutumia rollback iliyotegemea Git (AZD haina rollback asilia)
- **Kuangalia Logi**: Rejea za `azd logs` zimebadilishwa na `azd monitor --logs`, `azd monitor --live`, na amri za Azure CLI
- **Sehemu ya Utendaji**: Imetoa bendera zisizokuwepo za uenezaji sambamba/za hatua kwa hatua, ikitoa mbadala sahihi

#### Maelezo ya Kiufundi
- **Amri Halali za AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera Halali za azd monitor**: `--live`, `--logs`, `--overview`
- **Vipengele Vilivyotolewa**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Vidokezo
- **Uthibitisho**: Amri zimekaguliwa dhidi ya Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Kukamilika kwa Warsha na Sasisho la Ubora wa Nyaraka
**Toleo hili linakamilisha moduli za warsha za kiingilizi, linarekebisha viungo vyote vilivyovunjika kwenye nyaraka, na kuboresha ubora wa maudhui kwa watengenezaji wa AI wanaotumia Microsoft AZD.**

#### Imeongezwa
- **📝 CONTRIBUTING.md**: Hati mpya ya miongozo ya mchango yenye:
  - Maelekezo wazi ya kuripoti matatizo na kupendekeza mabadiliko
  - Viwango vya nyaraka kwa maudhui mapya
  - Miongozo ya mifano ya msimbo na tamaduni za ujumbe wa commit
  - Taarifa za ushiriki wa jamii

#### Imekamilika
- **🎯 Moduli ya Warsha 7 (Wrap-up)**: Moduli ya hitimisho imetekelezwa kikamilifu ikijumuisha:
  - Muhtasari mpana wa mafanikio ya warsha
  - Sehemu ya dhana muhimu zilizopatikana ikijumuisha AZD, templeti, na Microsoft Foundry
  - Mapendekezo ya kuendelea na safari ya kujifunza
  - Mazoezi ya changamoto za warsha na viwango vya ugumu
  - Viungo vya maoni ya jamii na msaada

- **📚 Moduli ya Warsha 3 (Deconstruct)**: Imeboresha malengo ya kujifunza ikijumuisha:
  - Mwongozo wa kuwasha GitHub Copilot na seva za MCP
  - Uelewa wa muundo wa saraka za templeti za AZD kwenye GitHub
  - Mifumo ya kupanga miundombinu kwa kutumia Infrastructure-as-Code (Bicep)
  - Maelekezo ya maabara ya vitendo (hands-on)

- **🔧 Moduli ya Warsha 6 (Teardown)**: Imetekelezwa kikamilifu kwa:
  - Kusafisha rasilimali na malengo ya usimamizi wa gharama
  - Matumizi ya `azd down` kwa kuondoa miundombinu kwa usalama
  - Mwongozo wa urejesho wa huduma za cognitive zilizofutwa kwa mpangilio mpole (soft-deleted)
  - Vipengele vya ziada kwa uchunguzi wa GitHub Copilot na Azure Portal

#### Imerekebishwa
- **🔗 Marekebisho ya Viungo Vilivyovunjika**: Imeweka sawa viungo 15+ vilivyovunjika ndani ya nyaraka:
  - `docs/ai-foundry/ai-model-deployment.md`: Imeweka sawa njia za microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Imeweka sawa njia za ai-model-deployment.md na production-ai-practices.md
  - `docs/getting-started/first-project.md`: Imebadilisha cicd-integration.md isiyokuwepo na deployment-guide.md
  - `examples/retail-scenario.md`: Imeweka sawa njia za Maswali Yanayoulizwa Mara kwa Mara (FAQ) na mwongozo wa utatuzi
  - `examples/container-app/microservices/README.md`: Imeweka sawa njia za ukurasa wa kozi na mwongozo wa uenezaji
  - `resources/faq.md` na `resources/glossary.md`: Imeboresha rejea za sura za AI
  - `course-outline.md`: Imeweka sawa rejea za mwongozo wa mwalimu na maabara ya warsha ya AI

- **📅 Bango la Hali ya Warsha**: Imebadilishwa kutoka "Under Construction" kuwa hadharani kwa tarehe Februari 2026

- **🔗 Urambazaji wa Warsha**: Imeweka sawa viungo vya urambazaji vilivyokuwa vikiashiria saraka isiyokuwepo lab-1-azd-basics

#### Imebadilishwa
- **Uwasilishaji wa Warsha**: Imetoa onyo la "under construction", warsha sasa imekamilika na iko tayari kutumika
- **Muafaka wa Urambazaji**: Imehakikisha moduli zote za warsha zina urambazaji sahihi kati ya moduli
- **Rejea za Njia za Kujifunza**: Imebadilisha rejea za sura ili kutumia njia sahihi za microsoft-foundry

#### Imethibitishwa
- ✅ Faili zote za Markdown kwa Kiingereza zina viungo vya ndani vinavyofanya kazi
- ✅ Moduli za warsha 0-7 zimekamilika na zina malengo ya kujifunza
- ✅ Urambazaji kati ya sura na moduli unafanya kazi vizuri
- ✅ Maudhui yanayofaa kwa watengenezaji wa AI wanaotumia Microsoft AZD
- ✅ Lugha rafiki kwa waanzilishi na muundo umehifadhiwa kote
- ✅ CONTRIBUTING.md inatoa mwanga wazi kwa wachangiaji wa jamii

#### Utekelezaji wa Kiufundi
- **Uthibitishaji wa Viungo**: Script ya PowerShell iliyoendeshwa moja kwa moja ilikagua viungo vyote vya .md
- **Ukaguzi wa Yaliyomo**: Mapitio ya mkono ya ukamilifu wa warsha na ubunifu wa maandishi kwa waanzilishi
- **Mfumo wa Urambazaji**: Mifumo ya urambazaji wa sura na moduli imewekwa kwa uwiano

#### Vidokezo
- **Eneo la utekelezaji**: Mabadiliko yalitekelezwa kwa nyaraka za Kiingereza pekee
- **Tafsiri**: Folda za tafsiri hazikuombwa katika toleo hili (tafsiri za kiotomatiki zitasawazishwa baadaye)
- **Muda wa Warsha**: Warsha kamili sasa inatoa masaa 3-4 ya kujifunza kwa vitendo

---

### [v3.8.0] - 2025-11-19

#### Nyaraka za Juu: Ufuatiliaji, Usalama, na Mifumo ya Wakala Wengi
**Toleo hili linaongeza masomo kamili ya kiwango cha A juu ya ujumuishaji wa Application Insights, mifumo ya uthibitisho, na uratibu wa wakala wengi kwa uenezaji wa uzalishaji.**

#### Imeongezwa
- **📊 Somo la Ujumuishaji wa Application Insights**: katika `docs/pre-deployment/application-insights.md`:
  - Uenezaji uliolengwa na AZD na upangaji wa moja kwa moja
  - Templeti kamili za Bicep kwa Application Insights + Log Analytics
  - Programu za Python zinazoendesha zikiwa na telemetry maalum (mistari 1,200+)
  - Mifumo ya ufuatiliaji ya AI/LLM (ufuatiliaji wa tokeni/gharama za Microsoft Foundry Models)
  - Michoro 6 ya Mermaid (miundo, tracing iliyosambazwa, mtiririko wa telemetry)
  - Mazoezi 3 ya vitendo (alerts, dashboards, ufuatiliaji wa AI)
  - Mifano ya Kusto query na mikakati ya uboreshaji wa gharama
  - Kutiririka kwa metrika za moja kwa moja na uchambuzi wa wakati-wa-kweli
  - Muda wa kujifunza wa dakika 40-50 na mifumo ya uzalishaji

- **🔐 Somo la Mifumo ya Uthibitisho & Usalama**: katika `docs/getting-started/authsecurity.md`:
  - Mifumo 3 ya uthibitisho (connection strings, Key Vault, managed identity)
  - Templeti kamili za miundombinu za Bicep kwa uenezaji salama
  - Msimbo wa programu za Node.js unaounganishwa na Azure SDK
  - Mazoezi 3 kamili (wezeshaji wa managed identity, user-assigned identity, mzunguko wa Key Vault)
  - Mbinu bora za usalama na usanidi wa RBAC
  - Mwongozo wa utatuzi na uchambuzi wa gharama
  - Mifumo ya uzalishaji kwa uthibitisho bila nywila (passwordless)

- **🤖 Somo la Mifumo ya Uratibu wa Wakala Wengi**: katika `docs/pre-deployment/coordination-patterns.md`:
  - Mifumo 5 ya uratibu (mlolongo, sambamba, kihenjari, inayosababishwa na tukio, mkatikati wa makubaliano)
  - Utekelezaji kamili wa huduma ya orkestra (Python/Flask, mistari 1,500+)
  - Utekelezaji wa wakala 3 maalum (Utafiti, Mwandishi, Mhariri)
  - Ujumuishaji wa Service Bus kwa kuorodhesha ujumbe
  - Usimamizi wa hali kwa Cosmos DB kwa mifumo iliyosambazwa
  - Michoro 6 ya Mermaid ikionyesha mwingiliano wa wakala
  - Mazoezi 3 ya hali ya juu (kusimamia muda wa kusubiri, mantiki ya kurudia, circuit breaker)
  - Ugawaji wa gharama ($240-565/mwezi) na mikakati ya uboreshaji
  - Ujumuishaji wa Application Insights kwa ufuatiliaji

#### Imeboreshwa
- **Sura ya Kabla ya Uenezaji (Pre-deployment)**: Sasa inajumuisha ufuatiliaji mpana na mifumo ya uratibu
- **Sura ya Kuanzia**: Imeboreshwa na mifumo ya kitaalamu ya uthibitisho
- **Utakamilifu kwa Uzalishaji**: Ufunuo kamili kutoka usalama hadi ufuatiliaji
- **Muhtasari wa Kozi**: Imesasishwa kuashiria masomo mapya katika Sura 3 na 6

#### Imebadilishwa
- **Mchakato wa Kujifunza**: Uingizaji bora wa usalama na ufuatiliaji kote katika kozi
- **Ubora wa Nyaraka**: Viwango vya kiwango cha A (95-97%) vilihifadhiwa katika masomo mapya
- **Mifumo ya Uzalishaji**: Ufunuo kamili wa mwisho hadi mwisho kwa uenezaji wa shirika

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Njia wazi kutoka kwa maendeleo hadi ufuatiliaji uzalishaji
- **Viwango vya Usalama**: Mifumo ya kitaalamu kwa uthibitisho na usimamizi wa siri
- **Uwezo wa Kuonekana**: Muunganisho kamili wa Application Insights na AZD
- **Mizigo ya AI**: Ufuatiliaji maalum kwa Microsoft Foundry Models na mifumo ya mawakala wengi

#### Imethibitishwa
- ✅ Masomo yote yanajumuisha msimbo kamili unaofanya kazi (si vipande vya msimbo)
- ✅ Michoro ya Mermaid kwa kujifunza kwa kuona (jumla 19 katika masomo 3)
- ✅ Mazoezi ya vitendo yenye hatua za uhakiki (jumla 9)
- ✅ Miundo ya Bicep tayari kwa uzalishaji inayoweza kutumika kupitia `azd up`
- ✅ Uchambuzi wa gharama na mikakati ya uboreshaji
- ✅ Mwongozo wa kutatua matatizo na mbinu bora
- ✅ Vituo vya ukaguzi wa maarifa yenye amri za uhakiki

#### Matokeo ya Upimaji wa Nyaraka
- **docs/pre-deployment/application-insights.md**: - Mwongozo kamili wa ufuatiliaji
- **docs/getting-started/authsecurity.md**: - Mifumo ya usalama ya kitaalamu
- **docs/pre-deployment/coordination-patterns.md**: - Miundo ya juu ya mawakala wengi
- **Overall New Content**: - Viwango vya ubora vya juu vinavyolingana

#### Utekelezaji wa Kiufundi
- **Application Insights**: Log Analytics + telemetri maalum + uchunguzi uliosambazwa
- **Authentication**: Managed Identity + Key Vault + mifumo ya RBAC
- **Mawakala Wengi**: Service Bus + Cosmos DB + Container Apps + uandikishaji
- **Ufuatiliaji**: vipimo vya moja kwa moja + maswali ya Kusto + tahadhari + dashibodi
- **Usimamizi wa Gharama**: Mikakati ya sampuli, sera za uhifadhi, udhibiti wa bajeti

### [v3.7.0] - 2025-11-19

#### Maboresho ya Ubora wa Nyaraka na Mfano Mpya wa Microsoft Foundry Models
**Toleo hili linaboresha ubora wa nyaraka katika hifadhi nzima na linaongeza mfano kamili wa ueneaji wa Microsoft Foundry Models wenye kiolesura cha mazungumzo cha gpt-4.1.**

#### Iliongezwa
- **🤖 Mfano wa Mazungumzo wa Microsoft Foundry Models**: Ueneaji kamili wa gpt-4.1 na utekelezaji unaofanya kazi katika `examples/azure-openai-chat/`:
  - Miundombinu kamili ya Microsoft Foundry Models (ueneaji wa mfano gpt-4.1)
  - Kiolesura cha mazungumzo cha Python kwa mstari wa amri chenye historia ya mazungumzo
  - Muunganisho wa Key Vault kwa uhifadhi salama wa funguo za API
  - Ufuatiliaji wa matumizi ya tokeni na makadirio ya gharama
  - Kudhibiti kiwango cha maombi na utunzaji wa makosa
  - README kamili yenye mwongozo wa ueneaji wa dakika 35-45
  - Faili 11 tayari kwa uzalishaji (miundo ya Bicep, programu ya Python, usanidi)
- **📚 Mazoezi ya Nyaraka**: Imeongezwa mazoezi ya vitendo kwa mwongozo wa usanidi:
  - Zoefisho 1: Usanidi wa mazingira mengi (dakika 15)
  - Zoefisho 2: Mazoezi ya usimamizi wa siri (dakika 10)
  - Vigezo vya mafanikio wazi na hatua za uhakiki
- **✅ Uhakiki wa Ueneaji**: Imeongezwa sehemu ya uhakiki katika mwongozo wa ueneaji:
  - Taratibu za ukaguzi wa afya
  - Orodha ya vigezo vya mafanikio
  - Matokeo yanayotarajiwa kwa amri zote za ueneaji
  - Rejea ya haraka ya kutatua matatizo

#### Imeboreshwa
- **examples/README.md**: Imesasishwa hadi ubora wa daraja A (93%):
  - Imeongezwa azure-openai-chat katika sehemu zote muhimu
  - Imebadilishwa idadi ya mifano za ndani kutoka 3 hadi 4
  - Imeongezwa kwenye jedwali la Mifano ya Programu za AI
  - Imeingizwa ndani ya Mwongozo wa Kuanzia kwa Watumiaji wa Kati
  - Imeongezwa kwenye sehemu ya Templates za Microsoft Foundry
  - Imeboreshwa Matrix ya Ulinganisho na sehemu za kupata teknolojia
- **Ubora wa Nyaraka**: Uboreshaji B+ (87%) → A- (92%) kwenye folda ya docs:
  - Imeongezwa matokeo yanayotarajiwa kwa mifano ya amri muhimu
  - Imeingizwa hatua za uhakiki kwa mabadiliko ya usanidi
  - Imeboreshwa ujifunzaji wa vitendo kwa mazoezi ya vitendo

#### Imebadilishwa
- **Mfululizo wa Kujifunza**: Muingiliano bora wa mifano ya AI kwa wanafunzi wa kiwango cha kati
- **Muundo wa Nyaraka**: Mazoezi yenye utekelezaji zaidi na matokeo wazi
- **Mchakato wa Uhakiki**: Vigezo vya mafanikio vilivyowekwa wazi vimeongezwa kwa taratibu kuu

#### Imeboreshwa
- **Uzoefu wa Mwanaendelezaji**: Ueneaji wa Microsoft Foundry Models sasa unachukua dakika 35-45 (ikilinganishwa na 60-90 kwa mbadala ngumu)
- **Uwajibikaji wa Gharama**: Makadirio ya gharama wazi ($50-200/mwezi) kwa mfano wa Microsoft Foundry Models
- **Njia ya Kujifunza**: Waendelezaji wa AI wana nafasi ya kuingia wazi na azure-openai-chat
- **Viwango vya Nyaraka**: Matokeo yanayotarajiwa na hatua za uhakiki zenye msimamo

#### Imethibitishwa
- ✅ Mfano wa Microsoft Foundry Models unafanya kazi kikamilifu na `azd up`
- ✅ Faili zote 11 za utekelezaji ziko sahihi kiusanisi
- ✅ Maelekezo ya README yanaendana na uzoefu halisi wa ueneaji
- ✅ Viungo vya nyaraka vimeboreshwa katika maeneo zaidi ya 8
- ✅ Orodha ya mifano inaonyesha kwa usahihi mifano 4 za ndani
- ✅ Hakuna viungo vya nje vinavyorudiwa katika jedwali
- ✅ Marejeo yote ya urambazaji ni sahihi

#### Utekelezaji wa Kiufundi
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + muundo wa Container Apps
- **Usalama**: Managed Identity imeandaliwa, siri ziko ndani ya Key Vault
- **Ufuatiliaji**: Muunganisho wa Application Insights
- **Usimamizi wa Gharama**: Ufuatiliaji wa tokeni na uboreshaji wa matumizi
- **Ueneaji**: Amri moja `azd up` kwa usanidi kamili

### [v3.6.0] - 2025-11-19

#### Sasisho Kuu: Mifano ya Ueneaji ya Container App
**Toleo hili linaanzisha mifano kamili, tayari kwa uzalishaji ya ueneaji wa programu za container ikitumia Azure Developer CLI (AZD), pamoja na nyaraka kamili na uingizaji katika njia ya kujifunza.**

#### Iliongezwa
- **🚀 Mifano ya Container App**: Mifano mpya za ndani kwenye `examples/container-app/`:
  - [Mwongozo Mkuu](examples/container-app/README.md): Muhtasari kamili wa ueneaji wa programu zilizopo ndani ya container, mwongozo wa kuanza, uzalishaji, na mifumo ya juu
  - [API Rahisi ya Flask](../../examples/container-app/simple-flask-api): API ya REST rafiki kwa wanaoanza yenye skeli hadi sifuri, vipimo vya afya, ufuatiliaji, na utatuzi wa matatizo
  - [Muundo wa Microservices](../../examples/container-app/microservices): Ueneaji wa huduma nyingi tayari kwa uzalishaji (API Gateway, Product, Order, User, Notification), ujumbe wa asili, Service Bus, Cosmos DB, Azure SQL, uchambuzi uliogawanywa, ueneaji wa blue-green/canary
- **Mbinu Bora**: Usalama, ufuatiliaji, uboreshaji wa gharama, na mwongozo wa CI/CD kwa mizigo ya container
- **Vifaa vya Mifano**: `azure.yaml` kamili, miundo ya Bicep, na utekelezaji wa huduma kwa lugha nyingi (Python, Node.js, C#, Go)
- **Upimaji & Utatuzi Matatizo**: Nyenzo za mtihani kutoka mwanzo hadi mwisho, amri za ufuatiliaji, mwongozo wa kutatua matatizo

#### Imebadilishwa
- **README.md**: Imesasishwa kuonyesha na kuunganisha mifano mpya ya container app chini ya "Local Examples - Container Applications"
- **examples/README.md**: Imesasishwa kuonyesha mifano ya container app, kuongeza vituo vya kulinganisha, na kusasisha marejeo ya teknolojia/muundo
- **Muhtasari wa Kozi & Mwongozo wa Masomo**: Imesasishwa kurejea mifano mpya ya container app na mifumo ya ueneaji katika sura zinazofaa

#### Imethibitishwa
- ✅ Mifano mpya yote inaweza kuenezwa kwa `azd up` na inafuata mbinu bora
- ✅ Viungo vya nyaraka na urambazaji vimesasishwa
- ✅ Mifano inashughulikia hali kutoka kwa mgeni hadi juu, ikiwa ni pamoja na microservices za uzalishaji

#### Vidokezo
- **Uwanja**: Nyaraka na mifano kwa Kiingereza tu
- **Hatua Zifuatazo**: Kupanua na mifumo ya juu ya container na automatisering ya CI/CD katika matoleo yajayo

### [v3.5.0] - 2025-11-19

#### Urejesho wa Jina la Bidhaa: Microsoft Foundry
**Toleo hili linatekeleza mabadiliko ya jina la bidhaa kutoka "Microsoft Foundry" hadi "Microsoft Foundry" katika nyaraka zote za Kiingereza, ikionyesha urejesho rasmi wa jina la Microsoft.**

#### Imebadilishwa
- **🔄 Sasisho la Jina la Bidhaa**: Urejesho kamili wa jina kutoka "Microsoft Foundry" hadi "Microsoft Foundry"
  - Imeboreshwa marejeo yote katika nyaraka za Kiingereza ndani ya folda `docs/`
  - Jina la folda lilibadilishwa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili iliyopewa jina jipya: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumla: Marejeo 23 yaliyosasishwa katika faili 7 za nyaraka

- **📁 Mabadiliko ya Muundo wa Folda**:
  - `docs/ai-foundry/` lilibadilishwa jina kuwa `docs/microsoft-foundry/`
  - Marejeo yote ya ndani yamesasishwa kuonyesha muundo mpya wa folda
  - Viungo vya urambazaji vimehakikiwa kushirikiana

- **📄 Urejeshwaji wa Majina ya Faili**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Marejeo yote ya ndani yamesasishwa kurejea jina jipya la faili

#### Faili Zilisasishwa
- **Nyaraka za Sura** (mafayela 7):
  - `docs/microsoft-foundry/ai-model-deployment.md` - maboresho 3 ya viungo vya urambazaji
  - `docs/microsoft-foundry/ai-workshop-lab.md` - marejeo 4 ya jina la bidhaa yaliyo sasishwa
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Tayari inatumia Microsoft Foundry (kutoka kwa sasisho za awali)
  - `docs/microsoft-foundry/production-ai-practices.md` - marejeo 3 yaliyosasishwa (muhtasari, maoni ya jamii, nyaraka)
  - `docs/getting-started/azd-basics.md` - marejeo 4 ya msimbo wa kuvuka yalisasishwa
  - `docs/getting-started/first-project.md` - marejeo 2 ya urambazaji wa sura yalisasishwa
  - `docs/getting-started/installation.md` - marejeo 2 ya sura inayofuata yalisasishwa
  - `docs/troubleshooting/ai-troubleshooting.md` - marejeo 3 yaliyosasishwa (urambazaji, jamii ya Discord)
  - `docs/troubleshooting/common-issues.md` - kirejeo 1 cha urambazaji kilisasishwa
  - `docs/troubleshooting/debugging.md` - kirejeo 1 cha urambazaji kilisasishwa

- **Faili za Muundo wa Kozi** (mafayela 2):
  - `README.md` - marejeo 17 yaliyo sasishwa (muhtasari wa kozi, vichwa vya sura, sehemu za templates, maarifa ya jamii)
  - `course-outline.md` - marejeo 14 yaliyo sasishwa (muhtasari, malengo ya kujifunza, rasilimali za sura)

#### Imethibitishwa
- ✅ Hakuna marejeo ya kubaki ya `docs/ai-foundry` katika nyaraka za Kiingereza
- ✅ Hakuna marejeo yaliobaki ya jina la bidhaa "Microsoft Foundry" katika nyaraka za Kiingereza
- ✅ Viungo vyote vya urambazaji vinavyofanya kazi lakini sasa vinarejea muundo mpya wa folda
- ✅ Majina ya faili na madirisha yamebadilishwa kwa mafanikio
- ✅ Marejeo ya ndani kati ya sura yamehakikiwa

#### Vidokezo
- **Uwanja**: Mabadiliko yalitumika tu kwa nyaraka za Kiingereza katika folda `docs/`
- **Tafsiri**: Folda za tafsiri (`translations/`) hazijasasishwa katika toleo hili
- **Warsha**: Vifaa vya warsha (`workshop/`) havijasasishwa katika toleo hili
- **Mifano**: Faili za mfano zinaweza bado kurejea jina la zamani (itashughulikiwa katika sasisho lijalo)
- **Viungo vya Nje**: URL za nje na marejeo ya GitHub zilibaki kama zilivyokuwa

#### Mwongozo wa Uhamishaji kwa Wachangiaji
Ikiwa una matawi ya ndani au nyaraka zinarejea muundo wa zamani:
1. Sasisha marejeo ya folda: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Sasisha marejeo ya faili: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Badilisha jina la bidhaa: "Microsoft Foundry" → "Microsoft Foundry"
4. Thibitisha kwamba viungo vyote vya ndani vya nyaraka vinaendelea kufanya kazi

---

### [v3.4.0] - 2025-10-24

#### Mwonekano wa Miundombinu na Maboresho ya Uhakiki
**Toleo hili linaleta msaada kamili kwa kipengele kipya cha onyesho la Azure Developer CLI na linaboreshwa uzoefu wa mtumiaji wa warsha.**

#### Iliongezwa
- **🧪 Uandishi wa kipengele azd provision --preview**: Mwanga kamili wa uwezo mpya wa onyesho la miundombinu
  - Marejeo ya amri na mifano ya matumizi katika kielelezo cha mwendo
  - Uingizaji wa kina katika mwongozo wa utoaji na matumizi na faida
  - Uingizaji wa ukaguzi wa kabla ya kuruka kwa uhalali wa ueneaji salama
  - Sasisho za mwongozo wa kuanza na mbinu za usalama kwanza
- **🚧 Bango la Hali ya Warsha**: Bango la kitaalamu la HTML linaloonyesha hali ya maendeleo ya warsha
  - Muundo wa gradient yenye viashiria vya ujenzi kwa mawasiliano wazi kwa watumiaji
  - Alama ya tarehe ya sasisho la mwisho kwa uwazi
  - Muundo unaostahimili simu kwa aina zote za vifaa

#### Imeboreshwa
- **Usalama wa Miundombinu**: Uwezo wa onyesho umeingizwa katika nyaraka zote za utoaji
- **Uhakiki Kabla ya Ueneaji**: Skripti za otomatiki sasa zinajumuisha majaribio ya onyesho la miundombinu
- **Mtiririko wa Kazi wa Mwanaendelezaji**: Mfululizo wa amri umeboreshwa kujumuisha onyesho kama dira bora
- **Uzoefu wa Warsha**: Tarajia wazi kwa watumiaji kuhusu hali ya maendeleo ya maudhui

#### Imebadilishwa
- **Mambo ya Mbinu za Ueneaji**: Mtiririko uliokithiri wa onyesho sasa unapendekezwa
- **Mtiririko wa Nyaraka**: Uhakiki wa miundombinu umehamishwa mapema katika mchakato wa kujifunza
- **Uwasilishaji wa Warsha**: Mawasiliano ya hali ya kitaalamu na muda wa maendeleo umewekwa wazi

#### Imeboreshwa
- **Mbinu ya Usalama Kwanza**: Mabadiliko ya miundombinu sasa yanaweza kuthibitishwa kabla ya ueneaji
- **Ushirikiano wa Timu**: Matokeo ya onyesho yanaweza kushirikiwa kwa ukaguzi na uthibitisho
- **Uelewa wa Gharama**: Uelewa bora wa gharama za rasilimali kabla ya upandaji
- **Kupunguza Hatari**: Kupungua kwa kushindwa kwa ueneaji kupitia uhakiki wa mapema

#### Utekelezaji wa Kiufundi
- **Ushirikiano wa Nyaraka Nyingi**: Kipengele cha onyesho kimeandikwa katika faili 4 za muhimu
- **Mifumo ya Amri**: Sintaksia na mifano ya matumizi thabiti kote katika nyaraka
- **Uingizaji wa Mbinu Bora**: Onyesho limejumuishwa katika mizunguko ya uhakiki na skripti
- **Viashiria vya Kuonekana**: Ishara mpya za kipengele kwa ugunduzi rahisi

#### Miundombinu ya Warsha
- **Mawasiliano ya Hali**: Bango la kitaalamu la HTML lenye mtindo wa gradient
- **Uzoefu wa Mtumiaji**: Hali ya maendeleo wazi inapunguza mkanganyiko
- **Uwasilishaji wa Kitaalamu**: Inatunza uaminifu wa hifadhi huku ikiweka matarajio
- **Uwazi wa Mwendelezo wa Muda**: Tarehe ya mwisho ya sasisho Oktoba 2025 kwa uwajibikaji

### [v3.3.0] - 2025-09-24

#### Vifaa vya Warsha Vilivyoboreshwa na Uzoefu wa Kujifunza wa Kihusisha
**Toleo hili linaanzisha vifaa vya warsha vya kina na mwongozo mwingi wa kuingiliana kupitia kivinjari na njia zilizopangwa za kujifunza.**

#### Iliongezwa
- **🎥 Interactive Workshop Guide**: Uzoefu wa warsha unaotekelezwa kupitia kivinjari wenye uwezo wa kuonyesha awali MkDocs
- **📝 Structured Workshop Instructions**: Njia ya kujifunza iliyoongozwa ya hatua 7 kutoka kugundua hadi kubinafsisha
  - 0-Introduction: Muhtasari wa warsha na usanidi
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for enhanced learning experience
- **🎯 Hands-On Learning Path**: Mbinu ya hatua 3 (Ugunduzi → Utekelezaji → Ubinafsishaji)
- **📱 GitHub Codespaces Integration**: Usanidi wa mazingira ya maendeleo bila mshono

#### Iliyoboreshwa
- **AI Workshop Lab**: Imeongezwa na uzoefu kamili wa kujifunza uliopangwa wa saa 2-3
- **Workshop Documentation**: Uwasilishaji wa kitaalamu ukiwa na urambazaji na vifaa vya kuona
- **Learning Progression**: Mwongozo wazi wa hatua kwa hatua kutoka uchaguzi wa kiolezo hadi utekelezaji wa uzalishaji
- **Developer Experience**: Vifaa vilivyowezeshwa kwa mtiririko wa kazi wa maendeleo uliorahisishwa

#### Imboreshwa
- **Accessibility**: Kiolesura kinachotegemea kivinjari chenye utafutaji, utendaji wa kunakili, na kubadili mandhari
- **Self-Paced Learning**: Muundo wa warsha unaobadilika unaokubaliana na kasi tofauti za kujifunza
- **Practical Application**: Mifano ya utekelezaji wa kiolezo cha AI katika mazingira halisi
- **Community Integration**: Uunganisho wa Discord kwa msaada wa warsha na ushirikiano

#### Workshop Features
- **Built-in Search**: Ugunduzi wa haraka wa maneno muhimu na masomo
- **Copy Code Blocks**: Utendaji wa kunakili kwa kuwekea kielekezi juu kwa mifano yote ya msimbo
- **Theme Toggle**: Msaada wa modi ya giza/mwanga kwa mapendeleo tofauti
- **Visual Assets**: Picha-skrini na michoro kwa uelewa ulioimarishwa
- **Help Integration**: Upatikanaji wa moja kwa moja wa Discord kwa msaada wa jamii

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Toleo hili linateleza muundo kamili wa kujifunza unaogawanywa kwa sura pamoja na urambazaji ulioboreshwa katika ghala lote.**

#### Imeongezwa
- **📚 Chapter-Based Learning System**: Kozi yote imepangwa upya kuwa sura 8 za kujifunza zinazoendelea
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Vichwa vya urambazaji na migongo ya ukurasa vinavyolingana katika nyaraka zote
- **🎯 Progress Tracking**: Orodha ya ukamilishaji wa kozi na mfumo wa uthibitisho wa kujifunza
- **🗺️ Learning Path Guidance**: Njia za kuingilia zilizo wazi kwa viwango na malengo tofauti ya uzoefu
- **🔗 Cross-Reference Navigation**: Sura zinazohusiana na masharti ya awali zimeunganishwa wazi

#### Iliyoboreshwa
- **README Structure**: Imebadilishwa kuwa jukwaa lililo na muundo wa kujifunza uliogawanywa kwa sura
- **Documentation Navigation**: Kila ukurasa sasa unajumuisha muktadha wa sura na mwongozo wa maendeleo
- **Template Organization**: Mifano na miundo imepangwa kwenye sura zinazofaa za kujifunza
- **Resource Integration**: Ramani za mwongozo, Maswali yanayoulizwa mara kwa mara, na mwongozo wa masomo umeunganishwa na sura zinazofaa
- **Workshop Integration**: Maabara za vitendo zimepangwa kwa malengo ya kujifunza ya sura nyingi

#### Imabadilishwa
- **Learning Progression**: Imehamishwa kutoka nyaraka za mstari moja hadi kujifunza kwa sura zinazobadilika
- **Configuration Placement**: Mwongozo wa usanidi umewekwa kama Chapter 3 kwa mtiririko bora wa kujifunza
- **AI Content Integration**: Uunganisho bora wa yaliyomo maalum ya AI katika safari yote ya kujifunza
- **Production Content**: Mifumo ya juu imeunganishwa kwenye Chapter 8 kwa wanafunzi wa biashara

#### Imboreshwa
- **User Experience**: Viashiria vya urambazaji na maendeleo ya sura vilivyo wazi
- **Accessibility**: Mifumo ya urambazaji inayofanana kwa urahisi wa kupitia kozi
- **Professional Presentation**: Muundo wa kozi kama chuo unaofaa kwa mafunzo ya kitaaluma na kampuni
- **Learning Efficiency**: Wakati uliopunguzwa wa kupata yaliyomo yanayofaa kupitia muundo ulioboreshwa

#### Utekelezaji wa Kiufundi
- **Navigation Headers**: Urambazaji wa sura uliosanifiwa katika faili 40+ za nyaraka
- **Footer Navigation**: Mwongozo wa maendeleo unaolingana na viashiria vya ukamilishaji wa sura
- **Cross-Linking**: Mfumo kamili wa uunganishaji wa ndani unaounganisha dhana zinazohusiana
- **Chapter Mapping**: Miundo na mifano imehusishwa wazi na malengo ya kujifunza

#### Uboreshaji wa Mwongozo wa Masomo
- **📚 Comprehensive Learning Objectives**: Mwongozo wa masomo umepangwa upya ili kuendana na mfumo wa sura 8
- **🎯 Chapter-Based Assessment**: Kila sura inajumuisha malengo maalum ya kujifunza na mazoezi ya vitendo
- **📋 Progress Tracking**: Ratiba ya kujifunza ya kila wiki yenye matokeo yanayopimika na orodha za kukamilisha
- **❓ Assessment Questions**: Maswali ya uthibitisho wa maarifa kwa kila sura yenye matokeo ya kitaalamu
- **🛠️ Practical Exercises**: Shughuli za vitendo na matukio halisi ya utekelezaji na utatuzi wa matatizo
- **📊 Skill Progression**: Kuinuka wazi kutoka dhana za msingi hadi mifumo ya biashara na msisitizo wa maendeleo ya taaluma
- **🎓 Certification Framework**: Matokeo ya maendeleo ya kitaalamu na mfumo wa utambuzi wa jamii
- **⏱️ Timeline Management**: Mpango wa kujifunza wa wiki 10 uliopangwa na uthibitisho wa hatua za mafanikio

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Toleo hili linaboreshwa suluhisho la rejareja la wakala-wengi kwa utoaji bora wa majina ya wakala na nyaraka zilizoboreshwa.**

#### Imabadilishwa
- **Multi-Agent Terminology**: Imebadilisha "Cora agent" na "Customer agent" katika suluhisho la rejareja la wakala-wengi kwa kueleweka zaidi
- **Agent Architecture**: Nyaraka zote, miundo ya ARM, na mifano ya msimbo zimesasishwa kutumia jina linalolingana "Customer agent"
- **Configuration Examples**: Mifumo ya usanidi wa wakala imemodernishwa na mabadiliko ya vigezo vya majina
- **Documentation Consistency**: Imehakikishiwa kwamba rejea zote zinatumia majina ya wakala ya kitaalamu na yenye maelezo

#### Iliyoboreshwa
- **ARM Template Package**: retail-multiagent-arm-template imesasishwa kwa rejea za Customer agent
- **Architecture Diagrams**: Michoro ya Mermaid imerefreshwa kwa majina ya wakala yaliyosasishwa
- **Code Examples**: Madarasa ya Python na mifano ya utekelezaji sasa zinatumia jina la CustomerAgent
- **Environment Variables**: Skripti zote za utekelezaji zimesasishwa kutumia vigezo vya CUSTOMER_AGENT_NAME

#### Imboreshwa
- **Developer Experience**: Majukumu ya wakala yameeleweka vizuri zaidi katika nyaraka
- **Production Readiness**: Uwiano bora na kanuni za majina za makampuni
- **Learning Materials**: Majina ya wakala yaliyofafanuliwa zaidi kwa madhumuni ya elimu
- **Template Usability**: Ufahamu uliorahisishwa wa kazi za wakala na mifumo ya utekelezaji

#### Maelezo ya Kiufundi
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Toleo hili linageuza ghala kuwa rasilimali ya kujifunza inayolenga AI kwa undani pamoja na uunganisho wa Microsoft Foundry.**

#### Imeongezwa
- **🤖 AI-First Learning Path**: Urejeshaji kamili ulioweka kipaumbele kwa waendelezaji na wahandisi wa AI
- **Microsoft Foundry Integration Guide**: Nyaraka kamili za kuunganisha AZD na huduma za Microsoft Foundry
- **AI Model Deployment Patterns**: Mwongozo wa kina unaofunika uteuzi wa modeli, usanidi, na mikakati ya utekelezaji wa uzalishaji
- **AI Workshop Lab**: Warsha ya vitendo ya saa 2-3 kwa kubadilisha programu za AI kuwa suluhisho zinazoendeshwa kwa AZD
- **Production AI Best Practices**: Mifumo tayari kwa biashara kwa upanuzi, ufuatiliaji, na usalama wa mizigo ya AI
- **AI-Specific Troubleshooting Guide**: Utatuzi wa matatizo kwa Microsoft Foundry Models, Cognitive Services, na masuala ya utekelezaji wa AI
- **AI Template Gallery**: Mkusanyiko uliowekwa wa miundo ya Microsoft Foundry pamoja na viwango vya ugumu
- **Workshop Materials**: Muundo kamili wa warsha unaojumuisha maabara za vitendo na nyenzo za rejea

#### Iliyoboreshwa
- **README Structure**: Imezingatia waendelezaji wa AI kwa taarifa ya 45% ya maslahi ya jamii kutoka Microsoft Foundry Discord
- **Learning Paths**: Njia maalum za mtaalamu wa AI kando na njia za jadi kwa wanafunzi na wahandisi wa DevOps
- **Template Recommendations**: Miundo ya AI iliyochaguliwa ikijumuisha azure-search-openai-demo, contoso-chat, na openai-chat-app-quickstart
- **Community Integration**: Msaada wa jamii ulioboreshwa kwenye Discord pamoja na chaneli na majadiliano maalum ya AI

#### Security & Production Focus
- **Managed Identity Patterns**: Mbinu za utambulisho zilizosimamiwa za uthibitisho na usanidi wa usalama wa AI
- **Cost Optimization**: Ufuatiliaji wa matumizi ya tokeni na udhibiti wa bajeti kwa mizigo ya AI
- **Multi-Region Deployment**: Mikakati ya utekelezaji wa programu za AI kwa maeneo mengi
- **Performance Monitoring**: Vipimo maalum vya AI na ujumuishaji wa Application Insights

#### Documentation Quality
- **Linear Course Structure**: Mvutano wa mantiki kutoka mwanzoni hadi mifumo ya juu ya utekelezaji wa AI
- **Validated URLs**: Viungo vyote vya nje vya ghala vimehakikiwa na vinapatikana
- **Complete Reference**: Viungo vyote vya ndani vya nyaraka vimehakikiwa na vinavyofanya kazi
- **Production Ready**: Mifumo ya utekelezaji kwa biashara na mifano ya maisha halisi

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Toleo hili linawakilisha marekebisho makubwa ya muundo wa ghala na uwasilishaji wa yaliyomo.**

#### Imeongezwa
- **Structured Learning Framework**: Kurasa zote za nyaraka sasa zinajumuisha Sehemu ya Utangulizi, Malengo ya Kujifunza, na Matokeo ya Kujifunza
- **Navigation System**: Viungo vya Somo la Awali/Kufuata vimeongezwa katika nyaraka zote kwa ukuaji wa kujifunza unaoongozwa
- **Study Guide**: study-guide.md kamili na malengo ya kujifunza, mazoezi, na vifaa vya tathmini
- **Professional Presentation**: Ikamuliwa emoji zote za ikoni kwa upatikanaji bora na muonekano wa kitaalamu
- **Enhanced Content Structure**: Muundo na mtiririko wa nyenzo za kujifunza umeboreshwa

#### Imabadilishwa
- **Documentation Format**: Nyaraka zote zimesanidiwa kwa muundo unaolenga kujifunza
- **Navigation Flow**: Mtiririko wa kimuundo kupitia nyenzo za kujifunza umeboreshwa
- **Content Presentation**: Vipengele vya mapambo vimeondolewa kwa tija ya uwasilishaji wa kitaalamu
- **Link Structure**: Viungo vya ndani vimebadilishwa kuunga mkono mfumo mpya wa urambazaji

#### Imboreshwa
- **Accessibility**: Kuondolewa kwa utegemezi wa emoji kwa urahisi wa watazamaji wa skrini
- **Professional Appearance**: Uwasilishaji mweupe wa mtindo wa kitaaluma unaofaa kwa mafunzo ya kampuni
- **Learning Experience**: Mbinu iliyopangwa na malengo na matokeo wazi kwa kila somo
- **Content Organization**: Mtiririko bora wa mantiki na uhusiano kati ya mada zinazohusiana

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Imeongezwa
- **Core Documentation Structure**
  - Mfululizo kamili wa mwongozo wa kuanza
  - Nyaraka kamili za utekelezaji na upatikanaji
  - Vyanzo vya utatuzi wa matatizo na miongozo ya uharibifu
  - Vifaa vya uchunguzi kabla ya utekelezaji na taratibu

- **Getting Started Module**
  - AZD Basics: Dhana za msingi na istilahi
  - Installation Guide: Maelekezo ya usanidi kwa majukwaa mbalimbali
  - Configuration Guide: Usanidi wa mazingira na uthibitisho
  - First Project Tutorial: Mafunzo ya hatua kwa hatua kwa vitendo

- **Deployment and Provisioning Module**
  - Deployment Guide: Nyaraka kamili za mtiririko wa kazi
  - Provisioning Guide: Miundombinu kama Msimbo kwa Bicep
  - Mazoezi bora kwa utekelezaji wa uzalishaji
  - Mifumo ya usanifu wa huduma nyingi

- **Pre-deployment Validation Module**
  - Capacity Planning: Uthibitisho wa upatikanaji wa rasilimali za Azure
  - SKU Selection: Mwongozo kamili wa ngazi za huduma
  - Pre-flight Checks: Skripti za uthibitisho wa moja kwa moja (PowerShell na Bash)
  - Makadirio ya gharama na zana za upangaji bajeti

- **Troubleshooting Module**
  - Common Issues: Matatizo yanayotokea mara kwa mara na suluhisho
  - Debugging Guide: Mbinu za kimfumo za utatuzi wa matatizo
  - Mbinu za uchunguzi wa hali ya juu na zana
  - Ufuatiliaji wa utendakazi na uboreshaji

- **Resources and References**
  - Command Cheat Sheet: Marejeo ya haraka kwa amri muhimu
  - Glossary: Kamusi kamili ya istilahi na vifupi vya maneno
  - FAQ: Majibu ya kina kwa maswali ya kawaida
  - Viungo vya rasilimali za nje na uunganisho wa jamii

- **Examples and Templates**
  - Mfano wa Programu Rahisi ya Wavuti
  - Kiolezo cha utekelezaji wa Tovuti Isiyobadilika
  - Uundaji wa Programu ya Kontena
  - Mifumo ya kuunganishwa kwa Hifadhidata
  - Mifano ya usanifu wa microservices
  - Utekelezaji wa kazi zisizo na seva

#### Features
- **Multi-Platform Support**: Maelekezo ya usakinishaji na usanidi kwa Windows, macOS, na Linux
- **Multiple Skill Levels**: Yaliyomo yameundwa kwa wanafunzi hadi waendelezaji wa ngazi ya kitaalamu
- **Practical Focus**: Mifano ya vitendo na matukio ya maisha halisi
- **Comprehensive Coverage**: Kutoka dhana za msingi hadi mifumo ya juu ya biashara
- **Security-First Approach**: Mazoezi bora ya usalama yamejumuishwa kote
- **Cost Optimization**: Mwongozo wa utekelezaji wa gharama nafuu na usimamizi wa rasilimali

#### Documentation Quality
- **Detailed Code Examples**: Sampuli za msimbo za vitendo, zilizothibitishwa
- **Step-by-Step Instructions**: Mwongozo wazi, unaoweza kutekelezwa
- **Comprehensive Error Handling**: Utatuzi wa matatizo kwa masuala ya kawaida
- **Best Practices Integration**: Viwango vya tasnia na mapendekezo
- **Version Compatibility**: Imeboreshwa kulingana na huduma za hivi karibuni za Azure na sifa za azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
- **Multi-Model Support**: Miundo ya muunganisho kwa Hugging Face, Azure Machine Learning, na modeli maalum
- **AI Agent Frameworks**: Violezo vya uanzishaji kwa LangChain, Semantic Kernel, na AutoGen
- **Advanced RAG Patterns**: Chaguo za hifadhidata za vekta zaidi ya Azure AI Search (Pinecone, Weaviate, n.k.)
- **AI Observability**: Ufuatiliaji ulioboreshwa wa utendaji wa modeli, matumizi ya tokeni, na ubora wa majibu

#### Developer Experience
- **VS Code Extension**: Uzoefu uliounganishwa wa maendeleo wa AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Uundaji wa violezo vya AZD ulioongozwa na AI
- **Interactive Tutorials**: Mazoezi ya kuandika msimbo kwa vitendo yenye uhakikisho wa kiotomatiki kwa matukio ya AI
- **Video Content**: Yaliyomo ya video ya ziada kwa wanaojifunza kwa kuona, yakilenga uanzishaji wa AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Utawala wa modeli za AI, uzingatiaji wa sheria, na rekodi za ukaguzi
- **Multi-Tenant AI**: Miundo ya kuhudumia wateja wengi kwa huduma za AI zilizo hifadhiwa kwa kujitegemea
- **Edge AI Deployment**: Muunganisho na Azure IoT Edge na instansi za kontena
- **Hybrid Cloud AI**: Miundo ya uanzishaji kwenye wingu nyingi na mseto kwa mzigo wa kazi wa AI

#### Advanced Features
- **AI Pipeline Automation**: Muunganisho wa MLOps na pipelines za Azure Machine Learning
- **Advanced Security**: Mifumo ya zero-trust, private endpoints, na ulinzi wa tishio wa hali ya juu
- **Performance Optimization**: Mbinu za juu za kurekebisha na kupanua kwa programu za AI zenye mtiririko wa juu
- **Global Distribution**: Miundo ya utoaji wa maudhui na caching ya edge kwa programu za AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Muunganisho kamili wa Microsoft Foundry (Imekamilishwa)
- ✅ **Interactive Tutorials**: Maabara ya warsha ya AI kwa vitendo (Imekamilishwa)
- ✅ **Advanced Security Module**: Mifumo ya usalama maalum kwa AI (Imekamilishwa)
- ✅ **Performance Optimization**: Mbinu za kurekebisha mzigo wa kazi wa AI (Imekamilishwa)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Matukio ya uanzishaji yanayolenga AI (Imekamilishwa)
- ✅ **Extended FAQ**: Maswali maalum ya AI na utatuzi wa matatizo (Imekamilishwa)
- **Tool Integration**: Mwongozo ulioboreshwa wa muunganisho wa IDE na mhariri
- ✅ **Monitoring Expansion**: Mifumo ya ufuatiliaji na tahadhari maalum kwa AI (Imekamilishwa)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Ubunifu unayojibadilisha kwa kujifunza kwa simu
- **Offline Access**: Vifurushi vya nyaraka vinavyoweza kupakuliwa
- **Enhanced IDE Integration**: VS Code extension kwa mtiririko wa kazi wa AZD + AI
- **Community Dashboard**: Vipimo vya jamii kwa wakati halisi na ufuatiliaji wa michango

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- Vipengele vipya, sehemu za nyaraka, au uwezo mpya
- Mifano mipya, violezo, au rasilimali za kujifunza
- Zana za ziada, skiripti, au matumizi

#### Changed
- Marekebisho ya utendaji uliopo au nyaraka
- Sasisho za kuboresha uwazi au usahihi
- Upangaji upya wa yaliyomo au muundo

#### Deprecated
- Vipengele au mbinu zinazohamiawa kutoka huduma
- Sehemu za nyaraka zilizopangwa kuondolewa
- Njia ambazo zina mbadala bora zaidi

#### Removed
- Vipengele, nyaraka, au mifano ambayo hayana umuhimu tena
- Taarifa zilizozeeka au mbinu zilizopitwa na wakati
- Yaliyojirudia au yaliyokunjwa

#### Fixed
- Marekebisho ya makosa katika nyaraka au msimbo
- Utatuzi wa masuala yaliyoripotiwa
- Maboresho ya usahihi au utendaji

#### Security
- Maboresho au marekebisho yanayohusiana na usalama
- Sasisho za mbinu bora za usalama
- Utatuzi wa udhaifu wa usalama

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Mabadiliko ya kuvunja yanayohitaji hatua kutoka kwa mtumiaji
- Upangaji mkubwa wa muundo wa yaliyomo au shirika
- Mabadiliko yanayoathiri mbinu msingi au metodolojia

#### Minor Version (X.Y.0)
- Vipengele vipya au nyongeza za yaliyomo
- Maboresho yanayohifadhi ulinganifu wa nyuma
- Mifano, zana, au rasilimali za ziada

#### Patch Version (X.Y.Z)
- Marekebisho ya hitilafu na marekebisho
- Maboresho madogo kwa yaliyopo
- Ufafanuzi na maboresho madogo

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Ripoti matatizo au pendekeza maboresho (masuala maalum ya AI yanakaribishwa)
- **Discord Discussions**: Shiriki mawazo na jihusishe na jamii ya Microsoft Foundry
- **Pull Requests**: Changia maboresho moja kwa moja kwenye yaliyomo, hasa violezo na mwongozo za AI
- **Microsoft Foundry Discord**: Shiriki katika chaneli ya #Azure kwa mijadala ya AZD + AI
- **Community Forums**: Shiriki katika mijadala pana ya waendelezaji wa Azure

### Feedback Categories
- **AI Content Accuracy**: Marekebisho ya taarifa za muunganisho na uanzishaji wa huduma za AI
- **Learning Experience**: Mapendekezo ya kuboresha mtiririko wa kujifunza kwa waendelezaji wa AI
- **Missing AI Content**: Maombi ya violezo, mifumo, au mifano ya ziada ya AI
- **Accessibility**: Maboresho kwa mahitaji tofauti ya kujifunza
- **AI Tool Integration**: Mapendekezo ya kuunganisha vizuri mtiririko wa kazi wa maendeleo ya AI
- **Production AI Patterns**: Maombi ya mifumo ya uanzishaji wa AI ya kampuni

### Response Commitment
- **Issue Response**: Ndani ya saa 48 kwa matatizo yaliyoripotiwa
- **Feature Requests**: Tathmini ndani ya wiki moja
- **Community Contributions**: Mapitio ndani ya wiki moja
- **Security Issues**: Kipaumbele cha mara moja na jibu la haraka

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Mapitio ya kila mwezi ya usahihi wa yaliyomo na uhalali wa viungo
- **Quarterly Updates**: Maboresho makubwa na nyongeza kila robo
- **Semi-Annual Reviews**: Upangaji upya wa kina na maboresho kila nusu mwaka
- **Annual Releases**: Matoleo makubwa ya kila mwaka yenye maboresho muhimu

### Monitoring and Quality Assurance
- **Automated Testing**: Uthibitisho wa mara kwa mara wa mifano ya msimbo na viungo
- **Community Feedback Integration**: Ushirikishwaji wa mapendekezo ya watumiaji mara kwa mara
- **Technology Updates**: Ulinganifu na huduma za hivi karibuni za Azure na matoleo ya azd
- **Accessibility Audits**: Mapitio ya mara kwa mara kwa kanuni za muundo wa ujumuishaji

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Msaada kamili pamoja na maboresho ya mara kwa mara
- **Previous Major Version**: Sasisho za usalama na marekebisho muhimu kwa miezi 12
- **Legacy Versions**: Msaada wa jamii tu, hakuna masasisho rasmi

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Maelekezo ya hatua kwa hatua ya mabadiliko
- **Compatibility Notes**: Maelezo kuhusu mabadiliko yanayovunja ulinganifu
- **Tool Support**: Skiripti au zana kusaidia mchakato wa uhamisho
- **Community Support**: Mijadala maalum kwa maswali ya uhamisho

---

**Navigation**
- **Previous Lesson**: [Mwongozo wa Masomo](resources/study-guide.md)
- **Next Lesson**: Rudi kwa [README Kuu](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kimashine zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatuwajibiki kwa kutoelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->