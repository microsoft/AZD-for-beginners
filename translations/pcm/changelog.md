# Changelog - AZD For Beginners

## Introduction

Dis changelog na to put for ground all di important changes, updates, and improvements wey happen for di AZD For Beginners repository. We dey follow semantic versioning principles and we dey maintain dis log make e help users sabi wetin don change between di different versions dem.

## Learning Goals

By to dey check dis changelog, you go fit:
- Dey informed about new features and things wey dem add
- Understand how dem take improve di tori wey dey inside di documentation
- Track bug fix and correction make sure say e dey correct
- Follow how di learning materials dey grow over time

## Learning Outcomes

After you don check di changelog entries, you go fit:
- Identify new content and resources wey dey for learning
- Understand which parts dem don update or improve
- Plan your learning journey based on di most recent materials
- Contribute feedback and suggestions make dem fit improve wella for future

## Version History

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: Version Currency Update
**Dis version dey revalidate di course according to `azd` `1.27.1` (July 2026, di latest stable release) plus di current preview AI agent extension `azure.ai.agents` `1.0.0-beta.5`, to make sure say every "validated against" banner dey up to date after di 1.26.0, 1.27.0, and 1.27.1 releases dem.**

#### Changed
- **✅ Validation baseline don update** from `azd 1.25.6` (June 2026) go `azd 1.27.1` (July 2026) for di main README, all chapter READMEs, Chapter 1 dev-container lesson (with pinned version examples), Chapter 4 custom-templates lesson, Chapter 5 multi-agent lesson, and workshop docs
- **🤖 Chapter 2 baseline refresh** from `azd 1.23.12` (March 2026) to `azd 1.27.1` for `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, and `microsoft-foundry-integration.md`; validation-note dates update to 2026-07-13
- **🧩 AI agent extension update** from `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` to present `1.0.0-beta.5` release for Chapter 2 README and `agents.md`
- **🧪 Workshop validation example** (`azd version` output) update to `1.27.1`

#### Notes on di important azd releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go support for Azure Functions on Flex Consumption, `azd config sub-filter` for per-tenant subscription filters, self-contained extension bundles (`azd x pack --bundle`), plus `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model Azure AI Foundry projects/agents inside `azure.yaml` (Bicep-less/Terraform-less init), container deployment support for App Service (`host: appservice` + `language: docker`), direct `-s/--source` for `azd extension` commands, and `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag for `azd extension install`, deprecated models no dey included for catalog/quota prompts by default, plus some bug fixes dem

#### Files wey Dem Update
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Dis version close all di remaining in-between gaps wey di azd-coverage analysis show: how to do your own template, reproducible dev-container/Codespaces environments, di Pulumi infrastructure provider, walkthrough for Azure DevOps CI/CD, service-principal authentication, host-selection advice (AKS/Spring Apps), `azd restore`/`azd package` explanations, hook error-handing, and team/shared environment practices dem.**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — how to create your own azd template: di required structure (`azure.yaml`, `infra/`, `src/`), di `metadata.template` field, parameterize infrastructure with di `uniqueString()` resource token and di `azd-env-name` tag, local testing with `azd init --template <local-path>`, publish for GitHub, and submit to Awesome AZD gallery
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — reproducible azd environments with Dev Containers and GitHub Codespaces: small `.devcontainer/devcontainer.json` using the official `ghcr.io/azure/azure-dev/azd` feature, language-specific features, `docker-in-docker` for container hosts, and `azd auth login --use-device-code` for remote sign-in
- **🧩 Pulumi with azd** section inside `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi folder layout, stacks mapped to azd environments, required outputs/tagging, and the same `azd up` / `azd down` workflow
- **🎯 Host-selection guide** inside `docs/chapter-04-infrastructure/provisioning.md` — beginner friendly comparison of `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, and `springapp`, plus how to choose between AKS and Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** inside `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection with workload identity federation (OIDC), the generated `azure-dev.yml`, plus variable-group setup
- **🔑 Service Principals (Pattern 4)** added for `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` with client secret vs federated/OIDC credentials, when to use am, and how to store credentials safe
- **🪝 Hook error-handling** subsection inside `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes and `set -e`, `continueOnError`, test hooks separately with `azd hooks run`, OS specific shells, and `--debug`
- **👥 Team / shared environment** section inside `docs/chapter-03-configuration/configuration.md` — wetin dey `.azure/`, wetin to put for gitignore, per-developer environments, `azd env list`/`select`, plus how to provide environment values for CI/CD
- **🧰 `azd restore` and better `azd package`** explanations inside `resources/cheat-sheet.md` — how to restore dependencies and build deployable artifact without actually deploying

#### Changed
- **🧭 Chapter 4 lessons table** updated to add di new "Author Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to add di new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers connect between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Dis version close di boku important gaps wey complete beginners need, by adding two new hands-on lessons (deployable multi-agent walkthrough plus how to add azd to existing app), beginner-friendly hooks intro, Terraform-with-azd section, step-by-step GitHub Actions pipeline walkthrough, explainer for di new preview extensions, plus a clear deployment verification checklist.**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — fully hands-on deployable two-agent walkthrough (orchestrator + specialists) using real template (`contoso-creative-writer`), covering when to use multi-agent, `azd up` workflow, understanding deployed resources, cross-agent tracing, customization, and cleanup
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — how to add azd to existing project with `azd init` ("use code inside current directory"), understanding `azure.yaml` and `infra/`, `azd infra generate`, host detection, plus deployment with `azd up`
- **🌐 Terraform with azd** section inside `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` folder layout, required `AZURE_*` outputs and `azd-env-name` tagging, plus di same `azd up` / `azd down` workflow (close di gap wey say Terraform support dey but only Bicep show)
- **⚙️ Step-by-step GitHub Actions walkthrough** inside `docs/chapter-08-production/production-ai-practices.md` — from GitHub repo to automated deploys: `azd pipeline config`, OIDC federated credentials (no stored secrets), generated `azure-dev.yml`, plus secrets-vs-variables guide
- **🪝 Beginner "New to hooks?" introduction** inside `docs/chapter-04-infrastructure/deployment-guide.md` — wetin hook be, hook-stage table, minimal first hook, plus how to run hooks manually with `azd hooks run`
- **✅ "Verify Your Deployment" checklist** added to Step 5 for `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, and clear success criteria
- **🧩 Explainer for new preview extensions** `azure.ai.skills` and `azure.ai.connections` (wetin dem be and when to use dem) inside `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** fix: `multi-agent-basics.md` na Lesson 1 now (di only full hands-on lesson), plus correct labeling say Lesson 2 dey Chapter 6 and Retail scenario na architecture blueprint, no be one-command template
- **🧭 Chapter 1 lessons table** include new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** update: `first-project.md` now link forward to `bring-your-own-app.md`

#### Fixed
- **🧱 Close di "claimed but missing" Terraform gap** — before dis, di course talk Terraform support but no show am
- **🔀 Fix misleading Chapter 5 cross-links** wey talk like full multi-agent implementation dey but na only architecture blueprint dey

#### Files wey Dem Update
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

**Dis version dey revalidate di course wit `azd` `1.25.6` (June 2026) plus di `azure.ai.agents` `0.1.40-preview` extension, e expand AI guidance from "scaffold an agent" to di whole agent lifecycle (test → evaluate → optimize → inspect → delete), e show di new `azure.ai.skills` plus `azure.ai.connections` preview extensions, and notes di ".NET Aspire" → "Aspire" product rebrand.**

#### Added
- **🔁 Full agent lifecycle coverage** for beginners and AI engineers across di docs:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle table (scaffold → test → measure → improve → inspect → clean up) added to di Extensions and AI Commands section
  - `docs/chapter-08-production/production-ai-practices.md` — New "Managing the Agent Lifecycle" section wey cover `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, and `delete --force`
  - `resources/cheat-sheet.md` — Expanded AI Agent Commands with `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, and `delete --force`
- **🧩 New preview extensions** documented: `azure.ai.skills` (reusable agent skills) and `azure.ai.connections` (Foundry connections) added to di extensions table and cheat sheet
- **⏱️ Response-timing guidance** — `azd ai agent invoke` examples now note say e dey print total latency and time-to-first-byte
- **📌 Version banner** inside di root README wey dey point learners to `azd version` and `azd upgrade`

#### Changed
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) go `azd 1.25.6` (June 2026) all di chapter READMEs plus di workshop docs
- **🤖 Chapter 2 extension note** updated from `azure.ai.agents` `0.1.18-preview` go `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) updated to `1.25.6`
- **🧭 README "What's New in azd Today"** refreshed to highlight di full agent lifecycle, new AI extensions, and recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now dey direct learners to di post-deploy lifecycle commands insteada stopping at `azd up`

