<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:28:45+00:00",
  "source_file": "workshop/README.md",
  "language_code": "en"
}
-->
# AZD for AI Developers Workshop

**Previous:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Next:** [Workshop Lab Modules](../../../workshop)

Welcome to this hands-on workshop where you'll learn how to use Azure Developer CLI (AZD) to deploy AI applications. This workshop will guide you from the basics of AZD to deploying AI solutions that are ready for production.

## Workshop Overview

**Duration:** 2-3 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** Basic understanding of Azure, command line tools, and AI concepts

### What You'll Learn

- **AZD Fundamentals**: Learn how to use Infrastructure as Code with AZD
- 🤖 **AI Service Integration**: Deploy Azure OpenAI, AI Search, and other AI services
- **Container Deployment**: Use Azure Container Apps for AI applications
- **Security Best Practices**: Implement Managed Identity and secure configurations
- **Monitoring & Observability**: Set up Application Insights for AI workloads
- **Production Patterns**: Explore strategies for enterprise-ready deployments

## Workshop Structure

### Module 1: AZD Foundations (30 minutes)
- Install and configure AZD
- Understand the AZD project structure
- Deploy your first AZD project
- **Lab**: Deploy a simple web application

### Module 2: Azure OpenAI Integration (45 minutes)
- Set up Azure OpenAI resources
- Learn model deployment strategies
- Configure API access and authentication
- **Lab**: Deploy a chat application using GPT-4

### Module 3: RAG Applications (45 minutes)
- Integrate Azure AI Search
- Process documents with Azure Document Intelligence
- Work with vector embeddings and semantic search
- **Lab**: Build a document Q&A system

### Module 4: Production Deployment (30 minutes)
- Configure Container Apps
- Optimize scaling and performance
- Set up monitoring and logging
- **Lab**: Deploy to production with observability

### Module 5: Advanced Patterns (15 minutes)
- Deploy to multiple environments
- Integrate CI/CD pipelines
- Apply cost optimization strategies
- **Wrap-up**: Review the production readiness checklist

## Prerequisites

### Required Tools

Please install the following tools before starting the workshop:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure Account Setup

1. **Azure Subscription**: [Sign up for free](https://azure.microsoft.com/free/)
2. **Azure OpenAI Access**: [Request access](https://aka.ms/oai/access)
3. **Required Permissions**:
   - Contributor role on your subscription or resource group
   - User Access Administrator (for RBAC assignments)

### Verify Prerequisites

Run the following script to ensure your setup is ready:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Workshop Materials

### Lab Exercises

Each module includes hands-on labs with starter code and step-by-step instructions:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Deploy your first AZD project
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Build a chat application with Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Create a RAG application with AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Explore production deployment patterns
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Dive into advanced deployment scenarios

### Reference Materials

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Detailed integration patterns
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Best practices for deploying AI models
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - Strategies for enterprise deployments
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - Solutions to common issues

### Sample Templates

Quick-start templates for popular AI scenarios:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Getting Started

### Option 1: GitHub Codespaces (Recommended)

The easiest way to start the workshop:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Option 2: Local Development

1. **Clone the workshop repository:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Log in to Azure:**
```bash
az login
azd auth login
```

3. **Start with Lab 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Option 3: Instructor-Led Workshop

If you're attending a session led by an instructor:

- 🎥 **Workshop Recording**: [Available on demand](https://aka.ms/azd-ai-workshop)
- 💬 **Discord Community**: [Join for live support](https://aka.ms/foundry/discord)
- **Workshop Feedback**: [Share your thoughts](https://aka.ms/azd-workshop-feedback)

## Workshop Timeline

### Self-Paced Learning (3 hours)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Instructor-Led Session (2.5 hours)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Success Criteria

By the end of this workshop, you will be able to:

✅ **Deploy AI applications** using AZD templates  
✅ **Configure Azure OpenAI** services securely  
✅ **Build RAG applications** with Azure AI Search integration  
✅ **Implement production patterns** for enterprise AI workloads  
✅ **Monitor and troubleshoot** AI deployments  
✅ **Optimize costs** for AI workloads  

## Community & Support

### During the Workshop

- 🙋 **Questions**: Use the workshop chat or raise your hand
- 🐛 **Issues**: Refer to the [troubleshooting guide](../docs/troubleshooting/ai-troubleshooting.md)
- **Tips**: Share insights with other participants

### After the Workshop

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Report template issues](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Feedback**: [Workshop evaluation form](https://aka.ms/azd-workshop-feedback)

## Next Steps

### Continue Learning

1. **Advanced Scenarios**: Learn about [multi-region deployments](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **CI/CD Integration**: Set up [GitHub Actions workflows](../docs/deployment/github-actions.md)
3. **Custom Templates**: Create your own [AZD templates](../docs/getting-started/custom-templates.md)

### Apply in Your Projects

1. **Assessment**: Use the [readiness checklist](./production-readiness-checklist.md)
2. **Templates**: Start with [AI-specific templates](../../../workshop/templates)
3. **Support**: Join the [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### Share Your Success

- ⭐ **Star the repository** if you found the workshop helpful
- 🐦 **Share on social media** using #AzureDeveloperCLI #AzureAI
- 📝 **Write a blog post** about your experience deploying AI applications

---

## Workshop Feedback

Your feedback helps us improve future workshops:

| Aspect | Rating (1-5) | Comments |
|--------|--------------|----------|
| Content Quality | ⭐⭐⭐⭐⭐ | |
| Hands-on Labs | ⭐⭐⭐⭐⭐ | |
| Documentation | ⭐⭐⭐⭐⭐ | |
| Difficulty Level | ⭐⭐⭐⭐⭐ | |
| Overall Experience | ⭐⭐⭐⭐⭐ | |

**Submit feedback**: [Workshop Evaluation Form](https://aka.ms/azd-workshop-feedback)

---

**Previous:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Next:** Begin with [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**Ready to start building AI applications with AZD?**

[Begin Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.