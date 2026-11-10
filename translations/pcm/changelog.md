# Changelog - AZD For Beginners

## Introduction

Dis changelog dey document all di important tins wey dem change, update, and improve for di AZD For Beginners repository. We dey follow semantic versioning principle dem and maintain dis log to help users sabi wetin don change between versions.

## Learning Goals

By to dey read dis changelog, you go:
- Dey informed about new features and tins wey dem add
- Understand di improvements wey dem do for better documentation
- Track bug fixes and corrections to make sure accuracy dey
- Follow how di learning materials don change as time dey go

## Learning Outcomes

After you don check di changelog entries, you fit:
- Identify new content and resources wey dey for learning
- Understand which parts dem don update or improve
- Plan your learning path based on di latest materials
- Contribute feedback and suggestions for future improvements

## Version History

### [v3.24.0]- 2026-11-04

#### Fixed
- Fixed English course navigation, moved-page paths, missing anchors, and outdated external references, including di Chapter 2 link to the production AI guide.
- Reviewed current guidance against published AZD 1.37.2, agents 1.0.0-beta.23, and evaluations 1.0.0-beta.2. Document di separate `azd ai eval` workflow and optimization configuration migration.
- Corrected unsupported CLI flags, authentication boundaries, plaintext environment/secret guidance, infrastructure updates, model configuration, and destructive recovery examples.
- Updated di workshop for di current AI Agents sample, including actual hooks, configuration inputs, evaluation tests, red-teaming entry points, and observability.
- Fixed example implementation claims and repaired issues inside application/infrastructure/configuration dem. Retail architecture material dey clearly different from full working app.
- Restored di CodeQL language matrix, selected supported Node.js 24 for di dev container, and made setup validators report failed version commands.

#### Added
- Added English-only offline link/anchor checker, regression tests, and documentation workflow wey also builds di workshop in strict mode. Generated translations and translated images no dey included.

#### Validation scope
- Source, syntax, configuration, local behavior, and network-link checks no fit determine live Azure deployability, quota, RBAC, regional model availability, billing, security compliance, or production readiness.
- Older entries below na historical records, no be current commands or release instructions.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: Version Currency Update
**Dis version revalidates di course against `azd` `1.27.1` (July 2026, latest stable release) and di current preview AI agent extension `azure.ai.agents` `1.0.0-beta.5`, making every "validated against" banner dey up-to-date since 1.26.0, 1.27.0, and 1.27.1 releases.**

#### Changed
- **✅ Validation baseline updated** from `azd 1.25.6` (June 2026) to `azd 1.27.1` (July 2026) inside di root README, all chapter READMEs, di Chapter 1 dev-container lesson (including pinned-version examples), di Chapter 4 custom-templates lesson, di Chapter 5 multi-agent lesson, and di workshop docs
- **🤖 Chapter 2 baseline refreshed** from `azd 1.23.12` (March 2026) to `azd 1.27.1` across `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, and `microsoft-foundry-integration.md`; validation-note dates updated to 2026-07-13
- **🧩 AI agent extension bumped** from `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` to di current `1.0.0-beta.5` release for di Chapter 2 README and `agents.md`
- **🧪 Workshop validation example** (`azd version` output) updated to `1.27.1`

#### Notes on relevant azd releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go support for Azure Functions on Flex Consumption, `azd config sub-filter` per-tenant subscription filters, self-contained extension bundles (`azd x pack --bundle`), and `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model Azure AI Foundry projects/agents directly in `azure.yaml` (Bicep-less/Terraform-less init), container deployment support for App Service (`host: appservice` + `language: docker`), direct `-s/--source` for `azd extension` commands, and `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag for `azd extension install`, deprecated models excluded from catalog/quota prompts by default, and several bug fixes

#### Files Updated
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
**Dis version close di remaining intermediate gaps wey azd-coverage analysis find: how to author and publish your own template, reproducible dev-container/Codespaces environments, di Pulumi infrastructure provider, Azure DevOps CI/CD walkthrough, service-principal authentication, host-selection guidance (AKS/Spring Apps), `azd restore`/`azd package` explanations, hook error-handling, and team/shared-environment practices.**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — how to author your own azd template: required structure (`azure.yaml`, `infra/`, `src/`), di `metadata.template` field, parameterizing infrastructure wit `uniqueString()` resource token and `azd-env-name` tag, testing locally with `azd init --template <local-path>`, publishing to GitHub, and submitting to the Awesome AZD gallery
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — reproducible azd environments wit Dev Containers and GitHub Codespaces: minimal `.devcontainer/devcontainer.json` using di official `ghcr.io/azure/azure-dev/azd` feature, language-specific features, `docker-in-docker` for container hosts, and `azd auth login --use-device-code` for remote sign-in
- **🧩 Pulumi with azd** section for `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi folder layout, stacks mapped to azd environments, required outputs/tagging, and di same `azd up` / `azd down` workflow
- **🎯 Host-selection guidance** inside `docs/chapter-04-infrastructure/provisioning.md` — beginner-friendly comparison of `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, and `springapp`, plus guidance on when to choose AKS or Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** inside `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection with workload identity federation (OIDC), generated `azure-dev.yml`, and variable-group setup
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` with client secret vs. federated/OIDC credentials, when to use, and safe credential storage
- **🪝 Hook error-handling** subsection in `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes plus `set -e`, `continueOnError`, testing hooks alone with `azd hooks run`, OS-specific shells, and `--debug`
- **👥 Team/shared environments** section in `docs/chapter-03-configuration/configuration.md` — which tins dey for `.azure/`, tins to gitignore, per-developer environments, `azd env list`/`select`, and how to provide environment values in CI/CD
- **🧰 `azd restore` and expanded `azd package`** explanations inside `resources/cheat-sheet.md` — restoring dependencies and building deployable artifact without deploying