#### Fixed
- **🏷️ Product naming** — added Aspire rebrand note (".NET Aspire" na now just "Aspire"); azd support for Aspire never change
- **🔎 Live release validation** confirmed against di Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) and `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Dis version na follow-up for di AZD 1.23 validation sweep plus beginner-focused documentation pass: e clear AZD-first authentication guidance, add local setup validation scripts, verify key commands against di live AZD CLI, plus remove di last obsolete English-source command references outside di changelog.**

#### Added
- **🧪 Beginner setup validation scripts** wit `validate-setup.ps1` and `validate-setup.sh` so learners fit confirm needed tools before dem start Chapter 1
- **✅ Upfront setup validation steps** inside di root README and Chapter 1 README so missing prerequisites fit catch before `azd up`

#### Changed
- **🔐 Beginner authentication guidance** now e dey always treat `azd auth login` as di main way for AZD workflows, with `az login` as optional unless you use Azure CLI commands directly
- **📚 Chapter 1 onboarding flow** now e dey direct learners to validate their local setup before installation, authentication, and first deployment
- **🛠️ Validator messaging** now e clear separate blocking requirements from optional Azure CLI warnings for AZD-only beginner path
- **📖 Configuration, troubleshooting, and example docs** now dem separate required AZD authentication from optional Azure CLI sign-in where before dem no give any context

#### Fixed
- **📋 Remaining English-source command references** updated to current AZD forms, including `azd config show` inside di cheat sheet and `azd monitor --overview` if Azure Portal overview dey needed
- **🧭 Beginner claims inside Chapter 1** soften so e no go overpromise for zero-error or rollback behaviour for all templates and Azure resources
- **🔎 Live CLI validation** confirmed current support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, and `azd down --force --purge`

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
**Dis version dey do documentation validation sweep against `azd` `1.23.12`, e update outdated AZD command examples, refresh AI model guidance to current defaults, and e expand di workshop instructions outside GitHub Codespaces to also support dev containers and local clones.**

#### Added
- **✅ Validation notes for core chapters and workshop docs** to make di tested AZD baseline clear for learners wey dey use newer or older CLI builds
- **⏱️ Deployment timeout guidance** for long AI app deployments wey use `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** wit `azd extension show azure.ai.agents` inside AI workflow docs
- **🌐 Broader workshop environment guidance** covering GitHub Codespaces, dev containers, and local clones wit MkDocs

