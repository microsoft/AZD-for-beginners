<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T22:06:49+00:00",
  "source_file": "README.md",
  "language_code": "en"
}
-->
# AZD For Beginners

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.en.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  
![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

Follow these steps to start using these resources:  
1. **Fork the Repository**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone the Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Join The Azure Discord Communities to connect with experts and fellow developers**](https://discord.com/invite/ByRwuEEgH4)  

### Multi-Language Support

#### Supported via GitHub Action (Automated & Always Up-to-Date)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**If you want additional translations, supported languages are listed [here](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Introduction

Welcome to the complete guide for Azure Developer CLI (azd). This repository is tailored to help developers of all levels—from students to professionals—learn and master Azure Developer CLI for efficient cloud deployments, **with a special emphasis on deploying AI applications using Azure AI Foundry**. This structured learning resource offers hands-on experience with Azure cloud deployments, troubleshooting common issues, and applying best practices for successful AZD template deployments.

### **Why This Guide Is Important for AI Developers**
According to a recent poll in the Azure AI Foundry Discord community, **45% of developers are interested in using AZD for AI workloads** but encounter challenges such as:  
- Complex multi-service AI architectures  
- Best practices for production AI deployments  
- Integration and configuration of Azure AI services  
- Cost optimization for AI workloads  
- Troubleshooting deployment issues specific to AI  

## Learning Goals

By working through this repository, you will:  
- Gain a solid understanding of Azure Developer CLI fundamentals and core concepts  
- Learn how to deploy and provision Azure resources using Infrastructure as Code  
- Develop troubleshooting skills for common AZD deployment issues  
- Understand pre-deployment validation and capacity planning  
- Apply security best practices and cost optimization strategies  
- Build confidence in deploying production-ready applications to Azure  

## Learning Outcomes

After completing this course, you will be able to:  
- Successfully install, configure, and use Azure Developer CLI  
- Create and deploy applications using AZD templates  
- Troubleshoot authentication, infrastructure, and deployment issues  
- Perform pre-deployment checks, including capacity planning and SKU selection  
- Implement monitoring, security, and cost management best practices  
- Integrate AZD workflows into CI/CD pipelines  

## Table of Contents

- [What is Azure Developer CLI?](../..)  
- [Quick Start](../..)  
- [Learning Path](../..)  
  - [For AI Developers (Recommended Start Here!)](../..)  
  - [For Students & Beginners](../..)  
  - [For Developers](../..)  
  - [For DevOps Engineers](../..)  
- [Documentation](../..)  
  - [Getting Started](../..)  
  - [Deployment & Provisioning](../..)  
  - [Pre-Deployment Checks](../..)  
  - [AI & Azure AI Foundry](../..)  
  - [Troubleshooting](../..)  
- [Examples & Templates](../..)  
  - [Featured: Azure AI Foundry Templates](../..)  
  - [Featured: Azure AI Foundry E2E Scenarios](../..)  
  - [Additional AZD Templates](../..)  
  - [Hands-On Labs & Workshops](../..)  
- [Resources](../..)  
- [Contributing](../..)  
- [Support](../..)  
- [Community](../..)  

## What is Azure Developer CLI?

Azure Developer CLI (azd) is a developer-focused command-line interface that simplifies the process of building and deploying applications to Azure. It offers:  

- **Template-based deployments** - Use pre-built templates for common application patterns  
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Easily provision, deploy, and monitor applications  
- **Developer-friendly** - Designed to enhance developer productivity and experience  

### **AZD + Azure AI Foundry: Ideal for AI Deployments**

**Why Choose AZD for AI Solutions?** AZD tackles the key challenges AI developers face:  

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads  
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments  
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring  
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads  
- **Azure AI Foundry Integration** - Seamless connection to AI Foundry model catalog and endpoints  

## Quick Start

### Prerequisites  
- Azure subscription  
- Azure CLI installed  
- Git (for cloning templates)  

### Installation  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Your First Deployment  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

### Your First AI Deployment  
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```  

## Learning Path

### For AI Developers (Recommended Start Here!)  
1. **Quick Start**: Try [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template  
2. **Learn Fundamentals**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **Hands-On Practice**: Complete [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)  
4. **Production Ready**: Review [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)  
5. **Advanced**: Deploy [contoso-chat](https://github.com/Azure-Samples/contoso-chat) enterprise template  

### For Students & Beginners  
1. Start with [AZD Basics](docs/getting-started/azd-basics.md)  
2. Follow the [Installation Guide](docs/getting-started/installation.md)  
3. Complete [Your First Project](docs/getting-started/first-project.md)  
4. Practice with [Simple Web App Example](../../examples/simple-web-app)  

### For Developers  
1. Review [Configuration Guide](docs/getting-started/configuration.md)  
2. Study [Deployment Guide](docs/deployment/deployment-guide.md)  
3. Work through [Database App Example](../../examples/database-app)  
4. Explore [Container App Example](../../examples/container-app)  

### For DevOps Engineers  
1. Master [Provisioning Resources](docs/deployment/provisioning.md)  
2. Implement [Pre-flight Checks](docs/pre-deployment/preflight-checks.md)  
3. Practice [Capacity Planning](docs/pre-deployment/capacity-planning.md)  
4. Advanced [Microservices Example](../../examples/microservices)  

## Documentation

### Getting Started  
- [**AZD Basics**](docs/getting-started/azd-basics.md) - Core concepts and terminology  
- [**Installation & Setup**](docs/getting-started/installation.md) - Platform-specific installation guides  
- [**Configuration**](docs/getting-started/configuration.md) - Environment setup and authentication  
- [**Your First Project**](docs/getting-started/first-project.md) - Step-by-step tutorial  

### Deployment & Provisioning  
- [**Deployment Guide**](docs/deployment/deployment-guide.md) - Complete deployment workflows  
- [**Provisioning Resources**](docs/deployment/provisioning.md) - Azure resource management  

### Pre-Deployment Checks  
- [**Capacity Planning**](docs/pre-deployment/capacity-planning.md) - Azure resource capacity validation  
- [**SKU Selection**](docs/pre-deployment/sku-selection.md) - Choosing the right Azure SKUs  
- [**Pre-flight Checks**](docs/pre-deployment/preflight-checks.md) - Automated validation scripts  

### AI & Azure AI Foundry  
- [**Azure AI Foundry Integration**](docs/ai-foundry/azure-ai-foundry-integration.md) - Connect AZD with Azure AI Foundry services  
- [**AI Model Deployment Patterns**](docs/ai-foundry/ai-model-deployment.md) - Deploy and manage AI models with AZD  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Hands-on lab: Making AI solutions AZD-ready  
- [**Production AI Best Practices**](docs/ai-foundry/production-ai-practices.md) - Security, scaling, and monitoring for AI workloads  

### Troubleshooting  
- [**Common Issues**](docs/troubleshooting/common-issues.md) - Frequently encountered problems and solutions  
- [**Debugging Guide**](docs/troubleshooting/debugging.md) - Step-by-step strategies for debugging  
- [**AI-Specific Troubleshooting**](docs/troubleshooting/ai-troubleshooting.md) - Resolving issues with AI services and model deployment  

## Examples & Templates  

### [Featured: Azure AI Foundry Templates](https://ai.azure.com/resource/build/templates)  
**Start here if you're deploying AI applications!**  

| Template | Description | Complexity | Services |  
|----------|-------------|------------|----------|  
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Build and deploy a simple chat application that integrates your data and telemetry insights using Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Develop and deploy a basic agent application with actions and telemetry insights using Azure Container Apps |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Improve task planning and automation by orchestrating and managing multiple AI agents |⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps |  
| [**Generate documents from your data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Speed up document creation (e.g., contracts, invoices, proposals) by finding and summarizing relevant data |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB |  
| [**Improve client meetings with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Enhance client interactions by leveraging agents to modernize legacy code |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Modernize your code with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Build and deploy a simple chat application that integrates your data and telemetry insights using Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps |  
| [**Build your conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Use advanced conversational understanding to create and improve chatbots and agents with deterministic workflows |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry |  
| [**Unlock insights from conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Enhance contact center efficiency by analyzing large audio and text datasets using advanced content understanding |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding |  
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Quickly and accurately process claims, invoices, contracts, and other documents by extracting and structuring information from unstructured content (supports text, images, tables, and graphs) |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps |  

### Featured: Azure AI Foundry E2E Scenarios  
**Start here if you're deploying AI applications!**  

| Template | Description | Complexity | Services |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Simple chat interface with Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-enabled chat app with Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Document analysis using AI services | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | AI agent framework with function calling | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Enterprise chat with AI orchestration | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Additional AZD Templates  
- [**Examples Directory**](examples/README.md) - Practical examples, templates, and real-world scenarios  
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Official Microsoft sample templates  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Community-contributed templates  

### Hands-On Labs & Workshops  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **NEW**: Make your AI solutions AZD-deployable  
- [**AZD For Beginners Workshop**](workshop/README.md) - Focus on deploying AI Agents AZD templates  

## Resources  

### Quick References  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Key azd commands  
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions answered  
- [**Study Guide**](resources/study-guide.md) - Learning objectives and practice exercises  

### External Resources  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Contributing  

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) for details on:  
- How to submit issues and feature requests  
- Code contribution guidelines  
- Documentation improvements  
- Community standards  

## Support  

- **Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)  
- **Discussions**: [Microsoft Azure Discord Community Q&A and discussions](https://discord.gg/microsoft-azure)  
- **AI-Specific Support**: Join the [#Azure channel](https://discord.gg/microsoft-azure) for AZD + AI Foundry discussions  
- **Email**: For private inquiries  
- **Microsoft Learn**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Community Insights from Azure AI Foundry Discord  

**Poll Results from #Azure Channel:**  
- **45%** of developers want to use AZD for AI workloads  
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices  

**Join our community to:**  
- Share your AZD + AI experiences and get help  
- Access early previews of new AI templates  
- Contribute to AI deployment best practices  
- Influence future AI + AZD feature development  

## License  

This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.  

## Other Courses  

Our team produces other courses! Check out:  

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

**Navigation**  
- **Next Lesson**: [AZD Basics](docs/getting-started/azd-basics.md)  

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.