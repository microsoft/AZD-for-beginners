# Changelog - AZD For Beginners

## Introduction

Dis changelog dey document all di important changes, updates, and improvements wey dem do for AZD For Beginners repository. We dey follow semantic versioning principles and we dey maintain dis log to help users understand wetin don change between versions.

## Learning Goals

By to dey check dis changelog, you go:
- Dey informed about new features and content additions
- Understand improvements wey dem make to existing documentation
- Track bug fixes and corrections to make sure say everything correct
- Follow how di learning materials dey change over time

## Learning Outcomes

After you don review di changelog entries, you go fit:
- Identify new content and resources wey dey available for learning
- Understand which sections don update or improve
- Plan your learning path based on di most current materials
- Contribute feedback and suggestions for future improvements

## Version History

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry extension 1.0 don fully ready

Di `microsoft.foundry` 1.0 bundle don **live and generally available**, as e don announce for [November 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Di course now dey teach di released GA workflow, no be upcoming release. Start wit AZD **1.37.0 or later** and `azd ext install microsoft.foundry`.

#### Wetin dey inside dis course update
- Di English guidance dey use di GA bundle as di default installation path and dey explain di seven core extensions wey dem version independently.
- One [hosted-agent walkthrough](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) dey cover di upstream Python Agent Framework Responses API sample, current uv, Python 3.13+, new/existing project selection, model reuse, and review of `azure.yaml`.
- Di local-to-cloud workflow dey cover Agent Inspector testing, Azure-backed model-call costs, remote code builds, deployed invocation, cloud tracing, deployment preview, logs, and diagnostics.
- Separate evaluation guidance dey cover how to generate and review datasets/rubrics, configure named evaluation, register assets, and inspect results. Older evaluation/optimization instructions na migration history, no be current release baseline.
- Foundry CI/CD guidance get runner extension installation, authenticated deployment, evaluation assets/access, and one explicit quality gate.
- Cleanup guidance dey show which projects wey new create and which ones dem reuse for Foundry. Di workshop link to di separate GA exercise but e no replace di sample-specific tests.
- Course navigation, learning objectives, setup prerequisites, cheat sheet, FAQ, and study guide dey follow di GA workflow. Generated translations dem no dey manually edit.

#### Review scope
- Based on di GA announcement, linked Microsoft Learn guidance, and di upstream sample configuration. No live Azure provisioning, deployment, model invocation, or evaluation perform.
- Bundle GA no mean say every optional feature, independent extension, or SDK dey GA, nor say di examples get production certification.

### [v3.24.0]- 2026-11-04

#### Fixed
- Dem repair English course navigation, moved-page paths, missing anchors, and obsolete external references, including di Chapter 2 link to di production AI guide.
- Dem review current guidance against published AZD 1.37.2, agents 1.0.0-beta.23, and evaluations 1.0.0-beta.2. Document the separate `azd ai eval` workflow and optimization configuration migration.
- Dem correct unsupported CLI flags, authentication boundaries, plaintext environment/secret guidance, infrastructure updates, model configuration, and destructive recovery examples.
- Dem refresh di workshop against di current AI Agents sample, including actual hooks, configuration inputs, evaluation tests, red-teaming entry points, and observability.
- Dem correct example implementation claims and repair associated application/infrastructure/configuration issues. Retail architecture material dey clearly separate from a complete working application.
- Dem restore di CodeQL language matrix, select supported Node.js 24 for di dev container, and make setup validators report failed version commands.

#### Added
- English-only offline link/anchor checker, regression tests, and documentation workflow wey also build di workshop for strict mode. Generated translations and translated images no included.

#### Validation scope
- Source, syntax, configuration, local behavior, and network-link checks no fit prove live Azure deployability, quota, RBAC, regional model availability, billing, security compliance, or production readiness.
- Older entries wey dey below na historical records, no be current command or release instructions.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Refresh: Version Currency Update
**Dis version dey revalidate di course against `azd` `1.27.1` (July 2026, latest stable release) and di current preview AI agent extension `azure.ai.agents` `1.0.0-beta.5`, e dey bring all "validated against" banner up to date after di 1.26.0, 1.27.0, and 1.27.1 releases.**

#### Changed
- **✅ Validation baseline update** from `azd 1.25.6` (June 2026) to `azd 1.27.1` (July 2026) across di root README, all chapter READMEs, di Chapter 1 dev-container lesson (including pinned-version examples), Chapter 4 custom-templates lesson, Chapter 5 multi-agent lesson, and workshop docs
- **🤖 Chapter 2 baseline refresh** from `azd 1.23.12` (March 2026) to `azd 1.27.1` across `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, and `microsoft-foundry-integration.md`; validation-note dates update to 2026-07-13
- **🧩 AI agent extension bump** from `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` to di current `1.0.0-beta.5` release for Chapter 2 README and `agents.md`
- **🧪 Workshop validation example** (`azd version` output) update to `1.27.1`

#### Notes on relevant azd releases (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go support for Azure Functions on Flex Consumption, `azd config sub-filter` per-tenant subscription filters, self-contained extension bundles (`azd x pack --bundle`), and `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model Azure AI Foundry projects/agents directly in `azure.yaml` (Bicep-less/Terraform-less init), container deployment support for App Service (`host: appservice` + `language: docker`), direct `-s/--source` for `azd extension` commands, and `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flag for `azd extension install`, deprecated models excluded from catalog/quota prompts by default, and some bug fixes

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
**Dis version close di remaining intermediate gaps wey di azd-coverage analysis show: how to author and publish your own template, reproducible dev-container/Codespaces environments, di Pulumi infrastructure provider, one Azure DevOps CI/CD walkthrough, service-principal authentication, host-selection guidance (AKS/Spring Apps), `azd restore`/`azd package` explanations, hook error-handling, and team/shared-environment practices.**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — authoring your own azd template: required structure (`azure.yaml`, `infra/`, `src/`), di `metadata.template` field, parameterizing infrastructure wit di `uniqueString()` resource token and `azd-env-name` tag, testing locally wit `azd init --template <local-path>`, publishing to GitHub, and submitting to di Awesome AZD gallery
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — reproducible azd environments wit Dev Containers and GitHub Codespaces: minimal `.devcontainer/devcontainer.json` using di official `ghcr.io/azure/azure-dev/azd` feature, language-specific features, `docker-in-docker` for container hosts, and `azd auth login --use-device-code` for remote sign-in
- **🧩 Pulumi wit azd** section for `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi folder layout, stacks mapped to azd environments, required outputs/tagging, and di identical `azd up` / `azd down` workflow
- **🎯 Host-selection guidance** for `docs/chapter-04-infrastructure/provisioning.md` — beginner-friendly comparison of `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, and `springapp`, and guidance on when to choose AKS or Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** for `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection wit workload identity federation (OIDC), di generated `azure-dev.yml`, and variable-group setup
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` wit client secret vs. federated/OIDC credentials, when to use, and safe credential storage
- **🪝 Hook error-handling** subsection for `docs/chapter-04-infrastructure/deployment-guide.md` — exit codes and `set -e`, `continueOnError`, testing hooks in isolation wit `azd hooks run`, OS-specific shells, and `--debug`
- **👥 Team / shared environments** section for `docs/chapter-03-configuration/configuration.md` — wetin dey inside `.azure/`, wetin to gitignore, per-developer environments, `azd env list`/`select`, and how to provide environment values for CI/CD
- **🧰 `azd restore` and expanded `azd package`** explanations for `resources/cheat-sheet.md` — how to restore dependencies and build deployable artifact without deploying

#### Changed
- **🧭 Chapter 4 lessons table** updated to include new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Dis version close di biggest gaps for beginners guide by adding two new hands-on lessons (deployable multi-agent walkthrough and adding azd to existing app), beginner-friendly hooks introduction, Terraform-with-azd section, step-by-step GitHub Actions pipeline walkthrough, explanation for new preview extensions, and explicit deployment-verification checklist.**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — fully hands-on, deployable two-agent walkthrough (orchestrator + specialists) using real template (`contoso-creative-writer`), covering when to use multi-agent, `azd up` workflow, understanding deployed resources, cross-agent tracing, customization, and cleanup
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — how to add azd to existing project with `azd init` ("use code inside current directory"), understanding `azure.yaml` and `infra/`, `azd infra generate`, host detection, and deploying wit `azd up`
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, `.tf` folder layout, required `AZURE_*` outputs and `azd-env-name` tagging, and identical `azd up` / `azd down` workflow (close di gap wey Terraform support claim but only Bicep show)
- **⚙️ Step-by-step GitHub Actions walkthrough** inside `docs/chapter-08-production/production-ai-practices.md` — from GitHub repo go reach automated deploys: `azd pipeline config`, OIDC federated credentials (no stored secrets), di generated `azure-dev.yml`, an secrets-vs-variables guidance
- **🪝 Beginner "New to hooks?" introduction** inside `docs/chapter-04-infrastructure/deployment-guide.md` — wetin be hook, hook-stage table, one minimal first hook, an how to run hooks manually wit `azd hooks run`
- **✅ "Verify Your Deployment" checklist** add for Step 5 of `docs/chapter-01-foundation/first-project.md` — smoke test, health-endpoint check, an correct success criteria
- **🧩 Explainer for new preview extensions** `azure.ai.skills` an `azure.ai.connections` (wetin dem be an wen to use dem) inside `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** correct: `multi-agent-basics.md` don turn Lesson 1 (di only fully hands-on lesson), wit honest label say Lesson 2 dey inside Chapter 6 an di Retail scenario na architecture blueprint, no be one-command template
- **🧭 Chapter 1 lessons table** don add di new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** update: `first-project.md` now dey link forward go `bring-your-own-app.md`

#### Fixed
- **🧱 Close di "claimed but missing" Terraform gap** — di course bin dey talk Terraform support but no show am before
- **🔀 Correct di misleading Chapter 5 cross-links** wey make people think say full multi-agent implementation dey when na architecture blueprint dey

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
**Dis version dey revalidate di course against `azd` `1.25.6` (June 2026) an di `azure.ai.agents` `0.1.40-preview` extension, expand AI guidance from "scaffold an agent" reach full agent lifecycle (test → evaluate → optimize → inspect → delete), show di new `azure.ai.skills` an `azure.ai.connections` preview extensions, an talk di ".NET Aspire" → "Aspire" product rebrand.**

#### Added
- **🔁 Full agent lifecycle coverage** for beginners an AI engineers for all di docs:
  - `docs/chapter-01-foundation/azd-basics.md` — Lifecycle table (scaffold → test → measure → improve → inspect → clean up) add to Extensions an AI Commands section
  - `docs/chapter-08-production/production-ai-practices.md` — New "Managing the Agent Lifecycle" section wey cover `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, an `delete --force`
  - `resources/cheat-sheet.md` — Expanded AI Agent Commands wit `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, an `delete --force`
- **🧩 New preview extensions** documented: `azure.ai.skills` (reusable agent skills) an `azure.ai.connections` (Foundry connections) add to extensions table an cheat sheet
- **⏱️ Response-timing guidance** — `azd ai agent invoke` examples now talk say e print total latency an time-to-first-byte
- **📌 Version banner** for root README wey dey point learners to `azd version` an `azd upgrade`

#### Changed
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) to `azd 1.25.6` (June 2026) for all chapter READMEs and workshop docs
- **🤖 Chapter 2 extension note** update from `azure.ai.agents` `0.1.18-preview` to `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) update to `1.25.6`
- **🧭 README "What's New in azd Today"** refresh to highlight end-to-end agent lifecycle, new AI extensions, an recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now dey guide learners go post-deploy lifecycle commands instead of stopping for `azd up`

#### Fixed
- **🏷️ Product naming** — add Aspire rebrand note (".NET Aspire" na now just "Aspire"); azd's Aspire support no change
- **🔎 Live release validation** check confirm against Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) an `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
**Dis version come follow AZD 1.23 validation sweep wit one beginner-focused docs pass: e clear AZD-first authentication guidance, add local setup validation scripts, verify key commands against live AZD CLI, an remove last obsolete English-source command references outside di changelog.**

