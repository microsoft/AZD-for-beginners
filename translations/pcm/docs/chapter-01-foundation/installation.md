# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dis complete guide go waka you through how to install and set up Azure Developer CLI (azd) for your system. You go learn how different method dey to install am for many operating system, how to take do authentication setup, plus how to do the first configuration to prepare your development environment to deploy for Azure.

## Learning Goals

By di time you finish this lesson, you go:
- Successfully install Azure Developer CLI for your operating system
- Configure authentication with Azure with different ways
- Set up your development environment with wetin you need
- Understand different installation options and when to use dem
- Troubleshoot common installation and setup wahala

## Learning Outcomes

After you finish this lesson, you go fit:
- Install azd with the proper method for your platform
- Authenticate with Azure using azd auth login
- Check your installation and test basic azd commands
- Configure your development environment well for better azd use
- Solve normal installation problems on your own

Dis guide go help you install and configure Azure Developer CLI for your system, no matter which operating system or development environment you get.

## Prerequisites

Before you install azd, make sure say:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** (optional) - For examples wey they run `az`; azd dey do authentication by itself
- **Git** - To clone templates and manage versions
- **Docker** (optional) - For containerized applications

**Chapter 2 Foundry GA path:** Make you use AZD **1.37.0 or later**, install am with `azd ext install microsoft.foundry`, and use Python **3.13+** plus current **uv** for the hosted-agent sample. E get code-deployment mode wey dey build remotely, so e no need local Docker build. Foundry permissions, regional model availability, plus quota still dey required; check [hosted-agent setup](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Installation Methods

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the newest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract am to `C:\Program Files\azd\`
3. Add am to your PATH environment variable

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
Download the archive wey dey for your macOS architecture from [the release assets](https://github.com/Azure/azure-dev/releases), unzip am, then add the `azd` binary to your `PATH`.

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Some Codespaces plus dev container environment don already get `azd`, but you better check am well instead of just assume:

```bash
azd version
```

If `azd` no dey, install am with the normal script for the environment.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Dis temporary container no dey keep login state between different runs. If you wan deploy many times, use the [dev container setup](dev-containers.md); container builds still need Docker daemon wey fit run inside the container.

## ✅ Verify Installation

After you install, check say azd dey work well:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Wetin you suppose see:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: The exact version number fit be different. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` show version number without errors
- [ ] `azd --help` show command documentation
- [ ] `azd template list` show templates wey dey available
- [ ] You fit create test directory and run `azd init` without wahala

**If all checks pass, you ready to continue to [Your First Project](first-project.md)!**

## Authentication Setup

### Recommended Beginner Setup

For AZD-first workflow, sign in with `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Use Azure CLI sign-in only if you plan to run `az` commands yourself during the course.

### Azure CLI Authentication (Optional)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Which Sign-In Flow Suppose You Use?

- Use `azd auth login` if you dey follow beginner AZD path and mostly dey run `azd` commands.
- Use `az login` too when you wan run Azure CLI commands like `az account show` or inspect resources direct.
- If exercise get both `azd` and `az` commands, run both sign-in commands one time at beginning.

### Device Code Authentication
If you dey use headless system or get browser wahala:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automated environment dem:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validate Your Complete Setup

If you want quick readiness check before you start Chapter 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Configuration

### Global Configuration
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Environment Variables
Add them to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
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
1. Install the Azure plugin
2. Configure your Azure credentials
3. Use integrated terminal for azd commands

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
Add azd manually to your PATH:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Version Conflicts
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Getting More Help
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Updating azd

### Update Check
azd go shout wen newer release dey, and you fit check your current build with:
```bash
azd version
```

### Manual Updates

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: Tool wey dey low level for managing each Azure resources
- `az webapp create`, `az storage account create`
- One resource at one time
- Focus dey for infrastructure management

**Azure Developer CLI (azd)**: High level tool to deploy complete app
- `azd up` dey deploy whole app with all resources
- Template-based workflows
- Developer productivity focus

**Dem dey independent**: azd use im own authentication by default. Install and sign in Azure CLI only if you wan run `az` commands, or you fit choose to use `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Fit I use azd with Azure resources wey don already dey?</strong></summary>

Yes! You fit:
1. Import existing resources into azd environments
2. Reference existing resources for your Bicep templates
3. Use azd for new deployments with the existing infrastructure join

See [Configuration Guide](../chapter-03-configuration/configuration.md) for more info.
</details>

<details>
<summary><strong>Azd dey work with Azure Government or Azure China?</strong></summary>

Yes, configure the cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

If you dey use Azure CLI too, configure `az cloud set --name ...` separately. Template services and model availability dey change depending on cloud.
</details>

<details>
<summary><strong>Fit I use azd for CI/CD pipelines?</strong></summary>

Sure! azd dey designed for automation:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>How much e go cost to use azd?</strong></summary>

azd na **completely free** and open-source. You go only pay for:
- Azure resources wey you deploy
- Azure consumption charges (compute, storage, etc.)

Use `azd provision --preview` to check proposed resources, then estimate their costs with the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Preview no dey calculate prices.
</details>

## Next Steps

1. **Finish authentication**: Make sure say you fit access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you get any wahala:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Get Azure command help direct for your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Go continue to [Your First Project](first-project.md) to start to build with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->