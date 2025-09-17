# AZD for AI Developers Workshop

**Workshop Navigation**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Related Chapters**: Covers [Chapter 1](../README.md#-chapter-1-foundation--quick-start), [Chapter 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), and [Chapter 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Hands-On Lab**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Next Steps**: [Workshop Lab Modules](#workshop-modules)

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop is designed to take you from AZD basics to deploying production-ready AI solutions.

## Workshop Overview

**Duration:** 2-3 hours  
**Level:** Beginner to Intermediate  
**Prerequisites:** Basic knowledge of Azure, command line tools, and AI concepts

### What You'll Learn

- **AZD Fundamentals**: Understanding Infrastructure as Code with AZD
- 🤖 **AI Service Integration**: Deploying Azure OpenAI, AI Search, and other AI services
- **Container Deployment**: Using Azure Container Apps for AI applications
- **Security Best Practices**: Implementing Managed Identity and secure configurations
- **Monitoring & Observability**: Setting up Application Insights for AI workloads
- **Production Patterns**: Enterprise-ready deployment strategies

## Workshop Structure

### Module 1: AZD Foundations (30 minutes)
- Installing and configuring AZD
- Understanding AZD project structure
- Your first AZD deployment
- **Lab**: Deploy a simple web application

### Module 2: Azure OpenAI Integration (45 minutes)
- Setting up Azure OpenAI resources
- Model deployment strategies
- Configuring API access and authentication
- **Lab**: Deploy a chat application with GPT-4

### Module 3: RAG Applications (45 minutes)
- Azure AI Search integration
- Document processing with Azure Document Intelligence
- Vector embeddings and semantic search
- **Lab**: Build a document Q&A system

### Module 4: Production Deployment (30 minutes)
- Container Apps configuration
- Scaling and performance optimization
- Monitoring and logging
- **Lab**: Deploy to production with observability

### Module 5: Advanced Patterns (15 minutes)
- Multi-environment deployments
- CI/CD integration
- Cost optimization strategies
- **Wrap-up**: Production readiness checklist

## Prerequisites

### Required Tools

Please install these tools before the workshop:

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
   - Contributor role on subscription or resource group
   - User Access Administrator (for RBAC assignments)

### Verify Prerequisites

Run this script to verify your setup:

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

- **[lab-1-azd-basics/](./lab-1-azd-basics/)** - Your first AZD deployment
- **[lab-2-openai-chat/](./lab-2-openai-chat/)** - Chat application with Azure OpenAI
- **[lab-3-rag-search/](./lab-3-rag-search/)** - RAG application with AI Search
- **[lab-4-production/](./lab-4-production/)** - Production deployment patterns
- **[lab-5-advanced/](./lab-5-advanced/)** - Advanced deployment scenarios

### Reference Materials

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Comprehensive integration patterns
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Model deployment best practices
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - Enterprise deployment patterns
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - Common issues and solutions

### Sample Templates

Quick-start templates for common AI scenarios:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Getting Started

### Option 1: GitHub Codespaces (Recommended)

The fastest way to start the workshop:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Option 2: Local Development

1. **Clone the workshop repository:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Login to Azure:**
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

If you're attending an instructor-led session:

- 🎥 **Workshop Recording**: [Available on demand](https://aka.ms/azd-ai-workshop)
- 💬 **Discord Community**: [Join for live support](https://aka.ms/foundry/discord)
- **Workshop Feedback**: [Share your experience](https://aka.ms/azd-workshop-feedback)

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
✅ **Configure Azure OpenAI** services with proper security  
✅ **Build RAG applications** with Azure AI Search integration  
✅ **Implement production patterns** for enterprise AI workloads  
✅ **Monitor and troubleshoot** AI application deployments  
✅ **Apply cost optimization** strategies for AI workloads  

## Community & Support

### During the Workshop

- 🙋 **Questions**: Use workshop chat or raise your hand
- 🐛 **Issues**: Check the [troubleshooting guide](../docs/troubleshooting/ai-troubleshooting.md)
- **Tips**: Share discoveries with other participants

### After the Workshop

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Report template issues](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Feedback**: [Workshop evaluation form](https://aka.ms/azd-workshop-feedback)

## Next Steps

### Continue Learning

1. **Advanced Scenarios**: Explore [multi-region deployments](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **CI/CD Integration**: Set up [GitHub Actions workflows](../docs/deployment/github-actions.md)
3. **Custom Templates**: Create your own [AZD templates](../docs/getting-started/custom-templates.md)

### Apply in Your Projects

1. **Assessment**: Use our [readiness checklist](./production-readiness-checklist.md)
2. **Templates**: Start with our [AI-specific templates](./templates/)
3. **Support**: Join the [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### Share Your Success

- ⭐ **Star the repository** if this workshop helped you
- 🐦 **Share on social media** with #AzureDeveloperCLI #AzureAI
- 📝 **Write a blog post** about your AI deployment journey

---

## Workshop Feedback

Your feedback helps us improve the workshop experience:

| Aspect | Rating (1-5) | Comments |
|--------|--------------|----------|
| Content Quality | ⭐⭐⭐⭐⭐ | |
| Hands-on Labs | ⭐⭐⭐⭐⭐ | |
| Documentation | ⭐⭐⭐⭐⭐ | |
| Difficulty Level | ⭐⭐⭐⭐⭐ | |
| Overall Experience | ⭐⭐⭐⭐⭐ | |

**Submit feedback**: [Workshop Evaluation Form](https://aka.ms/azd-workshop-feedback)

---

**Previous:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Next:** Begin with [Lab 1: AZD Basics](./lab-1-azd-basics/)

**Ready to start building AI applications with AZD?**

[Begin Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)