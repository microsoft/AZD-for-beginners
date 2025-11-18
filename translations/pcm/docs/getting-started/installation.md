<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-11-18T19:24:20+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "pcm"
}
-->
# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

## Introduction

Dis guide go show you how to install and set up Azure Developer CLI (azd) for your system. You go learn different ways to install am for different operating systems, how to set up authentication, and how to configure your development environment for Azure deployment.

## Learning Goals

By di end of dis lesson, you go:
- Fit install Azure Developer CLI for your operating system
- Set up authentication with Azure using different methods
- Prepare your development environment with di things wey you need
- Understand di different installation options and when to use dem
- Solve common installation and setup wahala

## Learning Outcomes

After you finish dis lesson, you go sabi:
- Install azd di correct way for your platform
- Authenticate with Azure using azd auth login
- Confirm say di installation dey work and test basic azd commands
- Configure your development environment to make azd work well
- Solve common installation wahala by yourself

Dis guide go help you install and set up Azure Developer CLI for your system, no matter di operating system or development environment wey you dey use.

## Prerequisites

Before you install azd, make sure say you get:
- **Azure subscription** - [Create free account](https://azure.microsoft.com/free/)
- **Azure CLI** - For authentication and resource management
- **Git** - For cloning templates and version control
- **Docker** (optional) - For containerized applications

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download di latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract am go `C:\Program Files\azd\`
3. Add am to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd don already dey inside GitHub Codespaces. Just create codespace and start to use azd straight away.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After you don install am, confirm say azd dey work well:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Expected output:
```
azd version 1.5.0 (commit abc123)
```

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Device Code Authentication
If you dey use headless system or browser dey give wahala:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Environment Variables
Add am to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE Integration

### Visual Studio Code
Install di Azure Developer CLI extension:
1. Open VS Code
2. Go Extensions (Ctrl+Shift+X)
3. Search "Azure Developer CLI"
4. Install di extension

Features:
- IntelliSense for azure.yaml
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
Create `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Install di Azure plugin
2. Configure Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Manually add azd to your PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Network/Proxy Issues
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Getting More Help
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Updating azd

### Automatic Updates
azd go notify you when update dey:
```bash
azd version --check-for-updates
```

### Manual Updates

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## Next Steps

1. **Complete authentication**: Make sure say you fit access your Azure subscription
2. **Try your first deployment**: Follow di [First Project Guide](first-project.md)
3. **Explore templates**: Browse di templates wey dey available with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you get wahala:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start to build with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transleshion service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transleshion. Even as we dey try make am accurate, abeg make you sabi say automatik transleshion fit get mistake or no dey correct well. Di original dokyument for im native language na di one wey you go take as di main source. For important mata, e good make you use professional human transleshion. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transleshion.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->