#### Changed
- **🧭 Chapter 4 lessons table** updated to include new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Dis version close di biggest gaps for complete beginners' guide by adding two new hands-on lessons (deployable multi-agent walkthrough and adding azd to existing app), beginner-friendly hooks introduction, Terraform-with-azd section, step-by-step GitHub Actions pipeline walkthrough, explainer for new preview extensions, and explicit deployment-verification checklist.**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — fully hands-on, deployable two-agent walkthrough (orchestrator + specialists) using real template (`contoso-creative-writer`), covering when to use multi-agent, `azd up` workflow, understanding deployed resources, cross-agent tracing, customization, and cleanup
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — how to add azd to existing project with `azd init` ("use code for di current directory"), understanding `azure.yaml` and `infra/`, `azd infra generate`, host detection, and deploying with `azd up`
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` folder layout, required `AZURE_*` outputs and `azd-env-name` tagging, and same `azd up` / `azd down` workflow (close gap where Terraform support was claimed but only Bicep was shown)
- **⚙️ Step-by-step GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — from GitHub repo to automated deploys: `azd pipeline config`, OIDC federated credentials (no stored secrets), generated `azure-dev.yml`, and secrets-vs-variables guidance
- **🪝 Beginner "New to hooks?" introduction** in `docs/chapter-04-infrastructure/deployment-guide.md` — what hook be, hook-stage table, minimal first hook, and running hooks manually wit `azd hooks run`
- **✅ "Verify Your Deployment" checklist** added to Step 5 of `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, and explicit success criteria
- **🧩 Explainer for new preview extensions** `azure.ai.skills` and `azure.ai.connections` (wetin dem be and when to use am) in `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** corrected: `multi-agent-basics.md` na Lesson 1 now (only fully hands-on lesson), with honest labeling that Lesson 2 dey for Chapter 6 and Retail scenario na architecture blueprint, no be one-command template
- **🧭 Chapter 1 lessons table** now get new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** updated: `first-project.md` now link forward to `bring-your-own-app.md`

#### Fixed
- **🧱 Closed "claimed but missing" Terraform gap** — di course before dey talk Terraform support but no show am
- **🔀 Fixed misleading Chapter 5 cross-links** wey make people think full multi-agent implementation dey when na architecture blueprint alone

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
**Dis version dey revalidate di course against `azd` `1.25.6` (June 2026) and di `azure.ai.agents` `0.1.40-preview` extension, e expand AI guidance from "scaffold an agent" to di complete agent lifecycle (test → evaluate → optimize → inspect → delete), e show di new `azure.ai.skills` and `azure.ai.connections` preview extensions, and e note di ".NET Aspire" → "Aspire" product rebrand.**

#### Added
- **🔁 Full agent lifecycle coverage** for beginners and AI engineers across di docs:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle table (scaffold → test → measure → improve → inspect → clean up) wey dem add for di Extensions and AI Commands section
  - `docs/chapter-08-production/production-ai-practices.md` — New "Managing the Agent Lifecycle" section wey cover `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, and `delete --force`
  - `resources/cheat-sheet.md` — Expanded AI Agent Commands with `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, and `delete --force`
- **🧩 New preview extensions** wey dem document: `azure.ai.skills` (reusable agent skills) and `azure.ai.connections` (Foundry connections) wey dem add for di extensions table and cheat sheet
- **⏱️ Response-timing guidance** — `azd ai agent invoke` examples now dey note say e dey print total latency and time-to-first-byte
- **📌 Version banner** for di root README wey dey point learners to `azd version` and `azd upgrade`

#### Changed
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) to `azd 1.25.6` (June 2026) across all chapter READMEs and di workshop docs
- **🤖 Chapter 2 extension note** wey dem update from `azure.ai.agents` `0.1.18-preview` to `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) wey dem update to `1.25.6`
- **🧭 README "What's New in azd Today"** wey dem refresh to highlight di end-to-end agent lifecycle, new AI extensions, and recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now dey direct learners go di post-deploy lifecycle commands, no be to stop for `azd up`

