# Changelog - AZD For Beginners

## Introduction

Dis changelog dey document all di important changes, updates, an improvements wey dem don do for di AZD For Beginners repository. We dey follow semantic versioning principles an we dey maintain dis log to help users sabi wetin don change between versions.

## Learning Goals

By reviewing dis changelog, you go:
- Dey informed about new features an new content wey dem add
- Sabi wetin dem don improve for di existing documentation
- Track bug fixes an corrections to make sure say tings accurate
- Follow how di learning materials don evolve over time

## Learning Outcomes

After you don review di changelog entries, you go fit:
- Identify new content an resources wey dey available for learning
- Understand which sections dem don update or improve
- Plan your learning path based on di most current materials
- Give feedback an suggest tins for future improvements

## Version History

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Dis version close di remaining intermediate gaps wey azd-coverage analysis show: how to author an publish your own template, reproducible dev-container/Codespaces environments, di Pulumi infrastructure provider, one Azure DevOps CI/CD walkthrough, service-principal authentication, host-selection guidance (AKS/Spring Apps), `azd restore`/`azd package` explanations, hook error-handling, an team/shared-environment practices.**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — how to author your own azd template: di required structure (`azure.yaml`, `infra/`, `src/`), di `metadata.template` field, how to parameterize infrastructure with di `uniqueString()` resource token an `azd-env-name` tag, how to test locally with `azd init --template <local-path>`, how to publish to GitHub, an how to submit to di Awesome AZD gallery
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — how to make reproducible azd environments wit Dev Containers an GitHub Codespaces: minimal `.devcontainer/devcontainer.json` wey use di official `ghcr.io/azure/azure-dev/azd` feature, language-specific features, `docker-in-docker` for container hosts, an `azd auth login --use-device-code` for remote sign-in
- **🧩 Pulumi with azd** section in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi folder layout, how stacks map to azd environments, required outputs/tagging, an di same `azd up` / `azd down` workflow
- **🎯 Host-selection guidance** in `docs/chapter-04-infrastructure/provisioning.md` — beginner-friendly comparison of `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, an `springapp`, with advice on when to choose AKS or Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection wit workload identity federation (OIDC), di generated `azure-dev.yml`, an variable-group setup
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` wit client secret vs. federated/OIDC credentials, when to use dem, an how to store credentials safely
- **🪝 Hook error-handling** subsection in `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes an `set -e`, `continueOnError`, how to test hooks alone wit `azd hooks run`, OS-specific shells, an `--debug`
- **👥 Team / shared environments** section in `docs/chapter-03-configuration/configuration.md` — wetin suppose dey inside `.azure/`, wetin to put for gitignore, per-developer environments, `azd env list`/`select`, an how to provide environment values for CI/CD
- **🧰 `azd restore` and expanded `azd package`** explanations in `resources/cheat-sheet.md` — how to restore dependencies an how to build deployable artifact without deploying

#### Changed
- **🧭 Chapter 4 lessons table** updated to include di new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include di new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Dis version close di biggest gaps for a complete beginners' guide by adding two new hands-on lessons (one deployable multi-agent walkthrough an how to add azd to an existing app), a beginner-friendly hooks introduction, a Terraform-with-azd section, step-by-step GitHub Actions pipeline walkthrough, explainer for di new preview extensions, an explicit deployment-verification checklist.**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — fully hands-on, deployable two-agent walkthrough (orchestrator + specialists) using real template (`contoso-creative-writer`), covering when to use multi-agent, di `azd up` workflow, understanding di deployed resources, cross-agent tracing, customization, an cleanup
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — how to add azd to an existing project wit `azd init` ("use code in the current directory"), understand `azure.yaml` an `infra/`, `azd infra generate`, host detection, an deploying wit `azd up`
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` folder layout, required `AZURE_*` outputs an `azd-env-name` tagging, an di same `azd up` / `azd down` workflow (dis one close di gap wey say Terraform support dey but only Bicep show)
- **⚙️ Step-by-step GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — from GitHub repo go automatic deploys: `azd pipeline config`, OIDC federated credentials (no stored secrets), di generated `azure-dev.yml`, an guidance for secrets vs variables
- **🪝 Beginner "New to hooks?" introduction** in `docs/chapter-04-infrastructure/deployment-guide.md` — wetin be hook, hook-stage table, minimal first hook, an how to run hooks manually wit `azd hooks run`
- **✅ "Verify Your Deployment" checklist** added to Step 5 of `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, an explicit success criteria
- **🧩 Explainer for new preview extensions** `azure.ai.skills` an `azure.ai.connections` (wetin dem be an when to use dem) in `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** corrected: `multi-agent-basics.md` now be Lesson 1 (di only fully hands-on lesson), with honest labeling say Lesson 2 dey Chapter 6 an di Retail scenario na architecture blueprint, no be one-command template
- **🧭 Chapter 1 lessons table** now include di new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** updated: `first-project.md` now link forward to `bring-your-own-app.md`

