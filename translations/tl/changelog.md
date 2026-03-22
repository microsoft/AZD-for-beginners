# Changelog - AZD Para sa Mga Nagsisimula

## Panimula

Itong changelog ay nagdodokumento ng lahat ng mga mahahalagang pagbabago, pag-update, at pagpapabuti sa AZD For Beginners repositoryo. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinananatili ang talaang ito upang tulungan ang mga gumagamit na maunawaan kung ano ang nagbago sa pagitan ng mga bersyon.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagrepaso ng changelog na ito, ikaw ay:
- Mananatiling may kaalaman tungkol sa mga bagong tampok at dagdag na nilalaman
- Maiintindihan ang mga pagpapabuti na ginawa sa umiiral na dokumentasyon
- Masusubaybayan ang mga pag-aayos ng bug at koreksyon upang matiyak ang katumpakan
- Maaalalayan ang pag-unlad ng mga materyales sa pagkatuto sa paglipas ng panahon

## Mga Kinalabasan ng Pagkatuto

Pagkatapos suriin ang mga entry ng changelog, magagawa mong:
- Tukuyin ang bagong nilalaman at mga mapagkukunan na magagamit para sa pagkatuto
- Maunawaan kung aling mga seksyon ang na-update o na-enhance
- Planuhin ang iyong landas sa pagkatuto batay sa pinaka-kasalukuyang mga materyales
- Magbigay ng puna at mga mungkahi para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Idinagdag ng bersyong ito ang saklaw ng `azd ai`, `azd extension`, at `azd mcp` na mga command sa lahat ng mga kabanata na may kinalaman sa AI, inayos ang mga sirang link at deprecated na code sa agents.md, in-update ang cheat sheet, at inayos ang Seksyon ng Example Templates na may mga na-validate na deskripsyon at bagong Azure AI AZD templates.**

