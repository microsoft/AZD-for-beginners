<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6dbd1fe0dee10a4def58fdc663c59e1d",
  "translation_date": "2025-11-18T18:51:49+00:00",
  "source_file": "README.md",
  "language_code": "pcm"
}
-->
# AZD For Beginners: How You Go Take Learn Am Step by Step

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pcm.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## How You Go Start Dis Course

Follow dis steps to start your AZD learning journey:

1. **Fork Di Repository**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Di Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Join Di Community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) wey go give you expert support
4. **Choose Your Learning Path**: Pick one chapter wey match your level or wetin you wan learn

### Multi-Language Support

#### Automated Translations (E dey Always Up-to-Date)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](./README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## Course Overview

You go sabi Azure Developer CLI (azd) well well through di chapters wey dem arrange make e easy to learn. **E dey focus on how you go deploy AI application wey dey use Azure AI Foundry.**

### Why Dis Course Important for Developers Today

From wetin di Azure AI Foundry Discord community talk, **45% of developers wan use AZD for AI workloads** but dem dey face wahala like:
- How dem go fit handle di complex AI architectures wey dey use many services
- Best way to deploy AI for production  
- How to configure Azure AI services
- How to reduce cost for AI workloads
- How to solve wahala wey dey happen for AI-specific deployment

### Wetin You Go Learn

If you finish dis course, you go sabi:
- **AZD Basics**: Di main idea, how to install am, and how to configure am
- **Deploy AI Applications**: Use AZD with Azure AI Foundry services
- **Infrastructure as Code**: Manage Azure resources with Bicep templates
- **Solve Deployment Wahala**: How to fix common problems and debug issues
- **Make Am Ready for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 📚 Learning Chapters

*Pick di chapter wey match your level or wetin you wan achieve*

### 🚀 Chapter 1: Foundation & Quick Start
**Wetin You Need Before You Start**: Azure subscription, small knowledge about command line  
**Time We E Go Take**: 30-45 minutes  
**Level**: ⭐

#### Wetin You Go Learn
- Di basics of Azure Developer CLI
- How to install AZD for your platform
- How to deploy your first project

#### Learning Resources
- **🎯 Start Here**: [Wetin Be Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/getting-started/azd-basics.md) - Di main idea and terms
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - How to install am for different platforms
- **🛠️ Hands-On**: [Your First Project](docs/getting-started/first-project.md) - Step-by-step tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Wetin You Go Gain**: You go fit deploy one simple web application to Azure using AZD

---

### 🤖 Chapter 2: AI-First Development (E Good for AI Developers)
**Wetin You Need Before You Start**: Finish Chapter 1  
**Time We E Go Take**: 1-2 hours  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to use Azure AI Foundry with AZD
- How to deploy AI-powered applications
- How to configure AI services

#### Learning Resources
- **🎯 Start Here**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - How to deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - How to make your AI solutions ready for AZD
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 Templates**: [Azure AI Foundry Templates](../..)

#### Practical Exercises
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Wetin You Go Gain**: You go fit deploy and configure one AI-powered chat application wey get RAG capabilities

---

### ⚙️ Chapter 3: Configuration & Authentication
**Wetin You Need Before You Start**: Finish Chapter 1  
**Time We E Go Take**: 45-60 minutes  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to configure and manage environments
- Best way to do authentication and security
- How to name and organize resources

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - How to set up environments
- **🔐 Security**: Authentication patterns and managed identity
- **📝 Examples**: [Database App Example](../../examples/database-app) - Configuration patterns

#### Practical Exercises
- Configure different environments (dev, staging, prod)
- Set up managed identity authentication
- Implement environment-specific configurations

**💡 Wetin You Go Gain**: You go sabi manage different environments with correct authentication and security

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Wetin You Need Before You Start**: Finish Chapters 1-3  
**Time We E Go Take**: 1-1.5 hours  
**Level**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- How to provision resources

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - How to manage Azure resources
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### Practical Exercises
- Create custom Bicep templates
- Deploy applications wey dey use many services
- Implement blue-green deployment strategies

**💡 Wetin You Go Gain**: You go sabi deploy complex applications wey dey use custom infrastructure templates

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Wetin You Need Before You Start**: Finish Chapters 1-2  
**Time We E Go Take**: 2-3 hours  
**Level**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Multi-agent architecture patterns
- How to coordinate and manage agents
- How to deploy AI solutions wey ready for production

#### Learning Resources
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: Multi-agent coordination patterns

#### Practical Exercises
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Wetin You Go Gain**: You go sabi deploy and manage one production-ready multi-agent AI solution wey get Customer and Inventory agents

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Wetin You Need Before You Start**: Finish Chapter 4  
**Time We E Go Take**: 1 hour  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to plan capacity and validate resources
- How to choose di correct SKU
- How to do pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Wetin You Go Gain**: You go sabi validate and optimize deployments before you run am

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Wetin You Need Before You Start**: Finish any deployment chapter  
**Time We E Go Take**: 1-1.5 hours  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to debug problems step by step
- Common issues and how to solve dem
- AI-specific troubleshooting

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Solve authentication issues
- Debug AI service connectivity

**💡 Wetin You Go Gain**: You go sabi diagnose and solve common deployment wahala by yourself

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Wetin You Need Before You Start**: Finish Chapters 1-4  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- How to deploy for production
- Security patterns for big companies
- How to monitor and reduce cost

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Patterns for big companies
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: Application Insights integration

#### Practical Exercises
- Do security patterns for big companies
- Set up monitoring wey cover everything
- Deploy for production with correct governance