#### Fixed
- **🧱 Closed di "claimed but missing" Terraform gap** — di course before dey reference Terraform support without showing am
- **🔀 Corrected misleading Chapter 5 cross-links** wey make people think say full multi-agent implementation dey when na only architecture blueprint

#### Files Updated
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Dis version revalidate di course against `azd` `1.25.6` (June 2026) an di `azure.ai.agents` `0.1.40-preview` extension, expand AI guidance from "scaffold an agent" go full agent lifecycle (test → evaluate → optimize → inspect → delete), show di new `azure.ai.skills` an `azure.ai.connections` preview extensions, an note di ".NET Aspire" → "Aspire" product rebrand.**

#### Added
- **🔁 Full agent lifecycle coverage** for beginners an AI engineers across di docs:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle table (scaffold → test → measure → improve → inspect → clean up) added to di Extensions and AI Commands section
  - `docs/chapter-08-production/production-ai-practices.md` — New "Managing the Agent Lifecycle" section wey dey cover `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, an `delete --force`
  - `resources/cheat-sheet.md` — Expanded AI Agent Commands wit `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, an `delete --force`
- **🧩 New preview extensions** documented: `azure.ai.skills` (reusable agent skills) an `azure.ai.connections` (Foundry connections) added to di extensions table an cheat sheet
- **⏱️ Response-timing guidance** — `azd ai agent invoke` examples now mention say e dey print total latency an time-to-first-byte
- **📌 Version banner** for di root README wey dey point learners to `azd version` an `azd upgrade`

#### Changed
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) to `azd 1.25.6` (June 2026) across all chapter READMEs an di workshop docs
- **🤖 Chapter 2 extension note** updated from `azure.ai.agents` `0.1.18-preview` to `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) updated to `1.25.6`
- **🧭 README "What's New in azd Today"** refreshed to highlight di end-to-end agent lifecycle, new AI extensions, an recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now direct learners to di post-deploy lifecycle commands instead of stopping at `azd up`

#### Fixed
- **🏷️ Product naming** — added Aspire rebrand note (".NET Aspire" now simply "Aspire"); azd support for Aspire remain unchanged
- **🔎 Live release validation** confirmed against di Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) an `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Files Updated
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Clear tok for Beginner Onboarding, Setup Validation & Final AZD Command Cleanup
**Dis version dey follow up di AZD 1.23 validation sweep with wan documentation pass wey focus on beginners: e dey clear tok for AZD-first authentication, add local setup validation scripts, confirm key commands for di live AZD CLI, an comot di last obsolete English-source command references wey dey outside di changelog.**

#### Wetin Add
- **🧪 Beginner setup validation scripts** wit `validate-setup.ps1` an `validate-setup.sh` so learners fit confirm di required tools before dem start Chapter 1
- **✅ Upfront setup validation steps** for di root README an Chapter 1 README so if any prerequisite dey miss dem go see am before `azd up`

#### Wetin Change
- **🔐 Beginner authentication guidance** now dey treat `azd auth login` steady as di main path for AZD workflows, wit `az login` mention say na optional unless person dey use Azure CLI commands directly
- **📚 Chapter 1 onboarding flow** now dey point learners make dem validate dia local setup before installation, authentication, an first deployment steps
- **🛠️ Validator messaging** now dey clearly separate blocking requirements from optional Azure CLI warnings for di AZD-only beginner path
- **📖 Configuration, troubleshooting, and example docs** now dey show difference between required AZD authentication an optional Azure CLI sign-in where before dem dey present both without context