#### Added
- **🧪 Beginner setup validation scripts** wit `validate-setup.ps1` an `validate-setup.sh` make learners fit confirm required tools before di start Chapter 1
- **✅ Upfront setup validation steps** inside root README an Chapter 1 README make sure say missing prerequisites dey catch before `azd up`

#### Changed
- **🔐 Beginner authentication guidance** now for sure treat `azd auth login` as di correct way for AZD workflows, wit `az login` mention say e optional unless Azure CLI commands dey used straight
- **📚 Chapter 1 onboarding flow** now guide learners to check dia local setup before installation, authentication, an first deployment steps
- **🛠️ Validator messaging** now separate blocking requirements from optional Azure CLI warnings for AZD-only beginner path
- **📖 Configuration, troubleshooting, an example docs** now show difference between required AZD authentication an optional Azure CLI sign-in where both bin dey show before without explanation

#### Fixed
- **📋 Remaining English-source command references** update to current AZD forms, include `azd config show` inside cheat sheet an `azd monitor --overview` where dem dey talk for Azure Portal overview guidance
- **🧭 Beginner claims inside Chapter 1** soft make e no dey promise say e guarantee zero-error or rollback behavior for all templates an Azure resources
- **🔎 Live CLI validation** confirm current support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, an `azd down --force --purge`

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
**Dis version do documentation validation sweep against `azd` `1.23.12`, update old AZD command examples, refresh AI model guidance to current defaults, an expand workshop instructions beyond GitHub Codespaces to also support dev containers an local clones.**