#### Fixed
- **🏷️ Product naming** — added Aspire rebrand note (".NET Aspire" na now simply "Aspire"); azd support for Aspire no change
- **🔎 Live release validation** wey dem confirm against di Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) and `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
**Dis version follow up di AZD 1.23 validation sweep with beginner-focused documentation pass: e clear AZD-first authentication guidance, add local setup validation scripts, e verify key commands against di live AZD CLI, and e remove di last obsolete English-source command references wey no dey changelog.**

#### Added
- **🧪 Beginner setup validation scripts** wit `validate-setup.ps1` and `validate-setup.sh` so learners fit confirm sey dem get all di tools before dem start Chapter 1
- **✅ Upfront setup validation steps** for di root README and Chapter 1 README so dem fit catch missing prerequisites before `azd up`

#### Changed
- **🔐 Beginner authentication guidance** now dey treat `azd auth login` as di primary way for AZD workflows, with `az login` as optional unless you dey use Azure CLI commands directly
- **📚 Chapter 1 onboarding flow** now dey direct learners to validate their local setup before installation, authentication, and first deployment steps
- **🛠️ Validator messaging** now clear about which ones be blocking requirements and which be optional Azure CLI warnings for di AZD-only beginner path
- **📖 Configuration, troubleshooting, and example docs** now dey show di difference between required AZD authentication and optional Azure CLI sign-in where both dem show before without context

#### Fixed
- **📋 Remaining English-source command references** updated to current AZD forms, including `azd config show` for di cheat sheet and `azd monitor --overview` where Azure Portal overview guidance follow
- **🧭 Beginner claims for Chapter 1** soften to no overpromise guaranteed zero-error or rollback behavior across all templates and Azure resources
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
**Dis version carry out documentation validation sweep against `azd` `1.23.12`, e update outdated AZD command examples, e refresh AI model guidance to current defaults, and e widen di workshop instructions beyond GitHub Codespaces to also support dev containers and local clones.**

#### Added
- **✅ Validation notes across core chapters and workshop docs** to make di tested AZD baseline clear for learners wey dey use newer or older CLI builds
- **⏱️ Deployment timeout guidance** for long-running AI app deployments using `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** wit `azd extension show azure.ai.agents` in AI workflow docs
- **🌐 Broader workshop environment guidance** wey cover GitHub Codespaces, dev containers, and local clones with MkDocs