#### Wetin Fix
- **📋 Remaining English-source command references** don update to current AZD forms, including `azd config show` for di cheat sheet an `azd monitor --overview` wey dey used where Azure Portal overview guidance dey intended
- **🧭 Beginner claims for Chapter 1** don soft make e no too promise guaranteed zero-error or rollback behaviour across all templates an Azure resources
- **🔎 Live CLI validation** don confirm current support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, an `azd down --force --purge`

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
**Dis version do documentation validation sweep against `azd` `1.23.12`, update outdated AZD command examples, refresh AI model guidance to current defaults, an expand di workshop instructions beyond GitHub Codespaces to also support dev containers an local clones.**

#### Wetin Add
- **✅ Validation notes across core chapters and workshop docs** wey make di tested AZD baseline clear for learners wey dey use newer or older CLI builds
- **⏱️ Deployment timeout guidance** for long-running AI app deployments using `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** with `azd extension show azure.ai.agents` for di AI workflow docs
- **🌐 Broader workshop environment guidance** wey cover GitHub Codespaces, dev containers, an local clones wit MkDocs

#### Wetin Change
- **📚 Chapter intro READMEs** now consistently mention validation against `azd 1.23.12` across foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, an production sections
- **🛠️ AZD command references** don update to current forms across di docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depend on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview dey intended
- **🧪 Provision preview examples** don simplify to current supported usage like `azd provision --preview` an `azd provision --preview -e production`
- **🧭 Workshop flow** don update so learners fit finish di labs for Codespaces, dev container, or a local clone instead of assuming Codespaces-only
- **🔐 Authentication guidance** now prefer `azd auth login` for AZD workflows, wit `az login` set as optional when Azure CLI commands dey used directly

#### Wetin Fix
- **🪟 Windows install commands** don normalize to current `winget` package casing inside di installation guide
- **🐧 Linux install guidance** don correct to avoid unsupported distro-specific `azd` package manager instructions an instead point to release assets where e dey necessary
- **📦 AI model examples** don refresh from old defaults like `gpt-35-turbo` and `text-embedding-ada-002` to current examples like `gpt-4.1-mini`, `gpt-4.1`, and `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** don correct to use current environment an status commands for logs, scripts, an troubleshooting steps
- **⚙️ GitHub Actions guidance** don update from `Azure/setup-azd@v1.0.0` to `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** don update from `azd mcp consent` to `azd copilot consent list`

#### Wetin Improve
- **🧠 AI chapter guidance** now dey explain preview-sensitive `azd ai` behaviour better, tenant-specific login, current extension usage, an updated model deployment recommendations
- **🧪 Workshop instructions** now dey use more realistic version examples an clearer environment setup language for hands-on labs
- **📈 Production and troubleshooting docs** now align better wit current monitoring, fallback model, an cost-tier examples

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
**Dis version add `azd ai`, `azd extension`, an `azd mcp` command coverage for all AI-related chapters, fix broken links an deprecated code inside agents.md, update di cheat sheet, an overhaul di Example Templates section wit validated descriptions an new Azure AI AZD templates.**

#### Wetin Add
- **🤖 AZD AI CLI coverage** across 7 files (before dis e only dey for Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section wey introduce `azd extension`, `azd ai agent init`, an `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` wit comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" an "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now show both template an manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now include `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section wit `azd extension`, `azd ai agent init`, `azd mcp`, an `azd infra generate`
- **📦 New AZD AI example templates** for `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat wit Blazor WebAssembly, Semantic Kernel, an voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat wey use Langchain4J wit ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app wey use Azure AI Agent Service, Bing Grounding, an Prompty
  - **serverless-chat-langchainjs** — Serverless RAG wey use Azure Functions + LangChain.js + Cosmos DB wit Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator wit admin portal, Teams integration, an PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app wit servers for .NET, Python, Java, an TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Wetin Fix
- **🔗 agents.md navigation**: Previous/Next links now match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` correct to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replace `opencensus` wit `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Move `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replace rough `len//4` estimate wit `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correct services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host change Oct 2024)
- **contoso-chat**: Update description to reference Azure AI Foundry + Prompty, to match di repo title an tech stack

#### Wetin Remove
- **ai-document-processing**: Remove non-functional template reference (repo no dey publicly accessible as an AZD template)

#### Wetin Improve
- **📝 agents.md exercises**: Exercise 1 now show expected output an `azd monitor` step; Exercise 2 include full `FunctionTool` registration code; Exercise 3 replace vague guidance wit concrete `prepdocs.py` commands
- **📚 agents.md resources**: Update documentation links to current Azure AI Agent Service docs an quickstart
- **📋 agents.md Next Steps table**: Add AI Workshop Lab link so learners fit cover di chapter well

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
#### Make Course Navigation Better
**Dis version dey improve README.md chapter navigation wit beta table format.**

#### Wetin change
- **Course Map Table**: Dem improve am wit direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Dem comot redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links for Course Map table don verify

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version dey update product references to the current Microsoft branding.**

#### Wetin change
- **Microsoft Foundry → Microsoft Foundry**: All references don update for non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name don change to reflect the current branding

#### Files Updated
- `README.md` - Main course start page
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
**Dis version rearrange documentation into chapter folders make navigation clear.**

#### Folder Renames
Old folders don change to chapter-number folders:
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

#### Wey dem add
- **📚 Chapter README files**: Dem create README.md for each chapter folder wey get:
  - Learning objectives and duration
  - Lesson table wit descriptions
  - Quick start commands
  - Navigation to oda chapters

#### Wetin change
- **🔗 Updated all internal links**: 78+ paths don update across all docs
- **🗺️ Main README.md**: Course Map don update with new chapter structure
- **📝 examples/README.md**: Cross-references to chapter folders don update

#### Wey dem remove
- Old folder structure don comot (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Dis version add chapter navigation README files (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Dis version add one complete guide for deploy AI agents wit Azure Developer CLI.**

#### Wey dem add
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide wey cover:
  - Wetin AI agents be and how dem different from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises wit success criteria

#### Content Structure
- **Introduction**: Agent concepts for beginners
- **Quick Start**: Deploy agents wit `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams of agent patterns
- **Configuration**: Tool setup and environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Dis version update the development container config wit modern tools and betta defaults for the AZD learning experience.**