#### Added
- **✅ Validation notes for core chapters an workshop docs** to show tested AZD baseline clearly for learners wey dey use new or old CLI builds
- **⏱️ Deployment timeout guidance** for long AI app deployments wit `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** wit `azd extension show azure.ai.agents` inside AI workflow docs
- **🌐 Broader workshop environment guidance** for GitHub Codespaces, dev containers, an local clones wit MkDocs

#### Changed
- **📚 Chapter intro READMEs** now always note validation against `azd 1.23.12` across foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, an production sections
- **🛠️ AZD command references** update to current form inside docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depend on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview dey
- **🧪 Preview provision examples** simplify to current supported usage like `azd provision --preview` and `azd provision --preview -e production`
- **🧭 Workshop flow** update so learners fit finish labs in Codespaces, dev container, or local clone no be Codespaces only
- **🔐 Authentication guidance** now prefer `azd auth login` for AZD workflows, wit `az login` as optional wen Azure CLI commands dey run directly

#### Fixed
- **🪟 Windows install commands** normalize to current `winget` package casing inside installation guide
- **🐧 Linux install guidance** correct to avoid unsupported distro-specific `azd` package manager instructions an instead point to release assets wen e fit
- **📦 AI model examples** refresh from old defaults like `gpt-35-turbo` and `text-embedding-ada-002` to current examples like `gpt-4.1-mini`, `gpt-4.1`, an `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** correct to use current environment an status commands in logs, scripts, an troubleshooting steps
- **⚙️ GitHub Actions guidance** update from `Azure/setup-azd@v1.0.0` to `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** update from `azd mcp consent` to `azd copilot consent list`

#### Improved
- **🧠 AI chapter guidance** now explain preview-sensitive `azd ai` behavior better, tenant-specific login, current extension usage, an update model deployment recommendations
- **🧪 Workshop instructions** now use more realistic version examples an clearer environment setup language for hands-on labs
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
**Dis version dey add `azd ai`, `azd extension`, and `azd mcp` command coverage for all AI-related chapters, fix broken links and deprecated code inside agents.md, update di cheat sheet, plus overhauls di Example Templates section wit valid description dem and new Azure AI AZD templates.**

#### Added
- **🤖 AZD AI CLI coverage** for 7 files (before e dey only for Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section wey show `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` wit comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now show both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now include `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section wit `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** inside `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat wit Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat using Langchain4J wit ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app using Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG using Azure Functions + LangChain.js + Cosmos DB wit Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator wit admin portal, Teams integration, and PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app wit servers for .NET, Python, Java, and TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to di [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` correct to `../chapter-08-production/production-ai-practices.md` (3 times)
- **📦 agents.md deprecated code**: Replace `opencensus` wit `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Move `max_tokens` from `create_agent()` go `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replace rough `len//4` estimate wit `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correct services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host don change Oct 2024)
- **contoso-chat**: Update description to reference Azure AI Foundry + Prompty, make e match di repo real title and tech stack

#### Removed
- **ai-document-processing**: Remove non-functional template reference (repo no public as AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now show expected output and `azd monitor` step; Exercise 2 get full `FunctionTool` registration code; Exercise 3 replace vague guidance wit clear `prepdocs.py` commands
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
**Dis version improve README.md chapter navigation wit better table format.**

#### Changed
- **Course Map Table**: Enhanced wit direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Remove duplicate old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links inside Course Map table verified

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version update product references to current Microsoft branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references update across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name update to reflect correct branding

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
**Dis version restructure di docs into chapter folders to make navigation clear.**

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
- **📚 Chapter README files**: Create README.md for each chapter folder wit:
  - Learning objectives and duration
  - Lesson table wit descriptions
  - Quick start commands
  - Navigation go other chapters

#### Changed
- **🔗 Updated all internal links**: 78+ paths update across all docs
- **🗺️ Main README.md**: Update Course Map wit new chapter structure
- **📝 examples/README.md**: Update cross-references to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Dis version add chapter navigation README files (but e don replace by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Dis version add full guide for deploying AI agents wit Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide cover:
  - Wetin AI agents be and how dem different from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises wit success criteria

#### Content Structure
- **Introduction**: Agent ideas for beginners
- **Quick Start**: Deploy agents wit `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams for agent patterns
- **Configuration**: Tool setup and environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Dis version update di development container configuration wit modern tools and better defaults for the AZD learning experience.**

#### Changed
- **🐳 Base Image**: Update from `python:3.12-bullseye` go `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Rename from "Python 3" go "AZD for Beginners" for clarity

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

- **⚙️ VS Code Settings**: Added default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Add MkDocs minify plugin
  - Add pre-commit for code quality
  - Add Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now verify AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Dis version well improve README.md to make am easy for beginners and add important resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation about when to use each tool with practical examples
- **🌟 Awesome AZD Links**: Direct links go community template gallery and how to contribute resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step start section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where to start based on developer experience

#### Changed
- **README Structure**: Reorganize for progressive disclosure - key info first
- **Introduction Section**: Rewrite to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Delete duplicate troubleshooting section
- **Troubleshooting Commands**: Fix `azd logs` reference make e use correct `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Add `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Comot all remaining `azd logs` for README troubleshooting area

#### Notes
- **Scope**: Changes wey happen for main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements wey devs new to AZD dey try understand

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Dis version correct all da commands wey no dey AZD for documentation, make sure all the code examples dey use correct Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Thorough check and correction of invalid commands:
  - `azd logs` (no dey) → replace wit `azd monitor --logs` or Azure CLI way
  - `azd service` subcommands (no dey) → replace wit `azd show` and Azure CLI
  - `azd infra import/export/validate` (no dey) → comot or replace wit correct ones
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (no dey) → comot
  - `azd provision --what-if/--rollback` flags (no dey) → fix make e use `--preview`
  - `azd config validate` (no dey) → replace wit `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no dey) → comot all

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Big upgrade of command reference
  - `docs/deployment/deployment-guide.md`: Fix rollback and deployment ways
  - `docs/troubleshooting/debugging.md`: Correct log analysis parts
  - `docs/troubleshooting/common-issues.md`: Update troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fix AZD debugging area
  - `docs/getting-started/azd-basics.md`: Correct monitoring commands
  - `docs/getting-started/first-project.md`: Update monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fix help and version examples
  - `docs/pre-deployment/application-insights.md`: Correct log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fix agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Change hardcoded `1.5.0` version to generic `1.x.x` wit link to releases

#### Changed
- **Rollback Strategies**: Update document make e use Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Change `azd logs` references to `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Remove flags wey no dey like parallel/incremental deployment, give correct alternatives

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands wey dem check correct for Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**Dis version finish all di interactive workshop modules, fix all broken documentation links, and improve the overall content quality for AI developers wey dey use Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: New contribution guideline document with:
  - Clear instructions to report wahala and propose changes
  - Documentation standards for new content
  - Guidelines for code examples and commit message ways
  - Community engagement information

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Fully complete wrap-up module with:
  - Complete summary of workshop achievements
  - Key concepts mastered covering AZD, templates, and Microsoft Foundry
  - Recommendations for continuing learning journey
  - Workshop challenge exercises with difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Update learning objectives wit:
  - GitHub Copilot with MCP servers activation guide
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Complete wit:
  - Resource cleanup and cost management goals
  - `azd down` usage for safe infrastructure shutdown
  - Guide for soft-deleted cognitive services recovery
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Fix 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fix paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correct ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Change non-existent cicd-integration.md to deployment-guide.md
  - `examples/retail-scenario.md`: Fix FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Correct course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Update AI chapter references
  - `course-outline.md`: Fix instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Change from "Under Construction" to active status with February 2026 date

- **🔗 Workshop Navigation**: Fix broken navigation links for workshop README.md wey point to non-existent lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Remove "under construction" warning, workshop now done and ready for use
- **Navigation Consistency**: Make sure all workshop modules get proper inter-module navigation
- **Learning Path References**: Update chapter cross-references wit correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files get correct internal links
- ✅ Workshop modules 0-7 complete wit learning objectives
- ✅ Navigation between chapters and modules dey work well
- ✅ Content suitable for AI developers wey dey use Microsoft AZD
- ✅ Beginner-friendly language and structure dey okay throughout
- ✅ CONTRIBUTING.md give clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script check all .md internal links
- **Content Audit**: Manual review of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns apply

#### Notes
- **Scope**: Changes apply to English documentation only
- **Translations**: Translation folders no update for dis version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now give 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Dis version add thorough A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Added
- **📊 Application Insights Integration Lesson**: for `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment wit automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python applications wit custom telemetry (over 1,200 lines)
  - AI/LLM monitoring patterns (Microsoft Foundry Models token and cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization strategies
  - Live metrics streaming and real-time debugging
  - 40-50 minutes learning time wit production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: for `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Complete Bicep infrastructure templates for secure deployments
  - Node.js application code wit Azure SDK integration
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
- **Pre-deployment Chapter**: Now get full monitoring and coordination patterns
- **Getting Started Chapter**: Better with professional authentication patterns
- **Production Readiness**: Full coverage from security to observability
- **Course Outline**: Update fit new lessons for Chapters 3 and 6

#### Changed
- **Learning Progression**: Better join security and monitoring for course
- **Documentation Quality**: Consistent A-grade standards (95-97%) for new lessons
- **Production Patterns**: Full end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear way from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Full Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons get complete working code (no snippets)
- ✅ Mermaid diagrams for visual learning (19 total for 3 lessons)
- ✅ Hands-on exercises wit verification steps (9 total)
- ✅ Production-ready Bicep templates deployable by `azd up`
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
**Dis version improve documentation quality across di repository and add full Microsoft Foundry Models deployment example wit gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Full gpt-4.1 deployment wit working implementation for `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface wit conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Full README wit 35-45 minutes deployment guide
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
- **Documentation Quality**: Improve B+ (87%) → A- (92%) for docs folder:
  - Add expected outputs to important command examples
  - Include verification steps for configuration sabi change dem
  - Make hands-on learning beta beta with practical exercise dem

#### Changed
- **Learning Progression**: Better show AI examples wey intermediate learners fit use
- **Documentation Structure**: More exercise wey get clear outcomes wey person fit do
- **Verification Process**: Explicit success criteria self add for important workflow dem

#### Improved
- **Developer Experience**: Microsoft Foundry Models deployment now dey take 35-45 minutes (instead of 60-90 for complex kain alternatives)
- **Cost Transparency**: Clear how much e go cost ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers get clear waya to start with azure-openai-chat
- **Documentation Standards**: Expected outputs and verification steps consistent

#### Validated
- ✅ Microsoft Foundry Models example dey work well with `azd up`
- ✅ All 11 implementation files no get syntax error
- ✅ README instructions match how deployment really dey happen
- ✅ Documentation links don update for 8+ different places
- ✅ Examples index show true 4 local examples
- ✅ No extra external links wey dey repeat for tables
- ✅ Navigation references correct everywhere

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity dey ready, secrets dey inside Key Vault
- **Monitoring**: Application Insights join inside
- **Cost Management**: Token tracking and optimization of use
- **Deployment**: Single `azd up` command go do everything

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Dis version bring full container application deployment examples wey ready for production using Azure Developer CLI (AZD), with full docs plus join am inside learning path.**

#### Added
- **🚀 Container App Examples**: New local examples inside `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview for containerized deployment, quick start, production, and advanced style
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, plus troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, plus CI/CD guidance for container workload dem
- **Code Samples**: Complete `azure.yaml`, Bicep templates, plus multi-language service implementation (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting advice

#### Changed
- **README.md**: Update show the new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Update highlight container app examples, add comparison matrix entries, and update technology/architecture reference
- **Course Outline & Study Guide**: Update talk about the new container app examples and deployment patterns inside the chapters wey concern am

#### Validated
- ✅ All new examples fit deploy well wit `azd up` and dem follow best practice
- ✅ Documentation cross-links plus navigation update finish well
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Notes
- **Scope**: English docs and examples only
- **Next Steps**: Go extend wit more advanced container patterns plus CI/CD automation for future release

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Dis version change product name full from "Microsoft Foundry" to "Microsoft Foundry" for all English documents, to show correct Microsoft rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Update all talk for English docs in `docs/` folder
  - Rename folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Rename file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references update for 7 doc files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` change name to `docs/microsoft-foundry/`
  - All cross-references update to match new folder structure
  - Navigation links check correct for all docs

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal link update make dem take new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link update
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name reference update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already dey use Microsoft Foundry (from previous update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference update (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links update
  - `docs/getting-started/first-project.md` - 2 chapter navigation links update
  - `docs/getting-started/installation.md` - 2 next chapter links update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link update
  - `docs/troubleshooting/debugging.md` - 1 navigation link update

- **Course Structure Files** (2 files):
  - `README.md` - 17 references update (course overview, chapter titles, templates section, community insight)
  - `course-outline.md` - 14 references update (overview, learning objectives, chapter resources)

#### Validated
- ✅ No more "ai-foundry" folder path talk for English docs
- ✅ No more "Microsoft Foundry" product name talk for English docs
- ✅ All navigation links dem dey work for new folder structure
- ✅ File and folder name change done well
- ✅ Cross-reference inside chapters check correct

#### Notes
- **Scope**: Changes na only for English docs inside `docs/` folder
- **Translations**: Translation folders (`translations/`) no update for dis version
- **Workshop**: Workshop materials (`workshop/`) no update for dis version
- **Examples**: Example files fit still get old name talk (na for future update to fix)
- **External Links**: External URLs and GitHub repo talk dem never change

#### Migration Guide for Contributors
If you get local branches or documentation wey dey talk about old structure:
1. Update folder talk: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file talk: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Change product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Check all inside doc links still dey work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Dis version introduce full support for new Azure Developer CLI preview feature plus make workshop user experience beta better.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Full explanation for new infrastructure preview ability
  - Command reference plus use examples for cheat sheet
  - Detailed join inside provisioning guide with why and how e dey help
  - Pre-flight check join for safer deployment
  - Getting started guide update wit deployment safety
- **🚧 Workshop Status Banner**: Professional HTML banner to show workshop status
  - Gradient design with construction signs so user go sabi wahala
  - Last updated time show for transparency
  - Mobile-friendly for all device kind

#### Enhanced
- **Infrastructure Safety**: Preview function join every deployment doc
- **Pre-deployment Validation**: Automated scripts add infrastructure preview test
- **Developer Workflow**: Update command order to include preview as correct way
- **Workshop Experience**: Clear talk to users about content progress

#### Changed
- **Deployment Best Practices**: Preview-first workflow now be recommended way
- **Documentation Flow**: Infrastructure validation shift go earlier inside learning
- **Workshop Presentation**: Professional status communication with clear timeline

#### Improved
- **Safety-First Approach**: Now you fit validate infrastructure change before you deploy
- **Team Collaboration**: Preview results fit share for review and approval
- **Cost Awareness**: Better idea of cost before you provision resource dem
- **Risk Mitigation**: Reduce deployment wahala with better validation beforehand

#### Technical Implementation
- **Multi-document Integration**: Preview feature doc don put for 4 main files
- **Command Patterns**: Syntax and example consistent for all docs
- **Best Practice Integration**: Preview join validation workflow plus scripts
- **Visual Indicators**: Clear NEW feature tag for easier find

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient look
- **User Experience**: Clear status no dey confuse people
- **Professional Presentation**: Keep repo trust while explain progress well
- **Timeline Transparency**: October 2025 last update show for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Dis version bring full workshop materials plus browser-based interactive guides and clear learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser workshop wey get MkDocs preview ability
- **📝 Structured Workshop Instructions**: 7-step guided learning from discovery to customization
  - 0-Introduction: Workshop overview plus setup
  - 1-Select-AI-Template: How to find and pick template
  - 2-Validate-AI-Template: How to deploy and check
  - 3-Deconstruct-AI-Template: Understand how the template be
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced changes and repeat
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary plus next step
- **🛠️ Workshop Tooling**: MkDocs config wit Material theme to improve learning
- **🎯 Hands-On Learning Path**: 3-step method (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Easy setup for developer environment

#### Enhanced
- **AI Workshop Lab**: Extend with full 2-3 hour structured learning
- **Workshop Documentation**: Professional design with navigation plus visual help
- **Learning Progression**: Clear step-by-step guide from template choice to production deployment
- **Developer Experience**: Tooling integrate well for smooth development

#### Improved
- **Accessibility**: Browser interface with search, copy function plus theme toggle
- **Self-Paced Learning**: Flexible workshop format for different learning speed
- **Practical Application**: Real AI template deployment scenarios
- **Community Integration**: Discord join inside for workshop support and collabo

#### Workshop Features
- **Built-in Search**: Quick keyword plus lesson find
- **Copy Code Blocks**: Hover and copy for all code example dem
- **Theme Toggle**: Dark/light mode for different user taste
- **Visual Assets**: Screenshots and diagrams for better understanding
- **Help Integration**: Direct Discord link for community help

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Dis version introduce full chapter based learning system with better navigation for whole repo.**

#### Added
- **📚 Chapter-Based Learning System**: Break whole course down to 8 progressive chapters
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Navigation header and footer consistent for all docs
- **🎯 Progress Tracking**: Course finish checklist plus learning verification system
- **🗺️ Learning Path Guidance**: Clear entry ways for different experience level plus goals
- **🔗 Cross-Reference Navigation**: Relevant chapter and prerequisite well link

#### Enhanced
- **README Structure**: Change am to structured learning platform with chapter based order
- **Documentation Navigation**: Every page get chapter context plus guide for progression
- **Template Organization**: Examples and templates map go correct learning chapter
- **Resource Integration**: Cheat sheets, FAQ’s, and study guides link to related chapters
- **Workshop Integration**: Hands-on labs attach go several chapter learning goals

#### Changed
- **Learning Progression**: Dem com waka from straight documentation go flexible chapter-based learning
- **Configuration Placement**: Dem put configuration guide as Chapter 3 make learning flow beta
- **AI Content Integration**: Beta integration of AI-specific content everywhere for learning journey
- **Production Content**: Advanced patterns join together for Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression signs
- **Accessibility**: Consistent navigation pattern for easier to waka through di course
- **Professional Presentation**: University-style course structure wey dem fit use for academic and corporate training
- **Learning Efficiency**: Dem reduce time to sabi beta content through better organization

#### Technical Implementation
- **Navigation Headers**: Standardize chapter navigation anyhow for 40+ documentation files
- **Footer Navigation**: Consistent guidance for progression and chapter completion sign
- **Cross-Linking**: Complete system wey link every concept wey relate
- **Chapter Mapping**: Templates and examples dem clearly connect to learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructure study guide make e follow 8-chapter system
- **🎯 Chapter-Based Assessment**: Every chapter get clear learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and checklist to complete
- **❓ Assessment Questions**: Questions to check knowledge for every chapter with professional results
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios plus troubleshooting
- **📊 Skill Progression**: Clear way to progress from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development results and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestones wey you fit check

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Dis version beta improve di multi-agent retail solution with better agent naming and better documentation.**

#### Changed
- **Multi-Agent Terminology**: Dem change "Cora agent" to "Customer agent" everywhere for retail multi-agent solution to make e clear well well
- **Agent Architecture**: Dem update all documentation, ARM templates, and code examples to dey use same "Customer agent" naming
- **Configuration Examples**: Modernize agent configuration pattern with updated names
- **Documentation Consistency**: Make sure all references dey use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Dem update retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Dem refresh Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Dem update all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Make agent roles and responsibilities clear for documentation
- **Production Readiness**: Better agreement with enterprise naming rules
- **Learning Materials**: Agent names wey easy to understand for educational matter
- **Template Usability**: Easier to sabi agent functions and deployment patterns

#### Technical Details
- Dem update Mermaid architecture diagrams with CustomerAgent references
- Dem change CoraAgent class names to CustomerAgent for Python examples
- Dem modify ARM template JSON configurations to use "customer" agent type
- Dem update environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Dem refresh all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Dis version turn di repository to full AI-centered learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Komple restructure wey put AI developers and engineers first
- **Microsoft Foundry Integration Guide**: Complete documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detail guide wey cover model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop to help dem convert AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Complete troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment wahala
- **AI Template Gallery**: Featured Microsoft Foundry template collection with complexity ratings
- **Workshop Materials**: Complete workshop setup with hands-on labs and reference materials

#### Enhanced
- **README Structure**: AI-developer-centered with 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey alongside traditional student and DevOps engineer paths
- **Template Recommendations**: Featured AI templates like azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Enhanced Discord community support with AI-specific channels and talks

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security setups
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical waka from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links verified and dey accessible
- **Complete Reference**: All internal documentation links verified and dey work
- **Production Ready**: Enterprise deployment patterns with real life examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Dis version na big overhaul of di repository structure and content display.**

#### Added
- **Structured Learning Framework**: All documentation pages now get Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Add Previous/Next lesson links everywhere for guided learning progression
- **Study Guide**: Complete study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Remove all emoji icons for better accessibility and professional look
- **Enhanced Content Structure**: Improve organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardize all documentation with consistent learning-focused structure
- **Navigation Flow**: Implement logical progress through all learning materials
- **Content Presentation**: Remove decorative things to get clear, professional formatting
- **Link Structure**: Update all internal links to support new navigation system

#### Improved
- **Accessibility**: Remove emoji dependencies for better screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation wey fit for enterprise learning
- **Learning Experience**: Structured approach with clear objectives and outcomes for every lesson
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
When you dey contribute to dis repository, make sure say changelog entries get:

1. **Version Number**: Follow semantic versioning (major.minor.patch)
2. **Date**: Release or update date for YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Short and clear description of wetin change
5. **Impact Assessment**: How di changes go affect users wey dey use am before

### Change Categories

#### Added
- New features, documentation parts, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Changes to wetin already dey or documentation
- Updates to make am clear or correct
- Restructuring content or organization

#### Deprecated
- Features or ways wey dem dey remove small small
- Documentation parts wey dem wan comot
- Methods wey get beta alternatives

#### Removed
- Features, documentation, or examples wey no relevant again
- Old information or deprecated ways
- Content wey de redundant or dem join am

#### Fixed
- Corrections for mistakes for documentation or code
- Solving reported issues or problems
- Make am beta and work well

#### Security
- Security-related betterments or fixes
- Updates to security best practices
- Fix security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Kain big change wey need make pesin do sometin
- Big change wey bounce tins or how tins show
- Change wey fit change how we dey do tin from ground up

#### Small Version (X.Y.0)
- New tins or putting tins inside
- Better tins wey still dey work wit old one
- More example, tool, or resource

#### Patch Version (X.Y.Z)
- Fix bugs and correct tins
- Small improvement to tins wey dey
- Explain well well and small beta tins

## Community Feedback and Suggestions

We dey make community feedback beta so we fit make this learning resource beta:

### How to Give Feedback
- **GitHub Issues**: Report wahala or suggest beta tins (AI-specific wahala dey welcome)
- **Discord Discussions**: Share ideas and run body with Microsoft Foundry community
- **Pull Requests**: Put your hands for direct beta content, especially AI templates and guides
- **Microsoft Foundry Discord**: Join #Azure channel for AZD + AI talk
- **Community Forums**: Join bigger Azure developer talk

### Feedback Categories
- **AI Content Accuracy**: Fix AI service integration and deployment information
- **Learning Experience**: Ideas to make AI developer learning beta pass
- **Missing AI Content**: Ask for more AI templates, patterns, or examples
- **Accessibility**: Make tins beta for different learning needs
- **AI Tool Integration**: Ideas to make AI development work beta together
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Wetin We Go Do
- **Issue Response**: Respond within 48 hours for reported wahala
- **Feature Requests**: Check within one week
- **Community Contributions**: Look within one week
- **Security Issues**: Urgent and quick response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Check content and links correct
- **Quarterly Updates**: Add big content and better tins
- **Semi-Annual Reviews**: Big restructure and beta upgrade
- **Annual Releases**: Big version update with better tins

### Monitoring and Quality Assurance
- **Automated Testing**: Regular check code examples and links
- **Community Feedback Integration**: Regular add user ideas
- **Technology Updates**: Follow latest Azure service and azd releases
- **Accessibility Audits**: Regular check for all design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security update and critical fix for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions don drop, we go:
- **Migration Guides**: Step by step tins to move
- **Compatibility Notes**: Tin wey go break present way
- **Tool Support**: Scripts or utility to help migration
- **Community Support**: Forum wey dey waka for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Go back to [Main README](README.md)

**Stay Updated**: Watch this repository to get notifications on new releases and important updates on learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->