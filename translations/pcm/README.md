# AZD For Beginners: Structured Learnin Journey

![AZD fo beginners](../../translated_images/pcm/azdbeginners.5527441dd9f74068.webp) 

[![GitHub people wey dey watch](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub people wey don fork](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatic Translations (Always dey up-to-date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](./README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **You prefer to clone am for your machine?**
>
> This repo get pass 50 translations wey dey make the download size big. To clone without translations, use sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Dis go give you everytin wey you need to complete di course, and e go download much faster.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Wetin new for azd Today

> 📌 This course don validate against **`azd 1.25.6`** (June 2026). Run `azd version` make you check your build, and `azd upgrade` to get the latest.

Azure Developer CLI don grow pass traditional web apps and APIs. Today, azd na one tool wey fit deploy **any** application to Azure—including AI-powered applications and intelligent agents.

Wetin this mean for you:

- **AI agents don become first-class azd workloads.** You fit initialize, deploy, and manage AI agent projects using the same `azd init` → `azd up` workflow wey you don sabi.
- **Complete agent lifecycle from the CLI.** The `azure.ai.agents` extension now cover the whole journey—`azd ai agent init` to scaffold, `azd ai agent invoke` to test (with response-timing output), `azd ai agent eval generate` and `azd ai agent optimize` to measure and improve quality, and `azd ai agent delete` to clean up.
- **More AI building blocks.** New preview extensions—`azure.ai.skills` and `azure.ai.connections`—let you manage reusable agent skills and Foundry connections directly with azd.
- **Microsoft Foundry integration** dey bring model deployment, agent hosting, and AI service configuration direct into the azd template ecosystem.
- **Smoother day-to-day basics.** Recent releases make `azd init` idempotent (safe to re-run), make `azd auth login` clear stale tokens automatically, and add friendly `azd tool` first-run setup prompt.
- **The core workflow never change.** Whether you dey deploy a todo app, a microservice, or a multi-agent AI solution, the commands remain the same.

> **Note for Aspire users:** Microsoft don start to call the product simply as **Aspire** (wey before dem dey call ".NET Aspire"). azd's Aspire support no change—na only the name dem update.

If you don use azd before, AI support na natural extension—not another tool or one advanced track. If you dey start fresh, you go learn one workflow wey dey work for everything.

---

## 🚀 Wetin be Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** na developer-friendly command-line tool wey make am easy to deploy applications to Azure. Instead of you dey manually create and connect plenty Azure resources, you fit deploy whole applications with single command.

### Di Magic of `azd up`

```bash
# Dis one command dey do everytin:
# ✅ Dem go create all Azure resources
# ✅ Dem go configure networking and security
# ✅ Dem go build your application code
# ✅ Dem go deploy am for Azure
# ✅ Dem go give you working URL
azd up
```

**Na so e be!** No need click for Azure Portal, no complex ARM templates to learn first, no manual configuration - just working applications on Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wetin be the Difference?

Na the most common question wey beginners dey ask. Here be the simple answer:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Wetin e dey do** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **How e dey to learn** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Simple Analogy

- **Azure CLI** be like say you get all the tools to build house - hammers, saws, nails. You fit build anything, but you gots sabi construction.
- **Azure Developer CLI** be like hire contractor - you explain wetin you want, dem go handle di building.

### When to Use Each

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Dem dey work together!

AZD dey use Azure CLI under the hood. You fit use both:
```bash
# Deploy your app wit AZD
azd up

# Den make correct adjustment for specific resources wit Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find Templates in Awesome AZD

No start from scratch! **Awesome AZD** na community collection of ready-to-deploy templates:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Browse 200+ templates wey you fit deploy with one click |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Contribute your own template to the community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star am and check the source |

### Popular AI Templates from Awesome AZD

```bash
# RAG Chat wit Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents wit Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 How to Start: 3 Steps

Before you start, make sure your machine ready for the template wey you wan deploy:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If any required check fail, fix am first and then continue with the quick start.

### Step 1: Install AZD (2 minutes)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Step 2: Authenticate for AZD

```bash
# Optional if yu wan use Azure CLI commands direct for dis course
az login

# Na wetin you need for AZD workflows
azd auth login
```

If you no sure which one you need, follow the full setup flow in [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Step 3: Deploy Your First App

```bash
# Begin wit template
azd init --template todo-nodejs-mongo

# Deploy go Azure (e go create everytin!)
azd up
```

**🎉 Na so!** Your app don dey live for Azure now.

### Clean Up (No forget!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 How to Use Dis Course

This course design for **progressive learning** - start where you dey comfortable and waka your way up:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Quick Setup

1. **Fork This Repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone It**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Get Help**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **You prefer to clone am for your machine?**
>
> This repo get pass 50 translations wey dey make the download size big. To clone without translations, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dis go give you everytin wey you need to complete di course with a much faster download.


## Course Overview

Master Azure Developer CLI (azd) through structured chapters wey dem design for progressive learning. **Wey dem focus well on AI application deployment with Microsoft Foundry integration.**
### Why Dis Course Dey Important for Modern Developers

Based on Microsoft Foundry Discord community insights, **45% of developers want to use AZD for AI workloads** but dem dey encounter wahala with:
- Complex multi-service AI architectures
- Production AI deployment best practices  
- Azure AI service integration and configuration
- Cost optimization for AI workloads
- Troubleshooting AI-specific deployment issues

### Learning Objectives

By completing dis structured course, you go:
- **Make you sabi AZD basics**: Main concepts, how to install, and how to configure
- **Deploy AI Applications**: Use AZD with Microsoft Foundry services
- **Implement Infrastructure as Code**: Manage Azure resources with Bicep templates
- **Troubleshoot Deployments**: Solve common issues and debug problems
- **Optimize for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## Before You Start: Accounts, Access, and Assumptions

Before you begin Chapter 1, make sure sey you get dis tins ready. The installation steps wey dey later inside this guide assume sey these basics don already set.

- **An Azure subscription**: You fit use an existing subscription from work or your own account, or create a [free trial](https://aka.ms/azurefreetrial) to start.
- **Permission to create Azure resources**: For most exercises, you suppose get at least **Contributor** access on the target subscription or resource group. Some chapters fit also assume sey you fit create resource groups, managed identities, and RBAC assignments.
- [**A GitHub account**](https://github.com): Dis one go help you fork the repository, track your own changes, and use GitHub Codespaces for the workshop.
- **Template runtime prerequisites**: Some templates need local tools like Node.js, Python, Java, or Docker. Run the setup validator before you start so you fit catch missing tools early.
- **Basic terminal familiarity**: You no need be expert, but you suppose dey comfortable to run commands like `git clone`, `azd auth login`, and `azd up`.

> **You dey work for enterprise subscription?**
> If administrator dey manage your Azure environment, confirm before you start sey you fit deploy resources for the subscription or resource group wey you wan use. If no, ask for sandbox subscription or Contributor access before you begin.

> **New to Azure?**
> Start with your own Azure trial or pay-as-you-go subscription for https://aka.ms/azurefreetrial so you fit finish the exercises end-to-end without waiting for tenant-level approvals.

## 🗺️ Course Map: Quick Navigation by Chapter

Each chapter get im own README wey get learning objectives, quick starts, and exercises:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Learning Chapters

*Choose your learning path based on experience level and goals*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### Wetin You Go Learn
- Understand Azure Developer CLI basics
- How to install AZD for your platform
- Your first successful deployment

#### Learning Resources
- **🎯 Start Here**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theory**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Main concepts and terminology
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platform-specific guides
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Step-by-step tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Small check make sure installation don set
azd version

# Make you deploy your first app
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: You go fit successfully deploy simple web application to Azure using AZD

**✅ Success Validation:**
```bash
# After you finish Chapter 1, you go fit:
azd version              # Dey show di version wey don install
azd init --template todo-nodejs-mongo  # Dey set up di project
azd up                  # Dey deploy go Azure
azd show                # Dey show di URL wey di app dey run
# App go open for browser an e go work
azd down --force --purge  # Dey clean up di resources
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Fit deploy basic applications on your own
**📈 Skill Level After:** Fit deploy basic applications on your own

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 don finish  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Microsoft Foundry integration with AZD
- How to deploy AI-powered applications
- Understand AI service configurations

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Deploy intelligent agents with AZD
- **📖 Patterns**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Make your AI solutions AZD-ready
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](#workshop-resources)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# Start di first AI app
azd init --template azure-search-openai-demo
azd up

# Try more AI template dem
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: Deploy and configure AI-powered chat application wey get RAG capabilities

**✅ Success Validation:**
```bash
# After Chapter 2, you go fit:
azd init --template azure-search-openai-demo
azd up
# Test di AI chat interface
# Ask question dem and get AI-powered answers wey get sources
# Confirm say search integration dey work
azd monitor  # Check say Application Insights dey show telemetry
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** Fit deploy and configure production-ready AI applications  
**💰 Cost Awareness:** Know sey dev costs fit be $80-150/month, production costs fit be $300-3500/month

#### 💰 Cost Considerations for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Cost Optimization Tips:**
- Use **Free Tier** Microsoft Foundry Models for learning (Azure OpenAI 50,000 tokens/month included)
- Run `azd down` to deallocate resources when you no dey actively develop
- Start with consumption-based billing, upgrade to PTU only for production
- Use `azd provision --preview` to estimate costs before deployment
- Enable auto-scaling: pay only for wetin you use

**Cost Monitoring:**
```bash
# Check di cost wey dem don estimate per month
azd provision --preview

# Dey monitor di real cost for Azure Portal
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
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Environment setup
- **🔐 Security**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Authentication patterns
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database Examples

#### Practical Exercises
- Configure multiple environments (dev, staging, prod)
- Set up managed identity authentication
- Implement environment-specific configurations

**💡 Chapter Outcome**: Manage multiple environments with correct authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 don finish  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- Resource provisioning strategies

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resource management
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### Practical Exercises
- Create custom Bicep templates
- Deploy multi-service applications
- Implement blue-green deployment strategies

**💡 Chapter Outcome**: Deploy complex multi-service applications using custom infrastructure templates
### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Make you don finish Chapters 1-2  
**Duration**: Time wey e go take: 2-3 hours  
**Complexity**: How e hard: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Patterns wey dem dey use for multi-agent architecture
- How to orchestrate and coordinate agents
- AI deployments wey ready for production

#### Materials wey go help you learn
- **🤖 Project wey dem highlight**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Implementation wey don complete
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Deploy with one click
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patterns wey dem dey use

#### Practical Exercises
```bash
# Deploy di full retail system wey get plenty agent dem
cd examples/retail-multiagent-arm-template
./deploy.sh

# Check di agent settings
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Wetin Chapter Go Do For You**: Deploy and manage production-ready multi-agent AI solution with Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Make you don finish Chapter 4  
**Duration**: Time wey e go take: 1 hour  
**Complexity**: How e hard: ⭐⭐

#### Wetin You Go Learn
- How to do capacity planning and validate resources
- Strategies to pick SKU
- Pre-flight checks and how to automate dem

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run di capacity validation scripts
- Optimize SKU selections make dem cheap
- Implement automated pre-deployment checks

**💡 Wetin Chapter Go Do For You**: Validate and optimize deployments before you run dem

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter don finish  
**Duration**: Time wey e go take: 1-1.5 hours  
**Complexity**: How e hard: ⭐⭐

#### Wetin You Go Learn
- Systematic approaches to debugging
- Common wahalas and how to fix dem
- Troubleshooting wey concern AI specifically

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problems wey fit show for AI services

#### Practical Exercises
- Diagnose why deployment fail
- Solve authentication wahalas
- Debug AI service connectivity

**💡 Wetin Chapter Go Do For You**: Make you fit diagnose and fix common deployment problems by yourself

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Make you don finish Chapters 1-4  
**Duration**: Time wey e go take: 2-3 hours  
**Complexity**: How e hard: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Strategies for production deployment
- Enterprise security patterns
- How to monitor and optimize cost

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up full monitoring
- Deploy to production with correct governance

**💡 Wetin Chapter Go Do For You**: Deploy enterprise-ready applications wey get full production capabilities

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> Workshop materials still dey under development and dem still dey refine am. Core modules dey work, but some advanced sections never complete. We dey work to finish all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Comprehensive hands-on learning with browser-based tools and guided exercises**

Our workshop materials dey give structured, interactive learning experience wey dey complement di chapter-based curriculum wey dey up. The workshop fit work for self-paced learning or instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
Di workshop follow **8-module progressive methodology** wey go carry you from discovery reach deployment mastery:

| Module | Topic | Wetin You Go Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 How to Start the Workshop
```bash
# Option 1: GitHub Codespaces (Na di one wey I recommend)
# Click "Code" → "Create codespace on main" inside di repository

# Option 2: Work for your local machine
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow di setup instructions wey dey for workshop/README.md
```

#### 🎯 Wetin You Go Achieve From Di Workshop
By completing the workshop, participants go:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues by yourself

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop overview and objectives
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Deep Dive: AZD Capabilities

Wetin AZD fit do pass di basics — e get powerful features for production deployments:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD dey solve top challenges wey AI developers dey face:

- **AI-Ready Templates** - Pre-configured templates for Microsoft Foundry Models, Azure AI Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you dey deploy AI applications!**

> **Note:** These templates dey show different AI patterns. Some na external Azure Samples, others na local implementations.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates wey map go learning chapters**

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
> **Local Examples** (for this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples wey dey this repository:**
- [**Container App Eksamples**](examples/container-app/README.md) - Full guide to deploying tins as containers
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API wey fit scale go zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment wey ready for production for many services
  - Quick Start, Production, and Advanced deployment patterns
  - Guide for monitoring, security, and how to cut costs

#### External Examples - Simple Applications (Chapters 1-2)
**Clone dis Azure Samples repositories make you fit start:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - How to deploy static content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - How to deploy REST API

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

## 📚 Materials wey go help you learn & Reference

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Make your AI solutions AZD-deployable (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-module guided exercises with MkDocs and GitHub Codespaces
  - Follows: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent skills for Azure AI, Foundry, deployment, diagnostics, cost optimization, and more. Install them in GitHub Copilot, Cursor, Claude Code, or any supported agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Quick Troubleshooting Guide

**Common issues beginners face and immediate solutions:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Make sure say you install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Make sure say e don install well
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Show di subscriptions wey dey available
az account list --output table

# Set di default subscription
az account set --subscription "<subscription-id-or-name>"

# Set am for di AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Check am
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Try anoda Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smol SKUs for development
# Make you edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Option 1: Clean make e try again
azd down --force --purge
azd up

# Option 2: Just fix di infrastructure
azd provision

# Option 3: Check di detailed status
azd show

# Option 4: Check di logs for Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Make you sign in again for AZD
azd auth logout
azd auth login

# If you wan: refresh Azure CLI too if you dey run az commands
az logout
az login

# Make sure say you don sign in
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD dey generate unique names, but if dem clash:
azd down --force --purge

# Den try again with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning is slow)

```bash
# Check how e dey go
azd show

# If e jam pass 30 minutes, check Azure Portal:
azd monitor --overview
# Look for deployments wey fail
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Make sure say you check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You gats get at least "Contributor" role
# Ask your Azure admin make e grant:
# - Contributor (for resources dem)
# - User Access Administrator (for role assignments dem)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Make you show all service endpoints
azd show

# Abi open Azure Portal
azd monitor

# Check the service wey you want
azd env get-values
# Find any *_URL variables
```
</details>

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Track your learning progress through each chapter:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
After completing each chapter, verify your knowledge by:
1. **Practical Exercise**: Complete the chapter's hands-on deployment
2. **Knowledge Check**: Review the FAQ section for your chapter
3. **Community Discussion**: Share your experience in Azure Discord
4. **Next Chapter**: Move to the next complexity level

### Course Completion Benefits
After you finish all the chapters, you go get:
- **Production Experience**: Deployed real AI applications to Azure
- **Professional Skills**: Enterprise-ready deployment capabilities  
- **Community Recognition**: Active member of Azure developer community
- **Career Advancement**: In-demand AZD and AI deployment expertise

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** of developers want to use AZD for AI workloads
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**Join our community to:**
- Share your AZD + AI experiences and get help
- Access early previews of new AI templates
- Contribute to AI deployment best practices
- Influence future AI + AZD feature development

### Contributing to the Course
We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) for details on:
- **Content Improvements**: Enhance existing chapters and examples
- **New Examples**: Add real-world scenarios and templates  
- **Translation**: Help maintain multi-language support
- **Bug Reports**: Improve accuracy and clarity
- **Community Standards**: Follow our inclusive community guidelines

---

## 📄 Course Information

### License
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
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
 
### Core Learnin
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

## 🗺️ How to Dey Navigate Di Course

**🚀 You ready to start learn?**

**Beginners**: Start wit [Chapter 1: Foundation & Quick Start](#-chapter-1-foundation--quick-start)  
**AI Developers**: Make una jump go [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Experienced Developers**: Start wit [Chapter 3: Configuration & Authentication](#️-chapter-3-configuration--authentication)

**Wetin Next**: [Begin Chapter 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->