#### Changed
- **📚 Chapter intro READMEs** now dey consistently note validation against `azd 1.23.12` across foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, and production sections
- **🛠️ AZD command references** updated to current forms across di docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview dey
- **🧪 Provision preview examples** simplify to current supported usage like `azd provision --preview` and `azd provision --preview -e production`
- **🧭 Workshop flow** updated so learners fit complete di labs in Codespaces, dev container, or local clone instead of assuming say na Codespaces-only execution
- **🔐 Authentication guidance** now prefer `azd auth login` for AZD workflows, with `az login` as optional when Azure CLI commands dey use directly

#### Fixed
- **🪟 Windows install commands** normalize to current `winget` package casing for installation guide
- **🐧 Linux install guidance** correct to avoid unsupported distro-specific `azd` package manager instructions and to point to release assets where e necessary
- **📦 AI model examples** refresh from old defaults like `gpt-35-turbo` and `text-embedding-ada-002` to current examples such as `gpt-4.1-mini`, `gpt-4.1`, and `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** correct to use current environment and status commands in logs, scripts, and troubleshooting steps
- **⚙️ GitHub Actions guidance** update from `Azure/setup-azd@v1.0.0` to `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** update from `azd mcp consent` to `azd copilot consent list`

#### Improved
- **🧠 AI chapter guidance** now better explain preview-sensitive `azd ai` behavior, tenant-specific login, current extension usage, and updated model deployment recommendations
- **🧪 Workshop instructions** now use more realistic version examples and clearer environment setup language for hands-on labs
- **📈 Production and troubleshooting docs** now better align with current monitoring, fallback model, and cost-tier examples

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
**Dis version add `azd ai`, `azd extension`, and `azd mcp` command coverage across all AI-related chapters, e fix broken links and deprecated code for agents.md, update di cheat sheet, and e overhaul di Example Templates section wit validated descriptions and new Azure AI AZD templates.**

#### Added
- **🤖 AZD AI CLI coverage** across 7 files (before e dey only for Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section wey introduce `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` wit comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now show both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now include `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section wit `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** for `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat wit Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat wey use Langchain4J with ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app wey dey use Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG using Azure Functions + LangChain.js + Cosmos DB wit Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator wit admin portal, Teams integration, an PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app wit servers for .NET, Python, Java, an TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to di [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` corrected to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replaced `opencensus` with `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Moved `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replaced rough `len//4` estimate with `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrected services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host changed Oct 2024)
- **contoso-chat**: Updated description to reference Azure AI Foundry + Prompty, matching the repo's actual title and tech stack

#### Removed
- **ai-document-processing**: Removed non-functional template reference (repo no dey publicly accessible as an AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now show expected output an `azd monitor` step; Exercise 2 get full `FunctionTool` registration code; Exercise 3 replace vague guidance wit concrete `prepdocs.py` commands
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
**Dis version dey improve README.md chapter navigation wit better table format.**

#### Changed
- **Course Map Table**: Improve wit direct lesson links, duration estimates, an complexity ratings
- **Folder Cleanup**: Remove old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links in Course Map table don verify

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version update product references to current Microsoft branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references update for all non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name update to match current branding

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
**Dis version rearrange documentation into chapter folders for better navigation.**

#### Folder Renames
Old folders don replace wit chapter-numbered folders:
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
- **📚 Chapter README files**: Create README.md for every chapter folder wit:
  - Learning objectives an duration
  - Lesson table wit descriptions
  - Quick start commands
  - Navigation to other chapters

#### Changed
- **🔗 Updated all internal links**: 78+ paths update for all documentation files
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
**Dis version update development container configuration wit modern tools an beta defaults for di AZD learning experience.**

#### Changed
- **🐳 Base Image**: Update from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Rename from "Python 3" to "AZD for Beginners" for clear understanding

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` wit Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Pre-configure ports for common development:
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

- **⚙️ VS Code Settings**: Added default settings for Python interpreter, format on save, an whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Added MkDocs minify plugin
  - Added pre-commit for code quality
  - Added Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now dey verify AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Dis version greatly improve README.md to be more friendly for beginners an add important resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation of when to use each tool wit practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where to start based on developer experience

#### Changed
- **README Structure**: Reorganize for progressive disclosure - key information first
- **Introduction Section**: Rewrite to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Remove duplicate troubleshooting section
- **Troubleshooting Commands**: Fix `azd logs` reference to use valid `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Added `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Remove remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes apply to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements specially for developers new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Dis version correct non-existent AZD commands for all documentation, dey ensure say all code examples use valid Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Full audit an correction of invalid commands:
  - `azd logs` (no dey exist) → replace wit `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (no dey exist) → replace wit `azd show` and Azure CLI
  - `azd infra import/export/validate` (no dey exist) → remove or replace wit valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (no dey exist) → remove
  - `azd provision --what-if/--rollback` flags (no dey exist) → update to use `--preview`
  - `azd config validate` (no dey exist) → replace wit `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no dey exist) → remove

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fix rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Correct log analysis sections
  - `docs/troubleshooting/common-issues.md`: Update troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fix AZD debugging section
  - `docs/getting-started/azd-basics.md`: Correct moni commands dem
  - `docs/getting-started/first-project.md`: Updated moni and debugging samples
  - `docs/getting-started/installation.md`: Correct help and version samples
  - `docs/pre-deployment/application-insights.md`: Correct log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Correct agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Change hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Changed
