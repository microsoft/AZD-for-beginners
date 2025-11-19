# Changelog - AZD For Beginners

## Introduction

This changelog documents all notable changes, updates, and improvements to the AZD For Beginners repository. We follow semantic versioning principles and maintain this log to help users understand what has changed between versions.

## Learning Goals

By reviewing this changelog, you will:
- Stay informed about new features and content additions
- Understand improvements made to existing documentation
- Track bug fixes and corrections to ensure accuracy
- Follow the evolution of the learning materials over time

## Learning Outcomes

After reviewing changelog entries, you will be able to:
- Identify new content and resources available for learning
- Understand which sections have been updated or improved
- Plan your learning path based on the most current materials
- Contribute feedback and suggestions for future improvements

## Version History

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**This version introduces comprehensive, production-ready container application deployment examples using Azure Developer CLI (AZD), with full documentation and integration into the learning path.**

#### Added
- **🚀 Container App Examples**: New local examples in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Complete overview of containerized deployments, quick start, production, and advanced patterns
  - [Simple Flask API](examples/container-app/simple-flask-api/): Beginner-friendly REST API with scale-to-zero, health probes, monitoring, and troubleshooting
  - [Microservices Architecture](examples/container-app/microservices/): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
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
**This version implements a comprehensive product name change from "Azure AI Foundry" to "Microsoft Foundry" across all English documentation, reflecting Microsoft's official rebranding.**

#### Changed
- **🔄 Product Name Update**: Complete rebranding from "Azure AI Foundry" to "Microsoft Foundry"
  - Updated all references across English documentation in `docs/` folder
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
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
- ✅ Zero remaining "Azure AI Foundry" product name references in English docs
- ✅ All navigation links functional with new folder structure
- ✅ File and folder renames completed successfully
- ✅ Cross-references between chapters validated

#### Notes
- **Scope**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Azure AI Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Comprehensive coverage of the new infrastructure preview capability
  - Command reference and usage examples in cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner indicating workshop development status
  - Gradient design with construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality integrated throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation moved earlier in learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes can now be validated before deployment
- **Team Collaboration**: Preview results can be shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevents confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
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
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for enhanced learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended with comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for streamlined development workflows

#### Improved
- **Accessibility**: Browser-based interface with search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure accommodating different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for enhanced understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructured entire course into 8 progressive learning chapters
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
- **README Structure**: Transformed into a structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now includes chapter context and progression guidance
- **Template Organization**: Examples and templates mapped to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connected to relevant chapters
- **Workshop Integration**: Hands-on labs mapped to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Moved from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Repositioned configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout the learning journey
- **Production Content**: Advanced patterns consolidated in Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure suitable for academic and corporate training
- **Learning Efficiency**: Reduced time to find relevant content through improved organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clearly associated with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter includes specific learning objectives and practical exercises
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
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplified understanding of agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Azure AI Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Azure AI Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure prioritizing AI developers and engineers
- **Azure AI Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Azure AI Foundry services
- **AI Model Deployment Patterns**: Detailed guide covering model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: 2-3 hour hands-on workshop for converting AI applications to AZD-deployable solutions
- **Production AI Best Practices**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **AI-Specific Troubleshooting Guide**: Comprehensive troubleshooting for Azure OpenAI, Cognitive Services, and AI deployment issues
- **AI Template Gallery**: Featured collection of Azure AI Foundry templates with complexity ratings
- **Workshop Materials**: Complete workshop structure with hands-on labs and reference materials

#### Enhanced
- **README Structure**: AI-developer focused with 45% community interest data from Azure AI Foundry Discord
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
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
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
- ✅ **AI-Focused Content**: Comprehensive Azure AI Foundry integration (Completed)
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
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

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
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
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
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Azure AI Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Azure AI Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
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
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Full support with regular updates
- **Previous Major Version**: Security updates and critical fixes for 12 months
- **Legacy Versions**: Community support only, no official updates

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Step-by-step transition instructions
- **Compatibility Notes**: Details about breaking changes
- **Tool Support**: Scripts or utilities to assist with migration
- **Community Support**: Dedicated forums for migration questions

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.