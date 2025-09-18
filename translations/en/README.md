<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T12:41:15+00:00",
  "source_file": "README.md",
  "language_code": "en"
}
-->
# AZD For Beginners: A Structured Learning Journey

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.en.png) 

## Getting Started with This Course

Follow these steps to begin your AZD learning journey:

1. **Fork the Repository**: Click the "Fork" button to create your own copy of the repository.
2. **Clone the Repository**: Use the command `git clone https://github.com/microsoft/azd-for-beginners.git` to download the repository to your local machine.
3. **Join the Community**: Connect with experts and peers in the [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4).
4. **Choose Your Learning Path**: Select a chapter below that aligns with your experience level and goals.

### Multi-Language Support

#### Automated Translations (Always Up-to-Date)

Explore translations in various languages to learn in your preferred language.

## Course Overview

Learn the Azure Developer CLI (azd) through structured chapters designed for step-by-step learning. This course emphasizes deploying AI applications with Azure AI Foundry integration.

### Why This Course is Essential for Modern Developers

Insights from the Azure AI Foundry Discord community reveal that **45% of developers aim to use AZD for AI workloads** but face challenges such as:
- Navigating complex multi-service AI architectures
- Understanding best practices for production AI deployment
- Configuring and integrating Azure AI services
- Optimizing costs for AI workloads
- Troubleshooting AI-specific deployment issues

### Learning Objectives

By completing this course, you will:
- **Master AZD Fundamentals**: Learn core concepts, installation, and configuration.
- **Deploy AI Applications**: Utilize AZD with Azure AI Foundry services.
- **Implement Infrastructure as Code**: Manage Azure resources using Bicep templates.
- **Troubleshoot Deployments**: Identify and resolve common issues.
- **Optimize for Production**: Focus on security, scaling, monitoring, and cost management.
- **Build Multi-Agent Solutions**: Deploy complex AI architectures.

## 📚 Learning Chapters

*Choose your learning path based on your experience level and objectives.*

### 🚀 Chapter 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, basic command line knowledge  
**Duration**: 30-45 minutes  
**Complexity**: ⭐

#### What You'll Learn
- Introduction to Azure Developer CLI
- Installing AZD on your system
- Deploying your first application

#### Learning Resources
- **🎯 Start Here**: [What is Azure Developer CLI?](../..)
- **📖 Theory**: [AZD Basics](docs/getting-started/azd-basics.md) - Key concepts and terminology
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific instructions
- **🛠️ Hands-On**: [Your First Project](docs/getting-started/first-project.md) - Step-by-step guide
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Practical Exercises
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Chapter Outcome**: Successfully deploy a simple web application to Azure using AZD.

---

### 🤖 Chapter 2: AI-First Development (Recommended for AI Developers)
**Prerequisites**: Chapter 1 completed  
**Duration**: 1-2 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Integrating Azure AI Foundry with AZD
- Deploying AI-powered applications
- Configuring AI services effectively

#### Learning Resources
- **🎯 Start Here**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - Deploy and manage AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Prepare your AI solutions for AZD
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

**💡 Chapter Outcome**: Deploy and configure an AI-powered chat application with RAG capabilities.

---

### ⚙️ Chapter 3: Configuration & Authentication
**Prerequisites**: Chapter 1 completed  
**Duration**: 45-60 minutes  
**Complexity**: ⭐⭐

#### What You'll Learn
- Managing environment configurations
- Authentication and security best practices
- Organizing resources effectively

#### Learning Resources
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: Authentication patterns and managed identity
- **📝 Examples**: [Database App Example](../../examples/database-app) - Configuration patterns

#### Practical Exercises
- Configure multiple environments (dev, staging, prod)
- Set up managed identity authentication
- Implement environment-specific configurations

**💡 Chapter Outcome**: Manage multiple environments with proper authentication and security.

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Prerequisites**: Chapters 1-3 completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- Advanced deployment techniques
- Infrastructure as Code using Bicep
- Strategies for resource provisioning

#### Learning Resources
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Managing Azure resources
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### Practical Exercises
- Create custom Bicep templates
- Deploy multi-service applications
- Implement blue-green deployment strategies

**💡 Chapter Outcome**: Deploy complex multi-service applications using custom infrastructure templates.

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Advanced)
**Prerequisites**: Chapters 1-2 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Multi-agent architecture patterns
- Orchestrating and coordinating agents
- Deploying production-ready AI solutions

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

**💡 Chapter Outcome**: Deploy and manage a production-ready multi-agent AI solution with Customer and Inventory agents.

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- Validating resources and planning capacity
- Selecting cost-effective SKUs
- Automating pre-deployment checks

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Chapter Outcome**: Validate and optimize deployments before execution.

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Systematic approaches to debugging
- Resolving common issues
- Troubleshooting AI-specific problems

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Resolve authentication issues
- Debug AI service connectivity

**💡 Chapter Outcome**: Independently diagnose and resolve common deployment issues.

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Strategies for production deployments
- Enterprise security patterns
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: Application Insights integration

#### Practical Exercises
- Implement enterprise security patterns
- Set up comprehensive monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Deploy enterprise-ready applications with full production capabilities

---

## 📖 What is Azure Developer CLI?

Azure Developer CLI (azd) is a command-line tool designed for developers to streamline the process of building and deploying applications to Azure. It offers:

- **Template-based deployments** - Utilize pre-built templates for common application scenarios
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Easily provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for productivity and ease of use

### **AZD + Azure AI Foundry: Ideal for AI Deployments**

**Why use AZD for AI solutions?** AZD tackles key challenges faced by AI developers:

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and machine learning workloads
- **Secure AI Deployments** - Built-in security measures for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable and cost-efficient AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with monitoring
- **Cost Optimization** - Intelligent resource allocation and scaling strategies for AI workloads
- **Azure AI Foundry Integration** - Seamless access to AI Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Azure AI Foundry Templates
**Start here if you're deploying AI applications!**

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
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Official Microsoft samples
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Community-contributed templates
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Make your AI solutions AZD-deployable
- [**AZD For Beginners Workshop**](workshop/README.md) - Complete hands-on workshop materials

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
After completing each chapter, verify your knowledge by:
1. **Practical Exercise**: Complete the chapter's hands-on deployment
2. **Knowledge Check**: Review the FAQ section for your chapter
3. **Community Discussion**: Share your experience in Azure Discord
4. **Next Chapter**: Move to the next complexity level

### Course Completion Benefits
Upon completing all chapters, you will have:
- **Production Experience**: Deployed real AI applications to Azure
- **Professional Skills**: Enterprise-ready deployment capabilities  
- **Community Recognition**: Active member of Azure developer community
- **Career Advancement**: In-demand AZD and AI deployment expertise

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-Specific Help**: Join the [#Azure channel](https://discord.gg/microsoft-azure) for AZD + AI Foundry discussions
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Azure AI Foundry Discord

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

- [**NEW** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Course Navigation

**🚀 Ready to Start Learning?**

**Beginners**: Start with [Chapter 1: Foundation & Quick Start](../..)  
**AI Developers**: Jump to [Chapter 2: AI-First Development](../..)
**Experienced Developers**: Begin with [Chapter 3: Configuration & Authentication](../..)

**Next Steps**: [Begin Chapter 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.