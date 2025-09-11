# AZD For Beginners

![AZD-for-beginners](./images/azdbeginners.png) 


[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Follow these steps to get started using these resources:
1. **Fork the Repository**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone the Repository**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Join The Azure Discord Communities and meet experts and fellow developers**](https://discord.com/invite/ByRwuEEgH4)


### 🌐 Multi-Language Support

#### Supported via GitHub Action (Automated & Always Up-to-Date)

[French](./translations/fr/README.md) | [Spanish](./translations/es/README.md) | [German](./translations/de/README.md) | [Russian](./translations/ru/README.md) | [Arabic](./translations/ar/README.md) | [Persian (Farsi)](./translations/fa/README.md) | [Urdu](./translations/ur/README.md) | [Chinese (Simplified)](./translations/zh/README.md) | [Chinese (Traditional, Macau)](./translations/mo/README.md) | [Chinese (Traditional, Hong Kong)](./translations/hk/README.md) | [Chinese (Traditional, Taiwan)](./translations/tw/README.md) | [Japanese](./translations/ja/README.md) | [Korean](./translations/ko/README.md) | [Hindi](./translations/hi/README.md) | [Bengali](./translations/bn/README.md) | [Marathi](./translations/mr/README.md) | [Nepali](./translations/ne/README.md) | [Punjabi (Gurmukhi)](./translations/pa/README.md) | [Portuguese (Portugal)](./translations/pt/README.md) | [Portuguese (Brazil)](./translations/br/README.md) | [Italian](./translations/it/README.md) | [Polish](./translations/pl/README.md) | [Turkish](./translations/tr/README.md) | [Greek](./translations/el/README.md) | [Thai](./translations/th/README.md) | [Swedish](./translations/sv/README.md) | [Danish](./translations/da/README.md) | [Norwegian](./translations/no/README.md) | [Finnish](./translations/fi/README.md) | [Dutch](./translations/nl/README.md) | [Hebrew](./translations/he/README.md) | [Vietnamese](./translations/vi/README.md) | [Indonesian](./translations/id/README.md) | [Malay](./translations/ms/README.md) | [Tagalog (Filipino)](./translations/tl/README.md) | [Swahili](./translations/sw/README.md) | [Hungarian](./translations/hu/README.md) | [Czech](./translations/cs/README.md) | [Slovak](./translations/sk/README.md) | [Romanian](./translations/ro/README.md) | [Bulgarian](./translations/bg/README.md) | [Serbian (Cyrillic)](./translations/sr/README.md) | [Croatian](./translations/hr/README.md) | [Slovenian](./translations/sl/README.md) | [Ukrainian](./translations/uk/README.md) | [Burmese (Myanmar)](./translations/my/README.md)

**If you wish to have additional translations languages supported are listed [here](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**


## Introduction

Welcome to the comprehensive guide for Azure Developer CLI (azd). This repository is designed to help developers at all levels from students to professional developers learn and master Azure Developer CLI for efficient cloud deployments. This structured learning resource provides hands-on experience with Azure cloud deployments, troubleshooting common issues, and implementing best practices for successful AZD template deployments.

## Learning Goals

By working through this repository, you will:
- Master Azure Developer CLI fundamentals and core concepts
- Learn to deploy and provision Azure resources using Infrastructure as Code
- Develop troubleshooting skills for common AZD deployment issues
- Understand pre-deployment validation and capacity planning
- Implement security best practices and cost optimization strategies
- Build confidence in deploying production-ready applications to Azure

## Learning Outcomes

After completing this course, you will be able to:
- Successfully install, configure, and use Azure Developer CLI
- Create and deploy applications using AZD templates
- Troubleshoot authentication, infrastructure, and deployment problems
- Perform pre-deployment checks including capacity planning and SKU selection
- Implement monitoring, security, and cost management best practices
- Integrate AZD workflows into CI/CD pipelines

## Table of Contents

- [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- [Quick Start](#quick-start)
- [Documentation](#documentation)
- [Examples & Templates](#examples--templates)
- [Resources](#resources)
- [Contributing](#contributing)

## What is Azure Developer CLI?

Azure Developer CLI (azd) is a developer-centric command-line interface that accelerates the process of building and deploying applications to Azure. It provides:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

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

### Troubleshooting
- [**Common Issues**](docs/troubleshooting/common-issues.md) - Frequently encountered problems and solutions
- [**Debugging Guide**](docs/troubleshooting/debugging.md) - Step-by-step debugging strategies

## Examples & Templates
- [**Examples**]([examples/README.md) - Practical examples, templates, and real-world scenarios to help you learn Azure Developer CLI through hands-on practice. Each example provides complete working code, infrastructure templates, and detailed instructions for different application architectures and deployment patterns.

### Hands On Lab/Workshop
- [**AZD For Beginners**](workshop/README.md) - This workshop will focus on the Get Started with AI Agents AZD template and provide hands on best practice for deployment of Azure AI services using AZD

## Resources

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands
- [**Glossary**](resources/glossary.md) - Azure and azd terminology
- [**FAQ**](resources/faq.md) - Frequently asked questions
- [**Study Guide**](resources/study-guide.md) - Comprehensive learning objectives and practice exercises

### External Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Learning Path

### For Students & Beginners
1. Start with [AZD Basics](docs/getting-started/azd-basics.md)
2. Follow the [Installation Guide](docs/getting-started/installation.md)
3. Complete [Your First Project](docs/getting-started/first-project.md)
4. Practice with [Simple Web App Example](examples/simple-web-app/)

### For Developers
1. Review [Configuration Guide](docs/getting-started/configuration.md)
2. Study [Deployment Guide](docs/deployment/deployment-guide.md)
3. Work through [Database App Example](examples/database-app/)
4. Explore [Container App Example](examples/container-app/)

### For DevOps Engineers
1. Master [Provisioning Resources](docs/deployment/provisioning.md)
2. Implement [Pre-flight Checks](docs/pre-deployment/preflight-checks.md)
3. Practice [Capacity Planning](docs/pre-deployment/capacity-planning.md)
4. Advanced [Microservices Example](examples/microservices/)

## Contributing

We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) for details on:
- How to submit issues and feature requests
- Code contribution guidelines
- Documentation improvements
- Community standards

## Support

- **Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Discussions**: [Microsoft Azure Discord Community Q&A and discussions](https://discord.gg/microsoft-azure)
- **Email**: For private inquiries
- **Microsoft Learn**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🎒 Other Courses

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