#### Wetin change
- **🐳 Base Image**: Update from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Dem rename am from "Python 3" to "AZD for Beginners" make e clear

#### Wey dem add
- **🔧 New Dev Container Features**:
  - `azure-cli` wit Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Pre-configured ports for common development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Enhanced Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions support
  - `ms-azuretools.vscode-docker` - Docker support
  - `ms-azuretools.vscode-bicep` - Bicep language support
  - `ms-azure-devtools.azure-resource-groups` - Azure resource management
  - `yzhang.markdown-all-in-one` - Markdown editing
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagram support
  - `redhat.vscode-yaml` - YAML support (for azure.yaml)
  - `eamodio.gitlens` - Git visualization
  - `mhutchie.git-graph` - Git history

- **⚙️ VS Code Settings**: Dem add default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Added MkDocs minify plugin
  - Added pre-commit for code quality
  - Added Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Wey dem fix
- **Post-Create Command**: Now e dey verify AZD and Azure CLI installation when container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Dis version make README.md easier for beginners and add important resources for AI developers.**

#### Wey dem add
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation wen to use each tool wit practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guide on where person suppose start based on developer experience

#### Wetin change
- **README Structure**: Reorganize am so key information dey front
- **Introduction Section**: Rewriten to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Dem remove duplicate troubleshooting section
- **Troubleshooting Commands**: Fix `azd logs` reference to use valid `azd monitor --logs`

#### Wey dem fix
- **🔐 Authentication Commands**: Dem add `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Dem remove remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes apply to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements focus for developers wey new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Dis version correct non-existent AZD commands for the docs, make sure all code examples use valid Azure Developer CLI syntax.**

#### Wey dem fix
- **🔧 Non-Existent AZD Commands Removed**: Dem audit and correct invalid commands:
  - `azd logs` (no dey) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (no dey) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (no dey) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (no dey) → removed
  - `azd provision --what-if/--rollback` flags (no dey) → updated to use `--preview`
  - `azd config validate` (no dey) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no dey) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Change hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Wetin change
- **Rollback Strategies**: Documentation now recommend Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Dem replace `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Dem remove non-existent parallel/incremental deployment flags, provide valid alternatives

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands validate against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**Dis version complete the interactive workshop modules, fix all broken docs links, and improve content quality for AI developers wey dey use Microsoft AZD.**

