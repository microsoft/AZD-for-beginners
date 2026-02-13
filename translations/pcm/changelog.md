# Wetin Don Change - AZD For Beginners

## Introduction

Dis changelog dey document all important changes, updates, and improvements wey dem don make for the AZD For Beginners repository. We dey follow semantic versioning principles and we dey maintain dis log to help users understand wetin don change between versions.

## Learning Goals

By reviewing dis changelog, you go:
- Dey aware of new features and new content wey dem add
- Sabi the improvements wey dem make for the documentation wey already dey
- Track bug fixes and corrections make sure say everything correct
- Follow how the learning materials don evolve over time

## Learning Outcomes

After you don review the changelog entries, you go fit:
- Identify new content and resources wey dey available for learning
- Sabi which sections dem don update or improve
- Plan your learning path based on the latest materials
- Contribute feedback and suggestions for later improvements

## Version History

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**Dis version dey improve README.md chapter navigation with better table format.**

#### Changed
- **Course Map Table**: Enhanced with direct lesson links, duration estimates, and complexity ratings
- **Folder Cleanup**: Removed redundant old folders (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: All 21+ internal links in Course Map table verified

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Dis version update product references to current Microsoft branding.**

#### Changed
- **Azure AI Foundry → Microsoft Foundry**: All references updated across non-translation files
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
**Dis version restructure the documentation into chapter folders make navigation clear.**

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
- **📚 Chapter README files**: Created README.md for each chapter folder wey get:
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
**Dis version add chapter navigation README files (superseded by v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Dis version add one full guide for deploying AI agents with Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide wey cover:
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
- **Quick Start**: Deploy agents with `azd init --template get-started-with-ai-agents`
- **Architecture Patterns**: Visual diagrams of agent patterns
- **Configuration**: Tool setup and environment variables
- **Monitoring**: Application Insights integration
- **Exercises**: Progressive hands-on learning (20-45 minutes each)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Dis version update the development container configuration with modern tools and better defaults for the AZD learning experience.**

#### Changed
- **🐳 Base Image**: Updated from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 Container Name**: Renamed from "Python 3" to "AZD for Beginners" for clarity

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

- **⚙️ VS Code Settings**: Added default settings for Python interpreter, format on save, and whitespace trimming

- **📦 Updated requirements-dev.txt**:
  - Added MkDocs minify plugin
  - Added pre-commit for code quality
  - Added Azure SDK packages (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: Now verifies AZD and Azure CLI installation on container start

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Dis version really improve the README.md make am easier for beginners and add important resources for AI developers.**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: Clear explanation of when to use each tool with practical examples
- **🌟 Awesome AZD Links**: Direct links to community template gallery and contribution resources:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Quick Start Guide**: Simplified 3-step getting started section (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: Clear guidance on where to start based on developer experience

#### Changed
- **README Structure**: Reorganized for progressive disclosure - key information first
- **Introduction Section**: Rewrote to explain "The Magic of `azd up`" for complete beginners
- **Removed Duplicate Content**: Eliminated duplicate troubleshooting section
- **Troubleshooting Commands**: Fixed `azd logs` reference to use valid `azd monitor --logs`

#### Fixed
- **🔐 Authentication Commands**: Added `azd auth login` and `azd auth logout` to cheat-sheet.md
- **Invalid Command References**: Removed remaining `azd logs` from README troubleshooting section

#### Notes
- **Scope**: Changes applied to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements specifically aimed at developers new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Dis version correct non-existent AZD commands for the documentation, make sure say all code examples dey use valid Azure Developer CLI syntax.**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: Comprehensive audit and correction of invalid commands:
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

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Changed hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Changed
- **Rollback Strategies**: Updated documentation to use Git-based rollback (AZD no get native rollback)
- **Log Viewing**: Replaced `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Removed non-existent parallel/incremental deployment flags, provide valid alternatives

#### Technical Details
- **Valid AZD Kommands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Features wey dem comot**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notis
- **Verifikashen**: Commands don validate for Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshop Don Complete and Documentation Quality Don Improve
**Dis version don finish di interactive workshop modules, fix all broken documentation links, and improve overall content quality for AI developers wey dey use Microsoft AZD.**

#### Wetin dem add
- **📝 CONTRIBUTING.md**: New contribution guidelines document wey get:
  - Clear instructions how to report wahala and propose changes
  - Documentation standards wey new content suppose follow
  - Guidelines for code example dem and how to write commit message dem
  - Information on how community fit engage

#### Wetin dem finish
- **🎯 Workshop Module 7 (Wrap-up)**: Wrap-up module don complete full with:
  - Complete summary of wetin workshop don achieve
  - Section wey show key concepts wey people don master covering AZD, templates, and AI Foundry
  - Recommendations how person fit continue dia learning journey
  - Workshop challenge exercises with difficulty ratings
  - Links for community feedback and support

- **📚 Workshop Module 3 (Deconstruct)**: Updated learning objectives wey include:
  - GitHub Copilot with MCP servers activation guidance
  - Make person sabi AZD template folder structure
  - Infrastructure-as-code (Bicep) organization patterns
  - Instructions for hands-on lab

- **🔧 Workshop Module 6 (Teardown)**: Completed with:
  - Resource cleanup and cost management objectives
  - `azd down` usage for safe infrastructure deprovisioning
  - Soft-deleted cognitive services recovery guidance
  - Bonus exploration prompts for GitHub Copilot and Azure Portal

#### Wetin dem fix
- **🔗 Broken Link Fixes**: Dem solve 15+ broken internal documentation links:
  - `docs/ai-foundry/ai-model-deployment.md`: Fix path dem to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Workshop Status Banner**: Updated from "Under Construction" to active workshop status with February 2026 date

- **🔗 Workshop Navigation**: Fixed broken navigation links in workshop README.md wey dey point to non-existent lab-1-azd-basics folder

#### Wetin change
- **Workshop Presentation**: Remove "under construction" warning — workshop don complete and ready for use
- **Navigation Consistency**: Make sure all workshop modules get proper inter-module navigation
- **Learning Path References**: Updated chapter cross-references to use correct microsoft-foundry paths

#### Dem don validate
- ✅ All English markdown files get valid internal links
- ✅ Workshop modules 0-7 don complete with learning objectives
- ✅ Navigation between chapters and modules dey work correct
- ✅ Content dey suitable for AI developers wey dey use Microsoft AZD
- ✅ Language and structure remain beginner-friendly
- ✅ CONTRIBUTING.md dey provide clear guidance for community contributors

#### Technical Implementation
- **Link Validation**: Automated PowerShell script don verify all .md internal links
- **Content Audit**: Manual review of workshop completeness and whether e dey suitable for beginners
- **Navigation System**: Consistent chapter and module navigation patterns apply

#### Notis
- **Scope**: Changes apply to English documentation only
- **Translations**: Translation folders no update for dis version (automated translation go sync later)
- **Workshop Duration**: Complete workshop now fit give 3-4 hours of hands-on learning

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Dis version add complete A-grade lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Wetin dem add
- **📊 Application Insights Integration Lesson**: for `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment with automatic provisioning
  - Complete Bicep templates for Application Insights + Log Analytics
  - Working Python applications with custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Azure OpenAI token/cost tracking)
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
- **Pre-deployment Chapter**: Now include comprehensive monitoring and coordination patterns
- **Getting Started Chapter**: Improved with professional authentication patterns
- **Production Readiness**: Full coverage from security to observability
- **Course Outline**: Updated to reference new lessons in Chapters 3 and 6

#### Wetin change
- **Learning Progression**: Better join of security and monitoring across the course
- **Documentation Quality**: Consistent A-grade standards (95-97%) for the new lessons
- **Production Patterns**: Full end-to-end coverage for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Special monitoring for Azure OpenAI and multi-agent systems

#### Dem don validate
- ✅ All lessons get complete working code (no be only snippets)
- ✅ Mermaid diagrams for visual learning (19 total across 3 lessons)
- ✅ Hands-on exercises with verification steps (9 total)
- ✅ Production-ready Bicep templates weh fit deploy via `azd up`
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

#### Documentation Quality Improvements and New Azure OpenAI Example
**Dis version make documentation better across the repo and add complete Azure OpenAI deployment example with GPT-4 chat interface.**

#### Wetin dem add
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Azure OpenAI infrastructure (GPT-4 model deployment)
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

#### Enhanced
- **examples/README.md**: Updated to A-grade quality (93%):
  - Add azure-openai-chat to all relevant sections
  - Updated local example count from 3 to 4
  - Added to AI Application Examples table
  - Integrated into Quick Start for Intermediate Users
  - Added to Microsoft Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Wetin change
- **Learning Progression**: Better join of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Improved
- **Developer Experience**: Azure OpenAI deployment now take 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Azure OpenAI example
- **Learning Path**: AI developers get clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Dem don validate
- ✅ Azure OpenAI example dey fully functional with `azd up`
- ✅ All 11 implementation files syntactically correct
- ✅ README instructions match actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index correctly show 4 local examples
- ✅ No duplicate external links for tables
- ✅ All navigation references correct

#### Technical Implementation
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets for Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Dis version introduce comprehensive, production-ready container application deployment examples wey use Azure Developer CLI (AZD), with full documentation and join into the learning path.**

#### Wetin dem add
- **🚀 Container App Examples**: New local examples for `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Wetin change
- **README.md**: Updated to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Updated to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Course Outline & Study Guide**: Dem don update am make e reference new container app examples and deployment patterns inside the chapters wey concern am

#### Validated
- ✅ All new examples fit deploy with `azd up` and dem dey follow best practices
- ✅ Documentation cross-links and navigation don update
- ✅ Examples cover from beginner reach advanced scenarios, including production microservices

#### Notes
- **Scope**: Na English documentation and examples only
- **Next Steps**: Make we add more advanced container patterns and CI/CD automation for future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**This version implements a comprehensive product name change from "Microsoft Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Microsoft Foundry" to "Microsoft Foundry"
  - Dem don update all references across English documentation for `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references don update across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references don update to show the new folder structure
  - Navigation links don validate across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links don update to reference the new filename

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

#### Validated
- ✅ No more "ai-foundry" folder path references inside English docs
- ✅ No more "Microsoft Foundry" product name references left inconsistent inside English docs
- ✅ All navigation links dey functional with the new folder structure
- ✅ File and folder renames don complete successful
- ✅ Cross-references between chapters don validate

#### Notes
- **Scope**: Changes apply to English documentation inside `docs/` folder only
- **Translations**: Translation folders (`translations/`) no update for this version
- **Workshop**: Workshop materials (`workshop/`) no update for this version
- **Examples**: Some example files fit still get legacy naming (we go handle am for future update)
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
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Full coverage of the new infrastructure preview capability
  - Command reference and usage examples dey for the cheat sheet
  - Detailed integration inside the provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide don update with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner wey dey show workshop development status
  - Gradient design with construction indicators make user sabi the state
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality don integrate throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Command sequences don update to include preview as best practice
- **Workshop Experience**: Clear expectations don set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now na recommended approach
- **Documentation Flow**: Infrastructure validation don move earlier inside the learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes fit now dey validated before deployment
- **Team Collaboration**: Preview results fit dey shared for review and approval
- **Cost Awareness**: Better sense of resource costs before provisioning
- **Risk Mitigation**: Deployment failures don reduce through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature don document across 4 key files
- **Command Patterns**: Consistent syntax and examples across documentation
- **Best Practice Integration**: Preview include for validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings make e easy to find

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status dey prevent confusion
- **Professional Presentation**: E maintain repository credibility as e set expectations
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
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for better learning experience
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
- **Visual Assets**: Screenshots and diagrams for better understanding
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
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Dem turn am into structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now get chapter context and progression guidance
- **Template Organization**: Examples and templates map to the correct learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connect to relevant chapters
- **Workshop Integration**: Hands-on labs map to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Dem move from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Dem reposition configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content across the learning journey
- **Production Content**: Advanced patterns don consolidate for Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns make course easier to waka through
- **Professional Presentation**: University-style course structure wey fit academic and corporate training
- **Learning Efficiency**: Time to find relevant content don reduce because organisation don improve

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system wey connect related concepts
- **Chapter Mapping**: Templates and examples clearly associate with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Dem restructure study guide to match the 8-chapter system
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
- **Multi-Agent Terminology**: Dem replace "Cora agent" with "Customer agent" everywhere for the retail multi-agent solution make e clear well
- **Agent Architecture**: Dem update all documentation, ARM templates, and code examples to use the consistent "Customer agent" naming
- **Configuration Examples**: Modernize agent configuration patterns with the new naming conventions
- **Documentation Consistency**: Make sure say all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Update retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refresh Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now dey use CustomerAgent naming
- **Environment Variables**: Dem update all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Make agent roles an responsibilities for di documentation clear
- **Production Readiness**: Better align wit enterprise naming conventions
- **Learning Materials**: Make agent names dem more intuitive for learning
- **Template Usability**: Simplify how people sabi agent functions an deployment patterns

#### Technical Details
- Don update Mermaid architecture diagrams wit CustomerAgent references
- Don replace CoraAgent class names wit CustomerAgent for Python examples
- Don change ARM template JSON configurations make dem use "customer" agent type
- Don update environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Don refresh all deployment commands an container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Dis version don turn di repository into one complete AI-focused learning resource wey get Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure wey prioritize AI developers an engineers
- **Microsoft Foundry Integration Guide**: Complete documentation wey show how to connect AZD to Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide wey cover how to choose model, configure am, an deploy for production
- **AI Workshop Lab**: 2-3 hour hands-on workshop wey show how to convert AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, an securing AI workloads
- **AI-Specific Troubleshooting Guide**: Complete troubleshooting for Azure OpenAI, Cognitive Services, an AI deployment wahala
- **AI Template Gallery**: Featured collection of Microsoft Foundry templates wit complexity ratings
- **Workshop Materials**: Complete workshop structure wit hands-on labs an reference materials

#### Enhanced
- **README Structure**: README structure wey focus on AI developers, plus 45% community interest data from Microsoft Foundry Discord
- **Learning Paths**: Dedicated AI developer journey alongside traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates including azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Better Discord community support wit AI-specific channels an discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication an security configurations
- **Cost Optimization**: Token usage tracking an budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics an Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links verified an accessible
- **Complete Reference**: All internal documentation links validated an dey work
- **Production Ready**: Enterprise deployment patterns wit real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Dis version na big overhaul of di repo structure an how content dey present.**

#### Added
- **Structured Learning Framework**: All documentation pages now include Introduction, Learning Goals, an Learning Outcomes sections
- **Navigation System**: Add Previous/Next lesson links throughout all documentation for guided learning progression
- **Study Guide**: Complete study-guide.md wit learning objectives, practice exercises, an assessment materials
- **Professional Presentation**: Remove all emoji icons for better accessibility an professional look
- **Enhanced Content Structure**: Improve organization an flow of learning materials

#### Changed
- **Documentation Format**: Standardize all documentation wit consistent learning-focused structure
- **Navigation Flow**: Implement logical progression through all learning materials
- **Content Presentation**: Remove decorative elements so make formatting clear an professional
- **Link Structure**: Update all internal links to support new navigation system

#### Improved
- **Accessibility**: Remove emoji dependencies to improve screen reader compatibility
- **Professional Appearance**: Clean, academic-style presentation wey suit enterprise learning
- **Learning Experience**: Structured approach wit clear objectives an outcomes for each lesson
- **Content Organization**: Better logical flow an connection between related topics

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Complete deployment an provisioning documentation
  - Detailed troubleshooting resources an debugging guides
  - Pre-deployment validation tools an procedures

- **Getting Started Module**
  - AZD Basics: Core concepts an terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup an authentication
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
  - Cost estimation an budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems an solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques an tools
  - Performance monitoring an optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology an acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links an community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Installation an configuration guides for Windows, macOS, an Linux
- **Multiple Skill Levels**: Content designed for students up to professional developers
- **Practical Focus**: Hands-on examples an real-world scenarios
- **Comprehensive Coverage**: From basic concepts to advanced enterprise patterns
- **Security-First Approach**: Security best practices integrated throughout
- **Cost Optimization**: Guidance for cost-effective deployments an resource management

#### Documentation Quality
- **Detailed Code Examples**: Practical, tested code samples
- **Step-by-Step Instructions**: Clear, actionable guidance
- **Comprehensive Error Handling**: Troubleshooting for common issues
- **Best Practices Integration**: Industry standards an recommendations
- **Version Compatibility**: Up-to-date with latest Azure services an azd features

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integration patterns for Hugging Face, Azure Machine Learning, an custom models
- **AI Agent Frameworks**: Templates for LangChain, Semantic Kernel, an AutoGen deployments
- **Advanced RAG Patterns**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Enhanced monitoring for model performance, token usage, an response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises wit automated validation for AI scenarios
- **Video Content**: Supplementary video tutorials for visual learners wey focus on AI deployments

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI model governance, compliance, an audit trails
- **Multi-Tenant AI**: Patterns for serving multiple customers wit isolated AI services
- **Edge AI Deployment**: Integration wit Azure IoT Edge an container instances
- **Hybrid Cloud AI**: Multi-cloud an hybrid deployment patterns for AI workloads

#### Advanced Features
- **AI Pipeline Automation**: MLOps integration wit Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust patterns, private endpoints, an advanced threat protection
- **Performance Optimization**: Advanced tuning an scaling strategies for high-throughput AI applications
- **Global Distribution**: Content delivery an edge caching patterns for AI applications

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
- **Tool Integration**: Enhanced IDE an editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics an contribution tracking

## Contributing to the Changelog

### Reporting Changes
When you dey contribute to this repository, make sure changelog entries include:

1. **Version Number**: Make e follow semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Short description of wetin change
5. **Impact Assessment**: How changes go affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Changes to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches wey dem dey phase out
- Documentation sections wey dem set for removal
- Methods wey get better alternatives

#### Removed
- Features, documentation, or examples wey no relevant again
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
- Breaking changes wey require user action
- Significant restructuring of content or organization
- Changes wey change the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements wey maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes an corrections
- Minor improvements to existing content
- Clarifications an small enhancements

## Community Feedback and Suggestions

We dey encourage community feedback make we improve dis learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas an engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates an guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration an deployment info
- **Learning Experience**: Suggestions to make AI developer learning flow better
- **Missing AI Content**: Requests for more AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy an link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates wit significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples an links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment wit latest Azure services an azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support wit regular updates
- **Previous Major Version**: Security updates an critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions dem release, we go provide:
- **Migration Guide dem**: Step-by-step instruction dem wey go show how to migrate
- **Compatibility Note dem**: Small-small details about changes wey fit break things
- **Tool Support**: Scripts or utilities wey go help with migration
- **Community Support**: Forum dem wey dey for migration questions

---

**Navigation**
- **Lesson wey come before**: [Study Guide](resources/study-guide.md)
- **Lesson wey next**: Return to [Main README](README.md)

**Make Dey Updated**: Dey watch dis repository to get notification about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis dokument don translate with AI translation service [Co-op Translator]. Even though we dey try make am correct, abeg note say machine translations fit get mistakes or wrong parts. The original dokument for im original language na the correct source. If na important mata, make you use professional human translator. We no dey responsible for any misunderstanding or wrong interpretation wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->