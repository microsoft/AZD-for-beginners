# Wetin Don Change - AZD For Beginners

## Introdakshon

Dis changelog dey tok about all important changes, updates, and improvements we dem don do for the AZD For Beginners repository. We dey follow semantic versioning principles and we dey maintain this log to help users understand wetin don change between versions.

## Learning Goals

If you read dis changelog, you go:
- Dey informed about new features and content wey dem add
- Understand the improvements wey dem make for the documentation wey already dey
- Follow bug fixes and corrections make sure tins correct
- Track how the learning materials don dey evolve over time

## Learning Outcomes

After you don read the changelog entries, you go fit:
- Identify new content and resources wey dey available for learning
- Understand which sections dem don update or improve
- Plan your learning path based on the most current materials
- Give feedback and suggest improvements for later versions

## Version History

### [v3.19.1] - 2026-03-27

#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**Dis version na follow-up to the AZD 1.23 validation sweep with documentation wey focus on beginners: e dey clarify AZD-first authentication guidance, add local setup validation scripts, verify key commands against the live AZD CLI, and remove the last obsolete English-source command references wey still dey outside the changelog.**

#### Added
- **🧪 Beginner setup validation scripts** with `validate-setup.ps1` and `validate-setup.sh` so learners fit confirm the required tools before dem start Chapter 1
- **✅ Upfront setup validation steps** for the root README and Chapter 1 README so missing prerequisites dey catch before `azd up`

#### Changed
- **🔐 Beginner authentication guidance** now dey treat `azd auth login` as the main path for AZD workflows, while `az login` dey mentioned as optional unless person dey use Azure CLI commands directly
- **📚 Chapter 1 onboarding flow** now dey point learners to validate their local setup before installation, authentication, and first deployment steps
- **🛠️ Validator messaging** now clear separate blocking requirements from optional Azure CLI warnings for the AZD-only beginner path
- **📖 Configuration, troubleshooting, and example docs** now dey show difference between required AZD authentication and optional Azure CLI sign-in where before dem present both without context

#### Fixed
- **📋 Remaining English-source command references** don update to current AZD forms, including `azd config show` for the cheat sheet and `azd monitor --overview` where Azure Portal overview guidance dey intended
- **🧭 Beginner claims in Chapter 1** dem soften to avoid overpromising guaranteed zero-error or rollback behavior across all templates and Azure resources
- **🔎 Live CLI validation** don confirm current support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, and `azd down --force --purge`

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
**Dis version do documentation validation sweep against `azd` `1.23.12`, update outdated AZD command examples, refresh AI model guidance to current defaults, and expand the workshop instructions beyond GitHub Codespaces to also support dev containers and local clones.**

#### Added
- **✅ Validation notes across core chapters and workshop docs** to make the tested AZD baseline clear for learners wey dey use newer or older CLI builds
- **⏱️ Deployment timeout guidance** for long-running AI app deployments using `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** with `azd extension show azure.ai.agents` inside AI workflow docs
- **🌐 Broader workshop environment guidance** wey cover GitHub Codespaces, dev containers, and local clones with MkDocs

#### Changed
- **📚 Chapter intro READMEs** now consistently note validation against `azd 1.23.12` across foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, and production sections
- **🛠️ AZD command references** don update to current forms across the docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview dey intended
- **🧪 Provision preview examples** dem simplify to current supported usage like `azd provision --preview` and `azd provision --preview -e production`
- **🧭 Workshop flow** update make learners fit finish the labs for Codespaces, a dev container, or a local clone instead of assuming Codespaces-only execution
- **🔐 Authentication guidance** now prefer `azd auth login` for AZD workflows, with `az login` positioned as optional when Azure CLI commands dey used directly

#### Fixed
- **🪟 Windows install commands** normalize to current `winget` package casing inside the installation guide
- **🐧 Linux install guidance** correct to avoid unsupported distro-specific `azd` package manager instructions and instead point to release assets where e dey appropriate
- **📦 AI model examples** refresh from older defaults like `gpt-35-turbo` and `text-embedding-ada-002` to current examples such as `gpt-4.1-mini`, `gpt-4.1`, and `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** correct to use current environment and status commands for logs, scripts, and troubleshooting steps
- **⚙️ GitHub Actions guidance** update from `Azure/setup-azd@v1.0.0` to `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** update from `azd mcp consent` to `azd copilot consent list`

#### Improved
- **🧠 AI chapter guidance** now dey explain preview-sensitive `azd ai` behavior better, tenant-specific login, current extension usage, and updated model deployment recommendations
- **🧪 Workshop instructions** now use more realistic version examples and clearer environment setup language for hands-on labs
- **📈 Production and troubleshooting docs** now align better with current monitoring, fallback model, and cost-tier examples

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
**Dis version add `azd ai`, `azd extension`, and `azd mcp` command coverage across all AI-related chapters, fix broken links and deprecated code for agents.md, update the cheat sheet, and overhaul the Example Templates section with validated descriptions and new Azure AI AZD templates.**

#### Added
- **🤖 AZD AI CLI coverage** across 7 files (before e dey only for Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section wey introduce `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` with comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now show both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now include `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section with `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** wey appear for `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat with Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat wey use Langchain4J with ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app wey use Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG with Azure Functions + LangChain.js + Cosmos DB and Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator with admin portal, Teams integration, and PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app with servers for .NET, Python, Java, and TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now match the Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` correct to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replace `opencensus` with `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Move `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replace rough `len//4` estimate with `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correct services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host change since Oct 2024)
- **contoso-chat**: Update description to reference Azure AI Foundry + Prompty, to match the repo's actual title and tech stack

