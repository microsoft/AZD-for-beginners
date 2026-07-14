# AZD For Beginners: A Structured Learning Journey

![AZD-for-beginners](../../translated_images/pcm/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automated Translations (Always Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](./README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Prefer to Clone Locally?**
>
> Dis repository get 50+ language translations wey increase di download size well well. To clone without translations, use sparse checkout:
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
> Dis one go give you everything wey you need to complete di course wit faster download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Wetin Dey New for azd Today

> 📌 Dis course dey match wit **`azd 1.27.1`** (July 2026). Run `azd version` to check your build, and `azd upgrade` to get di latest.

Azure Developer CLI don grow pass traditional web apps and APIs. Today, azd be di only tool to deploy **any** application to Azure—including AI-powered applications and intelligent agents.

Dis na wetin dat mean for you:

- **AI agents don become main azd workloads.** You fit initialize, deploy, and manage AI agent projects using di same `azd init` → `azd up` workflow wey you sabi.
- **Complete agent lifecycle from di CLI.** Di `azure.ai.agents` extension cover di whole journey—`azd ai agent init` to scaffold, `azd ai agent invoke` to test (wit response-timing output), `azd ai agent eval generate` and `azd ai agent optimize` to measure and improve quality, and `azd ai agent delete` to clean up.
- **More AI building blocks.** New preview extensions—`azure.ai.skills` and `azure.ai.connections`—let you manage reusable agent skills and Foundry connections directly with azd.
- **Microsoft Foundry integration** dey bring model deployment, agent hosting, and AI service configuration directly inside di azd template ecosystem.
- **Better day-to-day basics.** Recent releases make `azd init` re-runnable (safe to run again), `azd auth login` clear stale tokens automatically, and add better `azd tool` first-run setup prompt.
- **Di main workflow no change.** Whether you dey deploy todo app, microservice, or multi-agent AI solution, di commands dey same.

> **Note for Aspire users:** Microsoft dey now call di product simply **Aspire** (before dem call am ".NET Aspire"). azd's Aspire support no change—na only di name dem update.

If you don use azd before, AI support na natural extension—not new tool or advanced track. If you dey start fresh, you go learn one workflow wey fit everytin.

---

## 🚀 Wetin be Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** na developer-friendly command-line tool wey make am easy to deploy applications to Azure. Instead make you create and connect plenty Azure resources one by one, you fit deploy whole applications with one command.

### Di Magic of `azd up`

```bash
# Dis one command dey do everything:
# ✅ Dem go create all Azure resources
# ✅ Dem go arrange networking and security
# ✅ Dem go build your application code
# ✅ Dem go deploy am for Azure
# ✅ Dem go give you working URL
azd up
```

**Na so e be!** No need click for Azure Portal, no need sabi complex ARM templates first, no need manual configuration - just working applications for Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wetin Be Di Difference?

Dis na di most common question wey beginners dey ask. Na di simple answer be dis:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must sabi Azure services | Just sabi your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Simple Analogy

- **Azure CLI** na like get all tools to build house - hammers, saws, nails. You fit build anything, but you need sabi construction.
- **Azure Developer CLI** na like hire contractor - you talk wetin you want, dem go do di building.

### When to Use Each

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Dem Dey Work Together!

AZD dey use Azure CLI for di back. You fit use both:
```bash
# Deploy your app wit AZD
azd up

# Den adjust specific tins wit Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find Templates for Awesome AZD

No start from zero! **Awesome AZD** na community collection of ready-to-deploy templates:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Browse 200+ templates wit one-click deploy |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Contribute your own template to di community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star and explore di source |

### Popular AI Templates from Awesome AZD

```bash
# RAG Chat wit Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat App
azd init --template openai-chat-app-quickstart

# AI Agents wit Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 How to Start for 3 Steps

Before you start, make sure your machine dey ready for di template wey you want deploy:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If any required check no pass, fix am first then continue wit di quick start.

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
# Optional if yu plan fo yus Azure CLI command dem direktly for dis course
az login

# Wetin you need for AZD workflow dem
azd auth login
```

If you no sure which one you need, follow di full setup flow inside [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Step 3: Deploy Your First App

```bash
# Begin from one template
azd init --template todo-nodejs-mongo

# Put for Azure (e go create everytin!)
azd up
```

**🎉 Na so e be!** Your app don dey live for Azure now.

### Clean Up (No Forget!)

```bash
# Comot all di resources wen you don finish to try di tins
azd down --force --purge
```

---

## 📚 How to Use Dis Course

Dis course dey made for **progressive learning** - start from where you dey comfortable and waka go higher:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Quick Setup

1. **Fork This Repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone am**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Get Help**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Prefer to Clone Locally?**

> Dis repository get 50+ language translations wey increase di download size well well. To clone without translations, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dis one go give you everything wey you need to complete di course wit faster download.


## Course Overview

Master Azure Developer CLI (azd) through structured chapters wey dem design for progressive learning. **Special focus on AI application deployment wit Microsoft Foundry integration.**


### Why Dis Kọ́sì Bá Get Importance for Modern Developers

Based on Microsoft Foundry Discord community insights, **45% of developers want make dem use AZD for AI workloads** but dem dey encounter wahala wit:
- Complex multiple service AI architectures dem
- Production AI deployment best practices  
- Azure AI service integration and how to configure am
- How to reduce cost for AI workloads
- Solving AI-specific deployment problem dem

### Learning Objectives

If you complete dis structured course, you go fit:
- **Master AZD Fundamentals**: Core concepts, how to install and configure am
- **Deploy AI Applications**: Use AZD with Microsoft Foundry services dem
- **Implement Infrastructure as Code**: Manage Azure resources with Bicep templates dem
- **Troubleshoot Deployments**: Solve common problem dem and debug issues
- **Optimize for Production**: Security, how to scale, monitoring, plus cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architecture dem

## Before You Start: Accounts, Access, and Assumptions

Before you begin Chapter 1, make sure say you get dis tins set. The installation steps wey dey inside dis guide dey assume say dis basics don settle.

- **An Azure subscription**: You fit use subscription wey you get from work or your own account, or you fit create [free trial](https://aka.ms/azurefreetrial) to start.
- **Permission to create Azure resources**: For most breakpoint exercises, you suppose get at least **Contributor** access for the subscription or resource group wey you go use. Some chapters fit assume say you fit create resource groups, managed identities, and RBAC assignments.
- [**A GitHub account**](https://github.com): E go help you fork the repository, follow your own changes, and use GitHub Codespaces for the workshop.
- **Template runtime prerequisites**: Some templates need local tools like Node.js, Python, Java, or Docker. Make you run the setup validator before you start so that you no go miss any tools.
- **Basic terminal familiarity**: You no need be expert, but you suppose sabi run commands like `git clone`, `azd auth login`, and `azd up`.

> **You dey work for enterprise subscription?**
> If administrator dey manage your Azure environment, confirm beforehand say you fit deploy resources for the subscription or resource group wey you wan use. If no be so, ask for sandbox subscription or Contributor access before you start.

> **You new for Azure?**
> Start with your own Azure trial or pay-as-you-go subscription for https://aka.ms/azurefreetrial so that you fit complete the exercises from beginning to end without waiting for tenant-level approvals.

## 🗺️ Course Map: Quick Navigation by Chapter

Each chapter get him own README with learning objectives, quick starts, and exercises:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | How to Start | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
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

*Choose your learning path based on your experience level and goals*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### Wetin You Go Learn
- Understand Azure Developer CLI fundamentals
- How to install AZD for your platform
- Your first successful deployment

#### Learning Resources
- **🎯 Start Here**: [Wet̩in be Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theory**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Core concepts and terminology
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platform-specific guides
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Step-by-step tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Quick check for installation
azd version

# Put your first app for ground
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: You go fit deploy simple web app for Azure using AZD

**✅ Success Validation:**
```bash
# After you don finish Chapter 1, you suppose fit do:
azd version              # Dey show installed version
azd init --template todo-nodejs-mongo  # E go start project
azd up                  # E dey deploy for Azure
azd show                # E dey show running app URL
# Application go open for browser and e go dey work
azd down --force --purge  # E go clean resources
```

**📊 Time Investment:** 30-45 minutes  
**📈 Skill Level After:** Fit deploy basic applications without help
**📈 Skill Level After:** Fit deploy basic applications without help

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 finish  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Microsoft Foundry integration with AZD
- How to deploy AI-powered applications
- Understand AI service configurations

#### Learning Resources
- **🎯 Start Here**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - How to deploy intelligent agents with AZD
- **📖 Patterns**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - How to deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prepare your AI solutions for AZD
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](#workshop-resources)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### Practical Exercises
```bash
# Deploy yu fes AI application
azd init --template azure-search-openai-demo
azd up

# Try oda AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Chapter Outcome**: Deploy and set up AI-powered chat app with RAG capabilities

**✅ Success Validation:**
```bash
# After Chapter 2, you for fit:
azd init --template azure-search-openai-demo
azd up
# Test di AI chat interface
# Ask question dem and get AI-powered responses wit sources
# Make sure sey search integration dey work
azd monitor  # Check sey Application Insights dey show telemetry
azd down --force --purge
```

**📊 Time Investment:** 1-2 hours  
**📈 Skill Level After:** Fit deploy and configure production-ready AI apps  
**💰 Cost Awareness:** Know $80-150/month dev costs, $300-3500/month production costs

#### 💰 Cost Considerations for AI Deployments

**Development Environment (Estimated $80-150/month):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (based on how many tokens you use)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Production Environment (Estimated $300-3,500+/month):**
- Microsoft Foundry Models (PTU for steady performance): $3,000+/month OR Pay-as-go if your usage plenty
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Cost Optimization Tips:**
- Use **Free Tier** Microsoft Foundry Models to learn (Azure OpenAI get 50,000 tokens/month free)
- Run `azd down` to stop and deallocate resources wen you no dey actively develop
- Start with pay-as-you-go billing, upgrade to PTU only for production
- Use `azd provision --preview` to estimate cost before deployment
- Enable auto-scaling so you go pay only for wetin you use

**Cost Monitoring:**
```bash
# Check how much e fit cost every month
azd provision --preview

# Watch actual costs for Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: Chapter 1 finish  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to configure and manage environment
- Authentication and security best practices
- How to name and organize your resources

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - How to set up environment
- **🔐 Security**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Authentication methods dem
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database examples dem

#### Practical Exercises
- Configure many environments (dev, staging, and prod)
- Set up managed identity for authentication
- Do environment-specific configuration

**💡 Chapter Outcome**: You fit manage multiple environments with correct authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 finish  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment methods
- Infrastructure as Code with Bicep
- Resource provisioning methods

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Full workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - How to manage Azure resources
- **📝 Examples**: [Container App Example](../../examples/container-app) - Container-based deployments

#### Practical Exercises
- Create custom Bicep templates dem
- Deploy multi-service applications dem
- Use blue-green deployment strategies

**💡 Chapter Outcome**: You go fit deploy complex multi-service applications using your own infrastructure templates

---


### 🎯 Chapter 5: Multi-Agent AI Solution Dem (Advanced)
**Prerequisites**: Chapters 1-2 don finish  
**Duration**: 2-3 hour  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patterns

#### Practical Exercises
```bash
# Make we deploy di whole retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Make we check di agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Deploy and manage production-ready multi-agent AI solution with Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 don finish  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Chapter Outcome**: Validate and optimize deployments before execution

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter don finish  
**Duration**: 1-1.5 hour  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Systematic debugging approaches
- Common issues and solutions
- AI-specific troubleshooting

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Resolve authentication issues
- Debug AI service connectivity

**💡 Chapter Outcome**: Independently diagnose and resolve common deployment issues

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 don finish  
**Duration**: 2-3 hour  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Production deployment strategies
- Enterprise security patterns
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up comprehensive monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Deploy enterprise-ready applications with full production capabilities

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> The workshop materials dem dey develop and refine now. Core modules dey work, but some advanced sections never finish. We dey work hard to complete all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Complete hands-on learning with browser-based tools and guided exercises**

Our workshop materials provide structured, interactive learning wey dey complement the chapter-based curriculum wey dey up. The workshop set for both self-paced learning and instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Full MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 8-module guided exercises (3-4 hours total)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Module Structure
The workshop follow **8-module progressive methodology** wey go carry you from discovery to deployment mastery:

| Module | Topic | Wetin You Go Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and choose di correct AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy di template with `azd up` and make sure infrastructure dey work | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to check template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make Am Your Own | Enable AI Search, tracing, evaluation, and customize am for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review wetin you don achieve, key concepts, and continue your learning journey | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 How To Start The Workshop
```bash
# Option 1: GitHub Codespaces (Na wetin I recommend)
# Click "Code" → "Create codespace for main" inside the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions wey dey inside workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
If you finish the workshop, participants go:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues on your own

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

**Good for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Deep Dive: AZD Capabilities

Beyond di basics, AZD get powerful features for production deployments:

- **Template-based deployments** - Use templates dem wey dem don build for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Smoothly provide, deploy, and monitor applications
- **Developer-friendly** - Optimized to make developers productive and happy

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD dey solve di main wahala AI developers face:

- **AI-Ready Templates** - Pre-set templates for Microsoft Foundry Models, Azure AI Services, and ML workloads
- **Secure AI Deployments** - Built-in secure patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development reach production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling tactics for AI workloads
- **Microsoft Foundry Integration** - Smooth connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if na AI applications you wan deploy!**

> **Note:** These templates show different AI patterns. Some na Azure Samples from outside, others na local implementations.

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
**Production-ready application templates wey map to learning chapters**

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
**Complete container deployment examples for dis repo:**

- [**Container App Examples**](examples/container-app/README.md) - Kompleti gid to containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API wit scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**Clone dis Azure Samples repositories to start:**
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
- [**Examples Directory**](examples/README.md) - Local learning examples wit detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands wey organize by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organize by learning chapter
- [**Study Guide**](resources/study-guide.md) - Komprehensiv practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Make your AI solutions AZD-deployable (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-module guided exercises wit MkDocs and GitHub Codespaces
  - Follows: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent skills for Azure AI, Foundry, deployment, diagnostics, cost optimization, and more. Install dem for GitHub Copilot, Cursor, Claude Code, or any supported agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Quick Troubleshooting Guide

**Common issues wey beginners face and quick solutions:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Make you install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Check sey installation don beta
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Make list of di subscriptions wey dey available
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Check am well well
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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Option 1: Clean am den try again
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
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you dey run az commands
az logout
az login

# Make sure say authentication na correct one
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD dey generate unique names, but if gbege:
azd down --force --purge

# Den try again with new environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Simple web app: 5-10 minutes
- App wit database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning dey slow)

```bash
# Check how e dey go
azd show

# If e jam for pass 30 minutes, check Azure Portal:
azd monitor --overview
# Find failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin make e give you:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Show all di service endpoint dem
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
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
After you finish each chapter, check your knowledge by:
1. **Practical Exercise**: Finish the chapter's hands-on deployment
2. **Knowledge Check**: Review the FAQ section for your chapter
3. **Community Discussion**: Share your experience for Azure Discord
4. **Next Chapter**: Move go the next level of complexity

### Course Completion Benefits
When you finish all chapters, you go get:
- **Production Experience**: Deploy real AI applications to Azure
- **Professional Skills**: Enterprise-ready deployment skills  
- **Community Recognition**: Active member of Azure developer community
- **Career Advancement**: In-demand AZD and AI deployment experience

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

**Join our community for:**
- Share your AZD + AI experiences and get help
- Access early previews of new AI templates
- Contribute to AI deployment best practices
- Influence future AI + AZD feature development

### Contributing to the Course
We welcome contributions! Abeg read our [Contributing Guide](CONTRIBUTING.md) for details on:
- **Content Improvements**: Make better the chapters and examples wey dey
- **New Examples**: Add real-world scenarios and templates  
- **Translation**: Help maintain multi-language support
- **Bug Reports**: Make am more accurate and clear
- **Community Standards**: Follow our inclusive community guidelines

---

## 📄 Course Information

### License
Dis project get MIT License - see di [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team dey produce other comprehensive learning courses:

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
 
### Main Tin Wey You Must Learn
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serie Dem
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ How You Go Take Learn

**🚀 You Ready To Start To Learn?**

**Beginners**: Start with [Chapter 1: Foundation & Quick Start](#-chapter-1-foundation--quick-start)  
**AI Developers**: Jump go [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Experienced Developers**: Begin with [Chapter 3: Configuration & Authentication](#️-chapter-3-configuration--authentication)

**Next Steps**: [Begin Chapter 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->