<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6a804be263d09a0fd6f36d6ab251707a",
  "translation_date": "2025-11-25T13:17:34+00:00",
  "source_file": "README.md",
  "language_code": "pcm"
}
-->
# AZD For Beginners: A Structured Learning Journey

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pcm.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## How to Start Dis Course

Follow dis steps to start your AZD learning journey:

1. **Fork di Repository**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone di Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Join di Community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) for expert support
4. **Pick Your Learning Path**: Choose one chapter from di list below wey match your experience level

### Multi-Language Support

#### Automated Translations (Always Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](./README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Course Overview

You go sabi Azure Developer CLI (azd) well well through di structured chapters wey dem design for progressive learning. **Special focus dey on how to deploy AI application wit Microsoft Foundry integration.**

### Why Dis Course Important for Modern Developers

Based on Microsoft Foundry Discord community insights, **45% of developers wan use AZD for AI workloads** but dem dey face wahala wit:
- Di complex multi-service AI architectures
- Best practices for production AI deployment  
- How to integrate and configure Azure AI service
- How to reduce cost for AI workloads
- How to solve AI-specific deployment issues

### Learning Objectives

If you finish dis structured course, you go:
- **Sabi di Basics of AZD**: Core concepts, installation, and configuration
- **Deploy AI Applications**: Use AZD wit Microsoft Foundry services
- **Use Infrastructure as Code**: Manage Azure resources wit Bicep templates
- **Solve Deployment Wahala**: Fix common issues and debug problems
- **Prepare for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 📚 Learning Chapters

*Pick di learning path wey match your experience level and goals*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, small command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### Wetin You Go Learn
- Di basics of Azure Developer CLI
- How to install AZD for your platform
- Your first successful deployment

#### Learning Resources
- **🎯 Start Here**: [Wetin Be Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/getting-started/azd-basics.md) - Core concepts and terminology
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific guides
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

**💡 Chapter Outcome**: You go fit deploy one simple web application to Azure using AZD

**✅ Success Validation:**
```bash
# Afta you finish Chapter 1, you go fit do dis:
azd version              # E dey show di version wey don install
azd init --template todo-nodejs-mongo  # E dey start di project
azd up                  # E dey deploy go Azure
azd show                # E dey show di URL for di app wey dey run
# Di app go open for browser and e go work
azd down --force --purge  # E dey clean di resources
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** You go fit deploy basic applications on your own

**✅ Success Validation:**
```bash
# Afta you finish Chapter 1, you go fit do:
azd version              # E dey show di version wey dem don install
azd init --template todo-nodejs-mongo  # E dey start di project
azd up                  # E dey deploy go Azure
azd show                # E dey show di URL for di app wey dey run
# Di application go open for browser and e go work
azd down --force --purge  # E dey clean di resources
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** You go fit deploy basic applications on your own

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: You don finish Chapter 1  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to integrate Microsoft Foundry wit AZD
- How to deploy AI-powered applications
- How to configure AI services

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - Deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Make your AI solutions AZD-ready
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning wit MkDocs * DevContainer Environment
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

**💡 Chapter Outcome**: You go fit deploy and configure one AI-powered chat application wit RAG capabilities

**✅ Success Validation:**
```bash
# Afta Chapter 2, you go fit:
azd init --template azure-search-openai-demo
azd up
# Test di AI chat interface
# Ask kweshon and get AI-powered ansa wit sources
# Confirm say search integration dey work
azd monitor  # Check say Application Insights dey show telemetry
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** You go fit deploy and configure production-ready AI applications  
**💰 Cost Awareness:** You go sabi di $80-150/month dev costs, $300-3500/month production costs

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
- Start wit consumption-based billing, upgrade to PTU only for production
- Use `azd provision --preview` to estimate costs before deployment
- Enable auto-scaling: pay only for wetin you use

**Cost Monitoring:**
```bash
# Check wetin monthly cost go be
azd provision --preview

# Dey look di real cost for Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: You don finish Chapter 1  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to configure and manage environments
- Authentication and security best practices
- How to name and organize resources

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Authentication patterns
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database Examples

#### Practical Exercises
- Configure multiple environments (dev, staging, prod)
- Set up managed identity authentication
- Implement environment-specific configurations

**💡 Chapter Outcome**: You go sabi manage multiple environments wit proper authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: You don finish Chapters 1-3  
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

**💡 Chapter Outcome**: You go fit deploy complex multi-service applications using custom infrastructure templates

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: You don finish Chapters 1-2  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Deploy am sharp sharp
- **📖 Architecture**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Patterns wey dey work

