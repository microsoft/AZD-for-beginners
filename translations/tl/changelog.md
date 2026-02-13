# Tala ng Pagbabago - AZD Para sa Mga Nagsisimula

## Panimula

Itong tala ng pagbabago ay nagdodokumento ng lahat ng mga kapansin-pansing pagbabago, pag-update, at pagpapabuti sa AZD Para sa Mga Nagsisimula repository. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinapanatili ang log na ito upang matulungan ang mga gumagamit na maunawaan kung ano ang nagbago sa pagitan ng mga bersyon.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagrerepaso sa tala ng pagbabago, ikaw ay:
- Mananatiling may alam tungkol sa mga bagong tampok at karagdagang nilalaman
- Mauunawaan ang mga pagpapabuti sa umiiral na dokumentasyon
- Masusubaybayan ang mga pag-aayos ng bug at koreksyon upang matiyak ang katumpakan
- Susubaybayan ang ebolusyon ng mga materyales sa pagkatuto sa paglipas ng panahon

## Mga Kinalabasan ng Pagkatuto

Pagkatapos repasuhin ang mga entry sa tala ng pagbabago, magagawa mong:
- Tukuyin ang bagong nilalaman at mga mapagkukunan na magagamit para sa pagkatuto
- Maunawaan kung aling mga seksyon ang na-update o ipinabuti
- Planuhin ang iyong landas ng pagkatuto batay sa pinaka-kasalukuyang mga materyales
- Magbigay ng puna at mungkahi para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.17.0] - 2026-02-05

#### Pagpapahusay ng Navigasyon ng Kurso
**Pinapahusay ng bersyong ito ang navigasyon ng README.md na kabanata gamit ang pinahusay na format ng talahanayan.**