#### Wey dem add
- **📝 CONTRIBUTING.md**: New contribution guidelines wey get:
  - Clear instructions for report issues and propose changes
  - Documentation standards for new content
  - Rules for code example dem and how to write commit message dem
  - Info about how community fit engage

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Dem don finish wrap-up module full with:
  - Complete summary of wetin workshop don achieve
  - Section wey show key concepts wey people don master, including AZD, templates, and Microsoft Foundry
  - Recommendations for how to continue di learning journey
  - Workshop challenge exercises wey get difficulty ratings
  - Links for community feedback and support

- **📚 Workshop Module 3 (Deconstruct)**: Updated learning objectives wey include:
  - Guide to activate GitHub Copilot with MCP servers
  - Understanding di AZD template folder structure
  - Organization patterns for infrastructure-as-code (Bicep)
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Completed with:
  - Objectives for resource cleanup and cost management
  - Usage of `azd down` to safely deprovision infrastructure
  - Guide on how to recover soft-deleted cognitive services
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Fix 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fix di paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correct di ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replace non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fix FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Correct course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Update AI chapter references
  - `course-outline.md`: Fix instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Change from "Under Construction" to active workshop status wey get February 2026 date

- **🔗 Workshop Navigation**: Fix broken navigation links in workshop README.md wey dey point to non-existent lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Remove "under construction" warning, workshop don complete and ready to use
- **Navigation Consistency**: Ensure say all workshop modules get proper inter-module navigation
- **Learning Path References**: Update chapter cross-references to use correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files get valid internal links
- ✅ Workshop modules 0-7 don complete with learning objectives
- ✅ Navigation between chapters and modules dey work correct
- ✅ Content suitable for AI developers wey dey use Microsoft AZD
- ✅ Beginner-friendly language and structure maintained throughout
- ✅ CONTRIBUTING.md dey give clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script don verify all .md internal links
- **Content Audit**: Manual review of workshop completeness and whether e fit for beginners
- **Navigation System**: Consistent chapter and module navigation patterns don apply

#### Notes
- **Scope**: Changes apply for English documentation only
- **Translations**: Translation folders no update for this version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now dey give 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Dis version add complete A-grade lessons wey cover Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment wey get automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python applications with custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization strategies
  - Live metrics streaming and real-time debugging
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructure templates for secure deployments
  - Node.js application code with Azure SDK integration
  - 3 complete exercises (enable managed identity, user-assigned identity, Key Vault rotation)
  - Security best practices and RBAC configurations
  - Troubleshooting guide and cost analysis
  - Production-ready passwordless authentication patterns

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 coordination patterns (sequential, parallel, hierarchical, event-driven, consensus)
  - Complete orchestrator service implementation (Python/Flask, 1,500+ lines)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Service Bus integration for message queuing
  - Cosmos DB state management for distributed systems
  - 6 Mermaid diagrams showing agent interactions
  - 3 advanced exercises (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/month) with optimization strategies
  - Application Insights integration for monitoring

#### Enhanced
- **Pre-deployment Chapter**: Now include comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Don enhance with professional authentication patterns
- **Production Readiness**: Complete coverage from security to observability
- **Course Outline**: Update to reference new lessons in Chapters 3 and 6