#### Idinagdag
- **🤖 Saklaw ng AZD AI CLI** sa 7 file (noon ay nasa Kabanata 8 lamang):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagong seksyong "Extensions and AI Commands" na nagpapakilala ng `azd extension`, `azd ai agent init`, at `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsyon 4: `azd ai agent init` na may talahanayan ng paghahambing (template vs manifest na paraan)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Mga subseksyong "AZD Extensions for Foundry" at "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Ang Quick Start ngayon ay nagpapakita ng parehong template at manifest-based na mga landas ng deployment
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Ang Deploy na seksyon ngayon ay may kasamang `azd ai agent init` na opsyon
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseksyong "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bagong seksyong "AI & Extensions Commands" na may `azd extension`, `azd ai agent init`, `azd mcp`, at `azd infra generate`
- **📦 Bagong AZD AI example templates** sa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat gamit ang Blazor WebAssembly, Semantic Kernel, at suporta sa voice chat
  - **azure-search-openai-demo-java** — Java RAG chat gamit ang Langchain4J na may mga opsyon sa ACA/AKS deployment
  - **contoso-creative-writer** — Multi-agent creative writing app gamit ang Azure AI Agent Service, Bing Grounding, at Prompty
  - **serverless-chat-langchainjs** — Serverless RAG gamit ang Azure Functions + LangChain.js + Cosmos DB na may Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator na may admin portal, Teams integration, at mga opsyon sa PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app na may mga server sa .NET, Python, Java, at TypeScript
  - **azd-ai-starter** — Minimal na Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Sanggunian sa [kahanga-hangang gallery ng AZD AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Inayos
- **🔗 agents.md navigation**: Ang Previous/Next na mga link ay ngayon tumutugma sa pagkakasunud-sunod ng mga lesson sa Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` inayos sa `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Pinalitan ang `opencensus` ng `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Inilipat ang `max_tokens` mula sa `create_agent()` papunta sa `create_run()` bilang `max_completion_tokens`
- **🔢 agents.md token counting**: Pinalitan ang magaspang na estimate na `len//4` ng `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Inayos ang mga serbisyo mula sa "Cognitive Search + App Service" papuntang "Azure AI Search + Azure Container Apps" (nagbago ang default host Okt 2024)
- **contoso-chat**: In-update ang deskripsyon upang tukuyin ang Azure AI Foundry + Prompty, na tumutugma sa aktuwal na pamagat at tech stack ng repo

#### Tinanggal
- **ai-document-processing**: Tinanggal ang hindi gumaganang sanggunian ng template (ang repo ay hindi pampublikong naa-access bilang isang AZD template)

#### Pinabuti
- **📝 agents.md exercises**: Ang Exercise 1 ngayon ay nagpapakita ng inaasahang output at hakbang na `azd monitor`; ang Exercise 2 ay nagsasama ng buong `FunctionTool` registration code; ang Exercise 3 ay pinalitan ang malabong gabay ng konkreto `prepdocs.py` na mga utos
- **📚 agents.md resources**: In-update ang mga link ng dokumentasyon sa kasalukuyang Azure AI Agent Service docs at quickstart
- **📋 agents.md Next Steps table**: Idinagdag ang AI Workshop Lab link para sa kumpletong saklaw ng kabanata

#### Mga Binagong File
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Pagpapahusay ng Navigation ng Kurso
**Pinapahusay ng bersyong ito ang README.md chapter navigation gamit ang pinahusay na format ng talahanayan.**

#### Binago
- **Course Map Table**: Pinagyaman na may direktang mga link ng lesson, pagtatantya ng tagal, at mga rating ng pagiging kumplikado
- **Folder Cleanup**: Tinanggal ang mga dobleng lumang folder (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Lahat ng 21+ internal na mga link sa Course Map table ay na-verify

### [v3.16.0] - 2026-02-05

#### Mga Pag-update sa Pangalan ng Produkto
**Ina-update ng bersyong ito ang mga sanggunian ng produkto ayon sa kasalukuyang branding ng Microsoft.**

#### Binago
- **Microsoft Foundry → Microsoft Foundry**: Lahat ng sanggunian ay na-update sa mga non-translation na file
- **Azure AI Agent Service → Foundry Agents**: In-update ang pangalan ng serbisyo upang i-reflect ang kasalukuyang branding

#### Mga Binagong File
- `README.md` - Pangunahing landing page ng kurso
- `changelog.md` - Kasaysayan ng bersyon
- `course-outline.md` - Istruktura ng kurso
- `docs/chapter-02-ai-development/agents.md` - Gabay ng AI agents
- `examples/README.md` - Dokumentasyon ng mga halimbawa
- `workshop/README.md` - Landing page ng workshop
- `workshop/docs/index.md` - Index ng workshop
- `workshop/docs/instructions/*.md` - Lahat ng mga instruction file ng workshop

---

### [v3.15.0] - 2026-02-05

#### Malaking Pag-istruktura ng Repositoryo: Mga Pangalan ng Folder na Batay sa Kabanata
**Inaayos ng bersyong ito ang dokumentasyon sa mga dedikadong folder ng kabanata para sa mas malinaw na navigation.**

#### Pagpapangalan ng Folder
Ang mga lumang folder ay pinalitan ng mga folder na may numero ng kabanata:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Idinagdag: `docs/chapter-05-multi-agent/`

#### Migrasyon ng File
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
- **📚 Mga README ng Kabanata**: Nilikha ang README.md sa bawat chapter folder na may:
  - Mga layunin sa pagkatuto at tagal
  - Talahanayan ng mga lesson na may mga deskripsyon
  - Mga Quick start na utos
  - Navigation sa iba pang mga kabanata

#### Binago
- **🔗 In-update ang lahat ng internal na link**: 78+ path na na-update sa buong dokumentasyon
- **🗺️ Pangunahing README.md**: In-update ang Course Map sa bagong estruktura ng kabanata
- **📝 examples/README.md**: In-update ang mga cross-reference sa mga folder ng kabanata

#### Tinanggal
- Lumang istruktura ng folder (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Pag-istruktura ng Repositoryo: Navigation ng Kabanata
**Idinagdag ng bersyong ito ang mga chapter navigation README files (napalitan ng v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Bagong Gabay sa AI Agents
**Idinagdag ng bersyong ito ang isang komprehensibong gabay para sa pag-deploy ng AI agents gamit ang Azure Developer CLI.**

#### Idinagdag
- **🤖 docs/microsoft-foundry/agents.md**: Kumpletong gabay na sumasaklaw sa:
  - Ano ang AI agents at paano sila naiiba mula sa mga chatbot
  - Tatlong quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Mga pattern ng architecture ng agent (single agent, RAG, multi-agent)
  - Configuration ng tool at customizations
  - Monitoring at pagtatala ng metrics
  - Mga konsiderasyon sa gastos at optimization
  - Karaniwang mga scenario ng troubleshooting
  - Tatlong hands-on na ehersisyo na may success criteria

#### Istruktura ng Nilalaman
- **Introduksyon**: Mga konsepto ng agent para sa mga nagsisimula
- **Quick Start**: I-deploy ang mga agent gamit ang `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Mga visual diagram ng mga pattern ng agent
- **Configuration**: Setup ng tool at mga environment variable
- **Monitoring**: Integrasyon ng Application Insights
- **Exercises**: Mga progressive na hands-on na pag-aaral (20-45 minuto bawat isa)

---

### [v3.12.0] - 2026-02-05

#### Pag-update ng DevContainer Environment
**Ina-update ng bersyong ito ang configuration ng development container na may modernong mga tool at mas magagandang default para sa karanasan sa pag-aaral ng AZD.**

#### Binago
- **🐳 Base Image**: In-upgrade mula sa `python:3.12-bullseye` papuntang `python:3.12-bookworm` (pinakabagong Debian stable)
- **📛 Pangalan ng Container**: Pinalitan mula sa "Python 3" papuntang "AZD for Beginners" para sa kalinawan

#### Idinagdag
- **🔧 Mga Bagong Tampok ng Dev Container**:
  - `azure-cli` na may naka-enable na suporta para sa Bicep
  - `node:20` (LTS na bersyon para sa mga template ng AZD)
  - `github-cli` para sa pamamahala ng template
  - `docker-in-docker` para sa deployments ng container app

- **🔌 Port Forwarding**: Mga paunang-nakonpigurang port para sa karaniwang pag-unlad:
  - 8000 (Paunang-tanaw ng MkDocs)
  - 3000 (mga web app)
  - 5000 (Python Flask)
  - 8080 (mga API)

- **🧩 Mga Bagong Extension ng VS Code**:
  - `ms-python.vscode-pylance` - Pinahusay na IntelliSense para sa Python
  - `ms-azuretools.vscode-azurefunctions` - Suporta sa Azure Functions
  - `ms-azuretools.vscode-docker` - Suporta sa Docker
  - `ms-azuretools.vscode-bicep` - Suporta sa wika ng Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pamamahala ng Azure resource
  - `yzhang.markdown-all-in-one` - Pag-edit ng Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Suporta sa Mermaid diagram
  - `redhat.vscode-yaml` - Suporta sa YAML (para sa azure.yaml)
  - `eamodio.gitlens` - Visualisasyon ng Git
  - `mhutchie.git-graph` - Kasaysayan ng Git

- **⚙️ Mga Setting ng VS Code**: Idinagdag ang mga default na setting para sa Python interpreter, pag-format kapag nagsave, at pagtatanggal ng whitespace

- **📦 Na-update na requirements-dev.txt**:
  - Idinagdag ang MkDocs minify plugin
  - Idinagdag ang pre-commit para sa kalidad ng code
  - Idinagdag ang mga Azure SDK package (azure-identity, azure-mgmt-resource)

#### Naayos
- **Post-Create Command**: Ngayon sinisiguro ang pag-install ng AZD at Azure CLI kapag nagsimula ang container

---

### [v3.11.0] - 2026-02-05

#### Pagbabago ng README na Pinadali para sa mga Nagsisimula
**Ang bersyong ito ay malaki ang pagpapabuti sa README.md upang maging mas madaling ma-access para sa mga nagsisimula at nagdaragdag ng mahahalagang mapagkukunan para sa mga developer ng AI.**

#### Idinagdag
- **🆚 Azure CLI vs AZD Comparison**: Malinaw na paliwanag kung kailan gagamitin ang bawat tool na may mga praktikal na halimbawa
- **🌟 Awesome AZD Links**: Direktang mga link sa gallery ng mga template ng komunidad at mga mapagkukunang pang-kontribusyon:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Ambag ng komunidad
- **🎯 Quick Start Guide**: Pinasimpleng 3-hakbang na seksyon para sa pagsisimula (I-install → Mag-login → Mag-deploy)
- **📊 Experience-Based Navigation Table**: Malinaw na gabay kung saan magsisimula base sa karanasan ng developer

#### Binago
- **README Structure**: Inayos para sa progressive disclosure - pangunahing impormasyon muna
- **Introduction Section**: Muling sinulat upang ipaliwanag ang "The Magic of `azd up`" para sa mga ganap na nagsisimula
- **Removed Duplicate Content**: Inalis ang dobleng troubleshooting na seksyon
- **Troubleshooting Commands**: Inayos ang reference sa `azd logs` upang gumamit ng valid na `azd monitor --logs`

#### Naayos
- **🔐 Authentication Commands**: Idinagdag ang `azd auth login` at `azd auth logout` sa cheat-sheet.md
- **Invalid Command References**: Tinanggal ang natitirang `azd logs` mula sa README troubleshooting section

#### Mga Tala
- **Saklaw**: Mga pagbabago na inilapat sa main README.md at resources/cheat-sheet.md
- **Target Audience**: Mga pagbuti na partikular na nakatuon sa mga developer na bago sa AZD

---

### [v3.10.0] - 2026-02-05

#### Pag-update sa Katumpakan ng Mga Utos ng Azure Developer CLI
**Itong bersyon ay nagwawasto ng mga hindi umiiral na utos ng AZD sa buong dokumentasyon, tinitiyak na lahat ng halimbawa ng code ay gumagamit ng wastong sintaks ng Azure Developer CLI.**

#### Naayos
- **🔧 Non-Existent AZD Commands Removed**: Komprehensibong audit at pagwawasto ng mga invalid na utos:
  - `azd logs` (hindi umiiral) → pinalitan ng `azd monitor --logs` o Azure CLI alternatives
  - `azd service` subcommands (hindi umiiral) → pinalitan ng `azd show` at Azure CLI
  - `azd infra import/export/validate` (hindi umiiral) → tinanggal o pinalitan ng mga valid na alternatibo
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (hindi umiiral) → tinanggal
  - `azd provision --what-if/--rollback` flags (hindi umiiral) → in-update upang gumamit ng `--preview`
  - `azd config validate` (hindi umiiral) → pinalitan ng `azd config list`
  - `azd info`, `azd history`, `azd metrics` (hindi umiiral) → tinanggal

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Malaking pagbabago sa sanggunian ng mga utos
  - `docs/deployment/deployment-guide.md`: Inayos ang rollback at deployment strategies
  - `docs/troubleshooting/debugging.md`: Inayos ang mga seksyon ng log analysis
  - `docs/troubleshooting/common-issues.md`: In-update ang troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Inayos ang AZD debugging section
  - `docs/getting-started/azd-basics.md`: Inayos ang monitoring commands
  - `docs/getting-started/first-project.md`: In-update ang monitoring at debugging examples
  - `docs/getting-started/installation.md`: Inayos ang help at version examples
  - `docs/pre-deployment/application-insights.md`: Inayos ang mga command para sa pag-view ng logs
  - `docs/pre-deployment/coordination-patterns.md`: Inayos ang agent debugging commands

#### Binago
- **Rollback Strategies**: In-update ang dokumentasyon upang gumamit ng Git-based rollback (walang native rollback ang AZD)
- **Log Viewing**: Pinalitan ang mga reference sa `azd logs` ng `azd monitor --logs`, `azd monitor --live`, at mga Azure CLI command
- **Performance Section**: Tinanggal ang mga hindi umiiral na parallel/incremental deployment flags, nagbigay ng mga valid na alternatibo

#### Teknikal na Detalye
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Mga Tala
- **Verification**: Ang mga utos ay na-validate laban sa Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Pagtatapos ng Workshop at Pag-update ng Kalidad ng Dokumentasyon
**Tinapos ng bersyong ito ang mga interactive workshop module, inayos ang lahat ng sirang link sa dokumentasyon, at pinabuti ang pangkalahatang kalidad ng nilalaman para sa mga developer ng AI na gumagamit ng Microsoft AZD.**

#### Idinagdag
- **📝 CONTRIBUTING.md**: Bagong dokumento ng mga patnubay sa kontribusyon na may:
  - Malinaw na mga instruksiyon para sa pag-uulat ng mga isyu at pagsusumite ng mga pagbabago
  - Mga pamantayan sa dokumentasyon para sa bagong nilalaman
  - Mga gabay sa halimbawa ng code at mga convention sa commit message
  - Impormasyon sa pakikilahok ng komunidad

#### Nakumpleto
- **🎯 Workshop Module 7 (Wrap-up)**: Ganap na nakumpletong wrap-up module na may:
  - Komprehensibong buod ng mga natapos sa workshop
  - Seksyon ng mga pangunahing konseptong natutunan na sumasaklaw sa AZD, mga template, at Microsoft Foundry
  - Mga rekomendasyon para sa pagpapatuloy ng pag-aaral
  - Mga challenge exercise sa workshop na may rating ng kahirapan
  - Mga link para sa feedback ng komunidad at suporta

- **📚 Workshop Module 3 (Deconstruct)**: In-update ang mga learning objective na may:
  - Gabay sa pag-activate ng GitHub Copilot na may MCP servers
  - Pag-unawa sa folder structure ng AZD template
  - Mga pattern ng Infrastructure-as-code (Bicep) na organisasyon
  - Mga hands-on lab na instruksiyon

- **🔧 Workshop Module 6 (Teardown)**: Nakumpleto na may:
  - Mga layunin sa resource cleanup at cost management
  - Paggamit ng `azd down` para sa ligtas na pag-deprovision ng infra
  - Gabay sa pag-recover ng soft-deleted cognitive services
  - Mga bonus na prompt para sa GitHub Copilot at Azure Portal

#### Naayos
- **🔗 Pag-ayos ng mga Sirang Link**: Naresolba ang 15+ na sirang internal na link sa dokumentasyon:
  - `docs/ai-foundry/ai-model-deployment.md`: Naayos ang mga path patungo sa microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Naitama ang mga path ng ai-model-deployment.md at production-ai-practices.md
  - `docs/getting-started/first-project.md`: Pinalitan ang non-existent na cicd-integration.md ng deployment-guide.md
  - `examples/retail-scenario.md`: Naayos ang mga path sa FAQ at troubleshooting guide
  - `examples/container-app/microservices/README.md`: Naitama ang mga path sa course home at deployment guide
  - `resources/faq.md` at `resources/glossary.md`: In-update ang mga reference sa AI chapter
  - `course-outline.md`: Naayos ang mga reference sa instructor guide at AI workshop lab

- **📅 Workshop Status Banner**: In-update mula sa "Under Construction" tungo sa aktibong workshop status na may petsang February 2026

- **🔗 Workshop Navigation**: Naayos ang mga sirang navigation link sa workshop README.md na tumuturo sa non-existent na lab-1-azd-basics folder

#### Binago
- **Workshop Presentation**: Tinanggal ang "under construction" warning, ang workshop ay kumpleto na at handa nang gamitin
- **Navigation Consistency**: Tiniyak na lahat ng workshop module ay may tamang inter-module navigation
- **Learning Path References**: In-update ang mga cross-reference ng kabanata upang gumamit ng tamang microsoft-foundry paths

#### Napatunayan
- ✅ Lahat ng mga English markdown na file ay may wastong internal na mga link
- ✅ Kumpleto ang mga workshop module 0-7 na may mga learning objective
- ✅ Gumagana nang tama ang navigation sa pagitan ng mga kabanata at module
- ✅ Ang nilalaman ay angkop para sa mga developer ng AI na gumagamit ng Microsoft AZD
- ✅ Pinanatili ang beginner-friendly na wika at istraktura sa kabuuan
- ✅ Nagbibigay ng malinaw na gabay ang CONTRIBUTING.md para sa mga contributor ng komunidad

#### Teknikal na Implementasyon
- **Link Validation**: Automated PowerShell script ang nag-verify ng lahat ng .md internal na mga link
- **Content Audit**: Manu-manong pagrepaso ng pagkumpleto ng workshop at pagiging angkop para sa mga nagsisimula
- **Navigation System**: Ipinatupad ang magkakatugmang pattern ng navigation ng kabanata at module

#### Mga Tala
- **Saklaw**: Mga pagbabago na inilapat sa English na dokumentasyon lamang
- **Translations**: Hindi na-update ang mga translation folder sa bersyong ito (susunod ang automated translation sync)
- **Workshop Duration**: Ang kumpletong workshop ay nagbibigay na ngayon ng 3-4 na oras ng hands-on na pag-aaral

---

### [v3.8.0] - 2025-11-19

#### Advanced na Dokumentasyon: Monitoring, Security, at Multi-Agent Patterns
**Idinagdag ng bersyong ito ang komprehensibong A-grade na mga leksyon tungkol sa Application Insights integration, mga pattern ng authentication, at multi-agent coordination para sa production deployments.**

#### Idinagdag
- **📊 Application Insights Integration Lesson**: sa `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment na may automatic provisioning
  - Kumpletong Bicep templates para sa Application Insights + Log Analytics
  - Gumaganang Python na mga aplikasyon na may custom telemetry (1,200+ lines)
  - Mga pattern ng AI/LLM monitoring (Microsoft Foundry Models token/cost tracking)
  - 6 na Mermaid diagram (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercise (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng Kusto query at mga estratehiya sa cost optimization
  - Live metrics streaming at real-time na debugging
  - 40-50 minutong oras ng pag-aaral na may production-ready na mga pattern

- **🔐 Authentication & Security Patterns Lesson**: sa `docs/getting-started/authsecurity.md`:
  - 3 authentication pattern (connection strings, Key Vault, managed identity)
  - Kumpletong Bicep infrastructure templates para sa secure na deployments
  - Node.js application code na may Azure SDK integration
  - 3 kumpletong exercise (enable managed identity, user-assigned identity, Key Vault rotation)
  - Pinakamahusay na kasanayan sa seguridad at RBAC configurations
  - Gabay sa troubleshooting at analysis ng gastos
  - Production-ready na mga pattern para sa passwordless authentication

- **🤖 Multi-Agent Coordination Patterns Lesson**: sa `docs/pre-deployment/coordination-patterns.md`:
  - 5 coordination pattern (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong implementasyon ng orchestrator service (Python/Flask, 1,500+ lines)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Service Bus integration para sa message queuing
  - Cosmos DB state management para sa distributed systems
  - 6 na Mermaid diagram na nagpapakita ng agent interactions
  - 3 advanced exercise (timeout handling, retry logic, circuit breaker)
  - Breakdown ng gastos ($240-565/month) na may mga estratehiya sa optimization
  - Application Insights integration para sa monitoring

#### Pinahusay
- **Pre-deployment Chapter**: Ngayon ay naglalaman na ng komprehensibong monitoring at coordination patterns
- **Getting Started Chapter**: Pinalawak na may mga propesyonal na authentication pattern
- **Production Readiness**: Kumpletong coverage mula seguridad hanggang observability
- **Course Outline**: In-update upang i-reference ang mga bagong leksyon sa Chapters 3 at 6

#### Binago
- **Learning Progression**: Mas mabuting integrasyon ng seguridad at monitoring sa kabuuan ng kurso
- **Documentation Quality**: Pare-parehong A-grade na pamantayan (95-97%) sa mga bagong leksyon
- **Production Patterns**: Kumpletong end-to-end na coverage para sa enterprise deployments

#### Pinabuti
- **Karanasan ng Developer**: Maliwanag na landas mula sa development hanggang sa production monitoring
- **Pamantayan sa Seguridad**: Mga propesyonal na pattern para sa authentication at pamamahala ng mga secret
- **Observability**: Kumpletong Application Insights integration gamit ang AZD
- **Mga Workload ng AI**: Espesyal na monitoring para sa Microsoft Foundry Models at multi-agent na mga sistema

#### Na-validate
- ✅ Lahat ng aralin ay may kumpletong gumaganang code (hindi mga snippet)
- ✅ Mga mermaid diagram para sa visual na pagkatuto (19 kabuuan sa 3 aralin)
- ✅ Mga hands-on na ehersisyo na may mga hakbang sa beripikasyon (9 kabuuan)
- ✅ Production-ready na Bicep templates na maaaring i-deploy gamit ang `azd up`
- ✅ Pagsusuri ng gastos at mga estratehiya sa optimisasyon
- ✅ Mga gabay sa troubleshooting at pinakamahusay na kasanayan
- ✅ Mga knowledge checkpoint na may mga utos para sa beripikasyon

#### Resulta ng Pagraranggo ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong gabay sa monitoring
- **docs/getting-started/authsecurity.md**: - Mga propesyonal na pattern sa seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Advanced na multi-agent na arkitektura
- **Pangkalahatang Bagong Nilalaman**: - Konsistent na mataas na pamantayan ng kalidad

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC pattern
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Pamamahala ng Gastos**: Mga strategy sa sampling, retention policies, kontrol sa budget

### [v3.7.0] - 2025-11-19

#### Mga Pagbuti sa Kalidad ng Dokumentasyon at Bagong Halimbawa ng Microsoft Foundry Models
**Pinahusay ng bersyong ito ang kalidad ng dokumentasyon sa buong repository at nagdagdag ng kumpletong halimbawa ng pag-deploy ng Microsoft Foundry Models na may gpt-4.1 chat interface.**

#### Idinagdag
- **🤖 Microsoft Foundry Models Chat Example**: Kumpletong gpt-4.1 deployment na may gumaganang implementasyon sa `examples/azure-openai-chat/`:
  - Kumpletong Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface na may conversation history
  - Key Vault integration para sa secure na pag-iimbak ng API key
  - Pagsubaybay sa token usage at pagtatantiya ng gastos
  - Rate limiting at error handling
  - Komprehensibong README na may 35-45 minutong gabay sa deployment
  - 11 production-ready na file (Bicep templates, Python app, configuration)
- **📚 Mga Ehersisyo sa Dokumentasyon**: Nagdagdag ng hands-on practice exercises sa configuration guide:
  - Ehersisyo 1: Multi-environment configuration (15 minuto)
  - Ehersisyo 2: Secret management practice (10 minuto)
  - Malinaw na success criteria at mga hakbang sa beripikasyon
- **✅ Pag-beripika ng Deployment**: Nagdagdag ng seksyon ng beripikasyon sa deployment guide:
  - Mga pamamaraan ng health check
  - Checklist ng success criteria
  - Inaasahang outputs para sa lahat ng deployment na utos
  - Quick reference sa troubleshooting

#### Pinahusay
- **examples/README.md**: In-update sa A-grade na kalidad (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng kaugnay na seksyon
  - In-update ang bilang ng lokal na halimbawa mula 3 hanggang 4
  - Idinagdag sa AI Application Examples table
  - In-integrate sa Quick Start para sa Intermediate Users
  - Idinagdag sa Microsoft Foundry Templates section
  - In-update ang Comparison Matrix at mga seksyon ng technology finding
- **Kalidad ng Dokumentasyon**: Pinahusay mula B+ (87%) → A- (92%) sa buong docs folder:
  - Idinagdag ang inaasahang outputs sa mga kritikal na halimbawa ng utos
  - Kasama ang mga hakbang sa beripikasyon para sa mga pagbabago sa configuration
  - Pinagyaman ang hands-on na pagkatuto gamit ang praktikal na mga ehersisyo

#### Binago
- **Learning Progression**: Mas mahusay na integrasyon ng mga AI example para sa mga intermediate na mag-aaral
- **Istruktura ng Dokumentasyon**: Mas actionable na mga ehersisyo na may malinaw na kinalabasan
- **Proseso ng Beripikasyon**: Tiyak na success criteria na idinagdag sa mga pangunahing workflow

#### Pinabuti
- **Karanasan ng Developer**: Ang deployment ng Microsoft Foundry Models ay ngayon tumatagal ng 35-45 minuto (kumpara sa 60-90 para sa mas kumplikadong alternatibo)
- **Transparency sa Gastos**: Malinaw na pagtatantiya ng gastos ($50-200/month) para sa Microsoft Foundry Models na halimbawa
- **Learning Path**: May malinaw na entry point para sa mga AI developer gamit ang azure-openai-chat
- **Pamantayan ng Dokumentasyon**: Konsistent na inaasahang outputs at mga hakbang sa beripikasyon

#### Na-validate
- ✅ Ang Microsoft Foundry Models na halimbawa ay ganap na gumagana gamit ang `azd up`
- ✅ Lahat ng 11 implementation file ay syntactically correct
- ✅ Ang mga instruksyon sa README ay tumutugma sa aktwal na karanasan ng deployment
- ✅ Na-update ang mga link ng dokumentasyon sa higit sa 8 lokasyon
- ✅ Tumpak na nirerepresenta ng examples index ang 4 lokal na halimbawa
- ✅ Walang duplicate na external links sa mga talahanayan
- ✅ Lahat ng navigation reference ay tama

#### Teknikal na Implementasyon
- **Arkitektura ng Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps pattern
- **Seguridad**: Handa na ang Managed Identity, mga secret sa Key Vault
- **Monitoring**: Application Insights integration
- **Pamamahala ng Gastos**: Pagsubaybay ng token at optimisasyon ng paggamit
- **Deployment**: Isang utos na `azd up` para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Malaking Update: Mga Halimbawa ng Container App Deployment
**Ipinakikilala ng bersyong ito ang komprehensibo, production-ready na mga halimbawa ng pag-deploy ng container application gamit ang Azure Developer CLI (AZD), na may kumpletong dokumentasyon at integrasyon sa learning path.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Mga bagong lokal na halimbawa sa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kumpletong overview ng containerized deployments, quick start, production, at advanced na mga pattern
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready na multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Pinakamahusay na Kasanayan**: Seguridad, monitoring, optimisasyon ng gastos, at CI/CD guidance para sa mga containerized workload
- **Mga Halimbawa ng Code**: Kumpletong `azure.yaml`, Bicep templates, at multi-language na implementasyon ng serbisyo (Python, Node.js, C#, Go)
- **Pagsubok at Troubleshooting**: End-to-end na mga senaryo ng test, mga utos para sa monitoring, gabay sa troubleshooting

#### Binago
- **README.md**: In-update upang i-feature at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: In-update upang i-highlight ang mga halimbawa ng container app, magdagdag ng comparison matrix entries, at i-update ang mga reference sa technology/architecture
- **Course Outline & Study Guide**: In-update upang i-referensya ang mga bagong halimbawa ng container app at deployment patterns sa mga kaugnay na kabanata

#### Na-validate
- ✅ Lahat ng bagong halimbawa ay maaaring i-deploy gamit ang `azd up` at sumusunod sa pinakamahusay na kasanayan
- ✅ Na-update ang cross-links at navigation sa dokumentasyon
- ✅ Sakop ng mga halimbawa ang mula beginner hanggang advanced na mga senaryo, kabilang ang production microservices

#### Tala
- **Saklaw**: Dokumentasyon at mga halimbawa sa Ingles lamang
- **Susunod na Hakbang**: Palawakin na may karagdagang advanced container pattern at CI/CD automation sa mga susunod na release

### [v3.5.0] - 2025-11-19

#### Pag-rebrand ng Produkto: Microsoft Foundry
**Ipinatupad ng bersyong ito ang komprehensibong pagpapalit ng pangalan ng produkto mula "Microsoft Foundry" patungo sa "Microsoft Foundry" sa lahat ng English na dokumentasyon, na sumasalamin sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Pag-update ng Pangalan ng Produkto**: Kumpletong rebranding mula "Microsoft Foundry" patungo sa "Microsoft Foundry"
  - In-update ang lahat ng reference sa English na dokumentasyon sa `docs/` folder
  - Pinalitan ang pangalan ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 content reference na na-update sa 7 dokumentong file

- **📁 Mga Pagbabago sa Estruktura ng Folder**:
  - `docs/ai-foundry/` pinalitan ng pangalan sa `docs/microsoft-foundry/`
  - Na-update lahat ng cross-reference upang ipakita ang bagong folder structure
  - Na-validate ang mga navigation link sa buong dokumentasyon

- **📄 Pagpapalit ng Pangalan ng mga File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Na-update lahat ng internal link upang i-referensya ang bagong filename

#### Na-update na Mga File
- **Chapter Documentation** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link na na-update
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name reference na na-update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasalukuyang gumagamit na ng Microsoft Foundry (mula sa naunang mga update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference na na-update (overview, community feedback, dokumentasyon)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference link na na-update
  - `docs/getting-started/first-project.md` - 2 chapter navigation link na na-update
  - `docs/getting-started/installation.md` - 2 next chapter link na na-update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference na na-update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link na na-update
  - `docs/troubleshooting/debugging.md` - 1 navigation link na na-update

- **Course Structure Files** (2 file):
  - `README.md` - 17 reference na na-update (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 reference na na-update (overview, learning objectives, chapter resources)

#### Na-validate
- ✅ Walang natitirang "ai-foundry" folder path reference sa English docs
- ✅ Walang natitirang "Microsoft Foundry" product name reference sa English docs
- ✅ Lahat ng navigation link ay gumagana sa bagong folder structure
- ✅ Natapos nang matagumpay ang pagpapalit ng pangalan ng file at folder
- ✅ Na-validate ang cross-reference sa pagitan ng mga kabanata

#### Tala
- **Saklaw**: Mga pagbabago ay inilapat lamang sa English na dokumentasyon sa `docs/` folder
- **Mga Salin**: Hindi na-update ang translation folders (`translations/`) sa bersyong ito
- **Workshop**: Hindi na-update ang materyales ng workshop (`workshop/`) sa bersyong ito
- **Mga Halimbawa**: Maaaring mayroon pang halimbawa na nagre-reference ng legacy naming (aayusin sa susunod na update)
- **External Links**: Nanatiling hindi nabago ang mga external URL at mga reference sa GitHub repository

#### Migration Guide para sa mga Kontribyutor
Kung mayroon kang mga lokal na branch o dokumentasyon na tumutukoy sa lumang istruktura:
1. I-update ang mga reference sa folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga reference sa file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Microsoft Foundry" → "Microsoft Foundry"
4. I-validate na gumagana pa rin ang lahat ng internal na link ng dokumentasyon

---

### [v3.4.0] - 2025-10-24

#### Mga Pagpapahusay sa Infrastructure Preview at Beripikasyon
**Ipinapakilala ng bersyong ito ang komprehensibong suporta para sa bagong Azure Developer CLI preview feature at pinapabuti ang karanasan ng workshop user.**

#### Idinagdag
- **🧪 azd provision --preview Feature Documentation**: Komprehensibong saklaw ng bagong capability ng infrastructure preview
  - Reference ng utos at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa provisioning guide na may mga use case at benepisyo
  - Pre-flight check integration para sa mas ligtas na beripikasyon ng deployment
  - Pag-update sa getting started guide na may safety-first na mga patakaran sa deployment
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapahiwatig ng workshop development status
  - Gradient na disenyo na may construction indicators para sa malinaw na komunikasyon sa gumagamit
  - Timestamp ng huling pag-update para sa transparency
  - Mobile-responsive na disenyo para sa lahat ng uri ng device

#### Pinahusay
- **Infrastructure Safety**: Ang preview functionality ay na-integrate sa buong deployment documentation
- **Pre-deployment Validation**: Ang automated scripts ngayon ay kasama na ang infrastructure preview testing
- **Developer Workflow**: In-update ang mga sequence ng utos para isama ang preview bilang best practice
- **Workshop Experience**: Malinaw na expectation ang itinakda para sa mga gumagamit tungkol sa status ng pag-develop ng nilalaman

#### Binago
- **Deployment Best Practices**: Inirerekomenda na ang preview-first workflow bilang kasalukuyang diskarte
- **Daloy ng Dokumentasyon**: Inilipat nang mas maaga sa proseso ng pagkatuto ang infrastructure validation
- **Presentasyon ng Workshop**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng pag-develop

#### Pinabuti
- **Safety-First Approach**: Maaaring beripikahin ang mga pagbabago sa infrastructure bago ang deployment
- **Pagkakatuwang ng Koponan**: Maaaring ibahagi ang mga resulta ng preview para sa review at approval
- **Kamulatang Gastos**: Mas malinaw na pagkaunawa sa gastos ng mga resource bago mag-provision
- **Pagbawas ng Panganib**: Nababawasan ang kabiguan sa deployment sa pamamagitan ng advance validation

#### Teknikal na Implementasyon
- **Multi-document Integration**: Na-dokumento ang preview feature sa 4 na key file
- **Command Patterns**: Konsistent na syntax at mga halimbawa sa buong dokumentasyon
- **Integrasyon ng Best Practice**: Kasama ang preview sa validation workflows at scripts
- **Visual Indicators**: Klarong marka ng BAGONG feature para sa discoverability

#### Infrastructure ng Workshop
- **Komunikasyon ng Status**: Propesyonal na HTML banner na may gradient styling
- **Karanasan ng Gumagamit**: Ang malinaw na status ng pag-develop ay pumipigil sa kalituhan
- **Propesyonal na Presentasyon**: Pinapanatili ang kredibilidad ng repository habang itinakda ang mga inaasahan
- **Transparency ng Timeline**: October 2025 bilang huling timestamp ng pag-update para sa pananagutan

### [v3.3.0] - 2025-09-24

#### Pinagyamang Mga Materyales ng Workshop at Interaktibong Karanasan sa Pagkatuto
**Ipinapakilala ng bersyong ito ang komprehensibong mga materyales ng workshop na may browser-based interactive guides at istrukturadong learning paths.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Karanasang workshop na tumatakbo sa browser na may kakayahan ng MkDocs preview
- **📝 Structured Workshop Instructions**: 7-hakbang na gabay na landas ng pagkatuto mula sa pagtuklas hanggang sa pagpapasadya
  - 0-Introduction: Pangkalahatang-ideya ng workshop at setup
  - 1-Select-AI-Template: Proseso ng pagtuklas at pagpili ng template
  - 2-Validate-AI-Template: Mga pamamaraan ng deployment at pag-validate
  - 3-Deconstruct-AI-Template: Pag-unawa sa arkitektura ng template
  - 4-Configure-AI-Template: Konfigurasyon at pag-customize
  - 5-Customize-AI-Template: Mga advanced na pagbabago at iterasyon
  - 6-Teardown-Infrastructure: Paglilinis at pamamahala ng mga resources
  - 7-Wrap-up: Buod at mga susunod na hakbang
- **🛠️ Workshop Tooling**: Konfigurasyon ng MkDocs na may Material theme para sa pinahusay na karanasan sa pagkatuto
- **🎯 Hands-On Learning Path**: 3-hakbang na metodolohiya (Pagtuklas → Pag-deploy → Pagpapasadya)
- **📱 GitHub Codespaces Integration**: Tuloy-tuloy na pagsasaayos ng development environment

#### Pinahusay
- **AI Workshop Lab**: Pinalawig na komprehensibong 2-3 oras na istrukturadong karanasan sa pagkatuto
- **Workshop Documentation**: Propesyonal na presentasyon na may navigasyon at mga visual na gabay
- **Learning Progression**: Maliwanag na sunod-sunod na gabay mula sa pagpili ng template hanggang sa production deployment
- **Developer Experience**: Integrated na tooling para sa mas maayos na mga workflow sa development

#### Pinabuti
- **Accessibility**: Interface na nasa browser na may search, copy functionality, at theme toggle
- **Self-Paced Learning**: Flexible na istruktura ng workshop na umaangkop sa iba't ibang bilis ng pagkatuto
- **Practical Application**: Mga totoong senaryo ng pag-deploy ng AI template
- **Community Integration**: Integrasyon ng Discord para sa suporta at kolaborasyon sa workshop

#### Workshop Features
- **Built-in Search**: Mabilis na paghahanap ng keyword at leksyon
- **Copy Code Blocks**: Hover-to-copy na functionality para sa lahat ng halimbawa ng code
- **Theme Toggle**: Suporta para sa dark/light mode ayon sa kagustuhan
- **Visual Assets**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Help Integration**: Direktang access sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Inilalagay ng bersyong ito ang isang komprehensibong chapter-based na istruktura ng pagkatuto na may pinahusay na navigasyon sa buong repositoryo.**

#### Added
- **📚 Chapter-Based Learning System**: Inayos ang buong kurso sa 8 progresibong learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Konsistent na navigation headers at footers sa lahat ng dokumentasyon
- **🎯 Progress Tracking**: Checklist ng pagkumpleto ng kurso at sistema ng pag-verify ng pagkatuto
- **🗺️ Learning Path Guidance**: Maliwanag na entry points para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference Navigation**: Mga kaugnay na kabanata at mga prerequisites na malinaw na naka-link

#### Pinahusay
- **README Structure**: Binago upang maging isang istrukturadong learning platform na nakaayos ayon sa mga kabanata
- **Documentation Navigation**: Bawat pahina ay ngayon may konteksto ng kabanata at gabay sa progreso
- **Template Organization**: Mga halimbawa at template na naka-map sa angkop na learning chapters
- **Resource Integration**: Cheat sheets, FAQs, at study guides na konektado sa mga kaugnay na kabanata
- **Workshop Integration**: Hands-on labs na naka-map sa maraming learning objectives ng kabanata

#### Changed
- **Learning Progression**: Lumipat mula sa linear na dokumentasyon tungo sa flexible chapter-based na pagkatuto
- **Configuration Placement**: Inilipat ang configuration guide bilang Chapter 3 para sa mas mahusay na daloy ng pagkatuto
- **AI Content Integration**: Mas mabuting integrasyon ng AI-specific na nilalaman sa buong learning journey
- **Production Content**: Consolidated ang advanced patterns sa Chapter 8 para sa enterprise learners

#### Pinabuti
- **User Experience**: Maliwanag na breadcrumbs ng navigasyon at mga indicator ng progreso ng kabanata
- **Accessibility**: Konsistent na mga pattern ng navigasyon para sa mas madaling paggalugad ng kurso
- **Professional Presentation**: Estrukturang parang unibersidad na angkop para sa akademiko at corporate training
- **Learning Efficiency**: Nabawasang oras para mahanap ang kaugnay na nilalaman dahil sa pinahusay na organisasyon

#### Technical Implementation
- **Navigation Headers**: Standardized na chapter navigation sa mahigit 40+ documentation files
- **Footer Navigation**: Konsistent na gabay sa progreso at mga indicator ng pagkumpleto ng kabanata
- **Cross-Linking**: Komprehensibong internal linking system na nag-uugnay ng mga kaugnay na konsepto
- **Chapter Mapping**: Mga template at halimbawa na malinaw na iniuugnay sa mga learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Inayos ang study guide upang tumugma sa 8-chapter na sistema
- **🎯 Chapter-Based Assessment**: Bawat kabanata ay may partikular na learning objectives at practical exercises
- **📋 Progress Tracking**: Lingguhang learning schedule na may nasusukat na resulta at completion checklists
- **❓ Assessment Questions**: Mga tanong para sa pag-validate ng kaalaman sa bawat kabanata na may propesyonal na kinalabasan
- **🛠️ Practical Exercises**: Hands-on na aktibidad na may totoong senaryo ng deployment at troubleshooting
- **📊 Skill Progression**: Maliwanag na pag-angat mula sa mga pangunahing konsepto hanggang sa enterprise patterns na may pokus sa career development
- **🎓 Certification Framework**: Mga resulta sa propesyonal na pag-unlad at sistema ng pagkilala ng komunidad
- **⏱️ Timeline Management**: Istrukturadong 10-week learning plan na may milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Pinapabuti ng bersyong ito ang multi-agent retail solution na may mas malinaw na pagpapangalan ng agent at pinahusay na dokumentasyon.**

#### Changed
- **Multi-Agent Terminology**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pag-unawa
- **Agent Architecture**: In-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code upang gumamit ng konsistent na "Customer agent" naming
- **Configuration Examples**: Modernisado ang mga pattern ng agent configuration na may na-update na naming conventions
- **Documentation Consistency**: Tiniyak na lahat ng sanggunian ay gumagamit ng propesyonal at deskriptibong mga pangalan ng agent

#### Pinahusay
- **ARM Template Package**: In-update ang retail-multiagent-arm-template na may mga sanggunian sa Customer agent
- **Architecture Diagrams**: Na-refresh ang mga Mermaid diagrams na may na-update na agent naming
- **Code Examples**: Ang mga Python classes at halimbawa ng implementasyon ay ngayon gumagamit ng CustomerAgent naming
- **Environment Variables**: In-update ang lahat ng deployment scripts upang gumamit ng CUSTOMER_AGENT_NAME conventions

#### Pinabuti
- **Developer Experience**: Mas malinaw na mga tungkulin at responsibilidad ng agent sa dokumentasyon
- **Production Readiness**: Mas mahusay na pag-aayon sa enterprise naming conventions
- **Learning Materials**: Mas madaling maintindihan na mga pangalan ng agent para sa mga layuning edukasyonal
- **Template Usability**: Pinadaling pag-unawa sa mga function ng agent at mga pattern ng deployment

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Binago ng bersyong ito ang repositoryo upang maging isang komprehensibong AI-focused na learning resource na may integrasyon sa Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Kumpletong restructure na inuuna ang AI developers at engineers
- **Microsoft Foundry Integration Guide**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa Microsoft Foundry services
- **AI Model Deployment Patterns**: Detalyadong gabay na sumasaklaw sa pagpili ng modelo, konfigurasyon, at mga estratehiya ng production deployment
- **AI Workshop Lab**: 2-3 oras na hands-on workshop para sa pag-convert ng AI applications sa AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready na mga pattern para sa scaling, monitoring, at pag-secure ng AI workloads
- **AI-Specific Troubleshooting Guide**: Komprehensibong troubleshooting para sa Microsoft Foundry Models, Cognitive Services, at mga isyu sa AI deployment
- **AI Template Gallery**: Tampok na koleksyon ng Microsoft Foundry templates na may complexity ratings
- **Workshop Materials**: Kumpletong istruktura ng workshop na may hands-on labs at reference materials

#### Pinahusay
- **README Structure**: Nakatuon sa AI-developer na may 45% community interest data mula sa Microsoft Foundry Discord
- **Learning Paths**: Nakalaang AI developer journey kasama ang tradisyonal na mga landas para sa mga estudyante at DevOps engineers
- **Template Recommendations**: Tampok na AI templates kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Community Integration**: Pinalawak na suporta ng Discord community na may AI-specific na channels at talakayan

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific na authentication at security configurations
- **Cost Optimization**: Pagsubaybay ng token usage at mga kontrol sa budget para sa AI workloads
- **Multi-Region Deployment**: Mga estratehiya para sa global na pag-deploy ng AI application
- **Performance Monitoring**: AI-specific na metrics at Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Lohikal na pag-unlad mula sa beginner hanggang advanced AI deployment patterns
- **Validated URLs**: Lahat ng external repository links ay na-verify at maaabot
- **Complete Reference**: Lahat ng internal documentation links ay na-validate at gumagana
- **Production Ready**: Enterprise deployment patterns na may totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Ang bersyong ito ay kumakatawan sa malaking pagbabago sa istruktura ng repositoryo at presentasyon ng nilalaman.**

#### Added
- **Structured Learning Framework**: Lahat ng documentation pages ay ngayon may Introduction, Learning Goals, at Learning Outcomes sections
- **Navigation System**: Idinagdag ang Previous/Next lesson links sa lahat ng dokumentasyon para sa guided learning progression
- **Study Guide**: Komprehensibong study-guide.md na may learning objectives, practice exercises, at assessment materials
- **Professional Presentation**: Tinanggal ang lahat ng emoji icons para sa mas mahusay na accessibility at propesyonal na itsura
- **Enhanced Content Structure**: Pinahusay na organisasyon at daloy ng mga materyales sa pagkatuto

#### Changed
- **Documentation Format**: In-standardize ang lahat ng dokumentasyon na may konsistenteng learning-focused na istruktura
- **Navigation Flow**: Ipinasok ang lohikal na pag-unlad sa lahat ng learning materials
- **Content Presentation**: Tinanggal ang mga dekoratibong elemento para sa mas malinaw at propesyonal na pagpapakita
- **Link Structure**: In-update ang lahat ng internal links upang suportahan ang bagong navigation system

#### Pinabuti
- **Accessibility**: Tinanggal ang dependency sa emoji para sa mas mahusay na compatibility sa screen reader
- **Professional Appearance**: Malinis, akademikong istilo ng presentasyon na angkop para sa enterprise learning
- **Learning Experience**: Istrukturadong lapit na may malinaw na objectives at outcomes para sa bawat leksyon
- **Content Organization**: Mas mahusay na lohikal na daloy at koneksyon sa pagitan ng mga magkakaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Kumpletong getting-started guide series
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong troubleshooting resources at debugging guides
  - Mga tool at pamamaraan para sa pre-deployment validation

- **Getting Started Module**
  - AZD Basics: Mga pangunahing konsepto at terminolohiya
  - Installation Guide: Mga instruksyon sa platform-specific na setup
  - Configuration Guide: Pagsasaayos ng environment at authentication
  - First Project Tutorial: Hakbang-hakbang na hands-on na pagkatuto

- **Deployment and Provisioning Module**
  - Deployment Guide: Kumpletong workflow na dokumentasyon
  - Provisioning Guide: Infrastructure as Code gamit ang Bicep
  - Mga best practices para sa production deployments
  - Mga pattern ng multi-service architecture

- **Pre-deployment Validation Module**
  - Capacity Planning: Pag-validate ng availability ng Azure resources
  - SKU Selection: Komprehensibong gabay sa service tiers
  - Pre-flight Checks: Mga automated validation scripts (PowerShell at Bash)
  - Mga tool para sa pagtataya ng gastos at budget planning

- **Troubleshooting Module**
  - Common Issues: Madalas na mga problema at solusyon
  - Debugging Guide: Sistematikong mga metodolohiya sa troubleshooting
  - Advanced diagnostic techniques at mga tool
  - Performance monitoring at optimization

- **Resources and References**
  - Command Cheat Sheet: Mabilisang sanggunian para sa mahahalagang command
  - Glossary: Komprehensibong terminolohiya at depinisyon ng mga akronim
  - FAQ: Detalyadong sagot sa mga karaniwang tanong
  - Mga external resource links at koneksyon sa komunidad

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Mga gabay sa installation at konfigurasyon para sa Windows, macOS, at Linux
- **Multiple Skill Levels**: Nilalaman na idinisenyo para sa mga estudyante hanggang sa mga propesyonal na developer
- **Practical Focus**: Mga hands-on na halimbawa at totoong senaryo
- **Comprehensive Coverage**: Mula sa mga pangunahing konsepto hanggang sa advanced enterprise patterns
- **Security-First Approach**: Mga best practices sa seguridad na isinama sa kabuuan
- **Cost Optimization**: Gabay para sa cost-effective na deployments at pamamahala ng resources

#### Documentation Quality
- **Detailed Code Examples**: Praktikal, nasubok na mga halimbawa ng code
- **Step-by-Step Instructions**: Malinaw at actionable na gabay
- **Comprehensive Error Handling**: Troubleshooting para sa mga karaniwang isyu
- **Best Practices Integration**: Mga pamantayan sa industriya at rekomendasyon
- **Version Compatibility**: Napapanahon sa pinakabagong Azure services at azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at mga custom na modelo
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Advanced RAG Patterns**: Mga pagpipilian sa vector database lampas sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinahusay na pagsubaybay para sa performance ng modelo, paggamit ng token, at kalidad ng tugon

#### Developer Experience
- **VS Code Extension**: Pinagsamang karanasan sa pag-develop ng AZD + Microsoft Foundry
- **GitHub Copilot Integration**: AI-assisted na pagbuo ng AZD template
- **Interactive Tutorials**: Mga hands-on na coding exercise na may automated validation para sa mga AI scenario
- **Video Content**: Mga karagdagang video tutorial para sa mga visual learners na naka-pokus sa AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Pamamahala ng AI model, pagsunod, at audit trails
- **Multi-Tenant AI**: Mga pattern para sa pagserbisyo sa maraming customer na may hiwalay na AI services
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga multi-cloud at hybrid deployment pattern para sa AI workloads

#### Advanced Features
- **AI Pipeline Automation**: Integrasyon ng MLOps sa Azure Machine Learning pipelines
- **Advanced Security**: Mga zero-trust na pattern, private endpoints, at advanced threat protection
- **Performance Optimization**: Mga advanced na tuning at scaling na estratehiya para sa high-throughput AI applications
- **Global Distribution**: Mga pattern ng content delivery at edge caching para sa AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Komprehensibong Microsoft Foundry integration (Kumpleto)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Kumpleto)
- ✅ **Advanced Security Module**: AI-specific security patterns (Kumpleto)
- ✅ **Performance Optimization**: AI workload tuning strategies (Kumpleto)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Kumpleto)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Kumpleto)
- **Tool Integration**: Pinahusay na IDE at editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Kumpleto)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive na disenyo para sa mobile learning
- **Offline Access**: Mga downloadable na documentation packages
- **Enhanced IDE Integration**: VS Code extension para sa AZD + AI workflows
- **Community Dashboard**: Real-time na community metrics at tracking ng kontribusyon

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Sundin ang semantic versioning (major.minor.patch)
2. **Date**: Petsa ng release o update sa format na YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Maikli at malinaw na paglalarawan kung ano ang nagbago
5. **Impact Assessment**: Paano maaapektuhan ang mga umiiral na gumagamit

### Change Categories

#### Added
- Mga bagong feature, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o learning resources
- Karagdagang tools, scripts, o utilities

#### Changed
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga update upang mapabuti ang kalinawan o katumpakan
- Pagre-structure ng nilalaman o organisasyon

#### Deprecated
- Mga feature o pamamaraan na unti-unting tinatanggal
- Mga seksyon ng dokumentasyon na naka-iskedyul tanggalin
- Mga pamamaraan na may mas mabuting alternatibo

#### Removed
- Mga feature, dokumentasyon, o halimbawa na hindi na relevant
- Luma o out-of-date na impormasyon o deprecated na pamamaraan
- Mga redundant o pinagsamang nilalaman

#### Fixed
- Mga koreksyon sa mga error sa dokumentasyon o code
- Pagresolba ng nai-report na isyu o problema
- Pagpapabuti sa katumpakan o functionality

#### Security
- Mga pagpapabuti o pag-aayos na may kinalaman sa seguridad
- Mga update sa pinakamahusay na kasanayan sa seguridad
- Pagresolba ng mga security vulnerability

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Mga breaking change na nangangailangan ng aksyon mula sa gumagamit
- Malalaking restructuring ng nilalaman o organisasyon
- Mga pagbabago na nag-aalter sa pangunahing pamamaraan o metodolohiya

#### Minor Version (X.Y.0)
- Mga bagong feature o karagdagang nilalaman
- Mga enhancement na nagpapanatili ng backward compatibility
- Karagdagang halimbawa, tools, o resources

#### Patch Version (X.Y.Z)
- Mga pag-aayos ng bug at koreksyon
- Maliit na pagpapabuti sa umiiral na nilalaman
- Mga paglilinaw at maliliit na enhancement

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: I-report ang mga problema o magmungkahi ng mga pagpapabuti (AI-specific issues welcome)
- **Discord Discussions**: Ibahagi ang mga ideya at makipag-ugnayan sa Microsoft Foundry community
- **Pull Requests**: Mag-ambag ng direktang pagpapabuti sa nilalaman, lalo na sa AI templates at guides
- **Microsoft Foundry Discord**: Makilahok sa #Azure channel para sa mga talakayan tungkol sa AZD + AI
- **Community Forums**: Makibahagi sa mas malawak na mga talakayan ng Azure developer

### Feedback Categories
- **AI Content Accuracy**: Mga koreksyon sa integrasyon ng AI service at impormasyon sa deployment
- **Learning Experience**: Mga mungkahi para sa pagpapabuti ng daloy ng pagkatuto para sa AI developers
- **Missing AI Content**: Mga hiling para sa karagdagang AI templates, pattern, o halimbawa
- **Accessibility**: Pagpapabuti para sa iba't ibang pangangailangan sa pagkatuto
- **AI Tool Integration**: Mga mungkahi para sa mas mahusay na integrasyon ng AI development workflow
- **Production AI Patterns**: Mga hiling para sa enterprise AI deployment patterns

### Response Commitment
- **Issue Response**: Sa loob ng 48 oras para sa mga nai-report na problema
- **Feature Requests**: Pagsusuri sa loob ng isang linggo
- **Community Contributions**: Review sa loob ng isang linggo
- **Security Issues**: Agarang prayoridad na may pinabilis na tugon

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Buwanang pagsusuri ng katumpakan ng nilalaman at pag-validate ng mga link
- **Quarterly Updates**: Kada-kuwarter na mga pag-update at pagpapabuti
- **Semi-Annual Reviews**: Kada-kalahating-taon na komprehensibong restructuring at enhancement
- **Annual Releases**: Taunang paglabas ng mga major na bersyon na may malalaking pagpapabuti

### Monitoring and Quality Assurance
- **Automated Testing**: Regular na validation ng mga code example at mga link
- **Community Feedback Integration**: Regular na pagsasama ng mga mungkahi ng gumagamit
- **Technology Updates**: Pag-align sa pinakabagong Azure services at azd releases
- **Accessibility Audits**: Regular na pagsusuri para sa inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Buong suporta na may regular na mga update
- **Previous Major Version**: Mga security update at kritikal na pag-aayos sa loob ng 12 buwan
- **Legacy Versions**: Suporta mula sa komunidad lamang, walang opisyal na mga update

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Mga step-by-step na tagubilin para sa paglipat
- **Compatibility Notes**: Mga detalye tungkol sa breaking changes
- **Tool Support**: Mga script o utilities para tumulong sa migrasyon
- **Community Support**: Nakalaang mga forum para sa mga tanong tungkol sa migrasyon

---

**Navigation**
- **Previous Lesson**: [Gabay sa Pag-aaral](resources/study-guide.md)
- **Next Lesson**: Bumalik sa [Pangunahing README](README.md)

**Stay Updated**: Bantayan ang repositoryong ito para sa mga abiso tungkol sa mga bagong release at mahahalagang update sa mga materyales sa pag-aaral.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman pinagsisikapan namin ang katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o kamalian. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->