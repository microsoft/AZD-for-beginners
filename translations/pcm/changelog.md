# Changelog - AZD For Beginners

## Introduction

Dis changelog dey show all di important changes, updates, and improvements wey don happen for di AZD For Beginners repository. We dey follow semantic versioning principles and we dey keep dis log so users fit sabi wetin don change between di versions.

## Learning Goals

If you check dis changelog, you go:
- Know di new features and content wey dem add
- Understand di improvements wey dem make for di existing documentation
- Track bug fixes and corrections to make sure say everything dey accurate
- Follow how di learning materials don dey grow over time

## Learning Outcomes

After you don check di changelog entries, you go fit:
- Sabi di new content and resources wey dey available for learning
- Understand di sections wey dem don update or improve
- Plan how you go learn based on di latest materials
- Give feedback and suggestions for future improvements

## Version History

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Dis version add better lessons on Application Insights integration, authentication patterns, and multi-agent coordination for production deployments.**

#### Added
- **📊 Application Insights Integration Lesson**: for `docs/pre-deployment/application-insights.md`:
  - AZD-focused deployment wey dey provision automatically
  - Complete Bicep templates for Application Insights + Log Analytics
  - Python applications wey dey work with custom telemetry (1,200+ lines)
  - AI/LLM monitoring patterns (Azure OpenAI token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Kusto query examples and cost optimization strategies
  - Live metrics streaming and real-time debugging
  - 40-50 minutes learning time with production-ready patterns

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

#### Enhanced
- **Pre-deployment Chapter**: Now e get better monitoring and coordination patterns
- **Getting Started Chapter**: E don improve with professional authentication patterns
- **Production Readiness**: E cover everything from security to observability
- **Course Outline**: Dem don update am to show di new lessons for Chapters 3 and 6

#### Changed
- **Learning Progression**: Dem don arrange security and monitoring better for di course
- **Documentation Quality**: E dey consistent with A-grade standards (95-97%) for di new lessons
- **Production Patterns**: E dey complete for enterprise deployments

#### Improved
- **Developer Experience**: Clear path from development to production monitoring
- **Security Standards**: Professional patterns for authentication and secrets management
- **Observability**: Complete Application Insights integration with AZD
- **AI Workloads**: Specialized monitoring for Azure OpenAI and multi-agent systems

#### Validated
- ✅ All lessons get complete working code (no be snippets)
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

#### Documentation Quality Improvements and New Azure OpenAI Example
**Dis version improve di documentation quality and add complete Azure OpenAI deployment example with GPT-4 chat interface.**

#### Added
- **🤖 Azure OpenAI Chat Example**: Complete GPT-4 deployment with working implementation for `examples/azure-openai-chat/`:
  - Complete Azure OpenAI infrastructure (GPT-4 model deployment)
  - Python command-line chat interface with conversation history
  - Key Vault integration for secure API key storage
  - Token usage tracking and cost estimation
  - Rate limiting and error handling
  - Comprehensive README with 35-45 minute deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Added hands-on practice exercises to configuration guide:
  - Exercise 1: Multi-environment configuration (15 minutes)
  - Exercise 2: Secret management practice (10 minutes)
  - Clear success criteria and verification steps
- **✅ Deployment Verification**: Added verification section to deployment guide:
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
  - Added to Azure AI Foundry Templates section
  - Updated Comparison Matrix and technology finding sections
- **Documentation Quality**: Improved B+ (87%) → A- (92%) across docs folder:
  - Added expected outputs to critical command examples
  - Included verification steps for configuration changes
  - Enhanced hands-on learning with practical exercises

#### Changed
- **Learning Progression**: Better integration of AI examples for intermediate learners
- **Documentation Structure**: More actionable exercises with clear outcomes
- **Verification Process**: Explicit success criteria added to key workflows

#### Improved
- **Developer Experience**: Azure OpenAI deployment now dey take 35-45 minutes (vs 60-90 for complex alternatives)
- **Cost Transparency**: Clear cost estimates ($50-200/month) for Azure OpenAI example
- **Learning Path**: AI developers get clear entry point with azure-openai-chat
- **Documentation Standards**: Consistent expected outputs and verification steps

#### Validated
- ✅ Azure OpenAI example dey work well with `azd up`
- ✅ All 11 implementation files dey correct
- ✅ README instructions match di actual deployment experience
- ✅ Documentation links updated across 8+ locations
- ✅ Examples index dey show 4 local examples
- ✅ No duplicate external links for tables
- ✅ All navigation references dey correct

#### Technical Implementation
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets dey Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking and usage optimization
- **Deployment**: Single `azd up` command for complete setup

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Dis version bring production-ready container application deployment examples using Azure Developer CLI (AZD), with full documentation and integration into di learning path.**

#### Added
- **🚀 Container App Examples**: New local examples for `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, and CI/CD guidance for containerized workloads
- **Code Samples**: Complete `azure.yaml`, Bicep templates, and multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Changed
- **README.md**: Updated to feature and link new container app examples under "Local Examples - Container Applications"
- **examples/README.md**: Updated to highlight container app examples, add comparison matrix entries, and update technology/architecture references
- **Course Outline & Study Guide**: Updated to reference new container app examples and deployment patterns for di relevant chapters

#### Validated
- ✅ All new examples dey deployable with `azd up` and follow best practices
- ✅ Documentation cross-links and navigation updated
- ✅ Examples cover beginner to advanced scenarios, including production microservices

#### Notes
- **Scope**: English documentation and examples only
- **Next Steps**: Expand with additional advanced container patterns and CI/CD automation for future releases

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Dis version change di product name from "Azure AI Foundry" to "Microsoft Foundry" for all English documentation, to match Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Azure AI Foundry" to "Microsoft Foundry"
  - Updated all references for English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to match di new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to match di new filename

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

#### Validated
- ✅ No "ai-foundry" folder path references dey for English docs again
- ✅ No "Azure AI Foundry" product name references dey for English docs again
- ✅ All navigation links dey work with di new folder structure
- ✅ File and folder renames don complete successfully
- ✅ Cross-references between chapters don validate

#### Notes
- **Scope**: Changes dey for English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) no dey updated for dis version
- **Workshop**: Workshop materials (`workshop/`) no dey update for dis version
- **Examples**: Example files fit still dey use old naming (dem go fix am for future update)
- **External Links**: External URLs and GitHub repository references still remain di same

#### Migration Guide for Contributors
If you get local branches or documentation wey dey use di old structure:
1. Change folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Change file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Azure AI Foundry" → "Microsoft Foundry"
4. Make sure say all internal documentation links still dey work.

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Dis version bring full support for di new Azure Developer CLI preview feature and improve workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Full gist about di new infrastructure preview feature
  - Command reference and usage examples for cheat sheet
  - Detailed integration for provisioning guide with use cases and benefits
  - Pre-flight check integration to make deployment safer
  - Updates for getting started guide with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner wey dey show workshop development status
  - Gradient design with construction indicators to make users sabi wetin dey happen
  - Last updated timestamp for transparency
  - Mobile-responsive design wey go work for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality don dey inside deployment documentation
- **Pre-deployment Validation**: Automated scripts now dey include infrastructure preview testing
- **Developer Workflow**: Updated command sequences now dey recommend preview as best practice
- **Workshop Experience**: Clear expectations for users about di content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now na di recommended approach
- **Documentation Flow**: Infrastructure validation don move go earlier for di learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes fit now dey validate before deployment
- **Team Collaboration**: Preview results fit dey share for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Deployment failures don reduce because of advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature don dey document across 4 key files
- **Command Patterns**: Consistent syntax and examples dey throughout documentation
- **Best Practice Integration**: Preview don dey inside validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for easy discovery

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status dey prevent confusion
- **Professional Presentation**: E dey maintain repository credibility while e dey set expectations
- **Timeline Transparency**: October 2025 last updated timestamp dey show accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Dis version bring full workshop materials with browser-based interactive guides and structured learning paths.**

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
- **📱 GitHub Codespaces Integration**: Easy development environment setup

#### Enhanced
- **AI Workshop Lab**: E don extend with full 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for smooth development workflows

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
**Dis version bring full chapter-based learning structure with better navigation throughout di repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructure di whole course into 8 progressive learning chapters
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
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites dey clearly link

#### Enhanced
- **README Structure**: E don turn into structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now dey include chapter context and progression guidance
- **Template Organization**: Examples and templates don dey map to di right learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides dey connect to di right chapters
- **Workshop Integration**: Hands-on labs don dey map to multiple chapter learning objectives

#### Changed
- **Learning Progression**: E don move from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Configuration guide don move go Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout di learning journey
- **Production Content**: Advanced patterns don dey consolidate for Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure wey fit academic and corporate training
- **Learning Efficiency**: Reduced time to find di right content through better organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Full internal linking system wey dey connect related concepts
- **Chapter Mapping**: Templates and examples dey clearly associate with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructure study guide to align with di 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter get specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Dis version improve di multi-agent retail solution with better agent naming and better documentation.**

#### Changed
- **Multi-Agent Terminology**: Replace "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Update all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernize agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Make sure say all references dey use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Update retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refresh Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now dey use CustomerAgent naming
- **Environment Variables**: Update all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities for documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplify understanding of agent functions and deployment patterns

#### Technical Details
- Update Mermaid architecture diagrams with CustomerAgent references
- Replace CoraAgent class names with CustomerAgent for Python examples
- Modify ARM template JSON configurations to use "customer" agent type
- Update environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refresh all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Azure AI Foundry Integration
**Dis version turn di repository into full AI-focused learning resource with Azure AI Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure wey dey focus on AI developers and engineers
- **Azure AI Foundry Integration Guide**: Full documentation for connecting AZD with Azure AI Foundry services
- **AI Model Deployment Patterns**: Detailed guide wey dey cover model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop for converting AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Full troubleshooting for Azure OpenAI, Cognitive Services, and AI deployment issues
- **AI Template Gallery**: Featured collection of Azure AI Foundry templates with complexity ratings
- **Workshop Materials**: Complete workshop structure with hands-on labs and reference materials

#### Enhanced
- **README Structure**: E dey focus on AI developers with 45% community interest data from Azure AI Foundry Discord
- **Learning Paths**: Dedicated AI developer journey alongside traditional paths for students and DevOps engineers
- **Template Recommendations**: Featured AI templates like azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Better Discord community support with AI-specific channels and discussions

#### Security & Production Focus
- **Managed Identity Patterns**: AI-specific authentication and security configurations
- **Cost Optimization**: Token usage tracking and budget controls for AI workloads
- **Multi-Region Deployment**: Strategies for global AI application deployment
- **Performance Monitoring**: AI-specific metrics and Application Insights integration

#### Documentation Quality
- **Linear Course Structure**: Logical progression from beginner to advanced AI deployment patterns
- **Validated URLs**: All external repository links don dey verify and dey accessible
- **Complete Reference**: All internal documentation links don dey validate and dey functional
- **Production Ready**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Dis version na big overhaul for di repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: All documentation pages now dey include Introduction, Learning Goals, and Learning Outcomes sections
- **Navigation System**: Add Previous/Next lesson links throughout all documentation for guided learning progression
- **Study Guide**: Full study-guide.md with learning objectives, practice exercises, and assessment materials
- **Professional Presentation**: Remove all emoji icons for better accessibility and professional appearance
- **Enhanced Content Structure**: Better organization and flow of learning materials

#### Changed
- **Documentation Format**: Standardize all documentation with consistent learning-focused structure
- **Navigation Flow**: Implement logical progression through all learning materials
- **Content Presentation**: We comot all decoration wey no dey necessary, make e clear and professional for eye
- **Link Structure**: We don update all internal links to match di new navigation system

#### Improved
- **Accessibility**: We comot emoji dependency so say screen reader go fit work well
- **Professional Appearance**: Clean, academic-style wey fit enterprise learning
- **Learning Experience**: We arrange am well with clear objectives and wetin you go gain for each lesson
- **Content Organization**: Better flow and connection between topics wey relate

### [v1.0.0] - 2025-09-09

#### First Release - Full AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete guide for how to start
  - Full deployment and provisioning documentation
  - Detailed troubleshooting and debugging guides
  - Tools and steps for pre-deployment validation

- **Getting Started Module**
  - AZD Basics: Core ideas and words wey dem dey use
  - Installation Guide: How to set up for different platforms
  - Configuration Guide: How to set environment and authentication
  - First Project Tutorial: Step-by-step practical learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Full workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Check Azure resource availability
  - SKU Selection: Full guide for service tier
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Problems wey people dey face and how to solve am
  - Debugging Guide: Step-by-step troubleshooting methods
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for important commands
  - Glossary: Full list of words and acronyms with their meaning
  - FAQ: Answers to common questions
  - Links to external resources and community

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Guides for Windows, macOS, and Linux
- **Multiple Skill Levels**: Content for students and professional developers
- **Practical Focus**: Hands-on examples and real-world scenarios
- **Comprehensive Coverage**: From basic ideas to advanced enterprise patterns
- **Security-First Approach**: Security best practices dey everywhere
- **Cost Optimization**: Tips for cost-effective deployments and resource management

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
- **AI Observability**: Better monitoring for model performance, token usage, and response quality

#### Developer Experience
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
- **GitHub Copilot Integration**: AI-assisted AZD template generation
- **Interactive Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Video Content**: Extra video tutorials for people wey like visual learning, focus on AI deployments

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
- ✅ **AI-Focused Content**: Full Azure AI Foundry integration (Done)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Done)
- ✅ **Advanced Security Module**: AI-specific security patterns (Done)
- ✅ **Performance Optimization**: AI workload tuning strategies (Done)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Done in Current Release
- ✅ **Additional Examples**: AI-focused deployment scenarios (Done)
- ✅ **Extended FAQ**: AI-specific questions and troubleshooting (Done)
- **Tool Integration**: Better IDE and editor integration guides
- ✅ **Monitoring Expansion**: AI-specific monitoring and alerting patterns (Done)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive design for mobile learning
- **Offline Access**: Downloadable documentation packages
- **Enhanced IDE Integration**: VS Code extension for AZD + AI workflows
- **Community Dashboard**: Real-time community metrics and contribution tracking

## Contributing to the Changelog

### Reporting Changes
When you wan contribute to this repository, make sure say changelog entries get:

1. **Version Number**: Follow semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Short description of wetin change
5. **Impact Assessment**: How e go affect people wey dey use am

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Extra tools, scripts, or utilities

#### Changed
- Changes to existing functionality or documentation
- Updates to make am clearer or more accurate
- Restructuring of content or organization

#### Deprecated
- Features or methods wey dem wan phase out
- Documentation sections wey dem go soon comot
- Methods wey get better alternatives

#### Removed
- Features, documentation, or examples wey no dey relevant again
- Outdated information or deprecated methods
- Redundant or combined content

#### Fixed
- Corrections to errors for documentation or code
- Fixes for reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Fixes for security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes wey go need user action
- Big restructuring of content or organization
- Changes wey go change the main approach or method

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements wey no go break backward compatibility
- Extra examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Small improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We dey encourage community feedback to make this learning resource better:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and talk with the Azure AI Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Azure AI Foundry Discord**: Join #Azure channel for AZD + AI discussions
- **Community Forums**: Join broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for better AI developer learning flow
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
- **Monthly Reviews**: Check content accuracy and links
- **Quarterly Updates**: Add major content and improvements
- **Semi-Annual Reviews**: Full restructuring and enhancement
- **Annual Releases**: Major version updates with big improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular check of code examples and links
- **Community Feedback Integration**: Regularly add user suggestions
- **Technology Updates**: Match latest Azure services and azd releases
- **Accessibility Audits**: Regular check for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions release, we go provide:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to help with migration
- **Community Support**: Dedicated forums for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Go back to [Main README](README.md)

**Stay Updated**: Follow this repository to get notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shon service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shon. Even as we dey try make am correct, abeg make you sabi say machine transle-shon fit get mistake or no dey accurate well. Di original dokyument wey dey for im native language na di one wey you go take as di correct source. For important mata, e good make you use professional human transle-shon. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shon.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->