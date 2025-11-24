<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-24T13:20:18+00:00",
  "source_file": "README.md",
  "language_code": "pcm"
}
-->
# AZD For Beginners: How to Learn Am Step by Step

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pcm.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## How to Start Dis Course

Follow dis steps to start your AZD learning journey:

1. **Fork Dis Repo**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Dis Repo**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Join Di Community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) for expert support
4. **Pick Your Learning Path**: Choose one chapter below wey match your level

### Multi-Language Support

#### Automated Translations (Always Up-to-Date)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## Course Overview

Learn how to use Azure Developer CLI (azd) step by step. Dis course go focus well well on how to deploy AI apps with Microsoft Foundry.

### Why Dis Course Important for Developers Today

From wetin we see for Microsoft Foundry Discord community, **45% of developers wan use AZD for AI workloads** but dem dey face wahala like:
- How to manage complex AI architectures wey get many services
- Best way to deploy AI for production  
- How to configure Azure AI services
- How to reduce cost for AI workloads
- How to solve wahala wey dey happen when deploying AI

### Wetin You Go Learn

If you finish dis course, you go fit:
- **Understand AZD Basics**: Learn di main concepts, how to install am, and configure am
- **Deploy AI Apps**: Use AZD with Microsoft Foundry services
- **Use Infrastructure as Code**: Manage Azure resources with Bicep templates
- **Solve Deployment Wahala**: Learn how to debug and fix common problems
- **Prepare for Production**: Learn about security, scaling, monitoring, and cost management
- **Build Complex AI Solutions**: Deploy AI architectures wey get many agents

## 📚 Learning Chapters

*Choose di chapter wey match your level and wetin you wan achieve*

### 🚀 Chapter 1: Foundation & Quick Start
**Wetin You Need Before You Start**: Azure subscription, small knowledge about command line  
**Time We You Go Spend**: 30-45 minutes  
**Level of Difficulty**: ⭐

#### Wetin You Go Learn
- Di basics of Azure Developer CLI
- How to install AZD for your system
- How to deploy your first project

#### Learning Resources
- **🎯 Start Here**: [Wetin Be Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/getting-started/azd-basics.md) - Di main concepts and terms
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - How to install am for different systems
- **🛠️ Hands-On**: [Your First Project](docs/getting-started/first-project.md) - Step-by-step tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Quick installashun check
azd version

# Deploy your first app
azd init --template todo-nodejs-mongo
azd up
```

**💡 Wetin You Go Gain for Dis Chapter**: You go fit deploy simple web app to Azure using AZD

**✅ How You Go Know Say You Don Succeed:**
```bash
# Afta you finish Chapter 1, you go fit do dis:
azd version              # E dey show di version wey don install
azd init --template todo-nodejs-mongo  # E dey start di project
azd up                  # E dey deploy go Azure
azd show                # E dey show di URL for di app wey dey run
# Di application go open for browser and e go work
azd down --force --purge  # E dey clean di resources
```

**📊 Time We You Go Spend:** 30-45 minutes  
**📈 Wetin You Go Fit Do After:** You go fit deploy basic apps by yourself

**✅ How You Go Know Say You Don Succeed:**
```bash
# Afta you finish Chapter 1, you go fit do:
azd version              # E dey show di version wey dem don install
azd init --template todo-nodejs-mongo  # E dey start di project
azd up                  # E dey deploy go Azure
azd show                # E dey show di URL for di app wey dey run
# Di application go open for browser and e go work
azd down --force --purge  # E dey clean di resources
```

**📊 Time We You Go Spend:** 30-45 minutes  
**📈 Wetin You Go Fit Do After:** You go fit deploy basic apps by yourself

---

### 🤖 Chapter 2: AI-First Development (For AI Developers)
**Wetin You Need Before You Start**: Finish Chapter 1  
**Time We You Go Spend**: 1-2 hours  
**Level of Difficulty**: ⭐⭐

#### Wetin You Go Learn
- How to use Microsoft Foundry with AZD
- How to deploy AI-powered apps
- How to configure AI services

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - How to deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - How to make your AI solutions ready for AZD
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Learn with browser-based tools and DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Wetin You Go Gain for Dis Chapter**: You go fit deploy and configure AI-powered chat app wey get RAG features

**✅ How You Go Know Say You Don Succeed:**
```bash
# Afta Chapter 2, you go fit:
azd init --template azure-search-openai-demo
azd up
# Test di AI chat interface
# Dey ask question and get AI-powered ansa wit sources
# Confirm say search integration dey work
azd monitor  # Check say Application Insights dey show telemetry
azd down --force --purge
```

**📊 Time We You Go Spend:** 1-2 hours  
**📈 Wetin You Go Fit Do After:** You go fit deploy and configure AI apps wey ready for production  
**💰 Cost Awareness:** Understand $80-150/month dev costs, $300-3500/month production costs

#### 💰 Cost We You Go Spend for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Azure OpenAI (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Azure OpenAI (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 How to Reduce Cost:**
- Use **Free Tier** Azure OpenAI for learning (50,000 tokens/month included)
- Run `azd down` to stop resources when you no dey work
- Start with consumption-based billing, upgrade to PTU only for production
- Use `azd provision --preview` to check cost before deployment
- Enable auto-scaling: pay only for wetin you use

**How to Monitor Cost:**
```bash
# Check wetin e go cost for one month
azd provision --preview