- **Rollback Strategies**: Update documentation to use Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Change `azd logs` references to `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Remove non-existent parallel/incremental deployment flags, provide correct alternatives

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands validate against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**Dis version conpletes all di interactive workshop modules, fix all broken documentation links, and improve content quality for AI developers wey dey use Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: New contribution guideline document with:
  - Clear instructions for reporting wahala and proposing changes
  - Documentation standards for new content
  - Code example guidelines and commit message conventions
  - Community engagement information

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Fully finish wrap-up module with:
  - Complete summary of workshop accomplishments
  - Key concepts mastered section covering AZD, templates, and Microsoft Foundry
  - Learning journey continuation recommendations
  - Workshop challenge exercises with difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Update learning objectives with:
  - GitHub Copilot with MCP servers activation guidance
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Complete with:
  - Resource cleanup and cost management goals
  - `azd down` usage for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery instructions
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Fix 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fix paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correct ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replace non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fix FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Correct course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Update AI chapter references
  - `course-outline.md`: Fix instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Update from "Under Construction" to active workshop status with February 2026 date

- **🔗 Workshop Navigation**: Fix broken navigation links inside workshop README.md pointing to non-existent lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Remove "under construction" warning, workshop now complete and dey ready to use
- **Navigation Consistency**: Make sure all workshop modules get proper inter-module navigation
- **Learning Path References**: Update chapter cross-references with correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files get valid internal links
- ✅ Workshop modules 0-7 complete with learning objectives
- ✅ Navigation between chapters and modules dey work well
- ✅ Content suitable for AI developers wey dey use Microsoft AZD
- ✅ Beginner-friendly language and structure dey maintained throughout
- ✅ CONTRIBUTING.md give clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script verify all .md internal links
- **Content Audit**: Manual review of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns applied

#### Notes
- **Scope**: Changes applied to English documentation only
- **Translations**: Translation folders no update for dis version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now provide 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Dis version add correct A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Added
- **📊 Application Insights Integration Lesson**: for `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment with automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python applications with custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Microsoft Foundry Models token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization strategies
  - Live metrics streaming and real-time debugging
  - 40-50 minute learning time with production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: for `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructure templates for secure deployments
  - Node.js application code with Azure SDK integration
  - 3 complete exercises (enable managed identity, user-assigned identity, Key Vault rotation)
  - Security best practices and RBAC configurations
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
  - Cost breakdown ($240-565/month) with optimization strategies
  - Application Insights integration for monitoring

#### Enhanced
- **Pre-deployment Chapter**: Now get comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Enhanced with professional authentication patterns
- **Production Readiness**: Full coverage from security to observability
- **Course Outline**: Update to reference new lessons for Chapters 3 and 6

#### Changed
- **Learning Progression**: Better integration of security and monitoring throughout course
- **Documentation Quality**: Consistent A-grade standards (95-97%) for new lessons
- **Production Patterns**: Full end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons include complete working code (no snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises with verification steps (9 total)
- ✅ Production-ready Bicep templates deployable via `azd up`
- ✅ Cost analysis and optimization strategies
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints with verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Comprehensive monitoring guide
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
**Dis version improve documentation quality all over the repository and add complete Microsoft Foundry Models deployment example with gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working code inside `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Complete README with 35-45 minute deployment guide
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
- ✅ Microsoft Foundry Models example dey fully functional with `azd up`
- ✅ All 11 implementation files dey syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index dey accurately reflect 4 local examples
- ✅ No duplicate external links for tables
- ✅ All navigation references dey correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets for Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Dis version introduce complete, production-ready container application deployment examples using Azure Developer CLI (AZD), with full documentation and integration into di learning path.**

