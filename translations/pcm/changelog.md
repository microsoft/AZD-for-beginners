# Changelog - AZD For Beginners

## Introdukshon

Dis changelog dey record all important changes, updates, an improvements wey dem don make for di AZD For Beginners repository. We dey follow semantic versioning principles an we dey maintain dis log to help users sabi wetin don change between versions.

## Learning Goals

By reviewing dis changelog, you go:
- Dey informed about new features an new content wey dem add
- Sabi di improvements wey dem do for existing documentation
- Track bug fixes an corrections to make sure everything correct
- Follow how di learning materials don evolve over time

## Learning Outcomes

After you don review di changelog entries, you go fit:
- Identify new content an resources wey dey available for learning
- Understand which sections dem don update or improve
- Plan your learning path based on di most current materials
- Contribute feedback an suggestions for future improvements

## Version History

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Dis version add `azd ai`, `azd extension`, an `azd mcp` command coverage for all AI-related chapters, fix broken links an deprecated code for agents.md, update di cheat sheet, an overhaul di Example Templates section with validated descriptions an new Azure AI AZD templates.**

#### Added
- **🤖 AZD AI CLI coverage** across 7 files (before na only Chapter 8 get am):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section wey introduce `azd extension`, `azd ai agent init`, an `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` with comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" an "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now dey show both template an manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now include `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section wey get `azd extension`, `azd ai agent init`, `azd mcp`, an `azd infra generate`
- **📦 New AZD AI example templates** for `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat wit Blazor WebAssembly, Semantic Kernel, an voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat wey dey use Langchain4J wit ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app wey dey use Azure AI Agent Service, Bing Grounding, an Prompty
  - **serverless-chat-langchainjs** — Serverless RAG wey dey use Azure Functions + LangChain.js + Cosmos DB wit Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator wit admin portal, Teams integration, an PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app wit servers for .NET, Python, Java, an TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to di [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links don match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` don correct to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replace `opencensus` wit `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Move `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replace rough `len//4` estimate wit `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Correct services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host change Oct 2024)
- **contoso-chat**: Update description to reference Azure AI Foundry + Prompty, make am match di repo title an tech stack

#### Removed
- **ai-document-processing**: Remove non-functional template reference (repo no dey publicly accessible as an AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now dey show expected output an `azd monitor` step; Exercise 2 include full `FunctionTool` registration code; Exercise 3 replace vague guidance wit concrete `prepdocs.py` commands
- **📚 agents.md resources**: Update documentation links to current Azure AI Agent Service docs an quickstart
- **📋 agents.md Next Steps table**: Add AI Workshop Lab link for complete chapter coverage

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
**Dis version make README.md chapter navigation better wit improved table format.**

#### Changed
- **Course Map Table**: Make am better wit direct lesson links, duration estimates, an complexity ratings
- **Folder Cleanup**: Remove redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links for Course Map table don verify

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version update product references to di current Microsoft branding.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: All references don update across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name don update to reflect current branding

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
**Dis version restructure di documentation into dedicated chapter folders to make navigation clearer.**

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
- **📚 Chapter README files**: Create README.md for each chapter folder wey get:
  - Learning objectives an duration
  - Lesson table wit descriptions
  - Quick start commands
  - Navigation to other chapters

#### Changed
- **🔗 Update all internal links**: 78+ paths don update across all documentation files
- **🗺️ Main README.md**: Update Course Map wit new chapter structure
- **📝 examples/README.md**: Update cross-references to chapter folders

#### Removed
- Old folder structure (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Dis version add chapter navigation README files (dis one don supersede by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Dis version add complete guide for deploying AI agents wit Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide wey cover:
  - Wetin AI agents be an how dem different from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration an customization
  - Monitoring an metrics tracking
  - Cost considerations an optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises wit success criteria

#### Content Structure
- **Introduction**: Agent concepts for beginners
- **Quick Start**: Deploy agents wit `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams of agent patterns
- **Configuration**: Tool setup an environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Dis version update di development container configuration wit modern tools an better defaults for di AZD learning experience.**

#### Changed
- **🐳 Base Image**: Update from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Rename from "Python 3" to "AZD for Beginners" for clarity

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Port Forwarding**: Dem don pre-configure ports for common development:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Better Python IntelliSense
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
  - Dem add MkDocs minify plugin
  - Dem add pre-commit for code quality
  - Dem add Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now e dey verify say AZD and Azure CLI don install when container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**This version don improve README.md well-well make e dey more easy for beginners and e add important resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation wen person suppose use each tool with practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and how to contribute:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where person fit start based on developer experience

#### Changed
- **README Structure**: Dem reorganize am make e show important information first
- **Introduction Section**: Dem rewrite am to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Dem remove duplicate troubleshooting section
- **Troubleshooting Commands**: Dem fix `azd logs` reference to use valid `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Dem add `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Dem remove remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes apply to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements dey specially for developers wey new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**This version correct non-existent AZD commands for all documentation, make sure say all examples dey use valid Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Dem do complete audit and correct invalid commands:
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

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

#### Changed
- **Rollback Strategies**: Dem update docs to use Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Dem replace `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Dem remove non-existent parallel/incremental deployment flags and give valid alternatives

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: Commands validate against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**This version don finish the interactive workshop modules, fix all broken documentation links, and improve overall content quality for AI developers wey dey use Microsoft AZD.**

#### Added
- **📝 CONTRIBUTING.md**: New contribution guidelines document wey get:
  - Clear instructions how to report issues and propose changes
  - Documentation standards for new content
  - Code example guidelines and commit message conventions
  - Community engagement information

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Wrap-up module don complete with:
  - Comprehensive summary of workshop accomplishments
  - Key concepts mastered section wey cover AZD, templates, and Microsoft Foundry
  - Recommendations to continue learning journey
  - Workshop challenge exercises with difficulty ratings
  - Community feedback and support links

- **📚 Workshop Module 3 (Deconstruct)**: Updated learning objectives with:
  - GitHub Copilot with MCP servers activation guidance
  - AZD template folder structure understanding
  - Infrastructure-as-code (Bicep) organization patterns
  - Hands-on lab instructions

- **🔧 Workshop Module 6 (Teardown)**: Complete with:
  - Resource cleanup and cost management objectives
  - `azd down` usage for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery guidance
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Dem fix more than 15 broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Dem change from "Under Construction" to active workshop status with February 2026 date

- **🔗 Workshop Navigation**: Dem fix broken navigation links in workshop README.md wey point to non-existent lab-1-azd-basics folder

#### Changed
- **Workshop Presentation**: Dem remove "under construction" warning—workshop don ready for use
- **Navigation Consistency**: Make sure say all workshop modules get proper inter-module navigation
- **Learning Path References**: Dem update chapter cross-references to use correct microsoft-foundry paths

#### Validated
- ✅ All English markdown files get valid internal links
- ✅ Workshop modules 0-7 don complete with learning objectives
- ✅ Navigation between chapters and modules dey work correct
- ✅ Content good for AI developers wey dey use Microsoft AZD
- ✅ Language and structure still beginner-friendly
- ✅ CONTRIBUTING.md dey give clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script don verify all .md internal links
- **Content Audit**: Manual review of workshop completeness and beginner suitability
- **Navigation System**: Consistent chapter and module navigation patterns apply

#### Notes
- **Scope**: Changes apply to English documentation only
- **Translations**: Translation folders no update for this version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now give 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**This version add comprehensive A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

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
- **Pre-deployment Chapter**: Now e include comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Enhanced with professional authentication patterns
- **Production Readiness**: Complete coverage from security to observability
- **Course Outline**: Updated to reference new lessons in Chapters 3 and 6

#### Changed
- **Learning Progression**: Better integration of security and monitoring throughout course
- **Documentation Quality**: Consistent A-grade standards (95-97%) across new lessons
- **Production Patterns**: Complete end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Klear way from development go production monitoring
- **Security Standards**: Pro patterns for authentication and secrets management
- **Observability**: Full Application Insights integration wit AZD
- **AI Workloads**: Special monitoring for Microsoft Foundry Models and multi-agent systems

#### Validated
- ✅ All lessons get complete working code (no snippets)
- ✅ Mermaid diagrams for visual learning (19 total for 3 lessons)
- ✅ Hands-on exercises wey get verification steps (9 total)
- ✅ Production-ready Bicep templates we fit deploy with `azd up`
- ✅ Cost analysis and strategies to reduce cost
- ✅ Troubleshooting guides and best practices
- ✅ Knowledge checkpoints wey get verification commands

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Complete monitoring guide
- **docs/getting-started/authsecurity.md**: - Pro security patterns
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
**This version dey improve documentation quality for whole repository and add one complete Microsoft Foundry Models deployment example wit gpt-4.1 chat interface.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment wit working implementation for `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models infrastructure (gpt-4.1 model deployment)
  - Python command-line chat interface wit conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README wit 35-45 minute deployment guide
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
- **examples/README.md**: Updated to A-grade quality (93%):
  - Added azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Changed
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises wit clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Improved
- **Developer Experience**: Microsoft Foundry Models deployment now fit finish for 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Microsoft Foundry Models example
- **Learning Path**: AI developers get clear entry point wit azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validated
- ✅ Microsoft Foundry Models example fully functional wit `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index accurately reflect 4 local examples
- ✅ No duplicate external links in tables
- ✅ All navigation references correct

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets for Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**This version introduce complete, production-ready container application deployment examples wey use Azure Developer CLI (AZD), wit full documentation and integration into learning path.**

#### Added
- **🚀 Container App Examples**: New local examples for `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API wit scale-to-zero, health probes, monitoring, and troubleshooting
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
- **Next Steps**: Expand wit additional advanced container patterns and CI/CD automation for future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implement full product name change to "Microsoft Foundry" across all English documentation, to reflect Microsoft official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding to "Microsoft Foundry"
  - Updated all references across English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to show new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Updated Files
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

#### Validated
- ✅ Zero remaining "ai-foundry" folder path references in English docs
- ✅ Zero remaining "Microsoft Foundry" product name references in English docs
- ✅ All navigation links dey work with new folder structure
- ✅ File and folder renames complete successfully
- ✅ Cross-references between chapters validated

#### Notes
- **Scope**: Changes apply to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) no update for this version
- **Workshop**: Workshop materials (`workshop/`) no update for this version
- **Examples**: Example files fit still reference legacy naming (to be fix for future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you get local branches or documentation wey still dey reference old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate say all internal documentation links still dey work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduce full support for the new Azure Developer CLI preview feature and make workshop user experience better.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Full coverage of the new infrastructure preview capability
  - Command reference and usage examples for cheat sheet
  - Detailed integration in provisioning guide wit use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner wey show workshop development status
  - Gradient design wit construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality integrated across deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation move earlier in learning process
- **Workshop Presentation**: Professional status communication wit clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes fit now validate before deployment
- **Team Collaboration**: Preview results fit dey shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Less deployment failures because of advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner wit gradient styling
- **User Experience**: Clear development status prevent confusion
- **Professional Presentation**: Maintain repository credibility while set expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduce complete workshop materials wit browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Workshop wey you fit open for browser, wey get MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guide wey go carry you from discovery reach customization
  - 0-Introduction: Main gist of workshop and how to set up
  - 1-Select-AI-Template: How to find an choose template
  - 2-Validate-AI-Template: Deployment and validation steps
  - 3-Deconstruct-AI-Template: Make you sabi template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modification and iteration
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and wetin next to do
- **🛠️ Workshop Tooling**: MkDocs configuration wit Material theme to make learning experience better
- **🎯 Hands-On Learning Path**: 3-step method (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Smooth setup for development environment

#### Enhanced
- **AI Workshop Lab**: Dem extend am make e comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation wit navigation and visual aids
- **Learning Progression**: Clear step-by-step guide from template selection go production deployment
- **Developer Experience**: Integrated tooling for easier development workflow

#### Improved
- **Accessibility**: Browser-based interface wey get search, copy functionality, and theme toggle
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
- **📚 Chapter-Based Learning System**: Dem restructure the whole course into 8 progressive learning chapters
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
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites linked well

#### Enhanced
- **README Structure**: Turn am into structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page don include chapter context and progression guidance
- **Template Organization**: Examples and templates map to correct learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides link to relevant chapters
- **Workshop Integration**: Hands-on labs map to many chapter learning objectives

#### Changed
- **Learning Progression**: Shift from linear docs to flexible chapter-based learning
- **Configuration Placement**: Put configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: AI-specific content better spread across the learning journey
- **Production Content**: Advanced patterns gather for Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns make course waka easier
- **Professional Presentation**: University-style course structure fit for academic and corporate training
- **Learning Efficiency**: Time to find relevant content reduce because organization improve

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system wey connect related concepts
- **Chapter Mapping**: Templates and examples clear for learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to match 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter get specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear movement from basic concepts go enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Dem change "Cora agent" to "Customer agent" for retail multi-agent solution make e clear
- **Agent Architecture**: Update all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernize agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Make sure all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Update retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refresh Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Update all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities for documentation
- **Production Readiness**: Better fit with enterprise naming conventions
- **Learning Materials**: Agent naming dey more intuitive for education
- **Template Usability**: Make e easier to understand agent functions and deployment patterns

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
- **Microsoft Foundry Integration Guide**: Full documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide wey cover model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop to convert AI apps to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Complete troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment wahala
- **AI Template Gallery**: Featured collection of Microsoft Foundry templates with complexity ratings
- **Workshop Materials**: Complete workshop structure with hands-on labs and reference materials

#### Enhanced
- **README Structure**: AI-developer focused with 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey side-by-side traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates including azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Better Discord community support with AI-specific channels and discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security configurations
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links check and accessible
- **Complete Reference**: All internal documentation links validated and dey work
- **Production Ready**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: All documentation pages now get Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Add Previous/Next lesson links across documentation for guided learning progression
- **Study Guide**: Complete study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Dem remove all emoji icons for better accessibility and professional look
- **Enhanced Content Structure**: Improve organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardize all documentation with consistent learning-focused structure
- **Navigation Flow**: Implement logical progression through all learning materials
- **Content Presentation**: Remove decorative elements make presentation clear and professional
- **Link Structure**: Update internal links to support new navigation system

#### Improved
- **Accessibility**: Remove emoji dependency for better screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation fit for enterprise learning
- **Learning Experience**: Structured approach with clear objectives and outcomes for each lesson
- **Content Organization**: Better logical flow and connection between related topics

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Full deployment and provisioning documentation
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
  - Common Issues: Frequent problems wey people dey meet and solution
  - Debugging Guide: Systematic troubleshooting methods
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
- **Multiple Skill Levels**: Content for students up to professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices inside everything
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
- **Multi-Model Support**: Patterns wey show how to integrate Hugging Face, Azure Machine Learning, and custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Better monitoring for model performance, token usage, and response quality

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
When you dey contribute to this repository, make sure say changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of wetin change
5. **Impact Assessment**: How changes go affect existing users

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
- Documentation sections wey dem don schedule to remove
- Methods wey get better alternatives

#### Removed
- Features, documentation, or examples wey no dey relevant again
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
- Significant restructuring of content or organization
- Changes wey alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements wey still maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Small improvements to existing content
- Clarifications and minor enhancements

## Community Feedback and Suggestions

We dey encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Join broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions to improve AI developer learning flow
- **Missing AI Content**: Requests for extra AI templates, patterns, or examples
- **Accessibility**: Improvements for different learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with fast response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Check content accuracy and links
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Full restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Align with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions dey release, we go provide:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to help with migration
- **Community Support**: Dedicated forums for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis document don translate wit AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg sabi say automated translations fit get errors or mistakes. The original document for e own language na di correct/official source. If na important matter, better make professional human translator check am. We no dey responsible for any misunderstanding or wrong interpretation wey fit happen because of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->