# Dey look di real cost for Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Wetin You Need Before You Start**: Finish Chapter 1  
**Time We You Go Spend**: 45-60 minutes  
**Level of Difficulty**: ⭐⭐

#### Wetin You Go Learn
- How to configure and manage environments
- Best way to do authentication and security
- How to name and organize resources

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - How to set up environments
- **🔐 Security**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - How to do authentication
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database Examples

#### Practical Exercises
- Configure different environments (dev, staging, prod)
- Set up managed identity authentication
- Use environment-specific configurations

**💡 Wetin You Go Gain for Dis Chapter**: You go fit manage environments well with authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Wetin You Need Before You Start**: Finish Chapters 1-3  
**Time We You Go Spend**: 1-1.5 hours  
**Level of Difficulty**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment methods
- How to use Infrastructure as Code with Bicep
- How to provision resources

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Full workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - How to manage Azure resources
- **📝 Examples**: [Container App Example](../../examples/container-app) - How to deploy containerized apps

#### Practical Exercises
- Create custom Bicep templates
- Deploy apps wey get many services
- Use blue-green deployment methods

**💡 Wetin You Go Gain for Dis Chapter**: You go fit deploy complex apps wey get many services using custom templates

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Wetin You Need Before You Start**: Finish Chapters 1-2  
**Time We You Go Spend**: 2-3 hours  
**Level of Difficulty**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- How to design multi-agent architecture
- How to manage agents and make dem work together
- How to deploy AI solutions wey ready for production

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Full implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Patterns

#### Practical Exercises
```bash
# Deploy di complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Check how agent configuration dem be
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Deploy and manage beta multi-agent AI solution wey go ready for production wit Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 don complete  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to plan capacity and check resources
- Strategies to choose SKU
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections to save money
- Use automated pre-deployment checks

**💡 Chapter Outcome**: Validate and optimize deployments before you go run am

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter don complete  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to debug systematically
- Common problems and how to solve dem
- Troubleshooting wey concern AI

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Solve authentication wahala
- Debug AI service connectivity

**💡 Chapter Outcome**: Fit diagnose and solve common deployment problems by yourself

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 don complete  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Strategies to deploy for production
- Enterprise security patterns
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up full monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Deploy enterprise-ready apps wey get full production capabilities

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: E still dey develop**  
> The workshop materials dey under development. Core modules dey work, but some advanced sections never complete. We dey actively work to finish all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Structured, hands-on learning wey you go fit do for browser with guided exercises**

Our workshop materials dey provide structured, interactive learning experience wey go complement the chapter-based curriculum wey dey above. The workshop dey designed for self-paced learning and instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop wey get search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 7-step guided exercises (3.5 hours total)
- **Discovery → Deployment → Customization**: Progressive methodology
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Structure
The workshop dey follow **Discovery → Deployment → Customization** methodology:

1. **Discovery Phase** (45 mins)
   - Explore Microsoft Foundry templates and services
   - Understand multi-agent architecture patterns
   - Review deployment requirements and prerequisites

2. **Deployment Phase** (2 hours)
   - Hands-on deployment of AI applications with AZD
   - Configure Azure AI services and endpoints
   - Implement security and authentication patterns

3. **Customization Phase** (45 mins)
   - Modify applications for specific use cases
   - Optimize for production deployment
   - Implement monitoring and cost management

#### 🚀 How to Start the Workshop
```bash
# Opsi 1: GitHub Codespaces (We recommend am)
# Klik "Code" → "Create codespace on main" for di repository

# Opsi 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow di setup instructions for workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
When you finish the workshop, you go:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Solve common issues by yourself

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Wetin Be Azure Developer CLI?

Azure Developer CLI (azd) na developer-friendly command-line tool wey dey make building and deploying apps to Azure easy. E dey provide:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Provision, deploy, and monitor apps seamlessly
- **Developer-friendly** - Designed to make developers work easy

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD dey solve the main challenges wey AI developers dey face:

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Easy connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you wan deploy AI applications!**

