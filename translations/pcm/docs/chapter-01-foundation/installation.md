# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

This comprehensive guide go waka you through how to install and configure Azure Developer CLI (azd) for your system. You go learn different ways to install for different operating systems, how to do authentication, and initial setup to ready your dev environment for Azure deployments.

## Learning Goals

By the end of this lesson, you go:
- Successfully install Azure Developer CLI for your operating system
- Configure authentication with Azure using different methods
- Set up your development environment with the required prerequisites
- Understand different installation options and when make you use each
- Troubleshoot common installation and setup wahala

## Learning Outcomes

After you finish this lesson, you go fit:
- Install azd using the right method for your platform
- Authenticate with Azure using azd auth login
- Verify say installation dey correct and test basic azd commands
- Configure your development environment to use azd well
- Solve common installation problems by yourself

This guide go help you install and configure Azure Developer CLI on your system, no matter which OS or development environment you dey use.

## Prerequisites

Before you install azd, make sure say you get:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - For authentication and resource management
- **Git** - For cloning templates and version control
- **Docker** (optional) - For containerized applications

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Make you run am as Administrator or with higher permissions.
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
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
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
# Download, den install
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
# Add Microsoft pakej repo
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Make we add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd don dey pre-installed for GitHub Codespaces. Just create codespace and start to use azd sharp sharp.

### Docker

```bash
# Make azd run inside one container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Make an alias so e go easy to use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After you install am, make you verify say azd dey work:

```bash
# Check di version
azd version

# See di help
azd --help

# List di templates wey dey available
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: The actual version number go different. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` show version number without errors
- [ ] `azd --help` display command documentation
- [ ] `azd template list` show available templates
- [ ] `az account show` display your Azure subscription
- [ ] You fit create test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Install Azure CLI if e no don install
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login go Azure
az login

# Make sure say authentication correct
az account show
```

### Device Code Authentication
If you dey use headless system or browser no cooperate:
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
# Make subscription di default
azd config set defaults.subscription <subscription-id>

# Make location di default
azd config set defaults.location eastus2

# See all di configuration
azd config list
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure konfigureshon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd konfigureshon
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Make debug logging dey
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
# Make you open PowerShell as Admin
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

# Skip SSL verification (no dey recommend am for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Comot di old installation dem
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean di configuration
rm -rf ~/.azd
```

### Getting More Help
```bash
# Make debug logging dey
export AZD_DEBUG=true
azd <command> --debug

# See di configuration wey dey now
azd config list

# See di deployment status wey dey now
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
<summary><strong>Wetin be the difference between azd and az CLI?</strong></summary>

**Azure CLI (az)**: Na low-level tool for managing individual Azure resources
- `az webapp create`, `az storage account create`
- One resource at a time
- Infrastructure management focus

**Azure Developer CLI (azd)**: Na high-level tool wey dey handle whole application deployments
- `azd up` dey deploy entire app with all resources
- Template-based workflows
- Developer productivity focus

**You need both**: azd dey use az CLI for authentication
</details>

<details>
<summary><strong>Fit I use azd with resources wey don already dey my Azure?</strong></summary>

Yes o! You fit:
1. Import existing resources into azd environments
2. Reference existing resources for your Bicep templates
3. Use azd for new deployments side-by-side with your existing infrastructure

See [Configuration Guide](configuration.md) for more details.
</details>

<details>
<summary><strong>Azd dey work with Azure Government or Azure China?</strong></summary>

Yes, just configure the cloud:
```bash
# Azure for di government
az cloud set --name AzureUSGovernment
az login

# Azure for China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Fit I use azd for CI/CD pipelines?</strong></summary>

Sure! azd design make automation easy:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>How much e go cost to use azd?</strong></summary>

azd self na **completely free** and open-source. You go only pay for:
- Azure resources wey you deploy
- Azure consumption costs (compute, storage, and so on)

Use `azd provision --preview` to estimate costs before you deploy.
</details>

## Next Steps

1. **Complete authentication**: Make sure say you fit access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you jam any wahala:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Get Azure command guidance direct for your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start to build with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Make una sabi:
Dis document dem don translate wit AI translation service wey dem dey call Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, make una sabi say machine translation fit get mistakes or no correct finish. The original document for im original language na im be the real/authoritative source. If na important matter, make una use professional human translator. We no go responsible for any misunderstanding or wrong meaning wey fit come from this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->