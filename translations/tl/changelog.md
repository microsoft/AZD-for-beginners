# Talaan ng Pagbabago - AZD Para sa Mga Nagsisimula

## Panimula

Itong tala ng pagbabago ay dokumento ng lahat ng mahahalagang pagbabago, pag-update, at pagpapabuti sa AZD For Beginners repository. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinapanatili ang talaang ito upang tulungan ang mga gumagamit na maunawaan kung ano ang nagbago sa pagitan ng mga bersyon.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagsusuri sa tala ng pagbabago na ito, ikaw ay:
- Manatiling may kaalaman tungkol sa mga bagong tampok at idinagdag na nilalaman
- Maunawaan ang mga pagpapabuti na ginawa sa umiiral na dokumentasyon
- Sundan ang mga pagkukumpuni ng bug at mga pagwawasto upang matiyak ang katumpakan
- Sundan ang pag-unlad ng mga materyales sa pagkatuto sa paglipas ng panahon

## Mga Kinalabasan ng Pagkatuto

Matapos suriin ang mga entry ng tala ng pagbabago, magagawa mong:
- Tukuyin ang bagong nilalaman at mga mapagkukunan na magagamit para sa pagkatuto
- Maunawaan kung aling mga seksyon ang na-update o pinabuti
- Planuhin ang iyong landas sa pagkatuto batay sa pinaka-kasalukuyang mga materyales
- Mag-ambag ng puna at mga suhestiyon para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.19.1] - 2026-03-27

#### Paglilinaw sa Onboarding ng Nagsisimula, Pagpapatunay ng Setup at Huling Paglilinis ng Mga Utos ng AZD
**Sinusundan ng bersyong ito ang AZD 1.23 validation sweep na may isang dokumentasyong nakatuon sa mga nagsisimula: nililinaw nito ang patnubay sa authentication na inuuna ang AZD, nagdaragdag ng mga lokal na script para sa pagpapatunay ng setup, beripikahin ang mga pangunahing utos laban sa live na AZD CLI, at inaalis ang huling lipas na mga sanggunian ng utos mula sa English-source na nasa labas ng changelog.**

#### Idinagdag
- **🧪 Mga script para sa pagpapatunay ng setup ng nagsisimula** kasama ang `validate-setup.ps1` at `validate-setup.sh` para maberipika ng mga nag-aaral ang mga kinakailangang tool bago simulan ang Kabanata 1
- **✅ Mga paunang hakbang para sa pagpapatunay ng setup** sa root README at Chapter 1 README upang mahuli ang mga nawawalang prerequisites bago ang `azd up`

#### Binago
- **🔐 Patnubay sa authentication para sa nagsisimula** ngayon ay pare-parehong itinuturing ang `azd auth login` bilang pangunahing daan para sa mga AZD workflow, na binabanggit ang `az login` bilang opsyonal maliban kung direkta namang ginagamit ang mga Azure CLI na utos
- **📚 Daloy ng onboarding ng Kabanata 1** ngayon ay nagtuturo sa mga nag-aaral na i-validate ang kanilang lokal na setup bago ang pag-install, authentication, at mga unang hakbang ng deployment
- **🛠️ Mga mensahe ng validator** ngayon malinaw na naghihiwalay ng mga blocking requirement mula sa mga opsyonal na babala ng Azure CLI para sa landas ng mga nagsisimula na AZD-only
- **📖 Mga dokumento ng configuration, troubleshooting, at mga halimbawa** ngayon nagtatangi sa pagitan ng kinakailangang AZD authentication at opsyonal na pag-sign-in ng Azure CLI kung saan dati silang ipinakita nang walang konteksto

#### Naayos
- **📋 Natitirang mga sanggunian ng utos mula sa English-source** na na-update sa kasalukuyang mga anyo ng AZD, kabilang ang `azd config show` sa cheat sheet at `azd monitor --overview` kung saan ang patnubay ng Azure Portal overview ang nilayon
- **🧭 Mga pahayag para sa nagsisimula sa Kabanata 1** pinahina upang maiwasan ang sobrang pangako ng garantisadong zero-error o rollback na pag-uugali sa lahat ng template at Azure resources
- **🔎 Live na beripikasyon ng CLI** kinumpirma ang kasalukuyang suporta para sa `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, at `azd down --force --purge`

#### Mga File na Na-update
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

#### Pagpapatunay ng AZD 1.23.12, Pagpapalawak ng Kapaligiran ng Workshop at Pag-refresh ng AI Model
**Gumagawa ang bersyong ito ng documentation validation sweep laban sa `azd` `1.23.12`, ina-update ang lipas na mga halimbawa ng AZD na utos, nire-refresh ang patnubay sa AI model sa kasalukuyang default, at pinalalawak ang mga instruksiyon ng workshop lampas sa GitHub Codespaces upang suportahan din ang dev containers at lokal na clones.**

#### Idinagdag
- **✅ Mga tala ng pagpapatunay sa mga pangunahing kabanata at workshop docs** upang gawing malinaw ang nasubok na AZD baseline para sa mga nag-aaral na gumagamit ng mas bagong o mas lumang CLI builds
- **⏱️ Patnubay sa deployment timeout** para sa mga long-running na AI app deployment gamit ang `azd deploy --timeout 1800`
- **🔎 Mga hakbang para sa inspeksyon ng extension** gamit ang `azd extension show azure.ai.agents` sa AI workflow docs
- **🌐 Mas malawak na patnubay sa kapaligiran ng workshop** na sumasaklaw sa GitHub Codespaces, dev containers, at lokal na clones gamit ang MkDocs

#### Binago
- **📚 Mga intro README ng Kabanata** ngayon pare-parehong binabanggit ang pagpapatunay laban sa `azd 1.23.12` sa buong foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, at production na mga seksyon
- **🛠️ Mga sanggunian ng AZD na utos** na na-update sa kasalukuyang anyo sa buong docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` depende sa konteksto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kung ang Application Insights overview ang nilalayong i-address
- **🧪 Mga halimbawa ng provision preview** pinasimple sa kasalukuyang suportadong paggamit tulad ng `azd provision --preview` at `azd provision --preview -e production`
- **🧭 Daloy ng workshop** in-update upang makumpleto ng mga nag-aaral ang labs sa Codespaces, isang dev container, o isang lokal na clone sa halip na ipalagay ang Codespaces-only na pagpapatupad
- **🔐 Patnubay sa authentication** ngayon inuuna ang `azd auth login` para sa mga AZD workflow, na ipinapuwesto ang `az login` bilang opsyonal kapag direktang ginagamit ang mga Azure CLI na utos

#### Naayos
- **🪟 Mga utos sa pag-install ng Windows** inormalisa sa kasalukuyang casing ng `winget` sa installation guide
- **🐧 Patnubay sa pag-install sa Linux** inayos upang iwasan ang hindi sinusuportahang distro-specific na mga utos ng package manager para sa `azd` at sa halip ituro ang release assets kung kinakailangan
- **📦 Mga halimbawa ng AI model** nire-refresh mula sa mas lumang mga default tulad ng `gpt-35-turbo` at `text-embedding-ada-002` patungo sa kasalukuyang mga halimbawa tulad ng `gpt-4.1-mini`, `gpt-4.1`, at `text-embedding-3-large`
- **📋 Mga snippet ng deployment at diagnostics** inayos upang gumamit ng kasalukuyang mga environment at status commands sa logs, scripts, at troubleshooting steps
- **⚙️ Patnubay sa GitHub Actions** in-update mula sa `Azure/setup-azd@v1.0.0` patungo sa `Azure/setup-azd@v2`
- **🤖 Patnubay sa MCP/Copilot consent** in-update mula sa `azd mcp consent` patungo sa `azd copilot consent list`