> **Note:** These templates dey show different AI patterns. Some dey external Azure Samples, others dey local.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates wey match learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (inside this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples inside this repository:**
- [**Container App Examples**](examples/container-app/README.md) - Complete guide to containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API with scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**Clone these Azure Samples repositories to start:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectivity patterns
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML patterns

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises
### Hands-On Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Make your AI solution fit for AZD deployment (2-3 hours)
- [**Interactive Workshop Guide**](workshop/README.md) - Workshop wey you go run for browser using MkDocs and DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-step exercise wey dey guide you (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Full hands-on workshop materials wey get GitHub Codespaces integration

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Quick Troubleshooting Guide

**Common wahala wey beginners dey face and how to solve am quick:**

### ❌ "azd: command not found"

```bash
# First install AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Check say e don install
azd version
```

### ❌ "No subscription found" or "Subscription not set"

```bash
# Show di subscriptions wey dey available
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set am for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Check am
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs for development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fail halfway

```bash
# Option 1: Clean am and try again
azd down --force --purge
azd up

# Option 2: Just fix di infrastructure
azd provision

# Option 3: Check di detailed logs
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Do authentication again
az logout
az login

azd auth logout
azd auth login

# Check say authentication correct
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD dey generate unique names, but if wahala dey:
azd down --force --purge

# Make retry with new environment
azd env new dev-v2
azd up
```

### ❌ Template deployment dey take too long

**Normal wait time:**
- Simple web app: 5-10 minutes
- App wey get database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning dey slow)

```bash
# Check how far work don go
azd show

# If e don hook pass 30 minutes, check Azure Portal:
azd monitor
# Look for deployments wey no work
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Tell your Azure admin make e give you:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```

### ❌ No fit find deployed application URL

```bash
# Show all di service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check one service
azd env get-values
# Look for *_URL variables
```

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Quick Troubleshooting Guide

**Common wahala wey beginners dey face and how to solve am quick:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# First install AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Check say e don install
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Show di subscriptions wey dey available
az account list --output table

# Set di subscription wey go be default
az account set --subscription "<subscription-id-or-name>"

# Set am for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Check am
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs for development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fail halfway</strong></summary>

```bash
# Opsi 1: Clean am and try again
azd down --force --purge
azd up

# Opsi 2: Just fix di infrastructure
azd provision

# Opsi 3: Check di detailed logs
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Do authentication again
az logout
az login

azd auth logout
azd auth login

# Check say authentication correct
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts"</strong></summary>

```bash
# AZD dey generate unique names, but if wahala:
azd down --force --purge

# Den try again wit new environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment dey take too long</strong></summary>

**Normal wait time:**
- Simple web app: 5-10 minutes
- App wey get database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning dey slow)

```bash
# Check how far work don go
azd show

# If e don pass 30 minutes and e no move, check Azure Portal:
azd monitor
# Find deployments wey no work
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin make you get:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ No fit find deployed application URL</strong></summary>

```bash
# Show all di service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check one service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Track how far you don go for each chapter:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
After you finish each chapter, confirm wetin you learn by:
1. **Practical Exercise**: Do the chapter hands-on deployment
2. **Knowledge Check**: Check the FAQ section for the chapter
3. **Community Discussion**: Share your experience for Azure Discord
4. **Next Chapter**: Move to the next level

### Course Completion Benefits
When you finish all the chapters, you go get:
- **Production Experience**: Deploy real AI applications for Azure
- **Professional Skills**: Enterprise-ready deployment skills  
- **Community Recognition**: Be active member for Azure developer community
- **Career Advancement**: Skills wey dey in demand for AZD and AI deployment

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** of developers wan use AZD for AI workloads
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**Join our community to:**
- Share your AZD + AI experience and get help
- Access early previews of new AI templates
- Contribute to AI deployment best practices
- Influence future AI + AZD feature development

### Contributing to the Course
We dey welcome contributions! Abeg read our [Contributing Guide](CONTRIBUTING.md) for details on:
- **Content Improvements**: Make existing chapters and examples better
- **New Examples**: Add real-world scenarios and templates  
- **Translation**: Help maintain multi-language support
- **Bug Reports**: Make accuracy and clarity better
- **Community Standards**: Follow our inclusive community guidelines

---

## 📄 Course Information

### License
This project dey under MIT License - check the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team dey produce other complete learning courses:

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilot Series  
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Course Navigation  

**🚀 Ready to Start Learning?**  

**Beginners**: Start wit [Chapter 1: Foundation & Quick Start](../..)  
**AI Developers**: Jump go [Chapter 2: AI-First Development](../..)  
**Experienced Developers**: Begin wit [Chapter 3: Configuration & Authentication](../..)  

**Next Steps**: [Begin Chapter 1 - AZD Basics](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shun service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shun. Even as we dey try make am correct, abeg sabi say transle-shun wey machine do fit get mistake or no dey accurate. Di original dokyument for im native language na di main source wey you go fit trust. For important mata, e good make professional human transle-shun dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shun.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->