#### Practical Exercises
```bash
# Deploy di complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Check how agent configuration dem be
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Deploy and manage one AI solution wey fit work well for production, wey get Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Finish Chapter 4  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to plan capacity and check resources
- How to choose SKU wey go make sense
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Check resources well
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Choose better options wey no go cost too much
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Scripts wey dey automate checks

#### Practical Exercises
- Run scripts wey go validate capacity
- Make SKU selection wey go save money
- Use automation for pre-deployment checks

**💡 Chapter Outcome**: Make sure deployment dey ready and optimized before you start

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Finish any deployment chapter  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to debug step by step
- Common wahala and how to solve am
- Troubleshooting for AI-specific problems

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problems wey dey affect AI services

#### Practical Exercises
- Find out why deployment fail
- Solve authentication wahala
- Debug AI service connectivity

**💡 Chapter Outcome**: Learn how to solve deployment wahala by yourself

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Finish Chapters 1-4  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- How to deploy for production
- Security patterns for enterprise
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Use enterprise security patterns
- Set up monitoring wey dey complete
- Deploy for production with governance

**💡 Chapter Outcome**: Deploy applications wey fit work well for enterprise and production

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> Workshop materials dey under development. Core modules dey work, but some advanced sections never complete. We dey work to finish all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Hands-on learning wey you fit do for browser with guided exercises**

Our workshop materials dey give structured learning experience wey go follow the chapters wey dey above. You fit learn at your own pace or with instructor.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop wey get search, copy, and theme features
- **GitHub Codespaces Integration**: One-click setup for development environment
- **Structured Learning Path**: 7-step guided exercises (3.5 hours total)
- **Discovery → Deployment → Customization**: Progressive methodology
- **Interactive DevContainer Environment**: Tools and dependencies wey don already dey configured

#### 📚 Workshop Structure
The workshop dey follow **Discovery → Deployment → Customization** methodology:

1. **Discovery Phase** (45 mins)
   - Check Microsoft Foundry templates and services
   - Understand multi-agent architecture patterns
   - Review deployment requirements and prerequisites

2. **Deployment Phase** (2 hours)
   - Deploy AI applications with AZD
   - Configure Azure AI services and endpoints
   - Use security and authentication patterns

3. **Customization Phase** (45 mins)
   - Change applications to fit your use case
   - Optimize for production deployment
   - Add monitoring and cost management

#### 🚀 Getting Started with the Workshop
```bash
# Opsi 1: GitHub Codespaces (Wey dem recommend)
# Klik "Code" → "Create codespace on main" for di repository

# Opsi 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow di setup instructions wey dey workshop/README.md
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

Azure Developer CLI (azd) na command-line tool wey dey help developers build and deploy applications for Azure fast. E dey provide:

- **Template-based deployments** - Use templates wey don already dey set for common application patterns
- **Infrastructure as Code** - Manage Azure resources with Bicep or Terraform  
- **Integrated workflows** - Provision, deploy, and monitor applications without stress
- **Developer-friendly** - E dey make developers work easy and productive

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD dey solve the main problems wey AI developers dey face:

- **AI-Ready Templates** - Templates wey don already configure for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Security patterns wey dey protect AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with monitoring
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
**Templates wey dey ready for production mapped to learning chapters**

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
**Container deployment examples wey dey complete for this repo:**
- [**Container App Examples**](examples/container-app/README.md) - Guide for containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API wey fit scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Multi-service deployment wey dey ready for production
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
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Important azd commands wey dem arrange by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terms  
- [**FAQ**](resources/faq.md) - Common questions wey dem arrange by learning chapter
- [**Study Guide**](resources/study-guide.md) - Full practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Make your AI solutions fit to deploy with AZD (2-3 hours)
- [**Interactive Workshop Guide**](workshop/README.md) - Workshop wey you fit run for browser with MkDocs and DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-step exercises wey dem guide you (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Complete hands-on workshop materials wey get GitHub Codespaces integration

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

# Set di subscription wey go be default
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

### ❌ "azd up" fail for middle

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
# AZD dey generate unique names, but if e clash:
azd down --force --purge

# Make e try again with new environment
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

# If e don pass 30 minutes and e no move, check Azure Portal:
azd monitor
# Look for deployment wey no work
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

# Set default subscription
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
<summary><strong>❌ "azd up" fail for middle</strong></summary>

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
# Do di authentication again
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
# AZD dey generate unique names, but if e clash:
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

# If e don pass 30 minutes and you still dey stuck, check Azure Portal:
azd monitor
# Look for deployments wey no work
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Tell your Azure admin make e give you:
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
Dey track your learning progress for each chapter:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
After you finish each chapter, confirm say you sabi by:
1. **Practical Exercise**: Do the chapter hands-on deployment
2. **Knowledge Check**: Check the FAQ section for the chapter
3. **Community Discussion**: Share your experience for Azure Discord
4. **Next Chapter**: Move to the next level of complexity

### Course Completion Benefits
When you finish all the chapters, you go get:
- **Production Experience**: Deploy real AI applications for Azure
- **Professional Skills**: Enterprise-ready deployment skills  
- **Community Recognition**: Be active member for Azure developer community
- **Career Advancement**: In-demand AZD and AI deployment skills

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
- Share your AZD + AI experiences and get help
- Access early previews of new AI templates
- Contribute to AI deployment best practices
- Influence future AI + AZD feature development

### Contributing to the Course
We dey welcome contributions! Abeg read our [Contributing Guide](CONTRIBUTING.md) for details on:
- **Content Improvements**: Make the chapters and examples better
- **New Examples**: Add real-world scenarios and templates  
- **Translation**: Help us maintain multi-language support
- **Bug Reports**: Make accuracy and clarity better
- **Community Standards**: Follow our inclusive community guidelines

---

## 📄 Course Information

### License
This project dey under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team dey produce other full learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
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

**🚀 Ready to Start to Learn?**  

**Beginners**: Start wit [Chapter 1: Foundation & Quick Start](../..)  
**AI Developers**: Jump go [Chapter 2: AI-First Development](../..)  
**Experienced Developers**: Begin wit [Chapter 3: Configuration & Authentication](../..)  

**Next Steps**: [Begin Chapter 1 - AZD Basics](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transleshion service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transleshion. Even as we dey try make am accurate, abeg make you sabi say machine transleshion fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go fit trust. For important mata, e good make you use professional human transleshion. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transleshion.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->