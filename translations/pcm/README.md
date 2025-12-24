<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T21:59:04+00:00",
  "source_file": "README.md",
  "language_code": "pcm"
}
-->
# AZD For Beginners: Na Structured Learning Journey

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pcm.png) 

[![GitHub watcher dem](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub fork dem](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub star dem](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## How to Start Dis Course

Follow these steps make you fit start your AZD learning journey:

1. **Fork di Repository**: Click [![GitHub fork dem](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone di Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Join di Community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) for expert support
4. **Choose Your Learning Path**: Choose chapter wey dey below wey match your experience level

### Multi-Language Support

#### Automated Translations (Always Dey Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](./README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Course Overview

Become master for Azure Developer CLI (azd) wit chapters wey dem arrange step-by-step. **We go specially focus on how to deploy AI applications wit Microsoft Foundry integration.**

### Why Dis Course Dey Important for Modern Developers

Based on wetin Microsoft Foundry Discord community talk, **45% of developers wan use AZD for AI workloads** but dem dey face wahala with:
- Complex multi-service AI architectures
- How to deploy AI for production correct  
- How to integrate and configure Azure AI services
- How to optimize cost for AI workloads
- Troubleshooting AI-specific deployment issues

### Learning Objectives

When you finish dis structured course, you go:
- **Master AZD Fundamentals**: Understand core concepts, how to install, and how to configure
- **Deploy AI Applications**: Use AZD wit Microsoft Foundry services
- **Implement Infrastructure as Code**: Manage Azure resources wit Bicep templates
- **Troubleshoot Deployments**: Solve common issues and debug problems
- **Optimize for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 📚 Learning Chapters

*Choose your learning path based on experience level and goals*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### Wetin You Go Learn
- Understand Azure Developer CLI basics
- How to install AZD on your platform
- How to do your first successful deployment

#### Learning Resources
- **🎯 Start Here**: [Wet na Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/getting-started/azd-basics.md) - Main concepts and terms
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Guides for each platform
- **🛠️ Hands-On**: [Your First Project](docs/getting-started/first-project.md) - Step-by-step guide
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Quick check make sure installation don work
azd version

# Carry your first app go live
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: You go successfully deploy one simple web application to Azure using AZD

**✅ Success Validation:**
```bash
# After you don finish Chapter 1, you go fit:
azd version              # Dey show di installed version
azd init --template todo-nodejs-mongo  # Dey set up di project
azd up                  # Dey deploy am to Azure
azd show                # Dey show di URL wey di app dey run for
# App go open for browser an e go work
azd down --force --purge  # Dey clean up di resources
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Fit deploy basic applications by yourself

**✅ Success Validation:**
```bash
# After you don finish Chapter 1, you go fit:
azd version              # Dey show version wey don install
azd init --template todo-nodejs-mongo  # Dey set up di project
azd up                  # Dey deploy go Azure
azd show                # Dey show di URL wey di app dey run for
# App go open for browser and e go work
azd down --force --purge  # Dey clean up di resources
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Fit deploy basic applications by yourself

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 don finish  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to integrate Microsoft Foundry wit AZD
- How to deploy AI-powered applications
- Understand AI service configurations

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - Deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Make your AI solutions AZD-ready
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning wit MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# Put your first AI app for production
azd init --template azure-search-openai-demo
azd up

# Try more AI template dem
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: Deploy and configure AI-powered chat application wey get RAG capabilities

**✅ Success Validation:**
```bash
# After Chapter 2, you go fit do:
azd init --template azure-search-openai-demo
azd up
# Test di AI chat interface
# Ask question dem and get answers wey AI give with source dem
# Confirm say search integration dey work
azd monitor  # Check Application Insights dey show telemetry
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** Fit deploy and configure production-ready AI applications  
**💰 Cost Awareness:** Understand $80-150/month for dev costs, $300-3500/month for production costs

#### 💰 Cost Considerations for AI Deployments

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

**💡 Cost Optimization Tips:**
- Use **Free Tier** Azure OpenAI for learning (50,000 tokens/month included)
- Run `azd down` to deallocate resources when you no dey actively develop
- Start with consumption-based billing, upgrade to PTU only for production
- Use `azd provision --preview` to estimate costs before deployment
- Enable auto-scaling: pay only for actual usage

**Cost Monitoring:**
```bash
# Check di estimated monthly costs
azd provision --preview

# Dey monitor di real costs for Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: Chapter 1 don finish  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Environment configuration and management
- Authentication and security best practices
- Resource naming and organization

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Authentication patterns
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database Examples

#### Practical Exercises
- Configure multiple environments (dev, staging, prod)
- Set up managed identity authentication
- Implement environment-specific configurations

**💡 Chapter Outcome**: Manage multiple environments wit proper authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 don finish  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment patterns
- Infrastructure as Code wit Bicep
- Resource provisioning strategies

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure resource management
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### Practical Exercises
- Create custom Bicep templates
- Deploy multi-service applications
- Implement blue-green deployment strategies

**💡 Chapter Outcome**: Deploy complex multi-service applications using custom infrastructure templates

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 don finish  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Deploy wit one click
- **📖 Architecture**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Patterns

#### Praktikal Ejasaiz
```bash
# Deploy di complete retail solution wey get many agents
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore di agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Make you fit deploy an manage one production-ready multi-agent AI solution wey get Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 don finish  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to plan capacity and check resource dem
- How to choose SKU dem
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Check resources
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Choices wey go save cost
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Scripts wey dey run automatically

#### Praktikal Ejasaiz
- Run scripts wey go check capacity
- Make SKU choice dem better to save cost
- Set up automated checks wey go run before deployment

**💡 Chapter Outcome**: Make you fit validate an optimize deployments before you run am

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter wey you don finish  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Step-by-step ways to debug
- Common problems and how to solve dem
- Troubleshooting wey specific to AI

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problems wey dey AI service

#### Praktikal Ejasaiz
- Diagnose why deployment fail
- Fix authentication wahala
- Debug connection to AI service

**💡 Chapter Outcome**: Make you fit diagnose an fix common deployment issues by yourself

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 don finish  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Strategies for production deployment
- Security patterns for enterprise
- How to monitor an save cost

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Patterns wey enterprise dey use
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### Praktikal Ejasaiz
- Put enterprise security patterns for place
- Set up full monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Make you fit deploy enterprise-ready applications wit full production capabilities

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Dey Under Development**  
> Di workshop materials still dey under development an dem dey refine am. Core modules dey functional, but some advanced sections never complete. We dey actively work to finish all the content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Complete hands-on learning wit browser-based tools and guided exercises**

Our workshop materials dey give structured, interactive learning experience wey dey complement di chapter-based curriculum wey dey above. Di workshop dey designed for both self-paced learning and instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop wey get search, copy, and theme features
- **GitHub Codespaces Integration**: One-click setup for development environment
- **Structured Learning Path**: 7-step guided exercises (3.5 hours total)
- **Discovery → Deployment → Customization**: Progressive methodology
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Structure
Di workshop follow **Discovery → Deployment → Customization** methodology:

1. **Discovery Phase** (45 mins)
   - Check Microsoft Foundry templates and services
   - Understand how multi-agent architecture dem dey
   - Review deployment requirements and wetin you need

2. **Deployment Phase** (2 hours)
   - Do hands-on deployment of AI applications with AZD
   - Configure Azure AI services and endpoints
   - Put security and authentication patterns for place

3. **Customization Phase** (45 mins)
   - Modify applications for specific use cases
   - Make apps ready an optimized for production deployment
   - Put monitoring and cost management

#### 🚀 Getting Started with the Workshop
```bash
# Option 1: GitHub Codespaces (na wetin dem recommend)
# Click "Code" → "Create codespace on main" for inside di repository

# Option 2: Work for your computer
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow di setup instructions wey dey for workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
If person complete di workshop, dem go:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Exercises focused on AI
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - How to configure the environment

**E perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Wetin be Azure Developer CLI?

Azure Developer CLI (azd) na developer-centric command-line interface wey dey speed up di process of building and deploying applications to Azure. E dey provide:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Provision, deploy, and monitor applications without wahala
- **Developer-friendly** - Make developers work faster and better

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD dey tackle di main challenges wey AI developers dey face:

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you dey deploy AI applications!**

> **Note:** These templates show different AI patterns. Some dey external Azure Samples, others na local implementations.

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
**Production-ready application templates mapped to learning chapters**

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
> **Local Examples** (in this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - Deploy wit one click via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples in this repository:**
- [**Container App Examples**](examples/container-app/README.md) - Complete guide to containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API with scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**Clone these Azure Samples repositories to get started:**
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
- [**Cheat Sheet wey get azd commands**](resources/cheat-sheet.md) - Important azd commands wey dem arrange by chapter
- [**Glossary**](resources/glossary.md) - Terms wey concern Azure and azd  
- [**FAQ**](resources/faq.md) - Common questions dem arrange by learning chapter
- [**Study Guide**](resources/study-guide.md) - Plenty practice exercises wey cover everything

### Workshops wey you go do for hand
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Make your AI solutions fit deploy wit AZD (2-3 hours)
- [**Interactive Workshop Guide**](workshop/README.md) - Browser-based workshop wey dey use MkDocs and DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-step exercises wey dem guide you (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Complete hands-on workshop materials wit GitHub Codespaces integration

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Quick Troubleshooting Guide

**Problems wey beginners dey face and quick solutions:**

### ❌ "azd: command not found"

```bash
# Make sure say you install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Make sure say e don install
azd version
```

### ❌ "No subscription found" or "Subscription not set"

```bash
# List all subscriptions wey dey
az account list --output table

# Set subscription wey go be default
az account set --subscription "<subscription-id-or-name>"

# Set am for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Check am
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Try anoda Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs when you dey do development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Option 1: Clean am, try again
azd down --force --purge
azd up

# Option 2: Just fix di infrastructure
azd provision

# Option 3: Check di logs well-well
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Confirm say na you again
az logout
az login

azd auth logout
azd auth login

# Make sure say authentication dey correct
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD dey generate unique names, but if e get conflict:
azd down --force --purge

# Den try again wit fresh environment
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Normal wait times:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning dey slow)

```bash
# Check di progress
azd show

# If e dey stuck pass 30 minutes, check Azure Portal:
azd monitor
# Look for di deployments wey fail
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Make sure say you check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You suppose get at least "Contributor" role
# Ask your Azure admin make em give you:
# - Contributor (for resources dem)
# - User Access Administrator (to assign role dem)
```

### ❌ Can't find deployed application URL

```bash
# Show all di service endpoints
azd show

# Or open di Azure Portal
azd monitor

# Check di specific service
azd env get-values
# Find di *_URL variables
```

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Quick Troubleshooting Guide

**Problems wey beginners dey face and quick solutions:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# First make you install AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Make sure say e don install
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Show all subscriptions wey dey available
az account list --output table

# Set subscription wey go be default
az account set --subscription "<subscription-id-or-name>"

# Make am ready for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Make sure say e correct
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Try use anoda Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs when you dey develop
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Option 1: Clean am, try again
azd down --force --purge
azd up

# Option 2: Just fix di infrastructure
azd provision

# Option 3: Check di detailed logs
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Make dem confirm say na you be that again
az logout
az login

azd auth logout
azd auth login

# Make sure say authentication correct
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD dey generate unique names, but if e get conflict:
azd down --force --purge

# Den try again wit fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning dey slow)

```bash
# Check how e dey go
azd show

# If e jam you pass 30 minutes, check Azure Portal:
azd monitor
# Find deployment dem wey fail
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Make you check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You suppose get at least "Contributor" role
# Ask your Azure admin make dem grant:
# - Contributor (for resources dem)
# - User Access Administrator (for role assignments dem)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Show all di service endpoints
azd show

# Or open di Azure Portal
azd monitor

# Check di specific service
azd env get-values
# Look for di *_URL variables
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
Keep track of how your learning dey go for each chapter:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
After you finish each chapter, check say you sabi by:
1. **Practical Exercise**: Do the chapter hands-on deployment
2. **Knowledge Check**: Go through the FAQ section for the chapter
3. **Community Discussion**: Share your experience for Azure Discord
4. **Next Chapter**: Move to the next level of difficulty

### Course Completion Benefits
When you don finish all chapters, you go get:
- **Production Experience**: You go don deploy real AI applications to Azure
- **Professional Skills**: Skills wey fit deploy for enterprise  
- **Community Recognition**: You go be active member for Azure developer community
- **Career Advancement**: Better AZD and AI deployment skills wey employers dey find

---

## 🤝 Community & Support

### How to Get Help & Support
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
- Get early previews of new AI templates
- Contribute to AI deployment best practices
- Help shape future AI + AZD feature development

### Contributing to the Course
We dey welcome contributions! Abeg read our [Contributing Guide](CONTRIBUTING.md) for details on:
- **Content Improvements**: Improve existing chapters and examples
- **New Examples**: Add real-world scenarios and templates  
- **Translation**: Help maintain multi-language support
- **Bug Reports**: Improve accuracy and clarity
- **Community Standards**: Follow our inclusive community guidelines

---

## 📄 Course Information

### License
This project dey licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team dey produce other complete learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

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

**Beginners**: Start with [Chapter 1: Foundation & Quick Start](../..)  
**AI Developers**: Jump to [Chapter 2: AI-First Development](../..)  
**Experienced Developers**: Begin with [Chapter 3: Configuration & Authentication](../..)

**Next Steps**: [Begin Chapter 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis document don translate wit AI translation service [Co-op Translator] (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg sabi say automated translations fit get errors or mistakes. Di original document for e own language na di authoritative source. For important information, e better make professional human translation handle am. We no dey liable for any misunderstanding or misinterpretation wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->