#### Pinabuti
- **🧠 Patnubay sa kabanata ng AI** ngayon mas mahusay na naglalarawan ng preview-sensitive na pag-uugali ng `azd ai`, tenant-specific na login, kasalukuyang paggamit ng extension, at na-update na mga rekomendasyon sa pag-deploy ng model
- **🧪 Mga instruksiyon ng workshop** ngayon gumagamit ng mas makatotohanang halimbawa ng bersyon at mas malinaw na wika sa pag-setup ng kapaligiran para sa hands-on labs
- **📈 Mga dokumento para sa production at troubleshooting** ngayon mas naka-align sa kasalukuyang monitoring, fallback model, at cost-tier na mga halimbawa

#### Mga File na Na-update
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
**Idinagdag ng bersyong ito ang coverage para sa `azd ai`, `azd extension`, at `azd mcp` na mga utos sa lahat ng AI-related na kabanata, inayos ang mga sirang link at deprecated na code sa agents.md, in-update ang cheat sheet, at inayos ang Example Templates section na may beripikadong mga paglalarawan at bagong Azure AI AZD templates.**

#### Idinagdag
- **🤖 Coverage ng AZD AI CLI** sa 7 file (dati ay nasa Kabanata 8 lamang):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagong seksyong "Extensions and AI Commands" na nagpapakilala sa `azd extension`, `azd ai agent init`, at `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsyon 4: `azd ai agent init` na may talahanayan ng paghahambing (template vs manifest na paraan)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Mga subseksyon na "AZD Extensions for Foundry" at "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ngayon nagpapakita ng parehong template- at manifest-based na mga landas ng deployment
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Seksyon ng Deploy ngayon naglalaman ng opsyon na `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseksyong "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bagong seksyong "AI & Extensions Commands" na may `azd extension`, `azd ai agent init`, `azd mcp`, at `azd infra generate`
- **📦 Mga bagong AZD AI example templates** sa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat gamit ang Blazor WebAssembly, Semantic Kernel, at suporta para sa voice chat
  - **azure-search-openai-demo-java** — Java RAG chat gamit ang Langchain4J na may mga opsyon sa ACA/AKS deployment
  - **contoso-creative-writer** — Multi-agent creative writing app na gumagamit ng Azure AI Agent Service, Bing Grounding, at Prompty
  - **serverless-chat-langchainjs** — Serverless RAG gamit ang Azure Functions + LangChain.js + Cosmos DB na may lokal na dev support sa Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator na may admin portal, Teams integration, at mga opsyon sa PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app na may mga server sa .NET, Python, Java, at TypeScript
  - **azd-ai-starter** — Minimal na Azure AI infrastructure Bicep starter template
  - **🔗 Link sa Awesome AZD AI Gallery** — Sanggunian sa [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Naayos
- **🔗 agents.md navigation**: Ngayon ang Previous/Next links ay tumutugma sa pagkakasunod-sunod ng mga lesson sa Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md sirang mga link**: `production-ai-practices.md` inayos sa `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated na code**: Pinalitan ang `opencensus` ng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Inilipat ang `max_tokens` mula sa `create_agent()` patungo sa `create_run()` bilang `max_completion_tokens`
- **🔢 agents.md token counting**: Pinalitan ang approximasyon na `len//4` ng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Inayos ang mga serbisyo mula sa "Cognitive Search + App Service" patungo sa "Azure AI Search + Azure Container Apps" (nagbago ang default host Okt 2024)
- **contoso-chat**: In-update ang paglalarawan upang banggitin ang Azure AI Foundry + Prompty, na tumutugma sa aktwal na pamagat at tech stack ng repo

#### Tinanggal
- **ai-document-processing**: Tinanggal ang hindi gumaganang sanggunian ng template (ang repo ay hindi pampublikong naa-access bilang isang AZD template)

#### Pinabuti
- **📝 agents.md exercises**: Ipinapakita na ng Exercise 1 ang inaasahang output at ang hakbang na `azd monitor`; Ang Exercise 2 ay naglalaman ng buong code ng pagrehistro ng `FunctionTool`; Ang Exercise 3 ay pinalitan ang malabong gabay ng mga konkretong utos na `prepdocs.py`
- **📚 agents.md resources**: In-update ang mga link ng dokumentasyon tungo sa kasalukuyang Azure AI Agent Service docs at quickstart
- **📋 agents.md Next Steps table**: Idinagdag ang AI Workshop Lab link para sa kumpletong pagtakip ng kabanata

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
**Ang bersyong ito ay nagpapabuti ng README.md chapter navigation gamit ang pinalawak na format ng talahanayan.**

#### Changed
- **Course Map Table**: Pinalawak na may direktang mga link ng leksyon, pagtatantya ng tagal, at mga rating ng pagiging kumplikado
- **Folder Cleanup**: Tinanggal ang mga redundant na lumang folder (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Na-verify ang lahat ng 21+ internal links sa Course Map table

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Ang bersyong ito ay nag-a-update ng mga sanggunian ng produkto ayon sa kasalukuyang Microsoft branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: Na-update ang lahat ng sanggunian sa mga non-translation na file
- **Azure AI Agent Service → Foundry Agents**: Na-update ang pangalan ng serbisyo upang ipakita ang kasalukuyang branding

#### Files Updated
- `README.md` - Pangunahing landing page ng kurso
- `changelog.md` - Kasaysayan ng mga bersyon
- `course-outline.md` - Estruktura ng kurso
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Dokumentasyon ng mga halimbawa
- `workshop/README.md` - Landing page ng workshop
- `workshop/docs/index.md` - Index ng workshop
- `workshop/docs/instructions/*.md` - Lahat ng workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Ang bersyong ito ay nire-istruktura ang dokumentasyon sa mga dedikadong chapter folder para sa mas malinaw na pag-navigate.**

#### Folder Renames
Ang mga lumang folder ay pinalitan ng mga chapter-numbered folder:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Idinagdag: `docs/chapter-05-multi-agent/`

#### File Migrations
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

#### Added
- **📚 Chapter README files**: Nilikha ang README.md sa bawat chapter folder na may:
  - Mga layunin sa pagkatuto at tagal
  - Talahanayan ng mga leksyon na may mga paglalarawan
  - Mga quick start na utos
  - Navigasyon papunta sa ibang mga kabanata

#### Changed
- **🔗 Updated all internal links**: 78+ paths na-update sa buong dokumentasyon
- **🗺️ Main README.md**: In-update ang Course Map na may bagong istruktura ng mga kabanata
- **📝 examples/README.md**: In-update ang mga cross-reference sa chapter folders

#### Removed
- Lumang folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Ang bersyong ito ay nagdagdag ng chapter navigation README files (pinalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Ang bersyong ito ay nagdaragdag ng komprehensibong gabay para sa pag-deploy ng AI agents gamit ang Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang AI agents at paano ito naiiba sa mga chatbot
  - Tatlong quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Mga pattern ng architecture ng agent (single agent, RAG, multi-agent)
  - Konfigurasyon ng tool at pag-customize
  - Monitoring at pagsubaybay ng metrics
  - Mga konsiderasyon sa gastos at pag-optimize
  - Mga karaniwang scenario ng troubleshooting
  - Tatlong hands-on exercises na may success criteria

#### Content Structure
- **Introduction**: Mga konsepto ng agent para sa mga nagsisimula
- **Quick Start**: I-deploy ang mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual na diagram ng mga pattern ng agent
- **Configuration**: Setup ng tool at mga environment variable
- **Monitoring**: Integrasyon ng Application Insights
- **Exercises**: Progressive na hands-on na pagkatuto (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Ang bersyong ito ay nag-a-update ng configuration ng development container gamit ang mga modernong tool at mas magagandang default para sa karanasan sa pag-aaral ng AZD.**

#### Changed
- **🐳 Base Image**: In-update mula `python:3.12-bullseye` tungo sa `python:3.12-bookworm` (pinakabagong Debian stable)
- **📛 Container Name**: Pinalitan mula "Python 3" tungo sa "AZD for Beginners" para sa kalinawan

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` na may Bicep support na naka-enable
  - `node:20` (LTS version para sa AZD templates)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa container app deployments

- **🔌 Port Forwarding**: Pre-configured na mga port para sa karaniwang development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
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

- **⚙️ VS Code Settings**: Idinagdag ang default na settings para sa Python interpreter, format on save, at whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Ngayon nagve-verify ng AZD at Azure CLI installation sa pagsisimula ng container

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Ang bersyong ito ay malaki ang pagpapabuti sa README.md upang maging mas accessible para sa mga nagsisimula at nagdaragdag ng mahahalagang resources para sa mga AI developer.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Maliwanag na paliwanag kung kailan gagamit ng bawat tool kasama ang praktikal na mga halimbawa
- **🌟 Awesome AZD Links**: Direktang mga link sa community template gallery at mga resource para sa kontribusyon:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kontribusyon mula sa komunidad
- **🎯 Quick Start Guide**: Pinasimpleng 3-step na getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Maliwanag na gabay kung saan magsisimula base sa karanasan ng developer

#### Changed
- **README Structure**: Inayos para sa progressive disclosure - mahalagang impormasyon muna
- **Introduction Section**: Muling isinulat upang ipaliwanag ang "The Magic of `azd up`" para sa mga ganap na nagsisimula
- **Removed Duplicate Content**: Tinanggal ang duplicate na troubleshooting section
- **Troubleshooting Commands**: Inayos ang reference na `azd logs` upang gumamit ng wastong `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Invalid Command References**: Tinanggal ang natitirang `azd logs` mula sa README troubleshooting section

#### Notes
- **Scope**: Mga pagbabago na inilapat sa main README.md at resources/cheat-sheet.md
- **Target Audience**: Mga pagpapabuti na partikular na naka-target sa mga developer na bagong sa AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Ang bersyong ito ay nagwawasto ng mga hindi umiiral na AZD commands sa buong dokumentasyon, tinitiyak na lahat ng code example ay gumagamit ng wastong Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Komprehensibong audit at pagwawasto ng mga invalid na command:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o alternatibo ng Azure CLI
  - `azd service` subcommands (hindi umiiral) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (hindi umiiral) → tinanggal o pinalitan ng mga wastong alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (hindi umiiral) → tinanggal
  - `azd provision --what-if/--rollback` flags (hindi umiiral) → in-update upang gumamit ng `--preview`
  - `azd config validate` (hindi umiiral) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hindi umiiral) → tinanggal

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Malawakang pag-ayos ng command reference
  - `docs/deployment/deployment-guide.md`: Naayos ang rollback at deployment strategies
  - `docs/troubleshooting/debugging.md`: Naayos ang mga seksyon ng log analysis
  - `docs/troubleshooting/common-issues.md`: In-update ang mga troubleshooting command
  - `docs/troubleshooting/ai-troubleshooting.md`: Naayos ang AZD debugging section
  - `docs/getting-started/azd-basics.md`: Naayos ang monitoring commands
  - `docs/getting-started/first-project.md`: In-update ang monitoring at debugging examples
  - `docs/getting-started/installation.md`: Naayos ang help at version examples
  - `docs/pre-deployment/application-insights.md`: Naayos ang log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Naayos ang agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Pinalitan ang hardcoded na `1.5.0` na bersyon ng generic na `1.x.x` na may link sa releases

#### Changed
- **Rollback Strategies**: In-update ang dokumentasyon upang gumamit ng Git-based rollback (walang native rollback ang AZD)
- **Log Viewing**: Pinalitan ang mga sanggunian sa `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at mga Azure CLI command
- **Performance Section**: Tinanggal ang mga hindi umiiral na parallel/incremental deployment flags, nagbigay ng mga wastong alternatibo

#### Technical Details
- **Wastong AZD na Mga Utos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Wastong mga Flag ng azd monitor**: `--live`, `--logs`, `--overview`
- **Tinanggal na Mga Tampok**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Pagpapatunay**: Ang mga utos ay na-validate laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagkumpleto ng Workshop at Pagpapabuti ng Kalidad ng Dokumentasyon
**Tinapos ng bersyong ito ang mga interaktibong module ng workshop, inayos ang lahat ng sirang link sa dokumentasyon, at pinabuti ang pangkalahatang kalidad ng nilalaman para sa mga AI developer na gumagamit ng Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng mga patnubay sa kontribusyon na naglalaman ng:
  - Malinaw na mga tagubilin para sa pag-uulat ng mga isyu at pagmumungkahi ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga patnubay sa halimbawa ng code at mga kaugalian sa mensahe ng commit
  - Impormasyon tungkol sa pakikilahok ng komunidad

#### Natapos
- **🎯 Workshop Module 7 (Wrap-up)**: Ganap na natapos na wrap-up module na may:
  - Komprehensibong buod ng mga nagawa sa workshop
  - Seksyon ng mga pangunahing konseptong natutunan na sumasaklaw sa AZD, mga template, at Microsoft Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng paglalakbay sa pagkatuto
  - Mga challenge na ehersisyo ng workshop na may rating ng kahirapan
  - Mga link para sa feedback ng komunidad at suporta

- **📚 Workshop Module 3 (Deconstruct)**: Na-update na mga learning objectives na may:
  - Patnubay para sa pag-activate ng GitHub Copilot na may MCP servers
  - Pag-unawa sa istruktura ng folder ng AZD template
  - Mga pattern ng organisasyon para sa infrastructure-as-code (Bicep)
  - Mga tagubilin para sa hands-on lab

- **🔧 Workshop Module 6 (Teardown)**: Natapos na may:
  - Mga layunin para sa paglilinis ng mga resource at pamamahala ng gastos
  - Paggamit ng `azd down` para sa ligtas na infrastructure deprovisioning
  - Patnubay para sa pag-recover ng mga soft-deleted na cognitive services
  - Mga bonus na prompt para sa eksplorasyon ng GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Pag-ayos ng Sirang mga Link**: Naayos ang 15+ sirang internal na mga link sa dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Naayos ang mga path patungo sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Itinama ang ai-model-deployment.md at production-ai-practices.md na mga path
  - `docs/getting-started/first-project.md`: Pinalitan ang hindi umiiral na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Naayos ang mga path ng FAQ at troubleshooting guide
  - `examples/container-app/microservices/README.md`: Itinama ang course home at deployment guide na mga path
  - `resources/faq.md` at `resources/glossary.md`: In-update ang mga reference sa AI chapter
  - `course-outline.md`: Inayos ang mga reference sa instructor guide at AI workshop lab

- **📅 Workshop Status Banner**: Na-update mula sa "Under Construction" patungo sa aktibong status ng workshop na may petsang Pebrero 2026

- **🔗 Workshop Navigation**: Naayos ang mga sirang navigation link sa workshop README.md na tumuturo sa hindi umiiral na folder na lab-1-azd-basics

#### Binago
- **Workshop Presentation**: Inalis ang babalang "under construction", ang workshop ay kumpleto na at handa nang gamitin
- **Navigation Consistency**: Tiniyak na ang lahat ng workshop modules ay may tamang inter-module navigation
- **Learning Path References**: In-update ang mga cross-reference ng kabanata upang gumamit ng tamang microsoft-foundry paths

#### Napatunayan
- ✅ Lahat ng English na markdown na mga file ay may wastong internal na mga link
- ✅ Ang mga workshop module 0-7 ay kumpleto na na may mga layunin sa pagkatuto
- ✅ Gumagana nang tama ang navigation sa pagitan ng mga kabanata at module
- ✅ Ang nilalaman ay angkop para sa mga AI developer na gumagamit ng Microsoft AZD
- ✅ Napanatili ang wikang angkop sa mga baguhan at istraktura sa kabuuan
- ✅ Nagbibigay ang CONTRIBUTING.md ng malinaw na gabay para sa mga kontribyutor ng komunidad

#### Teknikal na Implementasyon
- **Link Validation**: Isinagawa ng automated PowerShell script ang pagpapatunay sa lahat ng .md internal na mga link
- **Content Audit**: Manu-manong pagsusuri ng pagkakumpleto ng workshop at angkop para sa mga baguhan
- **Navigation System**: Inilapat ang magkakatugmang pattern ng navigation ng kabanata at module

#### Mga Tala
- **Saklaw**: Ang mga pagbabago ay inilapat lamang sa English na dokumentasyon
- **Mga Pagsasalin**: Hindi na-update ang mga folder ng pagsasalin sa bersyong ito (ang automated translation ay mag-sync mamaya)
- **Tagal ng Workshop**: Nagbibigay na ang kumpletong workshop ng 3-4 na oras ng hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Pinahusay na Dokumentasyon: Pagsubaybay, Seguridad, at Mga Pattern ng Multi-Agent
**Dinagdag ng bersyong ito ang komprehensibong A-grade na mga aralin tungkol sa integrasyon ng Application Insights, mga pattern ng authentication, at multi-agent coordination para sa production deployments.**

#### Idinagdag
- **📊 Aralin sa Integrasyon ng Application Insights**: nasa `docs/pre-deployment/application-insights.md`:
  - Deployment na nakatuon sa AZD na may awtomatikong provisioning
  - Kompletong Bicep templates para sa Application Insights + Log Analytics
  - Gumaganang Python application na may custom telemetry (1,200+ linya)
  - Mga pattern ng pag-monitor para sa AI/LLM (pagsubaybay ng token/gastos ng Microsoft Foundry Models)
  - 6 na Mermaid na diagram (arkitektura, distributed tracing, daloy ng telemetry)
  - 3 mga hands-on na ehersisyo (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng Kusto query at mga estratehiya sa pag-optimize ng gastos
  - Live metrics streaming at real-time debugging
  - 40-50 minutong oras ng pagkatuto na may mga production-ready na pattern

- **🔐 Aralin sa Authentication at Mga Pattern ng Seguridad**: nasa `docs/getting-started/authsecurity.md`:
  - 3 mga pattern ng authentication (connection strings, Key Vault, managed identity)
  - Kompletong Bicep infrastructure templates para sa ligtas na deployments
  - Node.js application code na may Azure SDK integration
  - 3 kumpletong ehersisyo (paganahin ang managed identity, user-assigned identity, Key Vault rotation)
  - Pinakamahusay na kasanayan sa seguridad at mga konfigurasyon ng RBAC
  - Gabay sa troubleshooting at pagsusuri ng gastos
  - Production-ready na mga pattern ng passwordless authentication

- **🤖 Aralin sa Mga Pattern ng Multi-Agent Coordination**: nasa `docs/pre-deployment/coordination-patterns.md`:
  - 5 mga coordination pattern (sequential, parallel, hierarchical, event-driven, consensus)
  - Kompletong implementasyon ng orchestrator service (Python/Flask, 1,500+ linya)
  - 3 espesyalisadong implementasyon ng agent (Research, Writer, Editor)
  - Service Bus integration para sa message queuing
  - Cosmos DB state management para sa distributed systems
  - 6 na Mermaid diagram na nagpapakita ng mga interaksyon ng agent
  - 3 advanced na ehersisyo (timeout handling, retry logic, circuit breaker)
  - Pagbuwag ng gastos ($240-565/month) na may mga estratehiya sa pag-optimize
  - Application Insights integration para sa pag-monitor

#### Pinalawak
- **Pre-deployment Chapter**: Ngayon ay kasama ang komprehensibong mga pattern ng monitoring at coordination
- **Getting Started Chapter**: Pinalakas ng mga propesyonal na pattern ng authentication
- **Production Readiness**: Kumpletong saklaw mula seguridad hanggang observability
- **Course Outline**: In-update upang tumukoy sa mga bagong aralin sa Kabanata 3 at 6

#### Binago
- **Learning Progression**: Mas mahusay na integrasyon ng seguridad at pag-monitor sa buong kurso
- **Documentation Quality**: Nagkakatugmang A-grade na pamantayan (95-97%) sa mga bagong aralin
- **Production Patterns**: Kumpletong end-to-end na saklaw para sa enterprise deployments

#### Pinabuti
- **Developer Experience**: Maliwanag na landas mula development hanggang production monitoring
- **Security Standards**: Mga propesyonal na pattern para sa authentication at pamamahala ng mga secret
- **Observability**: Kumpletong Application Insights integration sa AZD
- **AI Workloads**: Espesyalisadong pag-monitor para sa Microsoft Foundry Models at mga multi-agent na sistema

#### Napatunayan
- ✅ Lahat ng aralin ay may kumpletong gumaganang code (hindi snippets)
- ✅ Mga Mermaid diagram para sa visual na pagkatuto (19 kabuuan sa 3 aralin)
- ✅ Mga hands-on na ehersisyo na may mga hakbang sa pag-verify (9 kabuuan)
- ✅ Production-ready na Bicep templates na mai-de-deploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa pag-optimize
- ✅ Mga gabay sa troubleshooting at pinakamahusay na kasanayan
- ✅ Mga knowledge checkpoint kasama ang mga verification command

#### Mga Resulta ng Pag-grade ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa pag-monitor
- **docs/getting-started/authsecurity.md**: - Mga propesyonal na pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Advanced na arkitekturang multi-agent
- **Overall New Content**: - Nagkakatugmang mataas na pamantayan ng kalidad

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Pagpapabuti ng Kalidad ng Dokumentasyon at Bagong Halimbawa ng Microsoft Foundry Models
**Pinahusay ng bersyong ito ang kalidad ng dokumentasyon sa buong repository at nagdagdag ng kumpletong halimbawa ng deployment ng Microsoft Foundry Models na may gpt-4.1 chat interface.**

#### Idinagdag
- **🤖 Microsoft Foundry Models Chat Example**: Kumpletong gpt-4.1 deployment na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface na may conversation history
  - Key Vault integration para sa ligtas na pag-iimbak ng API key
  - Pagsubaybay ng paggamit ng token at pagtatantiya ng gastos
  - Rate limiting at error handling
  - Komprehensibong README na may 35-45 minutong deployment guide
  - 11 production-ready na mga file (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Idinagdag ang mga hands-on practice exercise sa configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Malinaw na success criteria at mga hakbang sa pag-verify
- **✅ Deployment Verification**: Idinagdag ang verification section sa deployment guide:
  - Mga pamamaraan ng health check
  - Success criteria checklist
  - Inaasahang outputs para sa lahat ng deployment command
  - Mabilisang reference sa troubleshooting

#### Pinalawak
- **examples/README.md**: In-update sa A-grade na kalidad (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng kaugnay na seksyon
  - In-update ang bilang ng lokal na halimbawa mula 3 hanggang 4
  - Idinagdag sa AI Application Examples talahanayan
  - Isinama sa Quick Start para sa mga Intermediate Users
  - Idinagdag sa seksyon ng Microsoft Foundry Templates
  - In-update ang Comparison Matrix at mga seksyon ng technology finding
- **Kalidad ng Dokumentasyon**: Pinabuti mula B+ (87%) → A- (92%) sa folder ng docs:
  - Idinagdag ang mga inaasahang output sa mga kritikal na halimbawa ng command
  - Kasama ang mga hakbang ng pag-verify para sa mga pagbabago sa configuration
  - Pinahusay ang hands-on na pagkatuto gamit ang mga praktikal na ehersisyo

#### Binago
- **Learning Progression**: Mas mahusay na integrasyon ng mga AI example para sa mga intermediate na learner
- **Documentation Structure**: Mas maraming actionable na ehersisyo na may malinaw na mga resulta
- **Verification Process**: Idinagdag ang mga tahasang success criteria sa mga pangunahing workflow

#### Pinabuti
- **Developer Experience**: Ang deployment ng Microsoft Foundry Models ngayon ay tumatagal ng 35-45 minuto (kumpara sa 60-90 para sa mas kumplikadong alternatibo)
- **Cost Transparency**: Malinaw na mga pagtatantya ng gastos ($50-200/month) para sa Microsoft Foundry Models example
- **Learning Path**: May malinaw na entry point para sa AI developers gamit ang azure-openai-chat
- **Documentation Standards**: Nagkakatugmang mga inaasahang output at hakbang sa pag-verify

#### Napatunayan
- ✅ Ang Microsoft Foundry Models example ay ganap na gumagana gamit ang `azd up`
- ✅ Lahat ng 11 implementation files ay tama ang sintaks
- ✅ Tugma ang mga tagubilin sa README sa aktwal na karanasan sa deployment
- ✅ Na-update ang mga link ng dokumentasyon sa 8+ lokasyon
- ✅ Tumpak ang examples index na nagpapakita ng 4 lokal na halimbawa
- ✅ Walang duplicate na external links sa mga talahanayan
- ✅ Tama ang lahat ng navigation reference

#### Teknikal na Implementasyon
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets sa Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking at pag-optimize ng paggamit
- **Deployment**: Isang `azd up` na utos para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Malaking Update: Mga Halimbawa ng Container App Deployment
**Dinagdag ng bersyong ito ang komprehensibong, production-ready na mga halimbawa ng deployment ng container application gamit ang Azure Developer CLI (AZD), na may buong dokumentasyon at integrasyon sa learning path.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Pangunahing Gabay](examples/container-app/README.md): Kompletong overview ng containerized deployments, quick start, production, at advanced na mga pattern
  - [Simpleng Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Arkitekturang Microservices](../../examples/container-app/microservices): Production-ready na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Pinakamahusay na Kasanayan**: Seguridad, pag-monitor, pag-optimize ng gastos, at gabay sa CI/CD para sa mga containerized workload
- **Mga Halimbawa ng Code**: Kumpletong `azure.yaml`, Bicep templates, at multi-language na implementasyon ng serbisyo (Python, Node.js, C#, Go)
- **Pagsubok at Troubleshooting**: End-to-end test scenarios, monitoring commands, gabay sa troubleshooting

#### Binago
- **README.md**: Na-update upang itampok at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: Na-update upang i-highlight ang mga halimbawa ng container app, magdagdag ng mga entry sa comparison matrix, at i-update ang mga reference sa technology/architecture
- **Course Outline & Study Guide**: Na-update upang i-refer ang mga bagong halimbawa ng container app at mga pattern ng deployment sa mga kaugnay na kabanata

#### Napatunayan
- ✅ All new examples deployable with `azd up` and follow best practices
- ✅ Documentation cross-links and navigation updated
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Mga Tala
- **Scope**: Mga dokumentasyon at halimbawa sa Ingles lamang
- **Next Steps**: Palawakin gamit ang karagdagang advanced container patterns at CI/CD automation sa mga susunod na release

### [v3.5.0] - 2025-11-19

#### Pag-rebrand ng Produkto: Microsoft Foundry
**Isinabatas ng bersyon na ito ang komprehensibong pagbabago ng pangalan ng produkto mula sa "Microsoft Foundry" patungo sa "Microsoft Foundry" sa buong dokumentasyon sa Ingles, na sumasalamin sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Pag-update ng Pangalan ng Produkto**: Kumpletong rebranding mula sa "Microsoft Foundry" hanggang "Microsoft Foundry"
  - Updated all references across English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Pagbabago ng Estruktura ng Folder**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 Pagpapalit ng Pangalan ng File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Na-update na Mga File
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references updated
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already using Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references updated (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links updated
  - `docs/getting-started/first-project.md` - 2 chapter navigation links updated
  - `docs/getting-started/installation.md` - 2 next chapter links updated
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references updated (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link updated
  - `docs/troubleshooting/debugging.md` - 1 navigation link updated

- **Course Structure Files** (2 files):
  - `README.md` - 17 references updated (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references updated (overview, learning objectives, chapter resources)

#### Napatunayan
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Mga Tala
- **Scope**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Inilalagay ng bersyon na ito ang komprehensibong suporta para sa bagong Azure Developer CLI preview feature at pinapahusay ang karanasan ng user sa workshop.**

#### Idinagdag
- **🧪 azd provision --preview Feature Documentation**: Komprehensibong saklaw ng bagong infrastructure preview capability
  - Command reference and usage examples in cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nag-iindika ng status ng pag-develop ng workshop
  - Gradient design with construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Pinalakas
- **Infrastructure Safety**: Preview functionality integrated throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations set for users about content development status

#### Binago
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation moved earlier in learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Pinabuti
- **Safety-First Approach**: Infrastructure changes can now be validated before deployment
- **Team Collaboration**: Preview results can be shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Teknikal na Implementasyon
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevents confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
- **Timeline Transparency**: Oktubre 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Pinalawak na Mga Materyales ng Workshop at Interactive na Karanasan sa Pag-aaral
**Inilalagay ng bersyon na ito ang komprehensibong materyales ng workshop na may browser-based interactive guides at istrukturadong learning paths.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience with MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path mula discovery hanggang customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme para sa pinahusay na learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Pinalakas
- **AI Workshop Lab**: Pinalawak na may komprehensibong 2-3 hour structured learning experience
- **Workshop Documentation**: Propesyonal na presentasyon na may navigation at visual aids
- **Learning Progression**: Maliwanag na step-by-step na gabay mula template selection hanggang production deployment
- **Developer Experience**: Integrated tooling para sa streamlined development workflows

#### Pinabuti
- **Accessibility**: Browser-based interface na may search, copy functionality, at theme toggle
- **Self-Paced Learning**: Flexible workshop structure na tumutugon sa iba't ibang bilis ng pag-aaral
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration para sa workshop support at collaboration

#### Mga Tampok ng Workshop
- **Built-in Search**: Mabilis na paghahanap ng keyword at lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality para sa lahat ng code examples
- **Theme Toggle**: Dark/light mode support para sa iba't ibang preference
- **Visual Assets**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Help Integration**: Direktang access sa Discord para sa community support

### [v3.2.0] - 2025-09-17

#### Malaking Pag-restructure ng Navigation at Chapter-Based Learning System
**Inilalagay ng bersyon na ito ang komprehensibong chapter-based learning structure na may pinahusay na navigation sa buong repository.**

#### Idinagdag
- **📚 Chapter-Based Learning System**: Inistruktura muli ang buong kurso sa 8 progressive learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Komprehensibong Navigation System**: Konsistent na navigation headers at footers sa buong dokumentasyon
- **🎯 Progress Tracking**: Course completion checklist at learning verification system
- **🗺️ Learning Path Guidance**: Maliwanag na entry points para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference Navigation**: Mga kaugnay na kabanata at prerequisites na malinaw na naka-link

#### Pinalakas
- **README Structure**: Binago para maging istrukturadong learning platform na may chapter-based na organisasyon
- **Documentation Navigation**: Bawat pahina ngayon ay may context ng kabanata at progression guidance
- **Template Organization**: Mga halimbawa at template naka-mapa sa angkop na learning chapters
- **Resource Integration**: Cheat sheets, FAQs, at study guides na konektado sa mga kaugnay na kabanata
- **Workshop Integration**: Hands-on labs na naka-mapa sa maraming chapter learning objectives

#### Binago
- **Learning Progression**: Lumipat mula sa linear dokumentasyon tungo sa flexible chapter-based learning
- **Configuration Placement**: Inilipat ang configuration guide bilang Chapter 3 para sa mas maayos na learning flow
- **AI Content Integration**: Mas mahusay na integrasyon ng AI-specific na nilalaman sa buong learning journey
- **Production Content**: Advanced patterns na pinagsama sa Chapter 8 para sa enterprise learners

#### Pinabuti
- **User Experience**: Maliwanag na navigation breadcrumbs at chapter progression indicators
- **Accessibility**: Konsistent na navigation patterns para mas madaling pag-ikot sa kurso
- **Professional Presentation**: University-style course structure na angkop para sa akademiko at corporate training
- **Learning Efficiency**: Pinaikling oras para mahanap ang kaugnay na nilalaman sa pamamagitan ng pinahusay na organisasyon

#### Teknikal na Implementasyon
- **Navigation Headers**: Standardized chapter navigation sa higit sa 40 dokumento
- **Footer Navigation**: Konsistent na progression guidance at chapter completion indicators
- **Cross-Linking**: Komprehensibong internal linking system na kumokonekta sa mga kaugnay na konsepto
- **Chapter Mapping**: Mga template at halimbawa na malinaw na naka-ugnay sa learning objectives

#### Pagpapahusay ng Study Guide
- **📚 Komprehensibong Learning Objectives**: I-restrukturang study guide upang umayon sa 8-chapter system
- **🎯 Chapter-Based Assessment**: Bawat kabanata ay may partikular na learning objectives at praktikal na ehersisyo
- **📋 Progress Tracking**: Lingguhang learning schedule na may measurable outcomes at completion checklists
- **❓ Assessment Questions**: Mga tanong para sa pag-validate ng kaalaman sa bawat kabanata na may professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities na may real deployment scenarios at troubleshooting
- **📊 Skill Progression**: Maliwanag na pag-unlad mula sa mga pangunahing konsepto patungo sa enterprise patterns na may career development focus
- **🎓 Certification Framework**: Professional development outcomes at community recognition system
- **⏱️ Timeline Management**: Istrukturang 10-week learning plan na may milestone validation

### [v3.1.0] - 2025-09-17

#### Pinalakas na Multi-Agent AI Solutions
**Pinapabuti ng bersyon na ito ang multi-agent retail solution na may mas mahusay na pag-name ng agent at pinahusay na dokumentasyon.**

#### Binago
- **Multi-Agent Terminology**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pag-unawa
- **Agent Architecture**: In-update ang lahat ng dokumentasyon, ARM templates, at code examples upang gumamit ng konsistent na "Customer agent" na pagpangalan
- **Configuration Examples**: Modernisado ang mga pattern ng agent configuration na may na-update na konbensiyon ng pangalan
- **Documentation Consistency**: Tiniyak na lahat ng references ay gumagamit ng propesyonal at deskriptibong mga pangalan ng agent

#### Pinalakas
- **ARM Template Package**: Na-update ang retail-multiagent-arm-template na may mga reference sa Customer agent
- **Architecture Diagrams**: Na-refresh ang mga Mermaid diagram na may na-update na pangalan ng agent
- **Code Examples**: Ang mga Python class at mga halimbawa ng implementasyon ay gumagamit na ngayon ng pangalang CustomerAgent
- **Environment Variables**: Na-update ang lahat ng deployment script upang gumamit ng CUSTOMER_AGENT_NAME konbensiyon

#### Improved
- **Developer Experience**: Mas malinaw na mga papel at responsibilidad ng agent sa dokumentasyon
- **Production Readiness**: Mas mahusay na pag-align sa mga konbensiyon sa pagpangalan ng enterprise
- **Learning Materials**: Mas madaling maunawaan na pagtatalaga ng pangalan ng agent para sa layuning pang-edukasyon
- **Template Usability**: Pinadaling pag-unawa sa mga function ng agent at mga pattern ng deployment

#### Technical Details
- Na-update ang mga Mermaid architecture diagram na may mga reference sa CustomerAgent
- Pinalitan ang mga pangalan ng klase na CoraAgent ng CustomerAgent sa mga halimbawa ng Python
- Binago ang mga ARM template JSON configuration upang gumamit ng agent type na "customer"
- Na-update ang mga environment variable mula CORA_AGENT_* papuntang CUSTOMER_AGENT_* patterns
- Na-refresh ang lahat ng mga deployment command at mga container configuration

### [v3.0.0] - 2025-09-12

#### Major Changes - Pokus sa AI Developer at Integrasyon ng Microsoft Foundry
**Ang bersyong ito ay nagbabago ng repositoryo sa isang komprehensibong mapagkukunan ng pagkatuto na nakatuon sa AI na may integrasyon ng Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Kumpletong muling-istruktura na inuuna ang mga AI developer at mga inhinyero
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa mga serbisyo ng Microsoft Foundry
- **AI Model Deployment Patterns**: Detalyadong gabay na sumasaklaw sa pagpili ng modelo, konfigurasyon, at mga estratehiya para sa production deployment
- **AI Workshop Lab**: 2-3 oras na hands-on workshop para sa pag-convert ng mga AI application sa mga solusyong maide-deploy gamit ang AZD
- **Production AI Best Practices**: Mga pattern na handa para sa enterprise para sa pag-scale, monitoring, at seguridad ng mga AI workload
- **AI-Specific Troubleshooting Guide**: Komprehensibong troubleshooting para sa Microsoft Foundry Models, Cognitive Services, at mga isyu sa AI deployment
- **AI Template Gallery**: Tampok na koleksyon ng mga Microsoft Foundry template na may mga rating ng komplikasyon
- **Workshop Materials**: Kumpletong istruktura ng workshop na may mga hands-on lab at mga materyales na sanggunian

#### Enhanced
- **README Structure**: Nakatuon sa AI developer na may 45% data ng interes ng komunidad mula sa Microsoft Foundry Discord
- **Learning Paths**: Nakalaang landas para sa AI developer kasabay ng mga tradisyonal na landas para sa mga estudyante at DevOps engineer
- **Template Recommendations**: Mga tampok na AI template kasama ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Community Integration**: Pinalawak na suporta ng Discord community na may AI-specific na mga channel at talakayan

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific na awtentikasyon at mga security na konfigurasyon
- **Cost Optimization**: Pagsubaybay ng paggamit ng token at mga kontrol sa badyet para sa mga AI workload
- **Multi-Region Deployment**: Mga estratehiya para sa global na deployment ng mga AI application
- **Performance Monitoring**: AI-specific na mga metric at integrasyon ng Application Insights

#### Documentation Quality
- **Linear Course Structure**: Lohikal na pag-unlad mula beginner hanggang advanced na mga pattern ng AI deployment
- **Validated URLs**: Lahat ng external na repository link ay na-verify at naa-access
- **Complete Reference**: Lahat ng internal na link ng dokumentasyon ay na-validate at gumagana
- **Production Ready**: Mga pattern ng enterprise deployment na may mga halimbawa mula sa totoong mundo

### [v2.0.0] - 2025-09-09

#### Malalaking Pagbabago - Pag-restructure ng Repository at Propesyonal na Pagpapahusay
**Ang bersyong ito ay kumakatawan sa makabuluhang overhaul ng istruktura ng repositoryo at presentasyon ng nilalaman.**

#### Added
- **Structured Learning Framework**: Lahat ng pahina ng dokumentasyon ngayon ay may seksyon na Introduction, Learning Goals, at Learning Outcomes
- **Navigation System**: Idinagdag ang mga link na Previous/Next lesson sa buong dokumentasyon para sa ginabay na pag-unlad ng pagkatuto
- **Study Guide**: Komprehensibong study-guide.md na may learning objectives, practice exercises, at assessment materials
- **Professional Presentation**: Tinanggal ang lahat ng emoji icons para sa mas magandang accessibility at propesyonal na anyo
- **Enhanced Content Structure**: Pinabuting organisasyon at daloy ng mga materyales sa pagkatuto

#### Changed
- **Documentation Format**: Inayos at pinantay-pantay ang lahat ng dokumentasyon na may pare-parehong istrukturang nakatuon sa pagkatuto
- **Navigation Flow**: Ipinatupad ang lohikal na pag-unlad sa lahat ng materyales sa pagkatuto
- **Content Presentation**: Tinanggal ang mga pang-dekorasyong elemento pabor sa malinaw at propesyonal na pag-format
- **Link Structure**: Na-update ang lahat ng internal na link upang suportahan ang bagong navigation system

#### Improved
- **Accessibility**: Tinanggal ang pag-depende sa emoji para sa mas mahusay na compatibility sa screen reader
- **Professional Appearance**: Malinis, akademikong estilo ng presentasyon na angkop para sa enterprise learning
- **Learning Experience**: Istrakturadong pamamaraan na may malinaw na mga layunin at kinalabasan para sa bawat leksyon
- **Content Organization**: Mas maayos na lohikal na daloy at koneksyon sa pagitan ng mga magkaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Initial Release - Komprehensibong AZD Learning Repository

#### Added
- **Pangunahing Istruktura ng Dokumentasyon**
  - Kumpletong serye ng gabay sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga mapagkukunan para sa troubleshooting at mga gabay sa debugging
  - Mga tool at pamamaraan para sa pre-deployment na pagpapatunay

- **Module ng Pagsisimula**
  - AZD Basics: Pangunahing konsepto at terminolohiya
  - Installation Guide: Mga tagubilin sa pag-setup ayon sa platform
  - Configuration Guide: Pag-setup ng environment at awtentikasyon
  - First Project Tutorial: Hakbang-hakbang na hands-on na pagkatuto

- **Module ng Deployment at Provisioning**
  - Deployment Guide: Kompletong dokumentasyon ng workflow
  - Provisioning Guide: Infrastructure as Code gamit ang Bicep
  - Pinaka-mabubuting praktis para sa production deployments
  - Mga pattern ng arkitekturang multi-service

- **Module ng Pre-deployment Validation**
  - Capacity Planning: Pagpapatunay ng availability ng Azure resource
  - SKU Selection: Komprehensibong gabay sa service tier
  - Pre-flight Checks: Mga automated validation script (PowerShell at Bash)
  - Mga tool para sa pagtatantya ng gastos at pagpaplano ng badyet

- **Module ng Troubleshooting**
  - Common Issues: Madalas na mga problema at solusyon
  - Debugging Guide: Sistematikong mga metodolohiya sa troubleshooting
  - Mga advanced na teknik at tool sa pag-diagnose
  - Pagsubaybay ng performance at optimisasyon

- **Mga Pinagkukunan at Sanggunian**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mahahalagang command
  - Glossary: Komprehensibong kahulugan ng terminolohiya at mga acronym
  - FAQ: Detalyadong mga sagot sa karaniwang mga tanong
  - Mga link sa external na mga pinagkukunan at koneksyon sa komunidad

- **Mga Halimbawa at Template**
  - Halimbawa ng Simpleng Web Application
  - Template para sa deployment ng Static Website
  - Konfigurasyon ng Container Application
  - Mga pattern ng integrasyon ng database
  - Mga halimbawa ng arkitekturang microservices
  - Mga implementasyon ng serverless function

#### Features
- **Multi-Platform Support**: Mga gabay sa pag-install at konfigurasyon para sa Windows, macOS, at Linux
- **Multiple Skill Levels**: Nilalaman na dinisenyo para sa mga estudyante hanggang sa mga propesyonal na developer
- **Practical Focus**: Mga hands-on na halimbawa at mga sitwasyon mula sa totoong buhay
- **Comprehensive Coverage**: Mula sa mga pangunahing konsepto hanggang sa advanced na mga pattern ng enterprise
- **Security-First Approach**: Isinama ang mga pinakamahusay na praktis sa seguridad sa kabuuan
- **Cost Optimization**: Gabay para sa cost-effective na deployment at pamamahala ng resources

#### Documentation Quality
- **Detailed Code Examples**: Praktikal, nasubok na mga sample ng code
- **Step-by-Step Instructions**: Malinaw, magagawang sundin na mga gabay
- **Comprehensive Error Handling**: Troubleshooting para sa mga karaniwang isyu
- **Best Practices Integration**: Mga pamantayan ng industriya at mga rekomendasyon
- **Version Compatibility**: Napapanahon sa pinakabagong serbisyo ng Azure at mga feature ng azd

## Mga Planadong Hinaharap na Pagpapahusay

### Version 3.1.0 (Planned)
#### Paglawak ng AI Platform
- **Multi-Model Support**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at custom na mga modelo
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Advanced RAG Patterns**: Mga pagpipilian ng vector database lampas sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinalawak na monitoring para sa performance ng modelo, paggamit ng token, at kalidad ng tugon

#### Developer Experience
- **VS Code Extension**: Pinagsamang karanasan sa pag-develop ng AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Pagbuo ng AZD template na tinulungan ng AI
- **Interactive Tutorials**: Hands-on na coding exercise na may automated validation para sa mga AI na senaryo
- **Video Content**: Mga karagdagang video tutorial para sa mga visual learner na nakatutok sa AI deployments

### Version 4.0.0 (Planned)
#### Mga Pattern ng Enterprise AI
- **Governance Framework**: Pamamahala ng AI model, pagsunod, at mga audit trail
- **Multi-Tenant AI**: Mga pattern para sa pagseserbisyo sa maraming customer na may hiwalay na AI services
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga pattern ng multi-cloud at hybrid deployment para sa mga AI workload

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration gamit ang Azure Machine Learning pipelines
- **Advanced Security**: Mga zero-trust pattern, private endpoints, at advanced threat protection
- **Performance Optimization**: Advanced tuning at mga estratehiya sa pag-scale para sa high-throughput AI application
- **Global Distribution**: Mga pattern sa content delivery at edge caching para sa AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Mga Iminungkahing Dagdag - Ngayon Naipatupad sa v3.0.0
- ✅ **AI-Focused Content**: Komprehensibong integrasyon ng Microsoft Foundry (Nakumpleto)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Nakumpleto)
- ✅ **Advanced Security Module**: AI-specific na mga pattern ng seguridad (Nakumpleto)
- ✅ **Performance Optimization**: Mga estratehiya sa tuning ng AI workload (Nakumpleto)

### Version 2.1.0 (Planned) - Bahagyang Naipatupad sa v3.0.0
#### Maliit na Pagpapahusay - Ilan ang Nakumpleto sa Kasalukuyang Release
- ✅ **Additional Examples**: Mga scenario ng AI-focused deployment (Nakumpleto)
- ✅ **Extended FAQ**: Mga AI-specific na tanong at troubleshooting (Nakumpleto)
- **Tool Integration**: Pinalawak na mga gabay sa integrasyon ng IDE at editor
- ✅ **Monitoring Expansion**: AI-specific na monitoring at mga pattern ng alerting (Nakumpleto)

#### Nakatakdang Ilagay pa Rin sa Hinaharap na Release
- **Mobile-Friendly Documentation**: Responsive na disenyo para sa pagkatuto sa mobile
- **Offline Access**: Mga dokumentong pwedeng i-download na package
- **Enhanced IDE Integration**: VS Code extension para sa AZD + AI workflows
- **Community Dashboard**: Mga real-time na metrics ng komunidad at pagsubaybay ng kontribusyon

## Pag-aambag sa Changelog

### Pag-uulat ng mga Pagbabago
Kapag nag-aambag sa repositoryong ito, tiyaking kasama sa mga entry sa changelog ang mga sumusunod:

1. **Version Number**: Sundin ang semantic versioning (major.minor.patch)
2. **Date**: Petsa ng release o update sa format na YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Maiksing paglalarawan ng mga nagbago
5. **Impact Assessment**: Paano ang mga pagbabago ay makakaapekto sa mga umiiral na user

### Mga Kategorya ng Pagbabago

#### Idinagdag
- Mga bagong tampok, dokumentasyon na seksyon, o kakayahan
- Mga bagong halimbawa, template, o mapagkukunang pampagkatuto
- Karagdagang mga tool, script, o utility

#### Binago
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga update para mapabuti ang kalinawan o katumpakan
- Muling-istruktura ng nilalaman o organisasyon

#### Pinapawalang-bisa
- Mga tampok o pamamaraan na unti-unting tinatanggal
- Mga seksyon ng dokumentasyon na nakatakdang alisin
- Mga pamamaraan na may mas mahusay na mga alternatibo

#### Tinanggal
- Mga tampok, dokumentasyon, o halimbawa na hindi na nauugnay
- Luma na impormasyon o mga pinapawalang-bisang pamamaraan
- Mga nilalamang paulit-ulit o pinagsama

#### Naayos
- Mga pagwawasto sa mga error sa dokumentasyon o code
- Pagresolba ng mga iniulat na isyu o problema
- Pagpapabuti sa katumpakan o functionality

#### Seguridad
- Mga pagpapabuti o pag-aayos na may kaugnayan sa seguridad
- Mga update sa mga pinakamahusay na praktis sa seguridad
- Pagresolba ng mga kahinaan sa seguridad

### Mga Patnubay sa Semantic Versioning

#### Major Version (X.0.0)
- Mga breaking change na nangangailangan ng aksyon mula sa user
- Makabuluhang muling-istruktura ng nilalaman o organisasyon
- Mga pagbabago na nagbabago sa pangunahing pamamaraan o metodolohiya

#### Minor Version (X.Y.0)
- Mga bagong tampok o dagdag na nilalaman
- Mga pagpapahusay na nagpapanatili ng backward compatibility
- Karagdagang mga halimbawa, tool, o mapagkukunan

#### Patch Version (X.Y.Z)
- Pag-aayos ng bugs at mga pagwawasto
- Maliit na pagpapabuti sa umiiral na nilalaman
- Mga paglilinaw at maliliit na pagpapahusay

## Feedback ng Komunidad at Mga Mungkahi

Aktibo naming hinihikayat ang feedback ng komunidad upang mapabuti ang mapagkunang ito para sa pagkatuto:

### Paano Magbigay ng Feedback
- **GitHub Issues**: I-report ang mga problema o magmungkahi ng mga pagpapabuti (Malugod na tinatanggap ang mga AI-specific na isyu)
- **Discord Discussions**: Ibahagi ang mga ideya at makipag-ugnayan sa komunidad ng Microsoft Foundry
- **Pull Requests**: Mag-ambag ng direktang mga pagpapabuti sa nilalaman, lalo na sa mga AI template at gabay
- **Microsoft Foundry Discord**: Lumahok sa #Azure channel para sa mga diskusyon tungkol sa AZD + AI
- **Community Forums**: Lumahok sa mas malawak na mga diskusyon ng Azure developer

### Mga Kategorya ng Feedback
- **AI Content Accuracy**: Pagwawasto sa impormasyon ng integrasyon ng serbisyo ng AI at deployment
- **Learning Experience**: Mga mungkahi para sa pinahusay na daloy ng pagkatuto ng AI developer
- **Missing AI Content**: Mga kahilingan para sa karagdagang AI template, pattern, o halimbawa
- **Accessibility**: Mga pagpapabuti para sa magkakaibang pangangailangan sa pagkatuto
- **AI Tool Integration**: Mga mungkahi para sa mas mahusay na integrasyon ng AI development workflow
- **Production AI Patterns**: Mga kahilingan para sa mga pattern ng enterprise AI deployment

### Pangako sa Pagtugon
- **Issue Response**: Sa loob ng 48 oras para sa mga iniulat na problema
- **Feature Requests**: Ebalwasyon sa loob ng isang linggo
- **Community Contributions**: Review sa loob ng isang linggo
- **Security Issues**: Agarang prayoridad na may pinabilis na tugon

## Iskedyul ng Pagpapanatili

### Regular na Mga Update
- **Monthly Reviews**: Katumpakan ng nilalaman at pag-validate ng mga link
- **Quarterly Updates**: Malalaking dagdag at pagpapabuti ng nilalaman
- **Semi-Annual Reviews**: Komprehensibong muling-istruktura at pagpapahusay
- **Annual Releases**: Malalaking update ng bersyon na may makabuluhang pagpapabuti

### Pagsubaybay at Pagtiyak ng Kalidad
- **Automated Testing**: Regular na pag-validate ng mga halimbawa ng code at mga link
- **Community Feedback Integration**: Regular na pagsasama ng mga mungkahi ng user
- **Technology Updates**: Pag-align sa pinakabagong serbisyo ng Azure at mga release ng azd
- **Accessibility Audits**: Regular na pagsusuri para sa mga prinsipyong inclusive na disenyo

## Patakaran sa Suporta ng Bersyon

### Suporta para sa Kasalukuyang Bersyon
- **Pinakabagong Pangunahing Bersyon**: Ganap na suporta na may regular na mga pag-update
- **Nakaraang Pangunahing Bersyon**: Mga pag-update sa seguridad at kritikal na pag-aayos sa loob ng 12 buwan
- **Mga Lumang Bersyon**: Suporta mula sa komunidad lamang, walang opisyal na pag-update

### Patnubay sa Migrasyon
Kapag nailabas ang mga pangunahing bersyon, nagbibigay kami ng:
- **Mga Gabay sa Migrasyon**: Mga sunud-sunod na tagubilin para sa paglipat
- **Mga Tala sa Pagkakatugma**: Mga detalye tungkol sa mga pagbabago na makakasira ng pagkakatugma
- **Suporta sa Mga Kasangkapan**: Mga script o utility na tumutulong sa migrasyon
- **Suporta ng Komunidad**: Nakatuong mga forum para sa mga tanong tungkol sa migrasyon

---

**Nabigasyon**
- **Nakaraang Aralin**: [Gabay sa Pag-aaral](resources/study-guide.md)
- **Susunod na Aralin**: Bumalik sa [Pangunahing README](README.md)

**Manatiling Na-update**: Subaybayan ang repositoryong ito para sa mga abiso tungkol sa mga bagong bersyon at mahahalagang pag-update sa mga materyales sa pag-aaral.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling‑tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->