#### Changed
- **📚 Chapter intro READMEs** now always note validation against `azd 1.23.12` for foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, and production sections
- **🛠️ AZD command references** updated to current forms all over di docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` if Application Insights overview dey needed
- **🧪 Provision preview examples** simplified to current supported usage like `azd provision --preview` and `azd provision --preview -e production`
- **🧭 Workshop flow** updated so learners fit complete labs in Codespaces, dev container, or local clone instead of Codespaces only
- **🔐 Authentication guidance** now favor `azd auth login` for AZD workflows, wit `az login` optional if Azure CLI commands dey used directly

#### Fixed
- **🪟 Windows install commands** normalized to current `winget` package casing inside installation guide
- **🐧 Linux install guidance** corrected to avoid unsupported distro-specific `azd` package manager instructions plus e direct to release assets where e fit
- **📦 AI model examples** refreshed from older defaults like `gpt-35-turbo` and `text-embedding-ada-002` go current examples like `gpt-4.1-mini`, `gpt-4.1`, and `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** corrected to use current environment and status commands inside logs, scripts, and troubleshooting steps
- **⚙️ GitHub Actions guidance** updated from `Azure/setup-azd@v1.0.0` go `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** updated from `azd mcp consent` to `azd copilot consent list`

#### Improved
- **🧠 AI chapter guidance** now dey better explain preview-sensitive `azd ai` behavior, tenant-specific login, current extension usage, and updated model deployment recommendations
- **🧪 Workshop instructions** now use more realistic version examples and clearer environment setup talk for hands-on labs
- **📈 Production and troubleshooting docs** now dey align better with current monitoring, fallback model, and cost-tier examples

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
**Dis version add `azd ai`, `azd extension`, and `azd mcp` command coverage for all AI-related chapters, e fix broken links and deprecated code inside agents.md, update di cheat sheet, plus e overhaul di Example Templates section wit validated descriptions and new Azure AI AZD templates.**

#### Added
- **🤖 AZD AI CLI coverage** for 7 files (before dis e only dey inside Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section wey introduce `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` wit comparison table (template versus manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections

  - `docs/chapter-05-multi-agent/README.md` — Quick Start now dey show both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now get `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section with `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** for `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat with Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat using Langchain4J wit ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app using Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG using Azure Functions + LangChain.js + Cosmos DB with Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator with admin portal, Teams integration, and PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app with servers for .NET, Python, Java, and TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now dey match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` correct am to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Change `opencensus` to `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Move `max_tokens` from `create_agent()` go `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Change rough `len//4` estimate to `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correct services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host change Oct 2024)
