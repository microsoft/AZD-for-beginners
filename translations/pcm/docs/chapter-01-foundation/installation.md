# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dis complete guide go show you how to install an configure Azure Developer CLI (azd) for your system. You go learn different ways to install for various operating systems, how to set up authentication, an di initial configuration to ready your development environment for Azure deployments.

## Learning Goals

By di end of dis lesson, you go:
- Successfully install Azure Developer CLI on your operating system
- Configure authentication with Azure using multiple methods
- Set up your development environment with di necessary prerequisites
- Understand different installation options an when to use each one
- Troubleshoot common installation an setup wahalas

## Learning Outcomes

After you finish dis lesson, you go fit:
- Install azd using di correct method for your platform
- Authenticate with Azure using azd auth login
- Verify your installation an test basic azd commands
- Configure your development environment for better azd usage
- Solve common installation problems on your own

Dis guide go help you install an configure Azure Developer CLI on your system, no matter which operating system or development environment you dey use.

## Prerequisites

Before you install azd, make sure say you get:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - For authentication an resource management
- **Git** - For cloning templates an version control
- **Docker** (optional) - For containerized applications

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Run am as Administrator or wit higher privileges
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
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

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
# Download am, den install am
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
# Add di Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install di azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Put di Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd dey pre-installed for GitHub Codespaces. Just create codespace an start to use azd straight away.

### Docker

```bash
# Make azd run inside one container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Make one alias so e go easy to use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After you install am, check say azd dey work correct:

```bash
# Check di version
azd version

# View di help
azd --help

# List di templates wey dey available
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: Di actual version number fit different. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for di latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] `az account show` displays your Azure subscription
- [ ] You fit create small test directory an run `azd init` successfully

**If all checks pass, you ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Install Azure CLI if e never dey installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Make you login to Azure
az login

# Confirm say authentication correct
az account show
```

### Device Code Authentication
If you dey on headless system or browser dey cause wahala:
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
# Set di default subscription
azd config set defaults.subscription <subscription-id>

# Set di default location
azd config set defaults.location eastus2

# See all di configuration
azd config list
```

### Environment Variables
Add am to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure setup
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd setup
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Make debug logging dey on
```

## IDE Integration

### Visual Studio Code
Install the Azure Developer CLI extension:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Azure Developer CLI"
4. Install the extension

Features:
- IntelliSense for azure.yaml
- Integrated terminal commands
- Template browsing
- Deployment monitoring

### GitHub Codespaces
Create a `.devcontainer/devcontainer.json`:
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
1. Install the Azure plugin
2. Configure Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Make sure say you run PowerShell as Administrator
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
# Set up di proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# No dey verify SSL (we no recommend am for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Comot di old installation dem
# Windows: run dis command: winget uninstall Microsoft.Azd
# macOS: run dis command: brew uninstall azd
# Linux: run dis command: sudo apt remove azd

# Clean up di configuration
rm -rf ~/.azd
```

### Getting More Help
```bash
# Make debug logging dey
export AZD_DEBUG=true
azd <command> --debug

# See di current configuration
azd config list

# See di current deployment status
azd show
```

## Updating azd

### Automatic Updates
azd go notify you when updates dey:
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

**Azure CLI (az)**: Na low-level tool wey you use to manage individual Azure resources
- `az webapp create`, `az storage account create`
- One resource at a time
- Infrastructure management focus

**Azure Developer CLI (azd)**: Na high-level tool for whole application deployments
- `azd up` go deploy di whole app with all resources
- Template-based workflows
- Developer productivity focus

**You need both**: azd dey use az CLI for authentication
</details>

<details>
<summary><strong>I fit use azd with existing Azure resources?</strong></summary>

Yes! You fit:
1. Import existing resources into azd environments
2. Reference existing resources for your Bicep templates
3. Use azd for new deployments side-by-side with existing infrastructure

See [Configuration Guide](configuration.md) for more details.
</details>

<details>
<summary><strong>Azdi dey work with Azure Government or Azure China?</strong></summary>

Yes, just configure di cloud:
```bash
# Azure Gavment
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>I fit use azd for CI/CD pipelines?</strong></summary>

Sure! azd design make automation easy:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>How much e go cost to use azd?</strong></summary>

azd self na **completely free** an open-source. Di only things wey you go pay for na:
- Azure resources wey you deploy
- Azure consumption costs (compute, storage, etc.)

Use `azd provision --preview` to estimate costs before deployment.
</details>

## Next Steps

1. **Complete authentication**: Make sure say you fit access your Azure subscription
2. **Try your first deployment**: Follow di [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you meet wahala:
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
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis document don translate wit AI translation service (Co-op Translator: https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automated translation fit get errors or mistakes. Make una consider di original document wey dey for im original language as di authoritative source. If na important information, you suppose use professional human translator. We no dey liable for any misunderstanding or wrong interpretation wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->