**💡 Chapter Outcome**: Deploy applications wey ready for big companies with full production features

---

## 🎓 Workshop Overview: Hands-On Learning Experience

### Interactive Workshop Materials
**Structured hands-on learning wey use browser tools and guided exercises**

Our workshop materials dey give structured, interactive learning wey match the chapter-based curriculum wey dey above. The workshop fit work for self-paced learning or instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop wey get search, copy, and theme features
- **GitHub Codespaces Integration**: One-click setup for development environment
- **Structured Learning Path**: 7-step guided exercises (3.5 hours total)
- **Discovery → Deployment → Customization**: Progressive methodology
- **Interactive DevContainer Environment**: Tools and dependencies wey don already configure

#### 📚 Workshop Structure
The workshop dey follow **Discovery → Deployment → Customization** methodology:

1. **Discovery Phase** (45 mins)
   - Check Azure AI Foundry templates and services
   - Understand multi-agent architecture patterns
   - Look deployment requirements and prerequisites

2. **Deployment Phase** (2 hours)
   - Deploy AI applications with AZD hands-on
   - Configure Azure AI services and endpoints
   - Do security and authentication patterns

3. **Customization Phase** (45 mins)
   - Change applications to fit specific use cases
   - Optimize for production deployment
   - Add monitoring and cost management

#### 🚀 How to Start the Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
When you finish the workshop, you go:
- **Deploy Production AI Applications**: Use AZD with Azure AI Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Do Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Solve common issues by yourself

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 Wetin Be Azure Developer CLI?

Azure Developer CLI (azd) na developer-friendly command-line tool wey dey make am easy to build and deploy applications to Azure. E dey provide:

- **Template-based deployments** - Use templates wey don already dey for common application patterns
- **Infrastructure as Code** - Manage Azure resources with Bicep or Terraform  
- **Integrated workflows** - Provision, deploy, and monitor applications without stress
- **Developer-friendly** - Designed to make developers work easy

### **AZD + Azure AI Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD dey solve the main wahala wey AI developers dey face:

- **AI-Ready Templates** - Templates wey don already configure for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Security patterns wey dey built-in for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Azure AI Foundry Integration** - Easy connection to AI Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Azure AI Foundry Templates
**Start here if you wan deploy AI applications!**

| Template | Chapter | Complexity | Services |
|----------|---------|------------|----------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generate documents from your data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Improve client meetings with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernize your code with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Build your conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Unlock insights from conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Featured: Complete Learning Scenarios
**Templates wey ready for production mapped to learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

#### Simple Applications (Chapters 1-2)
- [Simple Web App](../../examples/simple-web-app) - Basic deployment patterns
- [Static Website](../../examples/static-site) - Static content deployment
- [Basic API](../../examples/basic-api) - REST API deployment

#### Database Integration (Chapter 3-4)  
- [Database App](../../examples/database-app) - Database connectivity patterns
- [Data Processing](../../examples/data-processing) - ETL workflow deployment

#### Advanced Patterns (Chapters 4-8)
- [Container Apps](../../examples/container-app) - Containerized deployments
- [Microservices](../../examples/microservices) - Multi-service architectures  
- [Enterprise Solutions](../../examples/enterprise) - Production-ready patterns

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Important azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Make your AI solutions AZD-deployable (2-3 hours)
- [**Interactive Workshop Guide**](workshop/README.md) - Browser-based workshop with MkDocs and DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) -7-step guided exercises (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Complete hands-on workshop materials with GitHub Codespaces integration

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

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
After you finish each chapter, confirm wetin you learn by:
1. **Practical Exercise**: Do the chapter's hands-on deployment
2. **Knowledge Check**: Check the FAQ section for your chapter
3. **Community Discussion**: Share your experience for Azure Discord
4. **Next Chapter**: Move to the next complexity level

### Course Completion Benefits
When you finish all chapters, you go get:
- **Production Experience**: Deploy real AI applications to Azure
- **Professional Skills**: Deployment skills wey big companies dey need  
- **Community Recognition**: Be active member for Azure developer community
- **Career Advancement**: Skills wey dey in-demand for AZD and AI deployment

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Azure AI Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** of developers wan use AZD for AI workloads
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**Join our community to:**
- Share your AZD + AI experiences and get help
- Access early previews of new AI templates
- Help for how AI go dey work well well
- Make impact for future AI + AZD feature development

### How to Contribute for Dis Course
We dey happy for any help wey you fit give! Abeg read our [Contributing Guide](CONTRIBUTING.md) to sabi more about:
- **How to Make Content Better**: Add better gist for di chapters and examples wey dey already
- **New Examples**: Put real-life stories and templates  
- **Translation**: Help us keep di course for plenty languages
- **Bug Reports**: Make di course more correct and clear
- **Community Standards**: Follow di rules wey go make everybody feel welcome

---

## 📄 Course Info

### License
Dis project dey under di MIT License - check di [LICENSE](../../LICENSE) file to sabi more.

### Microsoft Learning Resources Wey Relate

Our team dey do other big learning courses:

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

---

## 🗺️ How to Move Around for Dis Course

**🚀 You ready to start to learn?**

**Beginners**: Start with [Chapter 1: Foundation & Quick Start](../..)  
**AI Developers**: Go straight to [Chapter 2: AI-First Development](../..)  
**Experienced Developers**: Start with [Chapter 3: Configuration & Authentication](../..)

**Next Steps**: [Begin Chapter 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator) do di translation. Even as we dey try make am accurate, abeg sabi say automated translations fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go trust. For important information, e good make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->