- **contoso-chat**: Update description to talk Azure AI Foundry + Prompty, matching di repo real title and tech stack

#### Removed
- **ai-document-processing**: Remove non-functional template reference (repo no public as AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now show expected output and `azd monitor` step; Exercise 2 add full `FunctionTool` registration code; Exercise 3 replace vague advice wit concrete `prepdocs.py` commands
- **📚 agents.md resources**: Update documentation links to current Azure AI Agent Service docs and quickstart
- **📋 agents.md Next Steps table**: Add AI Workshop Lab link for full chapter coverage

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
**Dis version dey improve README.md chapter navigation wit better table format.**

#### Changed
- **Course Map Table**: Better with direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Remove old folders wey no need (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links for Course Map table confirm say dem dey correct

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version update product references to current Microsoft branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references update for non-translation files
- **Azure AI Agent Service → Foundry Agents**: Update service name to match current branding

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
**Dis version reorganize di documentation into chapter folders for clearer navigation.**

#### Folder Renames
Old folders don replace with chapter-numbered folders:
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
- **📚 Chapter README files**: Create README.md for each chapter folder wit:
  - Learning objectives and duration
  - Lesson table wit descriptions
  - Quick start commands
  - Navigation to other chapters

#### Changed
- **🔗 Update all internal links**: 78+ paths update across all docs files
- **🗺️ Main README.md**: Update Course Map wit new chapter structure
- **📝 examples/README.md**: Update cross-references to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Dis version add chapter navigation README files (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Dis version add full guide for deploying AI agents wit Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide for:
  - Wetin AI agents be and how dem different from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises with success criteria

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
**Dis version update the development container configuration wit modern tools and better defaults for AZD learning experience.**

#### Changed
- **🐳 Base Image**: Update from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Rename from "Python 3" to "AZD for Beginners" for clarity

#### Added
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

- **⚙️ VS Code Settings**: Add default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Add MkDocs minify plugin
  - Add pre-commit for code quality
  - Add Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now dey check AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Dis version improve README.md wella to make am easier for beginners and add important resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation when to use each tool wit practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear advice on where to begin based on developer experience

#### Changed
- **README Structure**: Arrange am for progressive disclosure - key info first
- **Introduction Section**: Rewrite to explain "The Magic of `azd up`" for total beginners
- **Remove Duplicate Content**: Delete duplicate troubleshooting section
- **Troubleshooting Commands**: Fix `azd logs` to use valid `azd monitor --logs`

#### Fixed

- **🔐 Authentication Commands**: Add `azd auth login` and `azd auth logout` for cheat-sheet.md
- **Invalid Command References**: Remove remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes apply to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements specially for developers wey new for AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Dis version dey correct non-existent AZD commands everywhere for the docs, make sure say all code examples dey use correct Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Complete check and correction of wrong commands:
  - `azd logs` (no dey) → replace wit `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (no dey) → replace wit `azd show` and Azure CLI
  - `azd infra import/export/validate` (no dey) → remove or replace wit correct ones
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (no dey) → remove
  - `azd provision --what-if/--rollback` flags (no dey) → change to use `--preview`
  - `azd config validate` (no dey) → replace wit `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no dey) → remove

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Big overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fix rollback and deployment way dem take run am
  - `docs/troubleshooting/debugging.md`: Correct log analysis sections
  - `docs/troubleshooting/common-issues.md`: Update troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fix AZD debugging section
  - `docs/getting-started/azd-basics.md`: Correct monitoring commands
  - `docs/getting-started/first-project.md`: Update monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fix help and version examples
  - `docs/pre-deployment/application-insights.md`: Correct log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fix agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Change hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Changed
- **Rollback Strategies**: Update docs to use Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Replace `azd logs` references wit `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Remove non-existent parallel/incremental deployment flags, add correct alternatives

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands verify well wit Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**Dis version complete di interactive workshop modules, fix all broken docs links, and improve content quality for AI developers wey dey use Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: New contribution guidelines doc wit:
  - Clear instructions for report issues and suggest changes
  - Docs standards for new content
  - Code example rules and commit message ways
  - Community engagement info

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Fully complete wrap-up module wit:
  - Complete summary of workshop achievements
  - Key concepts section wey cover AZD, templates, and Microsoft Foundry
  - Recommendations to continue learning journey
  - Workshop challenge exercises wit difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Update learning objectives wit:
  - GitHub Copilot wey get MCP servers activation guide
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Complete wit:
  - Resource cleanup and cost management goals
  - `azd down` use for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery guide
  - Bonus exploration ideas for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Fix 15+ broken internal docs links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fix paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correct ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replace no dey cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fix FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Correct course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Update AI chapter references
  - `course-outline.md`: Fix instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Change "Under Construction" to active workshop status wit February 2026 date

- **🔗 Workshop Navigation**: Fix broken navigation links for workshop README.md wey point to no dey lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Remove "under construction" warning, workshop ready to use now
- **Navigation Consistency**: Make sure all workshop modules get proper inter-module navigation
- **Learning Path References**: Update chapter cross-references to dey correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files get correct internal links
- ✅ Workshop modules 0-7 dey complete wit learning objectives
- ✅ Navigation between chapters and modules dey work fine
- ✅ Content suitable for AI developers wey dey use Microsoft AZD
- ✅ Beginner-friendly language and structure remain steady
- ✅ CONTRIBUTING.md give clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script verify all .md internal links
- **Content Audit**: Manual check of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns apply

#### Notes
- **Scope**: Changes apply to English docs only
- **Translations**: Translation folders no update for dis version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now give 3-4 hours hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Dis version add full A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Added
- **📊 Application Insights Integration Lesson**: for `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment wit automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python apps wit custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization ways
  - Live metrics streaming and real-time debugging
  - 40-50 minute learning time wit production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: for `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructure templates for secure deployments
  - Node.js app code wit Azure SDK integration
  - 3 complete exercises (enable managed identity, user-assigned identity, Key Vault rotation)
  - Security best practices and RBAC settings
  - Troubleshooting guide and cost analysis
  - Production-ready passwordless authentication patterns

- **🤖 Multi-Agent Coordination Patterns Lesson**: for `docs/pre-deployment/coordination-patterns.md`:
  - 5 coordination patterns (sequential, parallel, hierarchical, event-driven, consensus)
  - Complete orchestrator service implementation (Python/Flask, 1,500+ lines)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Service Bus integration for message queuing
  - Cosmos DB state management for distributed systems
  - 6 Mermaid diagrams showing agent interactions
  - 3 advanced exercises (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/month) wit optimization strategies
  - Application Insights integration for monitoring

#### Enhanced
- **Pre-deployment Chapter**: Now include full monitoring and coordination patterns
- **Getting Started Chapter**: Add professional authentication patterns
- **Production Readiness**: Full coverage from security to observability
- **Course Outline**: Update to talk about new lessons for Chapters 3 and 6

#### Changed
- **Learning Progression**: Better integration of security and monitoring for whole course
- **Documentation Quality**: Consistent A-grade standards (95-97%) for new lessons
- **Production Patterns**: Full end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration wit AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons include complete working code (no snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises wit verification steps (9 total)
- ✅ Production-ready Bicep templates wey you fit deploy wit `azd up`
- ✅ Cost analysis and optimization strategies
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints wit verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Full monitoring guide
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
**Dis version improve docs quality for whole repo and add full Microsoft Foundry Models deployment example wit gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Full gpt-4.1 deployment wit working app for `examples/azure-openai-chat/`:
  - Full Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface wit conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimate
  - Rate limiting and error handling
  - Complete README wit 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, config)
- **📚 Documentation Exercises**: Add hands-on practice exercises to config guide:
  - Exercise 1: Multi-environment config (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Add verification section to deployment guide:
  - Health check steps
  - Success criteria checklist
  - Expected outputs for all deployment commands
  - Troubleshooting quick reference

#### Enhanced
- **examples/README.md**: Update to A-grade quality (93%):
  - Add azure-openai-chat to all relevant sections
  - Increase local example count from 3 to 4
  - Add to AI Application Examples table
  - Integrate into Quick Start for Intermediate Users
  - Add to Microsoft Foundry Templates section
  - Update Comparison Matrix and tech finding sections
- **Documentation Quality**: Improve B+ (87%) → A- (92%) across docs folder:

  - Add expected outputs to important command examples dem
  - Include verification steps for configuration changes dem
  - Improve hands-on learning wit practical exercises dem

#### Change
- **Learning Progression**: Beta integration of AI examples for intermediate learners dem
- **Documentation Structure**: More actions wey person fit take wit clear outcomes
- **Verification Process**: Explicit success criteria add to key workflows

#### Improve
- **Developer Experience**: Microsoft Foundry Models deployment dey now take 35-45 minutes (compared to 60-90 minutes for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers get clear starting point wit azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validate
- ✅ Microsoft Foundry Models example fully work wit `azd up`
- ✅ All 11 implementation files correct for syntax
- ✅ README instructions match actual deployment experience
- ✅ Documentation links update well across more than 8 places
- ✅ Examples index accurately show 4 local examples
- ✅ No duplicate external links for tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets dey Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for full setup

### [v3.6.0] - 2025-11-19

#### Big Update: Container App Deployment Examples
**This version bring full, production-ready container application deployment examples dem using Azure Developer CLI (AZD), wit full documentation and integration into the learning path.**

#### Add
- **🚀 Container App Examples**: New local examples for `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API wit scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Change
- **README.md**: Update to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Update to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Course Outline & Study Guide**: Update to reference new container app examples and deployment patterns for relevant chapters

#### Validate
- ✅ All new examples fit deploy wit `azd up` and follow best practices
- ✅ Documentation cross-links and navigation update well
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Notes
- **Scope**: English documentation and examples dem only
- **Next Steps**: Expand wit additional advanced container patterns and CI/CD automation for future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implement big product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, wey show Microsoft's official rebranding.**

#### Change
- **🔄 Product Name Update**: Full rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Update all references for English documentation inside `docs/` folder
  - Rename folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rename file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated in 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` rename to `docs/microsoft-foundry/`
  - All cross-references update to reflect new folder structure
  - Navigation links validate for all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links update to point new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references updated
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already dey use Microsoft Foundry (from previous updates)
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

#### Validate
- ✅ Zero remaining "ai-foundry" folder path references for English docs
- ✅ Zero remaining "Microsoft Foundry" product name references for English docs
- ✅ All navigation links dey work wit new folder structure
- ✅ File and folder renames complete well
- ✅ Cross-references between chapters validate well

#### Notes
- **Scope**: Changes apply only to English documentation inside `docs/` folder
- **Translations**: Translation folders (`translations/`) no update for this version
- **Workshop**: Workshop materials (`workshop/`) no update for this version
- **Examples**: Example files fit still get old naming (go fix later for next update)
- **External Links**: External URLs and GitHub repository references no change

#### Migration Guide for Contributors
If you get local branches or documentation wey still dey use old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Make sure all internal documentation links still dey work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Dis version bring full support for new Azure Developer CLI preview feature and improves workshop user experience.**

#### Add
- **🧪 azd provision --preview Feature Documentation**: Full coverage of new infrastructure preview ability
  - Command reference and usage examples for cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with deployment safety-first practices
- **🚧 Workshop Status Banner**: Professional HTML banner wey show workshop development status
  - Gradient design and construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhance
- **Infrastructure Safety**: Preview functionality dey integrated across deployment documentation
- **Pre-deployment Validation**: Automated scripts now get infrastructure preview testing
- **Developer Workflow**: Update command sequences to include preview as best practice
- **Workshop Experience**: Clear expectation set for users about content development status

#### Change
- **Deployment Best Practices**: Preview-first workflow now be recommended way
- **Documentation Flow**: Infrastructure validation move earlier for learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improve
- **Safety-First Approach**: Infrastructure changes fit now dey validated before deployment
- **Team Collaboration**: Preview results fit share for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview include for validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings to help find am

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner wit gradient styling
- **User Experience**: Clear development status prevent confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhance Workshop Materials and Interactive Learning Experience
**Dis version bring full workshop materials with browser-based interactive guides and structured learning paths.**

#### Add
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience wit MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration wit Material theme for better learning experience
- **🎯 Hands-On Learning Path**: 3-step method (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Smooth development environment setup

#### Enhance
- **AI Workshop Lab**: Extend wit full 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation wit navigation and visual aids
- **Learning Progression**: Clear step-by-step guide from template selection to production deployment
- **Developer Experience**: Integrated tooling for smooth development workflows

#### Improve
- **Accessibility**: Browser-based interface with search, copy function, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure wey fit different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson finder
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for better understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Big Navigation Restructuring and Chapter-Based Learning System
**Dis version bring full chapter-based learning structure wit better navigation throughout the whole repository.**

#### Add
- **📚 Chapter-Based Learning System**: Restructure whole course into 8 progressive learning chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Consistent navigation headers and footers for all documentation
- **🎯 Progress Tracking**: Course completion checklist and learning verification system
- **🗺️ Learning Path Guidance**: Clear entry points for different experience levels and goals
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites well linked

#### Enhanced
- **README Structure**: Change to structured learning platform wit chapter-based organization
- **Documentation Navigation**: Every page now get chapter context and progression guidance
- **Template Organization**: Map examples and templates to proper learning chapters

- **Resource Integration**: Cheat sheets, FAQs, and study guides wey connect to correct chapters
- **Workshop Integration**: Hands-on labs wey map to plenty chapter learning objectives

#### Changed
- **Learning Progression**: Move from linear documentation go flexible chapter-based learning
- **Configuration Placement**: Reposition configuration guide as Chapter 3 for beta learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout the learning journey
- **Production Content**: Advanced patterns wey dem put together for Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure wey good for academic and corporate training
- **Learning Efficiency**: Reduced time to find relevant content through improved organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clear for learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter get specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Dis kain version dey improve the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Change "Cora agent" to "Customer agent" for the whole retail multi-agent solution to make am clear well
- **Agent Architecture**: Update all documentation, ARM templates, and code examples to use "Customer agent" naming wey dey consistent
- **Configuration Examples**: Modernize agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Make sure all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Update retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refresh Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Update all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplify understanding of agent functions and deployment patterns

#### Technical Details
- Update Mermaid architecture diagrams with CustomerAgent references
- Change CoraAgent class names to CustomerAgent for Python examples
- Modify ARM template JSON configurations to use "customer" agent type
- Update environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refresh all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Dis version convert the repository into a complete AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure wey prioritize AI developers and engineers
- **Microsoft Foundry Integration Guide**: Full documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide wey cover model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop for converting AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Complete troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment issues
- **AI Template Gallery**: Featured collection of Microsoft Foundry templates with complexity ratings
- **Workshop Materials**: Complete workshop structure with hands-on labs and reference materials

#### Enhanced
- **README Structure**: AI-developer focused with 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey alongside traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates including azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Enhanced Discord community support with AI-specific channels and discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security configurations
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links verified and accessible
- **Complete Reference**: All internal documentation links validated and functional
- **Production Ready**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Dis version na big overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: All documentation pages now get Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Added Previous/Next lesson links for guided learning progression
- **Study Guide**: Complete study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Remove all emoji icons for better accessibility and professional look
- **Enhanced Content Structure**: Better organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardized all documentation with consistent learning-focused structure
- **Navigation Flow**: Implemented logical progression through all learning materials
- **Content Presentation**: Remove decoration elements for clear, professional formatting
- **Link Structure**: Updated all internal links to support new navigation system

#### Improved
- **Accessibility**: Remove emoji dependencies for better screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation fit for enterprise learning
- **Learning Experience**: Structured approach with clear objectives and outcomes for each lesson
- **Content Organization**: Better logic flow and connection between related topics

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Complete deployment and provisioning documentation
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
  - SKU Selection: Complete service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for important commands
  - Glossary: Complete terminology and acronym definitions
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
When you dey contribute to dis repository, make sure say changelog entries get:

1. **Version Number**: Wey follow semantic versioning (major.minor.patch)
2. **Date**: Release or update date for YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Short description of wetin change
5. **Impact Assessment**: How change go affect users wey dey already use am

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates for better clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches wey dey phase out
- Documentation sections wey dem plan to remove
- Methods wey get better alternatives

#### Removed
- Features, documentation, or examples wey no dey relevant again
- Outdated info or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors for documentation or code
- Resolution of reported issues or problems
- Improvements for accuracy or functionality


#### Security
- Beta security wey dem improve or fix
- Update for beta beta beta wey dem dey do
- How dem take solve security wahala dem

### Rules for Semantic Versioning

#### Major Version (X.0.0)
- Big changes wey go make person gats do sometin
- Big changes inside content or how e be
- Changes wey go change how dem dey do tins

#### Minor Version (X.Y.0)
- New things or new content add
- Improvements wey no go spoil old tins
- More examples, tools, or resources

#### Patch Version (X.Y.Z)
- Fix bug and correct tins
- Small improvements for tins dem wey don dey
- Better explanation and small improvements

## Community Feedback and Suggestions

We dey always encourage community feedback to help make this learning resource beta pass:

### How to Give Feedback
- **GitHub Issues**: Report wahala or suggest beta improvements (AI specific wahala dem welcome)
- **Discord Discussions**: Share your ideas and yarn with Microsoft Foundry community
- **Pull Requests**: Add your own improvements for content, especially AI templates and guides
- **Microsoft Foundry Discord**: Join for #Azure channel for AZD + AI discussions
- **Community Forums**: Join general Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Fix corrections for AI service integration and deployment information
- **Learning Experience**: Ideas to beta the AI developer learning process
- **Missing AI Content**: Requests for more AI templates, patterns, or examples
- **Accessibility**: Improvements to help different learning needs
- **AI Tool Integration**: Ideas for beta AI development workflow integration
- **Production AI Patterns**: Requests for enterprise AI deployment patterns

### Response Commitment
- **Issue Response**: We go reply within 48 hours for reported wahala
- **Feature Requests**: We go check within one week
- **Community Contributions**: We go check within one week
- **Security Issues**: We go give am top priority and reply quick quick

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Check if content correct and links still dey work
- **Quarterly Updates**: Big content add and improvements
- **Semi-Annual Reviews**: Big restructuring and beta pass
- **Annual Releases**: Big version updates with serious improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regularly check code examples and links
- **Community Feedback Integration**: Regularly add user ideas
- **Technology Updates**: Make sure e match latest Azure services and azd releases
- **Accessibility Audits**: Regular check for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions come out, we dey provide:
- **Migration Guides**: Step-by-step instructions to move
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to help with migration
- **Community Support**: Dedicated forums to answer migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Go back to [Main README](README.md)

**Stay Updated**: Watch this repository to get notification about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->