#### Changed
- **Learning Progression**: Better integration of security and monitoring throughout di course
- **Documentation Quality**: Consistent A-grade standards (95-97%) across new lessons
- **Production Patterns**: Complete end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons include complete working code (no be snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises with verification steps (9 total)
- ✅ Production-ready Bicep templates wey you fit deploy with `azd up`
- ✅ Cost analysis and optimization strategies
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints with verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Complete monitoring guide
- **docs/getting-started/authsecurity.md**: - Professional security patterns
- **docs/pre-deployment/coordination-patterns.md**: - Advanced multi-agent architectures
- **Overall New Content**: - Consistent high-quality standards

#### Technical Implementation
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**Dis version improve documentation quality across repository and add complete Microsoft Foundry Models deployment example with gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README wey get 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Add hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Add verification section to deployment guide:
  - Health check procedures
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### Enhanced
- **examples/README.md**: Update to A-grade quality (93%):
  - Add azure-openai-chat to all relevant sections
  - Update local example count from 3 to 4
  - Add to AI Application Examples table
  - Integrate into Quick Start for Intermediate Users
  - Add to Microsoft Foundry Templates section
  - Update Comparison Matrix and technology finding sections
- **Documentation Quality**: Improve B+ (87%) → A- (92%) across docs folder:
  - Add expected outputs to critical command examples
  - Include verification steps for configuration changes
  - Enhance hands-on learning with practical exercises

#### Changed
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Improved
- **Developer Experience**: Microsoft Foundry Models deployment now take 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers get clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validated
- ✅ Microsoft Foundry Models example fully functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links update across 8+ locations
- ✅ Examples index accurately reflects 4 local examples
- ✅ No duplicate external links in tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets in Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Dis version introduce comprehensive, production-ready container application deployment examples using Azure Developer CLI (AZD), with full documentation and integration into the learning path.**

#### Added
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API wey get scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Changed
- **README.md**: Update to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Update to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Course Outline & Study Guide**: Update to reference new container app examples and deployment patterns in relevant chapters

#### Validated
- ✅ All new examples deployable with `azd up` and follow best practices
- ✅ Documentation cross-links and navigation updated
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Notes
- **Scope**: English documentation and examples only
- **Next Steps**: Expand with additional advanced container patterns and CI/CD automation in future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Dis version implement comprehensive product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Update all references across English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - File we dem rename: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references we dem update for 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` dem rename to `docs/microsoft-foundry/`
  - All cross-references don update make dem reflect the new folder structure
  - Navigation links don validate for all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links don update make dem point to the new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation links we dem update
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references we dem update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already dey use Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references we dem update (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links we dem update
  - `docs/getting-started/first-project.md` - 2 chapter navigation links we dem update
  - `docs/getting-started/installation.md` - 2 next chapter links we dem update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references we dem update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link we dem update
  - `docs/troubleshooting/debugging.md` - 1 navigation link we dem update

- **Course Structure Files** (2 files):
  - `README.md` - 17 references we dem update (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references we dem update (overview, learning objectives, chapter resources)

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references for English docs
- ✅ Zero remaining "Microsoft Foundry" product name references for English docs
- ✅ All navigation links dey functional with the new folder structure
- ✅ File and folder renames don complete successful
- ✅ Cross-references between chapters don validate

#### Notes
- **Scope**: Changes apply only to English documentation inside `docs/` folder
- **Translations**: Translation folders (`translations/`) no update for this version
- **Workshop**: Workshop materials (`workshop/`) no update for this version
- **Examples**: Example files fit still get legacy naming (we go handle am for future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you get local branches or documentation wey still dey reference the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate say all internal documentation links still dey work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Complete coverage of the new infrastructure preview capability
  - Command reference and usage examples for the cheat sheet
  - Detailed integration inside the provisioning guide with use cases and benefits
  - Pre-flight check integration to make deployment validation more safe
  - Getting started guide don update with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner wey dey show workshop development status
  - Gradient design with construction indicators to clear communication for users
  - Last updated timestamp for better transparency
  - Mobile-responsive design make am work for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality don integrate throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences wey include preview as best practice
- **Workshop Experience**: Clear expectations don set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now na recommended approach
- **Documentation Flow**: Infrastructure validation don shift earlier inside the learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes fit now dey validate before deployment
- **Team Collaboration**: Preview results fit dey share for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Deployment failures don reduce through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature don document for 4 key files
- **Command Patterns**: Consistent syntax and examples across documentation
- **Best Practice Integration**: Preview include for validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for easy discover

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status dey prevent confusion
- **Professional Presentation**: E dey maintain repository credibility while e dey set expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience with MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme to improve learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended with full 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for smoother development workflows

#### Improved
- **Accessibility**: Browser-based interface with search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure wey fit different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams to help understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Entire course don restructure into 8 progressive learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Consistent navigation headers and footers across all documentation
- **🎯 Progress Tracking**: Course completion checklist and learning verification system
- **🗺️ Learning Path Guidance**: Clear entry points for different experience levels and goals
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites dey clearly linked

#### Enhanced
- **README Structure**: README don transform to structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now get chapter context and progression guidance
- **Template Organization**: Examples and templates don map to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connect to relevant chapters
- **Workshop Integration**: Hands-on labs map to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Move from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Configuration guide don reposition to Chapter 3 for better learning flow
- **AI Content Integration**: AI-specific content don better integrate across the learning journey
- **Production Content**: Advanced patterns don consolidate in Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns make course easier to waka through
- **Professional Presentation**: University-style course structure wey fit academic and corporate training
- **Learning Efficiency**: Time to find relevant content don reduce because organization improve

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system wey connect related concepts
- **Chapter Mapping**: Templates and examples clearly associate with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Study guide don restructure to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter get specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Dem replace "Cora agent" with "Customer agent" throughout retail multi-agent solution to make am clearer
- **Agent Architecture**: All documentation, ARM templates, and code examples don update to use consistent "Customer agent" naming
- **Configuration Examples**: Agent configuration patterns don modernize with updated naming conventions
- **Documentation Consistency**: Make sure say all references dey use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Mermaid diagrams don refresh with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: All deployment scripts don update to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Documentation don make agent roles and responsibilities clearer
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: Agent naming don make am more intuitive for educational purposes
- **Template Usability**: Easier to understand agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure wey prioritize AI developers and engineers
- **Microsoft Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide wey cover model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 awa hands-on workshop wey go teach how to convert AI applications make dem fit deploy with AZD
- **Production AI Best Practices**: Enterprise-ready patterns wey dem fit use to scale, monitor, and secure AI workloads
- **AI-Specific Troubleshooting Guide**: Complete troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment palava
- **AI Template Gallery**: Featured collection of Microsoft Foundry templates wey get complexity ratings
- **Workshop Materials**: Full workshop structure wey get hands-on labs and reference materials

#### Enhanced
- **README Structure**: E focus on AI developers and get 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey side-by-side with normal paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates wey include azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Better Discord community support with AI-specific channels and discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security configurations
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Step-by-step progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links don verify and dem dey accessible
- **Complete Reference**: All internal documentation links don validate and dem dey functional
- **Production Ready**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: All documentation pages now include Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Added Previous/Next lesson links throughout all documentation for guided learning progression
- **Study Guide**: Comprehensive study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Removed all emoji icons for improved accessibility and professional appearance
- **Enhanced Content Structure**: Improved organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardized all documentation with consistent learning-focused structure
- **Navigation Flow**: Implemented logical progression through all learning materials
- **Content Presentation**: Removed decorative elements in favor of clear, professional formatting
- **Link Structure**: Updated all internal links to support new navigation system

#### Improved
- **Accessibility**: Removed emoji dependencies for better screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation suitable for enterprise learning
- **Learning Experience**: Structured approach with clear objectives and outcomes for each lesson
- **Content Organization**: Better logical flow and connection between related topics

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installation and configuration guides for Windows, macOS, and Linux
- **Multiple Skill Levels**: Content designed for students through professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices integrated throughout
- **Cost Optimization**: Guidance for cost-effective deployments and resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common issues
- **Best Practices Integration**: Industry standards and recommendations
- **Version Compatibility**: Up-to-date with latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + Microsoft Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers with isolated AI services
- **Edge AI Deployment**: Integration with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery and edge caching patterns for AI applications

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Advanced Security Module**: AI-specific security patterns (Completed)
- ✅ **Performance Optimization**: AI workload tuning strategies (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Completed)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Completed)
- **Tool Integration**: Enhanced IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please make sure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Short and clear description of wetin change
5. **Impact Assessment**: How changes go affect people wey dey use the repo

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches wey dem don start to phase out
- Documentation sections wey dey scheduled for removal
- Methods wey get better alternatives

#### Removed
- Features, documentation, or examples wey no dey relevant again
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes wey need person to take action
- Big restructuring of content or organization
- Changes wey change the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements wey still dey backward compatible
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Small improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We dey encourage community feedback to help improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and yarn with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Join broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions to improve AI developer learning flow
- **Missing AI Content**: Requests for more AI templates, patterns, or examples
- **Accessibility**: Improvements for different learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Requests for enterprise AI deployment patterns

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with fast response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Big restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular inclusion of user suggestions
- **Technology Updates**: Align with latest Azure services and azd releases
- **Accessibility Audits**: Regular checks for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions release, we dey provide:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to assist with migration
- **Community Support**: Dedicated forums for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Watch this repository make you dey get notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->