#### Added
- **🚀 Container App Examples**: New local examples for `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Changed
- **README.md**: Updated to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Updated to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Course Outline & Study Guide**: Updated to reference new container app examples and deployment patterns in relevant chapters

#### Validated
- ✅ All new examples deployable with `azd up` and follow best practices
- ✅ Documentation cross-links and navigation updated
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Notes
- **Scope**: English documentation and examples only
- **Next Steps**: Expand with additional advanced container patterns and CI/CD automation in future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Dis version don implement full product name change from "Microsoft Foundry" go "Microsoft Foundry" for all English documentation, wey represent Microsoft new rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" go "Microsoft Foundry"
  - Updated all references for English documentation for `docs/` folder
  - Rename folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rename file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references update for 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` rename to `docs/microsoft-foundry/`
  - All cross-references update to represent new folder structure
  - Navigation links check for all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links update to use new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references updated
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already dey use Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references update (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links updated
  - `docs/getting-started/first-project.md` - 2 chapter navigation links updated
  - `docs/getting-started/installation.md` - 2 next chapter links updated
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link updated
  - `docs/troubleshooting/debugging.md` - 1 navigation link updated

- **Course Structure Files** (2 files):
  - `README.md` - 17 references updated (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references updated (overview, learning objectives, chapter resources)

#### Validated
- ✅ No remaining "ai-foundry" folder path references for English docs
- ✅ No remaining "Microsoft Foundry" product name references for English docs
- ✅ All navigation links dey work well with new folder structure
- ✅ File and folder renames finish well
- ✅ Cross-references between chapters correct

#### Notes
- **Scope**: Changes only apply for English documentation for `docs/` folder
- **Translations**: Translation folders (`translations/`) no change for dis version
- **Workshop**: Workshop materials (`workshop/`) no update for dis version
- **Examples**: Example files fit still get old naming (go fix later)
- **External Links**: External URLs and GitHub repository references no change

#### Migration Guide for Contributors
If you get local branches or documentation wey dey use old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Check say all internal documentation links still dey work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Dis version introduce complete support for new Azure Developer CLI preview feature and improve workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Complete coverage of new infrastructure preview capability
  - Command reference and usage examples for cheat sheet
  - Detailed integration for provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide update with safe deployment practice
- **🚧 Workshop Status Banner**: Professional HTML banner wey dey show workshop development status
  - Gradient design with construction indicators for clear user message
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality added throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now get infrastructure preview testing
- **Developer Workflow**: Updated command sequences add preview as best practice
- **Workshop Experience**: Clear expectations for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now na recommended approach
- **Documentation Flow**: Infrastructure validation move earlier for learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes fit now get validation before deployment
- **Team Collaboration**: Preview results fit share for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failure through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature write for 4 key files
- **Command Patterns**: Consistent syntax and examples across documentation
- **Best Practice Integration**: Preview add for validation workflows and scripts
- **Visual Indicators**: Clear NEW feature marks so people fit see

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient style
- **User Experience**: Clear development status no go confuse people
- **Professional Presentation**: Make repository get trust with clear expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Dis version introduce full workshop materials wit browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience wit MkDocs preview feature
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedure dem
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for better learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Easy development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended wit full 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation wit navigation and visuals
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for smooth development workflows

#### Improved
- **Accessibility**: Browser interface wit search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure for different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson find
- **Copy Code Blocks**: Hover-to-copy for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for better understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Dis version bring full chapter-based learning structure wit better navigation across full repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructure full course into 8 progressive learning chapters
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
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Transform am into structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page get chapter context and progression guidance
- **Template Organization**: Examples and templates map to correct learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connect to relevant chapters
- **Workshop Integration**: Hands-on labs map to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Move from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Put configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content inside learning journey
- **Production Content**: Advanced patterns group inside Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course movement
- **Professional Presentation**: University-style course structure good for academic and corporate training
- **Learning Efficiency**: Less time to find correct content with better organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation for 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Strong internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clearly linked to learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructure study guide to fit 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter include specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional results
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development results and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Dis version improve the multi-agent retail solution with better agent naming and improved documentation.**

#### Changed
- **Multi-Agent Terminology**: Change "Cora agent" to "Customer agent" for better understanding for all retail multi-agent solution
- **Agent Architecture**: Update all documentation, ARM templates, and code examples to dey use one kain "Customer agent" naming
- **Configuration Examples**: Update agent configuration patterns with new naming conventions
- **Documentation Consistency**: Make sure all references dey use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Update retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refresh Mermaid diagrams to dey use updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Update all deployment scripts make dem dey use CUSTOMER_AGENT_NAME style

#### Improved
- **Developer Experience**: Make agent roles and responsibilities clear for documentation
- **Production Readiness**: Better arrangement with enterprise naming conventions
- **Learning Materials**: Give better agent naming wey dey easy for understanding for education
- **Template Usability**: Make e easy to understand agent functions and deployment patterns

#### Technical Details
- Update Mermaid architecture diagrams to use CustomerAgent references
- Replace CoraAgent class names with CustomerAgent for Python examples
- Change ARM template JSON configurations to use "customer" agent type
- Update environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* styles
- Refresh all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus plus Microsoft Foundry Integration
**Dis version don turn dis repository to full AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete rearrangement wey put AI developers and engineers first
- **Microsoft Foundry Integration Guide**: Full documentation for how to join AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide about model choice, setup, and how to deploy for production
- **AI Workshop Lab**: 2 to 3-hour hands-on workshop for how to turn AI apps to AZD-deployable solutions
- **Production AI Best Practices**: Patterns for enterprise to scale, monitor, and secure AI workloads well well
- **AI-Specific Troubleshooting Guide**: Detailed troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment wahala
- **AI Template Gallery**: Collection of Microsoft Foundry templates with complexity ratings
- **Workshop Materials**: Full workshop structure with hands-on labs plus reference materials

#### Enhanced
- **README Structure**: AI-developer centred with 45% community interest info from Microsoft Foundry Discord
- **Learning Paths**: AI developer journey alongside normal paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates like azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Better Discord community support with AI-specific channels and talks

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security setups
- **Cost Optimization**: Token use tracking and budget control for AI workloads
- **Multi-Region Deployment**: Ways to deploy AI apps worldwide
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Clear progress from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links checked and dem dey work
- **Complete Reference**: All internal documentation links checked and dem dey functional
- **Production Ready**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Upgrading
**Dis version na big overhaul of the repository structure and how content dey presented.**

#### Added
- **Structured Learning Framework**: Now all documentation pages get Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Add Previous/Next lesson links for guided learning progression
- **Study Guide**: Full study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Remove all emoji icons to make am better for accessibility and professional look
- **Enhanced Content Structure**: Improve organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardize all docs with one learning-focused structure
- **Navigation Flow**: Implement logical flow for all learning materials
- **Content Presentation**: Remove decoration to fit clear, professional formatting
- **Link Structure**: Update all internal links for new navigation system

#### Improved
- **Accessibility**: Remove emoji dependance to make e better for screen reader use
- **Professional Appearance**: Clean academic style fit for enterprise learning
- **Learning Experience**: Structured way with clear objectives and outcomes for every lesson
- **Content Organization**: Better flow and connection between related topics

### [v1.0.0] - 2025-09-09

#### Initial Release - Complete AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Full deployment and provisioning documentation
  - Detailed troubleshooting and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terms
  - Installation Guide: Platform-specific setup steps
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Full workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability check
  - SKU Selection: Full service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Wahala wey dey happen and how to solve am
  - Debugging Guide: Systematic troubleshooting methods
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for important commands
  - Glossary: Full list of terms and acronym definitions
  - FAQ: Answers for common questions
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
- **Multiple Skill Levels**: Content fit for students up to professional developers
- **Practical Focus**: Hands-on examples and real-life scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices inside everywhere
- **Cost Optimization**: Guidance for cost-effective deployments and resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common wahala
- **Best Practices Integration**: Industry standards and recommendations
- **Version Compatibility**: Up-to-date with latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Better monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Join AZD + Microsoft Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI cases
- **Video Content**: Extra video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, plus audit trails
- **Multi-Tenant AI**: Patterns for serving many customers with isolated AI services
- **Edge AI Deployment**: Join with Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps join with Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Performance Optimization**: Advanced tuning and scaling for high-throughput AI apps
- **Global Distribution**: Content delivery and edge caching patterns for AI apps

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Done for v3.0.0
- ✅ **AI-Focused Content**: Full Microsoft Foundry integration (Done)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Done)
- ✅ **Advanced Security Module**: AI-specific security patterns (Done)
- ✅ **Performance Optimization**: AI workload tuning ways (Done)

### Version 2.1.0 (Planned) - Small Part Done for v3.0.0
#### Minor Improvements - Some Done in Current Version
- ✅ **Additional Examples**: AI-focused deployment cases (Done)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Done)
- **Tool Integration**: Better IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerts (Done)