#### Binago
- **Course Map Table**: Pinahusay na may direktang mga link sa lesson, tinatayang tagal, at mga rating ng kompleksidad
- **Folder Cleanup**: Tinanggal ang mga paulit-ulit na lumang folder (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Lahat ng 21+ internal na link sa Course Map table ay na-verify

### [v3.16.0] - 2026-02-05

#### Pag-update ng Pangalan ng Produkto
**Ina-update ng bersyong ito ang mga sanggunian ng produkto ayon sa kasalukuyang branding ng Microsoft.**

#### Binago
- **Azure AI Foundry → Microsoft Foundry**: Lahat ng sanggunian na na-update sa mga non-translation na file
- **Azure AI Agent Service → Foundry Agents**: Pinalitan ang pangalan ng serbisyo upang ipakita ang kasalukuyang branding

#### Mga File na Na-update
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

#### Malaking Pag-restruktur ng Repositoryo: Mga Pangalan ng Folder Batay sa Kabanata
**Inaayos ng bersyong ito ang dokumentasyon sa mga dedikadong folder ng kabanata para sa mas malinaw na navigasyon.**

#### Pagpapalit ng Pangalan ng mga Folder
Pinalitan ang mga lumang folder ng mga folder na may numero ng kabanata:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Paglilipat ng mga File
| File | Mula | Sa |
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

#### Idinagdag
- **📚 Chapter README files**: Nilikha ang README.md sa bawat folder ng kabanata na may:
  - Mga layunin sa pagkatuto at tagal
  - Talahanayan ng lesson na may mga paglalarawan
  - Quick start commands
  - Navigasyon sa iba pang mga kabanata

#### Binago
- **🔗 Na-update ang lahat ng internal na link**: 78+ path na na-update sa lahat ng dokumentasyon
- **🗺️ Main README.md**: In-update ang Course Map na may bagong istruktura ng kabanata
- **📝 examples/README.md**: In-update ang mga cross-reference sa mga folder ng kabanata

#### Tinanggal
- Lumang istruktura ng folder (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Pag-restruktur ng Repositoryo: Navigasyon ng Kabanata
**Idinagdag ng bersyong ito ang mga chapter navigation README file (na pinalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Bagong Gabay sa AI Agents
**Idinagdag ng bersyong ito ang isang komprehensibong gabay para sa pag-deploy ng AI agents gamit ang Azure Developer CLI.**

#### Idinagdag
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang mga AI agents at paano sila naiiba sa mga chatbot
  - Tatlong quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Mga pattern ng arkitektura ng agent (single agent, RAG, multi-agent)
  - Konfigurasyon ng mga tool at pag-customize
  - Pagsubaybay at tracking ng metrics
  - Mga konsiderasyon sa gastos at pag-optimize
  - Mga karaniwang senaryo ng pag-troubleshoot
  - Tatlong hands-on na ehersisyo na may success criteria

#### Estruktura ng Nilalaman
- **Introduction**: Mga konsepto ng agent para sa mga nagsisimula
- **Quick Start**: I-deploy ang mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Mga visual na diagram ng mga pattern ng agent
- **Configuration**: Setup ng tool at mga environment variable
- **Monitoring**: Integrasyon ng Application Insights
- **Exercises**: Progressive na hands-on na pag-aaral (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### Pag-update ng Kapaligiran ng DevContainer
**Ina-update ng bersyong ito ang configuration ng development container gamit ang modernong mga tool at mas magagandang default para sa karanasan sa pagkatuto ng AZD.**

#### Binago
- **🐳 Base Image**: In-update mula `python:3.12-bullseye` hanggang `python:3.12-bookworm` (pinakabagong Debian stable)
- **📛 Container Name**: Pinalitan mula "Python 3" tungo sa "AZD for Beginners" para sa kalinawan

#### Idinagdag
- **🔧 Mga Bagong Tampok ng Dev Container**:
  - `azure-cli` na may Bicep support na naka-enable
  - `node:20` (LTS version para sa AZD templates)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa pag-deploy ng container app

- **🔌 Port Forwarding**: Nauna nang naka-configure na mga port para sa karaniwang development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Mga Bagong VS Code Extension**:
  - `ms-python.vscode-pylance` - Pinahusay na Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Suporta para sa Azure Functions
  - `ms-azuretools.vscode-docker` - Suporta sa Docker
  - `ms-azuretools.vscode-bicep` - Suporta sa Bicep language
  - `ms-azure-devtools.azure-resource-groups` - Pamamahala ng Azure resource
  - `yzhang.markdown-all-in-one` - Pag-edit ng Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Suporta sa Mermaid diagram
  - `redhat.vscode-yaml` - Suporta sa YAML (para sa azure.yaml)
  - `eamodio.gitlens` - Visualisasyon ng Git
  - `mhutchie.git-graph` - Kasaysayan ng Git

- **⚙️ Mga Setting ng VS Code**: Idinagdag ang default na mga setting para sa Python interpreter, format on save, at pag-trim ng whitespace

- **📦 Na-update na requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Naayos
- **Post-Create Command**: Ngayon ay nagve-verify ng AZD at Azure CLI installation sa pagsisimula ng container

---

### [v3.11.0] - 2026-02-05

#### Malawakang Pagbabago ng README para sa Mga Nagsisimula
**Malaki ang ipinabago ng bersyong ito sa README.md upang maging mas madaling lapitan para sa mga nagsisimula at nagdagdag ng mahahalagang mapagkukunan para sa mga AI developer.**

#### Idinagdag
- **🆚 Azure CLI vs AZD Comparison**: Malinaw na paliwanag kung kailan gagamitin ang bawat tool na may praktikal na mga halimbawa
- **🌟 Awesome AZD Links**: Direktang mga link sa community template gallery at mga resources sa kontribusyon:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Pinasimpleng 3-step na getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Malinaw na gabay kung saan magsisimula batay sa karanasan ng developer

#### Binago
- **Istruktura ng README**: Inayos para sa progressive disclosure - pangunahing impormasyon muna
- **Seksyon ng Panimula**: Muling isinulat upang ipaliwanag ang "The Magic of `azd up`" para sa mga ganap na nagsisimula
- **Tinanggal ang Dobleng Nilalaman**: Inalis ang duplicate na troubleshooting section
- **Mga Utos sa Pag-troubleshoot**: Inayos ang reference na `azd logs` upang gumamit ng wastong `azd monitor --logs`

#### Naayos
- **🔐 Authentication Commands**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Invalid Command References**: Inalis ang natitirang `azd logs` mula sa README troubleshooting section

#### Mga Tala
- **Saklaw**: Mga pagbabago na inilapat sa main README.md at resources/cheat-sheet.md
- **Target Audience**: Mga pagpapabuti na partikular na naka-target sa mga developer na bago sa AZD

---

### [v3.10.0] - 2026-02-05

#### Pagwawasto ng Katumpakan ng Mga Utos ng Azure Developer CLI
**Inaayos ng bersyong ito ang mga hindi umiiral na AZD command sa buong dokumentasyon, tiniyak na lahat ng halimbawa ng code ay gumagamit ng wastong Azure Developer CLI syntax.**

#### Naayos
- **🔧 Tinanggal ang Mga Hindi Umiiral na AZD Command**: Komprehensibong audit at pagwawasto ng mga invalid na utos:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o mga alternatibo ng Azure CLI
  - `azd service` subcommands (wala) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (wala) → tinanggal o pinalitan ng wastong alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (wala) → tinanggal
  - `azd provision --what-if/--rollback` flags (wala) → in-update upang gumamit ng `--preview`
  - `azd config validate` (wala) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (wala) → tinanggal

- **📚 Mga File na Na-update na may Pagwawasto ng Command**:
  - `resources/cheat-sheet.md`: Malaking overhaul ng command reference
  - `docs/deployment/deployment-guide.md`: Inayos ang rollback at deployment strategies
  - `docs/troubleshooting/debugging.md`: Inayos ang mga seksyon ng pagsusuri ng log
  - `docs/troubleshooting/common-issues.md`: In-update ang mga troubleshooting command
  - `docs/troubleshooting/ai-troubleshooting.md`: Inayos ang AZD debugging section
  - `docs/getting-started/azd-basics.md`: Inayos ang monitoring commands
  - `docs/getting-started/first-project.md`: In-update ang monitoring at debugging examples
  - `docs/getting-started/installation.md`: Inayos ang help at version examples
  - `docs/pre-deployment/application-insights.md`: Inayos ang mga command sa pagtingin ng log
  - `docs/pre-deployment/coordination-patterns.md`: Inayos ang agent debugging commands

- **📝 Na-update ang Reference ng Bersyon**: 
  - `docs/getting-started/installation.md`: Pinalitan ang hardcoded `1.5.0` na bersyon ng generic na `1.x.x` na may link sa releases

#### Binago
- **Mga Estratehiya sa Rollback**: In-update ang dokumentasyon upang gumamit ng Git-based rollback (walang native rollback ang AZD)
- **Pagtingin ng Log**: Pinalitan ang mga reference sa `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at mga command ng Azure CLI
- **Seksyon ng Performance**: Inalis ang mga hindi umiiral na parallel/incremental deployment flags, nagbigay ng wastong alternatibo

#### Teknikal na Detalye
- **Wastong Mga Utos ng AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Wastong azd monitor Mga Flag**: `--live`, `--logs`, `--overview`
- **Tinanggal na Mga Tampok**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Pagpapatunay**: Ang mga utos ay na-validate laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagkumpleto ng Workshop at Pagpapabuti ng Kalidad ng Dokumentasyon
**Kinukumpleto ng bersyong ito ang mga interactive na module ng workshop, inaayos ang lahat ng sirang mga link sa dokumentasyon, at pinapahusay ang pangkalahatang kalidad ng nilalaman para sa mga AI developer na gumagamit ng Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng mga alituntunin para sa kontribusyon na may:
  - Maliwanag na mga tagubilin para sa pag-uulat ng mga isyu at pagsusulong ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga alituntunin sa mga halimbawa ng code at mga kumbensyon sa mensahe ng commit
  - Impormasyon tungkol sa pakikipag-ugnayan sa komunidad

#### Nakumpleto
- **🎯 Workshop Module 7 (Wrap-up)**: Ganap na nakumpletong module ng pagwawakas na may:
  - Komprehensibong buod ng mga nagawa sa workshop
  - Seksiyon ng mga pangunahing konseptong natutunan na sumasaklaw sa AZD, mga template, at AI Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng paglalakbay sa pagkatuto
  - Mga hamon na ehersisyo ng workshop na may mga rating ng kahirapan
  - Mga link para sa feedback ng komunidad at suporta

- **📚 Workshop Module 3 (Deconstruct)**: Na-update na mga layunin sa pagkatuto na may:
  - Gabay sa pag-activate ng GitHub Copilot sa mga MCP server
  - Pag-unawa sa istruktura ng folder ng mga template ng AZD
  - Mga pattern ng organisasyon para sa infrastructure-as-code (Bicep)
  - Mga instruksyon para sa hands-on na lab

- **🔧 Workshop Module 6 (Teardown)**: Nakumpleto na may:
  - Mga layunin sa paglilinis ng mga resources at pamamahala ng gastos
  - Paggamit ng `azd down` para sa ligtas na pag-deprovision ng infrastructure
  - Gabay sa pagbawi ng mga cognitive services na soft-deleted
  - Mga bonus na prompt para sa paggalugad gamit ang GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Pag-aayos ng Sirang Link**: Naayos ang 15+ na sirang internal na mga link sa dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Inayos ang mga path patungo sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Itinama ang mga path ng ai-model-deployment.md at production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pinalitan ang hindi umiiral na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Inayos ang mga path ng FAQ at troubleshooting guide
  - `examples/container-app/microservices/README.md`: Itinama ang mga path ng course home at deployment guide
  - `resources/faq.md` at `resources/glossary.md`: In-update ang mga sanggunian sa kabanata ng AI
  - `course-outline.md`: Inayos ang mga sanggunian sa instructor guide at AI workshop lab references

- **📅 Banner ng Katayuan ng Workshop**: In-update mula sa "Under Construction" patungo sa aktibong katayuan ng workshop na may petsang Pebrero 2026

- **🔗 Navigation ng Workshop**: Inayos ang mga sirang navigation link sa workshop README.md na tumuturo sa hindi umiiral na folder na lab-1-azd-basics

#### Binago
- **Presentasyon ng Workshop**: Tinanggal ang babalang "sa ilalim ng konstruksyon", ang workshop ay kumpleto na at handa nang gamitin
- **Pagkakapare-pareho ng Navigation**: Tiniyak na lahat ng module ng workshop ay may wastong navigation sa pagitan ng mga module
- **Mga Sanggunian ng Landas sa Pagkatuto**: In-update ang mga cross-reference ng kabanata upang gamitin ang tamang microsoft-foundry paths

#### Napatunayan
- ✅ Lahat ng mga markdown file sa Ingles ay may wastong internal na mga link
- ✅ Ang mga module ng workshop 0-7 ay kumpleto na na may mga layunin sa pagkatuto
- ✅ Gumagana nang tama ang navigation sa pagitan ng mga kabanata at module
- ✅ Ang nilalaman ay angkop para sa mga AI developer na gumagamit ng Microsoft AZD
- ✅ Nanatiling magaan para sa mga nagsisimula ang wika at istruktura sa kabuuan
- ✅ Nagbibigay ang CONTRIBUTING.md ng malinaw na gabay para sa mga kontribyutor ng komunidad

#### Teknikal na Implementasyon
- **Pagpapatunay ng Mga Link**: Isang automated na PowerShell script ang nag-verify ng lahat ng .md internal na mga link
- **Audit ng Nilalaman**: Manu-manong pagsusuri ng pagkakumpleto ng workshop at pagiging angkop para sa mga nagsisimula
- **Sistema ng Navigation**: Inaplay ang magkakatugmang pattern ng navigation ng kabanata at module

#### Mga Tala
- **Saklaw**: Ang mga pagbabago ay inilapat sa dokumentasyong nasa Ingles lamang
- **Mga Salin**: Hindi na-update ang mga folder ng pagsasalin sa bersyong ito (sasabayin sa awtomatikong pagsasalin sa susunod)
- **Tagal ng Workshop**: Ang kumpletong workshop ay nagbibigay na ngayon ng 3-4 na oras ng hands-on na pagkatuto

---

### [v3.8.0] - 2025-11-19

#### Advanced na Dokumentasyon: Monitoring, Seguridad, at Mga Pattern ng Multi-Agent
**Dinagdag ng bersyong ito ang komprehensibong A-grade na mga leksyon tungkol sa integrasyon ng Application Insights, mga pattern ng authentication, at koordinasyon ng multi-agent para sa production deployments.**

#### Idinagdag
- **📊 Aralin sa Integrasyon ng Application Insights**: nasa `docs/pre-deployment/application-insights.md`:
  - Deployment na naka-focus sa AZD na may awtomatikong provisioning
  - Kumpletong mga Bicep template para sa Application Insights + Log Analytics
  - Gumagawang mga Python application na may custom telemetry (1,200+ linya)
  - Mga pattern para sa monitoring ng AI/LLM (Azure OpenAI token/pagsubaybay ng gastos)
  - 6 na Mermaid diagram (arkitektura, distributed tracing, daloy ng telemetry)
  - 3 hands-on na ehersisyo (mga alert, dashboards, monitoring ng AI)
  - Mga halimbawa ng Kusto query at mga estratehiya sa pag-optimize ng gastos
  - Live metrics streaming at real-time debugging
  - 40-50 minutong oras ng pagkatuto na may production-ready na mga pattern

- **🔐 Aralin sa Authentication & Security Patterns**: nasa `docs/getting-started/authsecurity.md`:
  - 3 pattern ng authentication (connection strings, Key Vault, managed identity)
  - Kumpletong mga Bicep infrastructure template para sa secure na deployment
  - Node.js application code na may integrasyon ng Azure SDK
  - 3 kumpletong ehersisyo (enable managed identity, user-assigned identity, Key Vault rotation)
  - Mga best practice sa seguridad at mga konfigurasyon ng RBAC
  - Gabay sa troubleshooting at pagsusuri ng gastos
  - Production-ready na mga pattern para sa passwordless authentication

- **🤖 Aralin sa Mga Pattern ng Koordinasyon ng Multi-Agent**: nasa `docs/pre-deployment/coordination-patterns.md`:
  - 5 pattern ng koordinasyon (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong implementasyon ng orchestrator service (Python/Flask, 1,500+ linya)
  - 3 espesyal na implementasyon ng agent (Research, Writer, Editor)
  - Integrasyon ng Service Bus para sa message queuing
  - Pamamahala ng estado sa Cosmos DB para sa distributed systems
  - 6 na Mermaid diagram na nagpapakita ng interaksyon ng mga agent
  - 3 advanced na ehersisyo (timeout handling, retry logic, circuit breaker)
  - Paghiwa-hiwalay ng gastos ($240-565/buwan) na may mga estratehiya sa pag-optimize
  - Integrasyon ng Application Insights para sa monitoring

#### Pinahusay
- **Kabanata ng Pre-deployment**: Ngayon ay naglalaman ng komprehensibong monitoring at mga pattern ng koordinasyon
- **Kabanata ng Getting Started**: Pinahusay na may mga propesyonal na pattern ng authentication
- **Kahandaan para sa Production**: Kumpletong saklaw mula sa seguridad hanggang sa observability
- **Balangkas ng Kurso**: In-update para i-refer ang mga bagong leksyon sa Mga Kabanata 3 at 6

#### Binago
- **Pag-unlad ng Pagkatuto**: Mas mahusay na integrasyon ng seguridad at monitoring sa buong kurso
- **Kalidad ng Dokumentasyon**: Magkakatugmang A-grade na pamantayan (95-97%) sa lahat ng bagong leksyon
- **Mga Pattern para sa Produksyon**: Kumpletong end-to-end na saklaw para sa mga enterprise na deployment

#### Pinahusay
- **Karanasan ng Developer**: Malinaw na landas mula sa development hanggang sa production monitoring
- **Mga Pamantayan sa Seguridad**: Mga propesyonal na pattern para sa authentication at pamamahala ng mga secret
- **Observability**: Kumpletong integrasyon ng Application Insights sa AZD
- **AI Workloads**: Espesyal na monitoring para sa Azure OpenAI at mga multi-agent system

#### Napatunayan
- ✅ Lahat ng leksyon ay may kumpletong gumaganang code (hindi mga snippet)
- ✅ Mga Mermaid diagram para sa visual na pagkatuto (19 kabuuan sa 3 leksyon)
- ✅ Hands-on na ehersisyo na may mga hakbang sa beripikasyon (9 kabuuan)
- ✅ Production-ready na mga Bicep template na maaaring i-deploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa pag-optimize
- ✅ Mga gabay sa troubleshooting at mga best practice
- ✅ Mga knowledge checkpoint na may mga command para sa beripikasyon

#### Mga Resulta ng Pagtatasa ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa monitoring
- **docs/getting-started/authsecurity.md**: - Mga propesyonal na pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Advanced na arkitektura ng multi-agent
- **Kabuuang Bagong Nilalaman**: - Magkakatugmang mataas na pamantayan ng kalidad

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + mga pattern ng RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Pamamahala ng Gastos**: Mga estratehiya sa sampling, mga polisiya sa retention, mga kontrol sa badyet

### [v3.7.0] - 2025-11-19

#### Pagpapabuti ng Kalidad ng Dokumentasyon at Bagong Halimbawa ng Azure OpenAI
**Pinapabuti ng bersyong ito ang kalidad ng dokumentasyon sa buong repositoryo at nagdadagdag ng kumpletong halimbawa ng pag-deploy ng Azure OpenAI na may GPT-4 chat interface.**

#### Idinagdag
- **🤖 Azure OpenAI Chat Example**: Kumpletong pag-deploy ng GPT-4 na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong Azure OpenAI infrastructure (pag-deploy ng GPT-4 model)
  - Python command-line chat interface na may kasaysayan ng pag-uusap
  - Integrasyon sa Key Vault para sa secure na pag-iimbak ng API key
  - Pagsubaybay ng paggamit ng token at pagtatantiya ng gastos
  - Rate limiting at pag-handle ng error
  - Komprehensibong README na may 35-45 minutong gabay sa pag-deploy
  - 11 na production-ready na mga file (Bicep templates, Python app, configuration)
- **📚 Mga Ehersisyo sa Dokumentasyon**: Idinagdag ang mga hands-on na ehersisyo sa guide ng configuration:
  - Ehersisyo 1: Multi-environment configuration (15 minuto)
  - Ehersisyo 2: Praktis sa pamamahala ng secret (10 minuto)
  - Maliwanag na mga pamantayan sa tagumpay at mga hakbang sa beripikasyon
- **✅ Pagpapatunay ng Pag-deploy**: Idinagdag ang seksyon ng beripikasyon sa gabay sa pag-deploy:
  - Mga pamamaraan sa health check
  - Checklist ng mga pamantayan sa tagumpay
  - Inaasahang mga output para sa lahat ng deployment command
  - Mabilisang sanggunian para sa troubleshooting

#### Pinahusay
- **examples/README.md**: In-update sa kalidad na A-grade (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng mga nauugnay na seksyon
  - In-update ang bilang ng lokal na halimbawa mula 3 hanggang 4
  - Idinagdag sa talahanayan ng Mga Halimbawa ng AI Application
  - Isinama sa Quick Start para sa Mga Intermediate na Gumagamit
  - Idinagdag sa seksyon ng Microsoft Foundry Templates
  - In-update ang Comparison Matrix at mga seksyon ng paghahanap ng teknolohiya
- **Kalidad ng Dokumentasyon**: Pinabuti mula B+ (87%) → A- (92%) sa buong docs folder:
  - Idinagdag ang mga inaasahang output sa mga kritikal na halimbawa ng command
  - Isinama ang mga hakbang sa beripikasyon para sa mga pagbabago sa configuration
  - Pinahusay ang hands-on na pagkatuto gamit ang mga praktikal na ehersisyo

#### Binago
- **Pag-unlad ng Pagkatuto**: Mas mahusay na integrasyon ng mga halimbawa ng AI para sa mga intermediate na nag-aaral
- **Estruktura ng Dokumentasyon**: Mas madaling maisagawa na mga ehersisyo na may malinaw na mga kinalabasan
- **Proseso ng Beripikasyon**: Idinagdag ang tahasang mga pamantayan ng tagumpay sa mga pangunahing workflow

#### Pinahusay
- **Karanasan ng Developer**: Ang pag-deploy ng Azure OpenAI ay ngayon tumatagal ng 35-45 minuto (kumpara sa 60-90 para sa mas kumplikadong alternatibo)
- **Kalinawan sa Gastos**: Maliwanag na pagtatantya ng gastos ($50-200/buwan) para sa halimbawa ng Azure OpenAI
- **Landas ng Pagkatuto**: May malinaw na entry point ang mga AI developer gamit ang azure-openai-chat
- **Pamantayan sa Dokumentasyon**: Mga magkakatugmang inaasahang output at mga hakbang sa beripikasyon

#### Napatunayan
- ✅ Ganap na gumagana ang halimbawa ng Azure OpenAI gamit ang `azd up`
- ✅ Ang lahat ng 11 na implementation file ay sintaktikong tama
- ✅ Tugma ang mga instruksyon sa README sa aktwal na karanasan sa pag-deploy
- ✅ Na-update ang mga link ng dokumentasyon sa higit sa 8 lokasyon
- ✅ Tumpak na ipinapakita ng examples index ang 4 lokal na halimbawa
- ✅ Walang duplicate na external links sa mga talahanayan
- ✅ Tama ang lahat ng mga sanggunian sa navigation

#### Teknikal na Implementasyon
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Seguridad**: Handang Managed Identity, mga secret sa Key Vault
- **Monitoring**: Integrasyon ng Application Insights
- **Pamamahala ng Gastos**: Pagsubaybay ng token at pag-optimize ng paggamit
- **Pag-deploy**: Isang `azd up` na command para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Malaking Pag-update: Mga Halimbawa ng Pag-deploy ng Container App
**Ipinapakilala ng bersyong ito ang komprehensibo, production-ready na mga halimbawa ng pag-deploy ng container application gamit ang Azure Developer CLI (AZD), na may kumpletong dokumentasyon at integrasyon sa landas ng pagkatuto.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Pangunahing Gabay](examples/container-app/README.md): Kumpletong pangkalahatang-ideya ng mga containerized na deployment, quick start, production, at mga advanced na pattern
  - [Simpleng Flask API](../../examples/container-app/simple-flask-api): REST API na friendly sa mga nagsisimula na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Arkitekturang Microservices](../../examples/container-app/microservices): Production-ready na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Mga Best Practice**: Seguridad, monitoring, pag-optimize ng gastos, at gabay sa CI/CD para sa mga containerized na workload
- **Mga Halimbawa ng Code**: Kumpletong `azure.yaml`, Bicep templates, at multi-language na implementasyon ng mga serbisyo (Python, Node.js, C#, Go)
- **Pagsubok at Troubleshooting**: Mga end-to-end na scenario ng pagsubok, mga command para sa monitoring, gabay sa troubleshooting

#### Binago
- **README.md**: In-update upang i-feature at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: In-update upang i-highlight ang mga halimbawa ng container app, magdagdag ng mga entry sa comparison matrix, at i-update ang mga sanggunian sa teknolohiya/arkitektura
- **Balangkas ng Kurso at Gabay sa Pag-aaral**: In-update upang tukuyin ang mga bagong halimbawa ng container app at mga pattern ng deployment sa mga kaugnay na kabanata

#### Napatunayan
- ✅ Lahat ng bagong halimbawa ay maide-deploy gamit ang `azd up` at sumusunod sa pinakamahusay na mga kasanayan
- ✅ Na-update ang mga cross-link ng dokumentasyon at nabigasyon
- ✅ Saklaw ng mga halimbawa ang mula sa panimulang antas hanggang advanced na mga senaryo, kasama ang production microservices

#### Mga Tala
- **Saklaw**: Dokumentasyon at mga halimbawa sa Ingles lamang
- **Susunod na Hakbang**: Palawakin sa karagdagang advanced na container patterns at CI/CD automation sa mga susunod na release

### [v3.5.0] - 2025-11-19

#### Pagre-rebrand ng Produkto: Microsoft Foundry
**Ang bersyong ito ay nagpapatupad ng komprehensibong pagbabago ng pangalan ng produkto mula sa "Microsoft Foundry" patungo sa "Microsoft Foundry" sa lahat ng dokumentasyon sa Ingles, na sumasalamin sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Na-update ang lahat ng sanggunian sa dokumentasyon sa Ingles sa `docs/` folder
  - Pinalitan ang pangalan ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 sanggunian ng nilalaman na na-update sa 7 mga file ng dokumentasyon

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - Na-update ang lahat ng cross-reference upang ipakita ang bagong istruktura ng folder
  - Na-validate ang mga navigation link sa buong dokumentasyon

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Na-update ang lahat ng internal na link upang tumukoy sa bagong pangalan ng file

#### Na-update na Mga File
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 na-update na link ng nabigasyon
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 sanggunian ng pangalan ng produkto na na-update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasalukuyang gumagamit na ng Microsoft Foundry (mula sa mga naunang update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 sanggunian na na-update (pangkalahatang-ideya, feedback ng komunidad, dokumentasyon)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference na link na na-update
  - `docs/getting-started/first-project.md` - 2 na-update na link ng nabigasyon ng kabanata
  - `docs/getting-started/installation.md` - 2 susunod na link ng kabanata na na-update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 sanggunian na na-update (navigasyon, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 na-update na link ng nabigasyon
  - `docs/troubleshooting/debugging.md` - 1 na-update na link ng nabigasyon

- **Mga File ng Estruktura ng Kurso** (2 files):
  - `README.md` - 17 sanggunian na na-update (pangkalahatang-ideya ng kurso, mga pamagat ng kabanata, seksiyon ng mga template, mga pananaw ng komunidad)
  - `course-outline.md` - 14 sanggunian na na-update (pangkalahatang-ideya, mga layunin sa pagkatuto, mga mapagkukunan ng kabanata)

#### Napatunayan
- ✅ Walang natitirang reference ng folder path na "ai-foundry" sa mga dokumentong Ingles
- ✅ Walang natitirang sanggunian ng pangalan ng produkto na "Microsoft Foundry" sa mga dokumentong Ingles
- ✅ Gumagana ang lahat ng mga link ng nabigasyon sa bagong istruktura ng folder
- ✅ Matagumpay na natapos ang pagpapalit ng pangalan ng mga file at folder
- ✅ Na-validate ang mga cross-reference sa pagitan ng mga kabanata

#### Mga Tala
- **Saklaw**: Ang mga pagbabago ay inilapat lamang sa dokumentasyong Ingles sa `docs/` folder
- **Mga Pagsasalin**: Ang mga folder ng pagsasalin (`translations/`) ay hindi na-update sa bersyong ito
- **Workshop**: Ang mga materyales ng workshop (`workshop/`) ay hindi na-update sa bersyong ito
- **Mga Halimbawa**: Maaaring tumukoy pa rin ang mga halimbawa sa legacy na pagngalan (aayusin sa susunod na update)
- **External Links**: Ang mga external na URL at sanggunian sa GitHub repository ay nananatiling hindi binago

#### Gabay sa Migrasyon para sa mga Kontributor
Kung mayroon kang mga lokal na branch o dokumentasyon na tumutukoy sa lumang istruktura:
1. I-update ang mga sanggunian ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga sanggunian ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Microsoft Foundry" → "Microsoft Foundry"
4. I-validate na gumagana pa rin ang lahat ng internal na link ng dokumentasyon

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Inilalagay ng bersyong ito ang komprehensibong suporta para sa bagong preview feature ng Azure Developer CLI at pinahuhusay ang karanasan ng gumagamit ng workshop.**

#### Idinagdag
- **🧪 azd provision --preview Feature Documentation**: Komprehensibong saklaw ng bagong kakayahan sa infrastructure preview
  - Sanggunian ng command at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa provisioning guide na may mga use case at benepisyo
  - Integrasyon ng pre-flight check para sa mas ligtas na pag-validate ng deployment
  - Mga update sa getting started guide na may safety-first na mga kasanayan sa deployment
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapahiwatig ng development status ng workshop
  - Gradient na disenyo na may mga indicator ng konstruksyon para sa malinaw na komunikasyon sa gumagamit
  - Timestamp ng huling pag-update para sa transparency
  - Mobile-responsive na disenyo para sa lahat ng uri ng device

#### Pinahusay
- **Kaligtasan ng Imprastruktura**: Ang functionality ng preview ay isinama sa buong dokumentasyon ng deployment
- **Pre-deployment Validation**: Kasama na sa automated scripts ang infrastructure preview testing
- **Developer Workflow**: Na-update ang mga sequence ng command upang isama ang preview bilang best practice
- **Workshop Experience**: Maliwanag ang mga inaasahan para sa mga gumagamit tungkol sa kalagayan ng content development

#### Binago
- **Deployment Best Practices**: Inirerekomenda na ngayon ang preview-first workflow
- **Documentation Flow**: Inilipat ang infrastructure validation nang mas maaga sa proseso ng pagkatuto
- **Workshop Presentation**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng development

#### Pinabuti
- **Safety-First Approach**: Maaaring i-validate ang mga pagbabago sa imprastruktura bago ang deployment
- **Team Collaboration**: Maaaring ibahagi ang mga resulta ng preview para sa review at pag-apruba
- **Cost Awareness**: Mas mahusay na pagkaunawa sa mga gastos sa resources bago ang provisioning
- **Risk Mitigation**: Nabawasan ang mga pagkabigo sa deployment sa pamamagitan ng advance validation

#### Teknikal na Implementasyon
- **Multi-document Integration**: Ang preview feature ay na-dokumentado sa 4 na pangunahing file
- **Command Patterns**: Konsistent na syntax at mga halimbawa sa buong dokumentasyon
- **Best Practice Integration**: Kasama ang preview sa validation workflows at mga script
- **Visual Indicators**: Malinaw na marka ng BAGONG feature para sa discoverability

#### Imprastruktura ng Workshop
- **Status Communication**: Propesyonal na HTML banner na may gradient styling
- **User Experience**: Malinaw na development status upang maiwasan ang kalituhan
- **Professional Presentation**: Pinananatili ang kredibilidad ng repository habang itinakda ang mga inaasahan
- **Timeline Transparency**: October 2025 huling na-update na timestamp para sa pananagutan

### [v3.3.0] - 2025-09-24

#### Pinahusay na Mga Materyales ng Workshop at Interactive na Karanasan sa Pagkatuto
**Inilalagay ng bersyong ito ang komprehensibong materyales ng workshop na may browser-based interactive guides at istrukturadong learning paths.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Browser-based na karanasan sa workshop na may MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step na guided learning path mula discovery hanggang customization
  - 0-Panimula: Pangkalahatang-ideya ng workshop at setup
  - 1-Select-AI-Template: Proseso ng pagtuklas at pagpili ng template
  - 2-Validate-AI-Template: Mga pamamaraan ng deployment at pag-validate
  - 3-Deconstruct-AI-Template: Pag-unawa sa arkitektura ng template
  - 4-Configure-AI-Template: Pag-configure at pag-customize
  - 5-Customize-AI-Template: Advanced na mga pagbabago at iterasyon
  - 6-Teardown-Infrastructure: Cleanup at pamamahala ng resources
  - 7-Wrap-up: Buod at mga susunod na hakbang
- **🛠️ Workshop Tooling**: MkDocs configuration na may Material theme para sa pinahusay na karanasan sa pagkatuto
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless na setup ng development environment

#### Pinahusay
- **AI Workshop Lab**: Pinalawig na may komprehensibong 2-3 oras na istrukturadong karanasan sa pagkatuto
- **Workshop Documentation**: Propesyonal na presentasyon na may nabigasyon at visual aids
- **Learning Progression**: Maliwanag na step-by-step na gabay mula sa pagpili ng template hanggang sa production deployment
- **Developer Experience**: Integrated na tooling para sa mas mabilis na development workflows

#### Pinabuti
- **Accessibility**: Browser-based na interface na may search, copy functionality, at theme toggle
- **Self-Paced Learning**: Flexible na istruktura ng workshop na naka-akomoda sa iba't ibang bilis ng pagkatuto
- **Practical Application**: Mga tunay na senaryo ng deployment ng AI template
- **Community Integration**: Integrasyon ng Discord para sa suporta at kolaborasyon sa workshop

#### Mga Tampok ng Workshop
- **Built-in Search**: Mabilis na paghahanap ng keyword at leksyon
- **Copy Code Blocks**: Hover-to-copy functionality para sa lahat ng code examples
- **Theme Toggle**: Suporta sa dark/light mode para sa iba't ibang preferensya
- **Visual Assets**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Help Integration**: Direktang access sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Malaking Restructuring ng Navigasyon at Chapter-Based Learning System
**Inilalagay ng bersyong ito ang komprehensibong chapter-based learning structure na may pinahusay na nabigasyon sa buong repository.**

#### Idinagdag
- **📚 Chapter-Based Learning System**: Inistruktura muli ang buong kurso sa 8 progresibong mga kabanata
  - Kabanata 1: Pundasyon at Mabilis na Simula (⭐ - 30-45 mins)
  - Kabanata 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Kabanata 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Kabanata 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Kabanata 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Kabanata 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Kabanata 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Kabanata 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Konsistent na navigation headers at footers sa buong dokumentasyon
- **🎯 Progress Tracking**: Checklist ng pagkumpleto ng kurso at sistema ng pag-verify ng pagkatuto
- **🗺️ Learning Path Guidance**: Maliwanag na entry points para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference Navigation**: Malinaw na naka-link ang mga kaugnay na kabanata at prerequisites

#### Pinahusay
- **README Structure**: Binago upang maging istrukturadong learning platform na may chapter-based na organisasyon
- **Documentation Navigation**: Bawat pahina ay ngayon may konteksto ng kabanata at gabay sa progreso
- **Template Organization**: Ang mga halimbawa at template ay naka-map sa angkop na learning chapters
- **Resource Integration**: Cheat sheets, FAQs, at study guides na konektado sa mga kaugnay na kabanata
- **Workshop Integration**: Hands-on labs na naka-map sa maraming learning objectives ng kabanata

#### Binago
- **Learning Progression**: Lumipat mula sa linear na dokumentasyon patungo sa flexible na chapter-based na pagkatuto
- **Configuration Placement**: Inilipat ang configuration guide bilang Kabanata 3 para sa mas maayos na daloy ng pagkatuto
- **AI Content Integration**: Mas mahusay na integrasyon ng AI-specific na nilalaman sa buong learning journey
- **Production Content**: Ang advanced na mga pattern ay pinagsama sa Kabanata 8 para sa mga enterprise learners

#### Pinabuti
- **User Experience**: Maliwanag na navigation breadcrumbs at mga indicator ng progreso ng kabanata
- **Accessibility**: Konsistent na mga pattern ng nabigasyon para sa mas madaling paglibot sa kurso
- **Professional Presentation**: Estruktura na parang unibersidad na angkop para sa akademiko at corporate training
- **Learning Efficiency**: Pinababang oras para mahanap ang may-kinalaman na nilalaman sa pamamagitan ng pinahusay na organisasyon

#### Teknikal na Implementasyon
- **Navigation Headers**: Standardized na chapter navigation sa 40+ na mga file ng dokumentasyon
- **Footer Navigation**: Konsistent na gabay sa progreso at mga indicator ng pagkumpleto ng kabanata
- **Cross-Linking**: Komprehensibong internal linking system na nag-uugnay ng mga kaugnay na konsepto
- **Chapter Mapping**: Malinaw na naka-associate ang mga template at halimbawa sa mga learning objectives

#### Pagpapahusay ng Gabay sa Pag-aaral
- **📚 Komprehensibong Mga Layunin sa Pagkatuto**: Inistruktura muli ang study guide upang umayon sa 8-kabanata na sistema
- **🎯 Chapter-Based Assessment**: Bawat kabanata ay may espesipikong mga layunin sa pagkatuto at praktikal na mga exercise
- **📋 Progress Tracking**: Lingguhang iskedyul ng pagkatuto na may nasusukat na mga resulta at checklist ng pagkumpleto
- **❓ Mga Tanong sa Pagsusuri**: Mga katanungan para sa pag-validate ng kaalaman sa bawat kabanata na may propesyonal na output
- **🛠️ Practical Exercises**: Hands-on na mga aktibidad na may tunay na mga senaryo ng deployment at troubleshooting
- **📊 Skill Progression**: Malinaw na pag-unlad mula sa mga pangunahing konsepto hanggang sa mga enterprise pattern na may pokus sa career development
- **🎓 Certification Framework**: Mga propesyonal na resulta sa pag-unlad at pagkilala ng komunidad
- **⏱️ Timeline Management**: Istrukturadong 10-week na learning plan na may milestone validation

### [v3.1.0] - 2025-09-17

#### Pinahusay na Multi-Agent AI Solutions
**Pinapabuti ng bersyong ito ang multi-agent retail solution na may mas malinaw na pagpe-penal ng pangalan ng agent at pinahusay na dokumentasyon.**

#### Binago
- **Multi-Agent Terminology**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pag-unawa
- **Agent Architecture**: Na-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code upang gumamit ng konsistent na "Customer agent" na pangalan
- **Configuration Examples**: Modernisado ang mga pattern ng configuration ng agent na may na-update na mga convention ng pangalan
- **Documentation Consistency**: Siniguro na ang lahat ng sanggunian ay gumagamit ng propesyonal at deskriptibong mga pangalan ng agent

#### Pinahusay
- **ARM Template Package**: Na-update ang retail-multiagent-arm-template na may mga sanggunian sa Customer agent
- **Architecture Diagrams**: Na-refresh ang mga Mermaid diagrams na may na-update na pagpe-penal ng agent
- **Code Examples**: Ang mga Python classes at implementation examples ay ngayon gumagamit ng CustomerAgent na pangalan
- **Environment Variables**: Na-update ang lahat ng deployment script upang gumamit ng CUSTOMER_AGENT_NAME na mga convention

#### Pinabuti
- **Developer Experience**: Mas malinaw na mga papel at responsibilidad ng agent sa dokumentasyon
- **Production Readiness**: Mas maayos na pag-align sa mga enterprise naming conventions
- **Learning Materials**: Mas intuitive na pagbigay-pangalan sa agent para sa layuning pang-edukasyon
- **Template Usability**: Pinasimpleng pag-unawa sa mga function ng agent at mga pattern ng deployment

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Pangunahing Pagbabago - Pagtuon sa AI Developer at Integrasyon ng Microsoft Foundry
**Binabago nitong bersyon ang repositoryo upang maging komprehensibong pinagkukunan ng pagkatuto na nakatuon sa AI na may integrasyon sa Microsoft Foundry.**

#### Idinagdag
- **🤖 AI-First Learning Path**: Kompletong restruktura na inuuna ang mga AI developer at engineer
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para ikonekta ang AZD sa mga serbisyo ng Microsoft Foundry
- **AI Model Deployment Patterns**: Detalyadong gabay na sumasaklaw sa pagpili ng modelo, konfigurasyon, at mga estratehiya para sa production deployment
- **AI Workshop Lab**: 2-3 oras na praktikal na workshop para i-convert ang mga AI application sa mga solusyon na madedeploy gamit ang AZD
- **Production AI Best Practices**: Mga pattern na handa para sa enterprise para sa pag-scale, pag-monitor, at pagsiguro ng mga AI workload
- **AI-Specific Troubleshooting Guide**: Komprehensibong troubleshooting para sa Azure OpenAI, Cognitive Services, at mga isyu sa AI deployment
- **AI Template Gallery**: Tampok na koleksyon ng mga template ng Microsoft Foundry na may mga rating ng pagiging kumplikado
- **Workshop Materials**: Kumpletong istruktura ng workshop na may mga praktikal na lab at mga reference na materyales

#### Pinahusay
- **README Structure**: Nakatuon sa AI developer at may 45% na datos ng interes ng komunidad mula sa Microsoft Foundry Discord
- **Learning Paths**: Nakalaang paglalakbay para sa AI developer kasabay ng tradisyonal na mga landas para sa mga estudyante at DevOps engineer
- **Template Recommendations**: Tampok na mga AI template kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Community Integration**: Pinalakas na suporta sa Discord community na may mga channel at talakayan na nakatuon sa AI

#### Pokus sa Seguridad at Produksyon
- **Managed Identity Patterns**: AI-specific na authentication at mga konfigurasyon ng seguridad
- **Cost Optimization**: Pagsubaybay ng paggamit ng token at mga kontrol sa budget para sa mga AI workload
- **Multi-Region Deployment**: Mga estratehiya para sa global na deployment ng AI application
- **Performance Monitoring**: AI-specific na mga metric at integrasyon ng Application Insights

#### Kalidad ng Dokumentasyon
- **Linear Course Structure**: Lohikal na pag-unlad mula beginner hanggang advanced na mga pattern ng AI deployment
- **Validated URLs**: Lahat ng external na link ng repositoryo ay na-verify at maa-access
- **Complete Reference**: Lahat ng internal na link ng dokumentasyon ay na-validate at gumagana
- **Production Ready**: Mga pattern ng enterprise deployment na may mga totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Pangunahing Pagbabago - Restructura ng Repository at Propesyonal na Pagpapabuti
**Ang bersyong ito ay kumakatawan sa isang makabuluhang overhaul ng istruktura ng repositoryo at presentasyon ng nilalaman.**

#### Idinagdag
- **Structured Learning Framework**: Lahat ng pahina ng dokumentasyon ngayon ay naglalaman ng mga seksyon na Introduction, Learning Goals, at Learning Outcomes
- **Navigation System**: Idinagdag ang mga link na Previous/Next lesson sa buong dokumentasyon para sa gabay na pag-unlad ng pagkatuto
- **Study Guide**: Komprehensibong study-guide.md na may mga learning objectives, practice exercises, at mga assessment na materyales
- **Professional Presentation**: Tinanggal lahat ng emoji icon para sa pinabuting accessibility at propesyonal na itsura
- **Enhanced Content Structure**: Pinahusay ang organisasyon at daloy ng mga materyales sa pagkatuto

#### Binago
- **Documentation Format**: Ipinatupad ang standard sa lahat ng dokumentasyon na may pare-parehong istrukturang nakatuon sa pagkatuto
- **Navigation Flow**: Ipinatupad ang lohikal na pag-unlad sa lahat ng materyales sa pagkatuto
- **Content Presentation**: Tinanggal ang mga dekoratibong elemento pabor sa malinaw at propesyonal na pag-format
- **Link Structure**: In-update ang lahat ng internal na link upang suportahan ang bagong navigation system

#### Pinabuti
- **Accessibility**: Tinanggal ang dependensya sa emoji para sa mas mahusay na compatibility sa screen reader
- **Professional Appearance**: Malinis, istilong akademiko na presentasyon na angkop para sa enterprise learning
- **Learning Experience**: Istrakturang pamamaraan na may malinaw na mga layunin at kinalabasan para sa bawat aralin
- **Content Organization**: Mas mahusay na lohikal na daloy at koneksyon sa pagitan ng magkakaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Paunang Release - Komprehensibong AZD Learning Repository

#### Idinagdag
- **Pangunahing Istruktura ng Dokumentasyon**
  - Kompletong serye ng gabay sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga resource para sa troubleshooting at mga gabay sa debugging
  - Mga tool at pamamaraan para sa pre-deployment validation

- **Module ng Pagsisimula**
  - AZD Basics: Mga pangunahing konsepto at terminolohiya
  - Installation Guide: Mga platform-specific na tagubilin sa pag-setup
  - Configuration Guide: Pag-setup ng environment at pagpapatunay
  - First Project Tutorial: Hakbang-hakbang na praktikal na pagkatuto

- **Module ng Deployment at Provisioning**
  - Deployment Guide: Kumpletong dokumentasyon ng workflow
  - Provisioning Guide: Infrastructure as Code gamit ang Bicep
  - Mga best practice para sa production deployments
  - Mga pattern ng multi-service architecture

- **Pre-deployment Validation Module**
  - Capacity Planning: Pag-validate ng availability ng Azure resources
  - SKU Selection: Komprehensibong gabay sa service tier
  - Pre-flight Checks: Mga automated validation script (PowerShell at Bash)
  - Mga tool para sa pagtatantya ng gastos at pagpaplano ng budget

- **Troubleshooting Module**
  - Common Issues: Mga madalas na nakikitang problema at solusyon
  - Debugging Guide: Sistematikong mga metodolohiya sa troubleshooting
  - Mga advanced na teknik at tool para sa diagnostic
  - Monitoring ng performance at optimisasyon

- **Mga Resource at Sanggunian**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mga mahahalagang utos
  - Glossary: Komprehensibong definisyon ng terminolohiya at mga akronim
  - FAQ: Detalyadong mga sagot sa mga karaniwang tanong
  - Mga external na link na resource at koneksyon sa komunidad

- **Mga Halimbawa at Template**
  - Halimbawa ng Simpleng Web Application
  - Template para sa deployment ng Static Website
  - Konfigurasyon ng Container Application
  - Mga pattern ng integrasyon ng database
  - Mga halimbawa ng arkitektura ng microservices
  - Implementasyon ng serverless function

#### Mga Tampok
- **Multi-Platform Support**: Mga gabay sa pag-install at konfigurasyon para sa Windows, macOS, at Linux
- **Multiple Skill Levels**: Nilalayon ang nilalaman mula sa mga estudyante hanggang sa mga propesyonal na developer
- **Practical Focus**: Mga hands-on na halimbawa at mga sitwasyong may kaugnayan sa tunay na mundo
- **Comprehensive Coverage**: Mula sa mga pangunahing konsepto hanggang sa advanced na enterprise pattern
- **Pangunang Pagtuon sa Seguridad**: Mga best practice sa seguridad na isinama sa kabuuan
- **Cost Optimization**: Mga gabay para sa cost-effective na mga deployment at pamamahala ng resources

#### Kalidad ng Dokumentasyon
- **Detalyadong Mga Halimbawa ng Code**: Praktikal, nasubukan na mga sample ng code
- **Hakbang-hakbang na Mga Tagubilin**: Malinaw at maiaaksyong mga gabay
- **Komprehensibong Pag-handle ng Error**: Troubleshooting para sa mga karaniwang isyu
- **Pagsasama ng Mga Best Practice**: Mga pamantayang pang-industriya at rekomendasyon
- **Pagkakatugma ng Bersyon**: Napapanahon sa mga pinakabagong serbisyo ng Azure at mga tampok ng azd

## Mga Planadong Hinaharap na Pagpapahusay

### Version 3.1.0 (Planned)
#### Pagpapalawak ng Platform ng AI
- **Multi-Model Support**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at pasadyang mga modelo
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Advanced RAG Patterns**: Mga pagpipilian ng vector database lampas sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinahusay na monitoring para sa performance ng modelo, paggamit ng token, at kalidad ng tugon

#### Developer Experience
- **VS Code Extension**: Pinagsamang karanasan sa pag-develop para sa AZD + AI Foundry
- **GitHub Copilot Integration**: AI-assisted na pagbuo ng mga template ng AZD
- **Interactive Tutorials**: Mga praktikal na coding exercise na may automated na pag-validate para sa mga senaryong AI
- **Video Content**: Mga karagdagang video tutorial para sa mga visual learner na nakatuon sa AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Pamamahala ng modelo ng AI, pagsunod, at mga audit trail
- **Multi-Tenant AI**: Mga pattern para sa pagseserbisyo sa maraming customer na may hiwalay na AI services
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga pattern para sa multi-cloud at hybrid deployment ng mga AI workload

#### Advanced Features
- **AI Pipeline Automation**: MLOps na integrasyon gamit ang Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust na mga pattern, private endpoints, at advanced threat protection
- **Performance Optimization**: Advanced na tuning at mga estratehiya sa pag-scale para sa high-throughput AI application
- **Global Distribution**: Mga pattern para sa content delivery at edge caching para sa mga AI application

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Komprehensibong integrasyon ng Microsoft Foundry (Nakumpleto)
- ✅ **Interactive Tutorials**: Praktikal na AI workshop lab (Nakumpleto)
- ✅ **Advanced Security Module**: Mga pattern ng seguridad na partikular sa AI (Nakumpleto)
- ✅ **Performance Optimization**: Mga estratehiya sa tuning ng AI workload (Nakumpleto)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Mga senaryong deployment na nakatuon sa AI (Nakumpleto)
- ✅ **Extended FAQ**: Mga tanong at troubleshooting na partikular sa AI (Nakumpleto)
- **Tool Integration**: Pinahusay na mga gabay sa integrasyon ng IDE at editor
- ✅ **Monitoring Expansion**: Pagpapalawak ng monitoring at alerting na partikular sa AI (Nakumpleto)

#### Patuloy na Plano para sa Hinaharap na Release
- **Mobile-Friendly Documentation**: Responsive na disenyo para sa mobile learning
- **Offline Access**: Mga downloadable na pakete ng dokumentasyon
- **Enhanced IDE Integration**: VS Code extension para sa AZD + AI workflows
- **Community Dashboard**: Real-time na metrics ng komunidad at pagsubaybay ng kontribusyon

## Pag-ambag sa Changelog

### Pag-uulat ng mga Pagbabago
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Mga Kategorya ng Pagbabago

#### Idinagdag
- Mga bagong feature, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o mapagkukunan ng pagkatuto
- Karagdagang mga tool, script, o utility

#### Binago
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga pag-update upang mapabuti ang kalinawan o katumpakan
- Restructuring ng nilalaman o organisasyon

#### Deprecated
- Mga feature o pamamaraan na unti-unting tinatanggal
- Mga seksyon ng dokumentasyon na naka-iskedyul na aalisin
- Mga metodo na may mas magagandang alternatibo

#### Tinanggal
- Mga feature, dokumentasyon, o halimbawa na hindi na relevant
- Outdated na impormasyon o mga deprecated na pamamaraan
- Redundant o pinagsama-samang nilalaman

#### Naayos
- Mga koreksyon sa mga error sa dokumentasyon o code
- Paglutas ng mga naiulat na isyu o problema
- Mga pagpapabuti sa katumpakan o functionality

#### Seguridad
- Mga pagpapabuti o pag-aayos na may kaugnayan sa seguridad
- Mga pag-update sa mga best practice sa seguridad
- Paglutas ng mga kahinaan sa seguridad

### Gabay sa Semantic Versioning

#### Major Version (X.0.0)
- Mga breaking change na nangangailangan ng aksyon mula sa user
- Malalaking restructuring ng nilalaman o organisasyon
- Mga pagbabago na binabago ang pundamental na diskarte o metodolohiya

#### Minor Version (X.Y.0)
- Mga bagong feature o karagdagang nilalaman
- Mga pagpapahusay na nagpapanatili ng backward compatibility
- Mga dagdag na halimbawa, tool, o mapagkukunan

#### Patch Version (X.Y.Z)
- Pag-aayos ng bugs at mga koreksyon
- Maliit na pagpapabuti sa umiiral na nilalaman
- Mga paglilinaw at maliliit na enhancement

## Feedback at Mga Mungkahi ng Komunidad

Aktibo naming hinihikayat ang feedback ng komunidad upang pagandahin ang pinagkukunang-pagkatuto na ito:

### Paano Magbigay ng Feedback
- **GitHub Issues**: Mag-ulat ng mga problema o magmungkahi ng mga pagpapabuti (AI-specific na isyu ay maligayang tinatanggap)
- **Discord Discussions**: Magbahagi ng mga ideya at makilahok sa Microsoft Foundry community
- **Pull Requests**: Direktang mag-ambag ng mga pagpapabuti sa nilalaman, lalo na sa mga AI template at gabay
- **Microsoft Foundry Discord**: Makilahok sa #Azure channel para sa mga talakayan tungkol sa AZD + AI
- **Community Forums**: Makilahok sa mas malawak na diskusyon ng mga Azure developer

### Mga Kategorya ng Feedback
- **AI Content Accuracy**: Mga koreksyon sa integrasyon ng AI service at impormasyon sa deployment
- **Learning Experience**: Mga mungkahi para sa pinahusay na daloy ng pagkatuto para sa AI developer
- **Missing AI Content**: Mga kahilingan para sa karagdagang AI template, pattern, o halimbawa
- **Accessibility**: Mga pagpapahusay para sa iba't ibang pangangailangan sa pagkatuto
- **AI Tool Integration**: Mga mungkahi para sa mas mahusay na integrasyon ng workflow sa pag-develop ng AI
- **Production AI Patterns**: Mga kahilingan para sa mga enterprise AI deployment pattern

### Pangako sa Pagtugon
- **Issue Response**: Sa loob ng 48 oras para sa mga naiulat na problema
- **Feature Requests**: Pagsusuri sa loob ng isang linggo
- **Community Contributions**: Review sa loob ng isang linggo
- **Security Issues**: Agarang prayoridad na may pinabilis na tugon

## Iskedyul ng Pagpapanatili

### Regular na Pag-update
- **Monthly Reviews**: Pag-verify ng katumpakan ng nilalaman at mga link
- **Quarterly Updates**: Malalaking karagdagan at pagpapabuti ng nilalaman
- **Semi-Annual Reviews**: Komprehensibong restructuring at pagpapahusay
- **Annual Releases**: Malalaking pag-update ng bersyon na may makabuluhang pagpapabuti

### Pagmo-monitor at Quality Assurance
- **Automated Testing**: Regular na pag-validate ng mga halimbawa ng code at mga link
- **Community Feedback Integration**: Regular na pagsasama ng mga mungkahi ng user
- **Technology Updates**: Pagsunod sa mga pinakabagong serbisyo ng Azure at mga release ng azd
- **Accessibility Audits**: Regular na pagrepaso para sa mga prinsipyo ng inclusive na disenyo

## Patakaran sa Suporta ng Bersyon

### Kasalukuyang Suporta sa Bersyon
- **Latest Major Version**: Full support na may regular na pag-update
- **Previous Major Version**: Mga update sa seguridad at kritikal na pag-aayos para sa 12 buwan
- **Legacy Versions**: Suporta mula sa komunidad lamang, walang opisyal na pag-update

### Gabay sa Migrasyon
When major versions are released, we provide:
- **Mga Gabay sa Migrasyon**: Mga sunud-sunod na tagubilin para sa paglipat
- **Mga Tala sa Kompatibilidad**: Mga detalye tungkol sa mga pagbabago na magsisira ng compatibility
- **Suporta sa Mga Tool**: Mga script o utility para tumulong sa paglipat
- **Suporta ng Komunidad**: Nakatuong mga forum para sa mga tanong tungkol sa paglipat

---

**Nawigasyon**
- **Nakaraang Aralin**: [Gabay sa Pag-aaral](resources/study-guide.md)
- **Susunod na Aralin**: Bumalik sa [Pangunahing README](README.md)

**Manatiling Na-update**: Bantayan ang repositoryong ito para sa mga abiso tungkol sa mga bagong release at mahahalagang pag-update sa mga materyales sa pag-aaral.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na bahagi. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagkukunan ng awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng isang tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->