#### Removed
- **ai-document-processing**: Remove non-functional template reference (repo no dey publicly accessible as an AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 don show wetin dem expect as output now and `azd monitor` step; Exercise 2 get full `FunctionTool` registration code; Exercise 3 don change vague guidance to concrete `prepdocs.py` commands
- **📚 agents.md resources**: Dem update documentation links to current Azure AI Agent Service docs and quickstart
- **📋 agents.md Next Steps table**: Dem add AI Workshop Lab link make the chapter cover complete

#### Files Wey Dem Update
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
**Dis version don improve README.md chapter navigation with better table format.**

#### Wetin Dem Change
- **Course Map Table**: Dem enhance am with direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Dem remove redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Dem verify all 21+ internal links for Course Map table

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version update product references to current Microsoft branding.**

#### Wetin Dem Change
- **Microsoft Foundry → Microsoft Foundry**: All references don update across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name don update to match current branding

#### Files Wey Dem Update
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

#### Big Repository Restructure: Chapter-Based Folder Names
**Dis version don restructure the documentation into chapter folders make navigation clearer.**

#### Folder Renames
Old folders don change to chapter-numbered folders:
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
- **📚 Chapter README files**: Dem create README.md for each chapter with:
  - Learning objectives and duration
  - Lesson table with descriptions
  - Quick start commands
  - Navigation to other chapters

#### Changed
- **🔗 Updated all internal links**: 78+ paths don update across all documentation files
- **🗺️ Main README.md**: Course Map don update with new chapter structure
- **📝 examples/README.md**: Cross-references don update to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Dis version add chapter navigation README files (this one don supersede by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Dis version add full guide for deploying AI agents with Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide wey cover:
  - Wetin AI agents be and how dem different from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and how to customize
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
**Dis version update the development container configuration with modern tools and better defaults for the AZD learning experience.**

#### Wetin Dem Change
- **🐳 Base Image**: Change from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Rename from "Python 3" to "AZD for Beginners" for clarity

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` with Bicep support enabled
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
  - Add MkDocs minify plugin
  - Add pre-commit for code quality
  - Add Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now e verify AZD and Azure CLI installation when container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Dis version make README.md much more friendly for beginners and add important resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation of when to use each tool with practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where to start based on developer experience

#### Changed
- **README Structure**: Reorganize for progressive disclosure - key information first
- **Introduction Section**: Rewrite to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Dem remove duplicate troubleshooting section
- **Troubleshooting Commands**: Fix `azd logs` reference to use valid `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Dem add `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Dem remove remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes apply to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements target developers wey dey new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Dis version correct non-existent AZD commands for all documentation, make sure all code examples use valid Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Full audit and correction of invalid commands:
  - `azd logs` (no dey) → replace with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (no dey) → replace with `azd show` and Azure CLI
  - `azd infra import/export/validate` (no dey) → remove or replace with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (no dey) → remove
  - `azd provision --what-if/--rollback` flags (no dey) → update to use `--preview`
  - `azd config validate` (no dey) → replace with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no dey) → remove

- **📚 Files Wey Dem Update with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fix rollback and deployment strategies
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
- **Rollback Strategies**: Documentation now use Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Replace `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Remove non-existent parallel/incremental deployment flags, provide valid alternatives

#### Technical Details
- **AZD commands wey correct**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **azd monitor flags wey correct**: `--live`, `--logs`, `--overview`
- **Features wey dem remove**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands don validate against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**This version don finish the interactive workshop modules, fix all broken documentation links, and improve overall content quality for AI developers wey dey use Microsoft AZD.**

#### Wey dem add
- **📝 CONTRIBUTING.md**: New contribution guidelines document wey get:
  - Clear instructions for reporting issues and proposing changes
  - Documentation standards for new content
  - Code example guidelines and commit message conventions
  - Community engagement information

#### Wey dem complete
- **🎯 Workshop Module 7 (Wrap-up)**: Wrap-up module don complete full with:
  - Comprehensive summary of workshop accomplishments
  - Key concepts mastered section wey cover AZD, templates, and Microsoft Foundry
  - Learning journey continuation recommendations
  - Workshop challenge exercises with difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Learning objectives don update with:
  - GitHub Copilot with MCP servers activation guidance
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Don complete with:
  - Resource cleanup and cost management objectives
  - `azd down` usage for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery guidance
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Wey dem fix
- **🔗 Broken Link Fixes**: Dem resolve 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Dem update from "Under Construction" to active workshop status with February 2026 date

- **🔗 Workshop Navigation**: Fixed broken navigation links for workshop README.md wey point to non-existent lab-1-azd-basics folder

#### Wey dem change
- **Workshop Presentation**: Dem remove "under construction" warning, workshop don complete and ready to use
- **Navigation Consistency**: Make sure say all workshop modules get proper inter-module navigation
- **Learning Path References**: Update chapter cross-references to use correct microsoft-foundry paths

#### Wey dem validate
- ✅ All English markdown files get valid internal links
- ✅ Workshop modules 0-7 don complete with learning objectives
- ✅ Navigation between chapters and modules dey work correct
- ✅ Content fit for AI developers wey dey use Microsoft AZD
- ✅ Language and structure remain beginner-friendly throughout
- ✅ CONTRIBUTING.md dey provide clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script don verify all .md internal links
- **Content Audit**: Manual review of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns don apply

#### Notes
- **Scope**: Changes apply to English documentation only
- **Translations**: Translation folders no update for this version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now give 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**This version don add full A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Wey dem add
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
  - 6 Mermaid diagrams wey show agent interactions
  - 3 advanced exercises (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/month) with optimization strategies
  - Application Insights integration for monitoring

#### Wey dem enhance
- **Pre-deployment Chapter**: Now include comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Enhance with professional authentication patterns
- **Production Readiness**: Full coverage from security to observability
- **Course Outline**: Update to reference new lessons in Chapters 3 and 6

#### Wey dem change
- **Learning Progression**: Better integration of security and monitoring across course
- **Documentation Quality**: Consistent A-grade standards (95-97%) for new lessons
- **Production Patterns**: Full end-to-end coverage for enterprise deployments

#### Wey dem improve
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Microsoft Foundry Models and multi-agent systems

#### Wey dem validate
- ✅ All lessons include complete working code (no be only snippets)
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
**This version improve documentation quality across the repo and add full Microsoft Foundry Models deployment example with gpt-4.1 chat interface.**

#### Wey dem add
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
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

#### Wey dem enhance
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

#### Wey dem change
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria add to key workflows

#### Wey dem improve
- **Developer Experience**: Microsoft Foundry Models deployment now take 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers get clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Wey dem validate
- ✅ Microsoft Foundry Models example full functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links update across 8+ locations
- ✅ Examples index show correct 4 local examples
- ✅ No duplicate external links for tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets for Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**This version introduce comprehensive, production-ready container application deployment examples wey use Azure Developer CLI (AZD), with full documentation and integration into the learning path.**

#### Wey dem add
- **🚀 Container App Examples**: New local examples for `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Wey dem change
- **README.md**: Dem don update am make e show and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Dem don update am to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Course Outline & Study Guide**: Dem don update am to reference new container app examples and deployment patterns for relevant chapters

#### Dem don validate
- ✅ All new examples fit deploy with `azd up` and dem follow best practices
- ✅ Documentation cross-links and navigation don update
- ✅ Examples cover from beginner reach advanced scenarios, include production microservices

#### Notes
- **Scope**: Only English documentation and examples
- **Next Steps**: Expand wit more advanced container patterns and CI/CD automation for future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Dis version don implement full product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, wey dey reflect Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Updated all references across English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references don update across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references don update to reflect new folder structure
  - Navigation links don validate across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links don update to reference new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation links don update
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references don update
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already dey use Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references don update (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links don update
  - `docs/getting-started/first-project.md` - 2 chapter navigation links don update
  - `docs/getting-started/installation.md` - 2 next chapter links don update
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references don update (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link don update
  - `docs/troubleshooting/debugging.md` - 1 navigation link don update

- **Course Structure Files** (2 files):
  - `README.md` - 17 references don update (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references don update (overview, learning objectives, chapter resources)

#### Dem don validate
- ✅ No remaining "ai-foundry" folder path references for English docs
- ✅ No remaining "Microsoft Foundry" product name references for English docs
- ✅ All navigation links dey functional with new folder structure
- ✅ File and folder renames complete
- ✅ Cross-references between chapters don validate

#### Notes
- **Scope**: Changes apply only to English documentation inside `docs/` folder
- **Translations**: `translations/` folders no update for dis version
- **Workshop**: `workshop/` materials no update for dis version
- **Examples**: Example files fit still refer to legacy naming (this one go dey fix for future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you get local branches or documentation wey dey reference the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate say all internal documentation links still dey work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Dis version bring full support for the new Azure Developer CLI preview feature and improve workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Full coverage of the new infrastructure preview capability
  - Command reference and usage examples for cheat sheet
  - Detailed integration inside provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide don update with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner wey dey show workshop development status
  - Gradient design with construction indicators to make message clear
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality don integrate throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Command sequences don update to include preview as best practice
- **Workshop Experience**: Clear expectations don set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow na the recommended approach now
- **Documentation Flow**: Infrastructure validation don move earlier for the learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes fit now dey validate before deployment
- **Team Collaboration**: Preview results fit dey share for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Deployment failures reduce because of advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature don document for 4 key files
- **Command Patterns**: Syntax and examples consistent across documentation
- **Best Practice Integration**: Preview include for validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings make am easy to find

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevent confusion
- **Professional Presentation**: Repository still dey credible while e dey set expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Dis version add full workshop materials wey get browser-based interactive guides and structured learning paths.**

#### Added
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
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme to improve learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended wit comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guide from template selection reach production deployment
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
**Dis version introduce full chapter-based learning structure with better navigation across the whole repository.**

#### Added
- **📚 Chapter-Based Learning System**: Reorganized the whole course into 8 progressive learning chapters
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
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Turn am into structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now include chapter context and progression guidance
- **Template Organization**: Examples and templates map to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connect to relevant chapters
- **Workshop Integration**: Hands-on labs map to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Shift from linear docs to flexible chapter-based learning
- **Configuration Placement**: Reposition configuration guide as Chapter 3 for better flow
- **AI Content Integration**: Better integration of AI-specific content throughout learning journey
- **Production Content**: Advanced patterns group into Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns make course easier to go through
- **Professional Presentation**: University-style course structure fit for academic and corporate training
- **Learning Efficiency**: Time to find relevant content don reduce because organization improve

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system wey connect related concepts
- **Chapter Mapping**: Templates and examples clearly associated with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Study guide restructure to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter get specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts reach enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Dis version improve the multi-agent retail solution with better agent naming and improved documentation.**

#### Changed
- **Multi-Agent Terminology**: Dem change "Cora agent" to "Customer agent" for the retail multi-agent solution so e go clear
- **Agent Architecture**: Dem update all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Agent configuration patterns modernize with updated naming conventions
- **Documentation Consistency**: Make sure say all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Don update retail-multiagent-arm-template make e include Customer agent references
- **Architecture Diagrams**: Don refresh Mermaid diagrams wit updated agent naming
- **Code Examples**: Python classes and implementation examples don now use CustomerAgent naming
- **Environment Variables**: Don update all deployment scripts make dem use CUSTOMER_AGENT_NAME conventions

#### Wetin Dem Improve
- **Developer Experience**: Make agent roles and responsibilities for documentation more clear
- **Production Readiness**: Better align wit enterprise naming conventions
- **Learning Materials**: Agent naming don become more intuitive for educational purposes
- **Template Usability**: E don simplify how people fit understand agent functions and deployment patterns

#### Technical Details
- Don update Mermaid architecture diagrams wit CustomerAgent references
- Don replace CoraAgent class names wit CustomerAgent in Python examples
- Modify ARM template JSON configurations make dem use "customer" agent type
- Don update environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Don refresh all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - Dem turn repo to AI-focused learning resource plus Microsoft Foundry integration
**Dis version don transform di repository into a comprehensive AI-focused learning resource wit Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure wey prioritize AI developers and engineers
- **Microsoft Foundry Integration Guide**: Full documentation wey show how to connect AZD to Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide wey cover model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop wey teach how to turn AI applications into AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Comprehensive troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment issues
- **AI Template Gallery**: Featured collection of Microsoft Foundry templates wit complexity ratings
- **Workshop Materials**: Complete workshop structure wit hands-on labs and reference materials

#### Enhanced
- **README Structure**: README don focus on AI-developer with 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey side-by-side wit traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates dem like azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Better Discord community support wit AI-specific channels and discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security configurations
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links don verify and dey accessible
- **Complete Reference**: All internal documentation links don validate and dey functional
- **Production Ready**: Enterprise deployment patterns wit real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Dem restructure repository and make am professional
**Dis version na big overhaul of di repository structure and how content dey present.**

#### Added
- **Structured Learning Framework**: All documentation pages don include Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Add Previous/Next lesson links throughout all documentation for guided learning progression
- **Study Guide**: Comprehensive study-guide.md wit learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Remove all emoji icons for better accessibility and professional appearance
- **Enhanced Content Structure**: Better organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardize all documentation wit consistent learning-focused structure
- **Navigation Flow**: Implement logical progression through all learning materials
- **Content Presentation**: Remove decorative elements make di formatting clear and professional
- **Link Structure**: Update all internal links to support new navigation system

#### Improved
- **Accessibility**: Remove emoji dependencies for better screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation wey suit enterprise learning
- **Learning Experience**: Structured approach wit clear objectives and outcomes for each lesson
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
- **Version Compatibility**: Up-to-date wit latest Azure services and azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Better monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + Microsoft Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises wit automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners focusing on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, and audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers wit isolated AI services
- **Edge AI Deployment**: Integration wit Azure IoT Edge and container instances
- **Hybrid Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration wit Azure Machine Learning pipelines
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
When you dey contribute to dis repository, make sure say changelog entries include:

1. **Version Number**: Follow semantic versioning (major.minor.patch)
2. **Date**: Release or update date for YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Short and clear description of wetin change
5. **Impact Assessment**: How di changes go affect existing users

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
- Features or approaches wey dem dey phase out
- Documentation sections wey dem plan remove
- Methods wey get better alternatives

#### Removed
- Features, documentation, or examples wey don no relevant again
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors for documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes wey need user action
- Big restructuring of content or organization
- Changes wey alter di fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements wey still keep backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Small improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We dey encourage community feedback to help improve dis learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage wit the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Enter for #Azure channel for AZD + AI discussions
- **Community Forums**: Join broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions to make AI developer learning flow better
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
- **Annual Releases**: Major version updates wit significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Keep in line wit latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Di latest major version**: We dey fully support am and dey give regular updates
- **Di previous major version**: Security updates an critical fixes for 12 months
- **Legacy Versions**: Na community dey support only, no official updates

### Migration Guidance
When major versions dem release, we dey provide:
- **Migration Guides**: Step-by-step instructions wey show how to migrate
- **Compatibility Notes**: Details wey explain breaking changes
- **Tool Support**: Scripts or utilities wey go help for migration
- **Community Support**: Dedicated forums wey you fit ask migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Go back to [Main README](README.md)

**Stay Updated**: Follow this repository make you dey get notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate with AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get errors or mistakes. Di original document for im native language suppose be di authoritative source. For critical information, we recommend make professional human translator handle am. We no dey liable for any misunderstandings or misinterpretations wey fit arise from di use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->