#### Still Planned for Future Version
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## How to Contribute to the Changelog

### How to Report Changes
When you want contribute to dis repository, make sure say your changelog entries get:

1. **Version Number**: Follow semantic versioning (major.minor.patch)
2. **Date**: Date we release or update for YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Sharp summary of wetin you change
5. **Impact Assessment**: How the changes go affect the users wey dey use am already

### Change Categories

#### Added
- New features, document sections, or capabilities
- New examples, templates, or learning resources
- Extra tools, scripts, or utilities

#### Changed
- Changes to how current functionality or documentation dey work
- Updates to make am clearer or more accurate
- Rearrangement of content or organization

#### Deprecated
- Features or methods wey dem dey phase out
- Document sections wey dem plan to remove
- Methods wey get better alternative

#### Removed
- Features, documentation, or examples wey no dey relevant again
- Outdated information or approaches wey don old
- Repeated or combined content

#### Fixed
- Correct errors for documentation or code
- Fix problems wey people report
- Improve accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Fix security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes wey go need user to take action
- Big rearrangement of content or organization
- Changes wey change the root approach or method

#### Minor Version (X.Y.0)
- New features or content add-ons
- Improvements wey still keep backward compatibility
- Extra examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Small improvements for current content
- Clarifications and small upgrades

