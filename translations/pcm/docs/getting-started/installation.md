<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-24T13:54:47+00:00",
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
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Dis guide go show you how you fit install and configure Azure Developer CLI (azd) for your system. You go learn different ways to install am for different operating systems, set up authentication, and do initial configuration to prepare your development environment for Azure deployments.

## Learning Goals

By di end of dis lesson, you go:
- Fit install Azure Developer CLI for your operating system
- Configure authentication with Azure using different methods
- Set up your development environment with di things wey you need
- Understand di different installation options and when you go use dem
- Solve common installation and setup wahala

## Learning Outcomes

After you finish dis lesson, you go sabi:
- Install azd using di correct method for your platform
- Authenticate with Azure using azd auth login
- Confirm say di installation dey work and test basic azd commands
- Configure your development environment to make azd work well
- Solve common installation problems by yourself

Dis guide go help you install and configure Azure Developer CLI for your system, no matter di operating system or development environment wey you dey use.

## Prerequisites

Before you install azd, make sure say you get:
- **Azure subscription** - [Create free account](https://azure.microsoft.com/free/)
- **Azure CLI** - To help with authentication and resource management
- **Git** - To clone templates and manage versions
- **Docker** (optional) - For containerized applications

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Run am as Administrator or wit beta privileges
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
# Download am and install am
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
# Run azd inside container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create alias make am easy to use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After you don install am, confirm say azd dey work well:

```bash
# Check version
azd version

# See help
azd --help

# Show templates wey dey
azd template list
```

Expected output:
```
azd version 1.5.0 (commit abc123)
```

**✅ Installation Success Checklist:**
- [ ] `azd version` go show version number without error
- [ ] `azd --help` go show command documentation
- [ ] `azd template list` go show di templates wey dey available
- [ ] `az account show` go show your Azure subscription
- [ ] You fit create test directory and run `azd init` without wahala

**If everything dey okay, you fit move go [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Install Azure CLI if e never dey already
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login for Azure
az login

# Check say authentication don work
az account show
```

### Device Code Authentication
If you dey use system wey no get head or browser dey give wahala:
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

# See all configuration
azd config list
```

### Environment Variables
Add am to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfigureshun
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfigureshun
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Make debug log dey work
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
3. Use di integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Admin
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
# Set proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# No check SSL (e no good for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Comot old install wey dey
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean config wey dey
rm -rf ~/.azd
```

### Getting More Help
```bash
# Make debug logging dey work
export AZD_DEBUG=true
azd <command> --debug

# See logs wey get plenty detail
azd logs

# Check system info
azd info
```

## Updating azd

### Automatic Updates
azd go notify you when update dey available:
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

## 💡 Frequently Asked Questions

<details>
<summary><strong>Wetin be di difference between azd and az CLI?</strong></summary>

**Azure CLI (az)**: Na low-level tool to manage individual Azure resources
- `az webapp create`, `az storage account create`
- One resource at a time
- Focus on infrastructure management

**Azure Developer CLI (azd)**: Na high-level tool to deploy complete application
- `azd up` go deploy di whole app with all di resources
- Template-based workflows
- Focus on developer productivity

**You need both**: azd dey use az CLI for authentication
</details>

<details>
<summary><strong>Fit I use azd with di Azure resources wey I don already get?</strong></summary>

Yes! You fit:
1. Import di resources wey you don already get into azd environments
2. Reference di resources wey you don already get for your Bicep templates
3. Use azd for new deployments alongside di infrastructure wey you don already get

Check [Configuration Guide](configuration.md) for more details.
</details>

<details>
<summary><strong>azd dey work with Azure Government or Azure China?</strong></summary>

Yes, configure di cloud:
```bash
# Azure Goment
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Fit I use azd for CI/CD pipelines?</strong></summary>

Of course! azd dey designed for automation:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

Check [Deployment Guide](../deployment/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>Wetin be di cost to use azd?</strong></summary>

azd itself na **completely free** and open-source. You go only pay for:
- Di Azure resources wey you deploy
- Di Azure consumption costs (compute, storage, etc.)

Use `azd provision --preview` to estimate costs before deployment.
</details>

## Next Steps

1. **Complete authentication**: Make sure say you fit access your Azure subscription
2. **Try your first deployment**: Follow di [First Project Guide](first-project.md)
3. **Explore templates**: Check di templates wey dey available with `azd template list`
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
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installation Complete!** Move go [Your First Project](first-project.md) to start to build with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI translet service [Co-op Translator](https://github.com/Azure/co-op-translator) do di translet. Even though we dey try make am accurate, abeg make you sabi say AI translet fit get mistake or no correct well. Di original dokyument wey dey for im native language na di one wey you go take as di correct source. For important informate, e good make you use professional human translet. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->