<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T22:08:57+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "en"
}
-->
# AZD Basics - Understanding Azure Developer CLI

**Previous:** [Installation & Setup](installation.md) | **Next:** [Configuration](configuration.md)

## Introduction

This lesson introduces you to Azure Developer CLI (azd), a powerful command-line tool that streamlines the process of moving from local development to Azure deployment. You'll learn the key concepts, main features, and how azd simplifies deploying cloud-native applications.

## Learning Goals

By the end of this lesson, you will:
- Understand what Azure Developer CLI is and its main purpose
- Learn the core concepts of templates, environments, and services
- Explore key features like template-driven development and Infrastructure as Code
- Understand the structure and workflow of an azd project
- Be ready to install and configure azd for your development setup

## Learning Outcomes

After completing this lesson, you will be able to:
- Explain the role of azd in modern cloud development workflows
- Identify the components of an azd project structure
- Describe how templates, environments, and services work together
- Understand the advantages of Infrastructure as Code with azd
- Recognize different azd commands and their uses

## What is Azure Developer CLI (azd)?

Azure Developer CLI (azd) is a command-line tool designed to simplify the process of building, deploying, and managing cloud-native applications on Azure. It helps developers move quickly from local development to deployment in the cloud.

## Core Concepts

### Templates
Templates are the backbone of azd. They include:
- **Application code** - Your source code and dependencies
- **Infrastructure definitions** - Azure resources defined using Bicep or Terraform
- **Configuration files** - Settings and environment variables
- **Deployment scripts** - Automated workflows for deployment

### Environments
Environments represent different deployment targets:
- **Development** - For testing and development
- **Staging** - Pre-production environment
- **Production** - Live production environment

Each environment has its own:
- Azure resource group
- Configuration settings
- Deployment state

### Services
Services are the individual components of your application:
- **Frontend** - Web applications or single-page apps
- **Backend** - APIs or microservices
- **Database** - Data storage solutions
- **Storage** - File and blob storage

## Key Features

### 1. Template-Driven Development
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure's domain-specific language for infrastructure
- **Terraform** - A tool for managing multi-cloud infrastructure
- **ARM Templates** - Azure Resource Manager templates

### 3. Integrated Workflows
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Environment Management
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Project Structure

A typical azd project structure:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Configuration Files

### azure.yaml
The main configuration file for the project:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configuration specific to each environment:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Common Workflows

### Starting a New Project
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Development Cycle
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Understanding `azd down --force --purge`
The `azd down --force --purge` command is a powerful way to completely remove your azd environment and all related resources. Here's what each flag does:
```
--force
```
- Skips confirmation prompts.
- Useful for automation or scripting where manual input isn’t practical.
- Ensures the teardown proceeds without interruptions, even if the CLI detects inconsistencies.

```
--purge
```
Deletes **all associated metadata**, including:
Environment state  
Local `.azure` folder  
Cached deployment information  

This prevents azd from "remembering" previous deployments, which can lead to issues like mismatched resource groups or outdated registry references.

### Why use both?
If you encounter issues with `azd up` due to lingering state or partial deployments, this combination ensures a **clean slate**.

It’s especially useful after manually deleting resources in the Azure portal or when switching templates, environments, or resource group naming conventions.

### Managing Multiple Environments
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigation Commands

### Discovery
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Project Management
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoring
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Best Practices

### 1. Use Meaningful Names
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Leverage Templates
- Start with existing templates
- Customize them to fit your needs
- Create reusable templates for your organization

### 3. Environment Isolation
- Use separate environments for development, staging, and production
- Avoid deploying directly to production from your local machine
- Use CI/CD pipelines for production deployments

### 4. Configuration Management
- Use environment variables for sensitive data
- Keep configuration files in version control
- Document settings specific to each environment

## Learning Progression

### Beginner (Week 1-2)
1. Install azd and authenticate
2. Deploy a simple template
3. Understand the project structure
4. Learn basic commands (up, down, deploy)

### Intermediate (Week 3-4)
1. Customize templates
2. Manage multiple environments
3. Understand infrastructure code
4. Set up CI/CD pipelines

### Advanced (Week 5+)
1. Create custom templates
2. Implement advanced infrastructure patterns
3. Deploy to multiple regions
4. Configure enterprise-grade setups

## Next Steps

- [Installation & Setup](installation.md) - Learn how to install and configure azd
- [Your First Project](first-project.md) - A hands-on tutorial
- [Configuration Guide](configuration.md) - Explore advanced configuration options

## Additional Resources

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**Previous:** [Installation & Setup](installation.md) | **Next:** [Configuration](configuration.md)
- **Next Lesson**: [Installation & Setup](installation.md)

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.