## Community Feedback and Suggestions

We dey always encourage community feedback to improve dis learning resource:

### How to Give Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific wahala welcome)
- **Discord Discussions**: Share ideas and join Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Join #Azure channel for AZD + AI talks
- **Community Forums**: Join other Azure developer chat

### Feedback Categories
- **AI Content Accuracy**: Corrections for AI service join and deployment info
- **Learning Experience**: Ideas to improve AI developer learning flow
- **Missing AI Content**: Requests for more AI templates, patterns, or examples
- **Accessibility**: Improvements for different learning need
- **AI Tool Integration**: Ideas for better AI development workflow join
- **Production AI Patterns**: Requests for enterprise AI deployment patterns

### Response Commitment
- **Issue Response**: Respond within 48 hours for reported problems
- **Feature Requests**: Evaluate within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with fast response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Check content accuracy and links
- **Quarterly Updates**: Big content add-ons and improvements
- **Semi-Annual Reviews**: Full restructuring and improvement
- **Annual Releases**: Big version updates with major improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular check of code examples and links
- **Community Feedback Integration**: Regular addition of user suggestions
- **Technology Updates**: Follow latest Azure services and azd releases
- **Accessibility Audits**: Regular check for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and important fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions dem release, we provide:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or tools wey go help with migration
- **Community Support**: Special forums for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Go back to [Main README](README.md)

**Stay Updated**: Follow dis repository to get notifications about new releases and important updates to di learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->