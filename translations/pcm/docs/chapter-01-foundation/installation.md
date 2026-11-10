# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dis full guide go waka you through how to install and configure Azure Developer CLI (azd) for your system. You go learn different ways to install for different operating systems, how to set authentication, and how to configure am first to prepare your development environment for Azure deployments.

## Learning Goals

By di time dis lesson finish, you go fit:
- Successfully install Azure Developer CLI for your operating system
- Configure authentication with Azure using plenty methods
- Set up your development environment with the things wey you need first
- Understand different installation options and when you suppose use each one
- Troubleshoot common installation and setup wahala dem

## Learning Outcomes

After you don complete dis lesson, you go sabi how to:
- Install azd using the correct method wey suit your platform
- Authenticate with Azure by yan azd auth login
- Check say your installation dey correct and run some basic azd commands
- Arrange your development environment well well for better azd use
- Solve common installation palava by yourself

Dis guide go help you setup and configure Azure Developer CLI for your system, no matter which operating system or development environment you dey use.

## Prerequisites

Before you start to install azd, make sure say you get:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** (optional) - For examples wey run `az` well well; azd fit authenticate regardless
- **Git** - To clone templates and manage version control
- **Docker** (optional) - For containerized applications

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
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
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
Download the archive for your macOS system from [the release assets](https://github.com/Azure/azure-dev/releases), extract am, and add the `azd` binary to your `PATH`.

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

Some Codespaces and dev container environments don already get `azd`, but you suppose check am yourself before you just assume say e dey:

```bash
azd version
```

If `azd` no dey, install am with the standard script wey dem use for the environment.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Dis temporary container no dey keep login state between runs. If you want to deploy many times, use the [dev container setup](dev-containers.md); container builds need Docker daemon wey dey inside the container.

## ✅ Verify Installation

After you install am, make sure say azd dey work correct:

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

**Note**: The real version number go fit change. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` show version number without any error
- [ ] `azd --help` display command documentation
- [ ] `azd template list` show available templates
- [ ] You fit create test directory and run `azd init` well

**If all checks pass, you ready to waka go [Your First Project](first-project.md)!**

## Authentication Setup

### Recommended Beginner Setup

For AZD-first workflows, just sign in with `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Use Azure CLI sign-in only if you plan to run `az` commands yourself during di course.

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

### Which Sign-In Flow Should You Use?

- Use `azd auth login` if you dey follow beginner AZD path and mainly run `azd` commands.
- Use `az login` also if you want run Azure CLI commands like `az account show` or dey check resources direct.
- If exercise get both `azd` and `az` commands, run both sign-in commands once for the start.

### Device Code Authentication
If your system no get browser or e get browser wahala:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automated environment:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validate Your Complete Setup

If you wan quick check say everything ready before you start Chapter 1:

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
Add am to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## IDE Integration

### Visual Studio Code
Install Azure Developer CLI extension:
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search "Azure Developer CLI"
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
1. Install Azure plugin
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
azd go talk you if new release dey, you fit check your current build with:
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
<summary><strong>Wetyn be di diff between azd and az CLI?</strong></summary>

**Azure CLI (az)**: Na low-level tool to manage individual Azure resources
- `az webapp create`, `az storage account create`
- Manage one resource at a time
- Focus na infrastructure management

**Azure Developer CLI (azd)**: Na high-level tool wey dem use to deploy whole application
- `azd up` dey deploy full app plus all resources
- Template based workflow
- Focus na developer productivity

**Dem independent**: azd get im own authentication by default. You go need to install and sign in Azure CLI only if you want run `az` commands or explicitly want use `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>I fit use azd with di Azure resources wey I get before?</strong></summary>

Yes! You fit:
1. Import your existing resources inside azd environments
2. Refer your existing resources for your Bicep templates
3. Use azd for new deployments side by side with the infrastructure wey you get

Check the [Configuration Guide](../chapter-03-configuration/configuration.md) for more info.
</details>

<details>
<summary><strong>AzD dey work for Azure Government or Azure China?</strong></summary>

Yes, you fit set the cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

If you dey use Azure CLI too, you need configure `az cloud set --name ...` separately. Template services and model availability differ by cloud.
</details>

<details>
<summary><strong>I fit use azd for CI/CD pipelines?</strong></summary>

Sure! azd na tool wey dem make for automation:
- E get GitHub Actions integration
- Azure DevOps support
- E get service principal authentication
- Non-interactive mode

Check [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>How much e go cost to use azd?</strong></summary>

azd na **completely free** and open-source. You go only pay for:
- Azure resources wey you deploy
- Azure consumption costs (like compute, storage, and others)

Use `azd provision --preview` to see the resources wey you go use, then check dia price with [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Preview no sabi calculate price.
</details>

## Next Steps

1. **Complete authentication**: Make sure say you fit enter your Azure subscription
2. **Try your first deployment**: Follow di [First Project Guide](first-project.md)
3. **Explore templates**: Browse templates wey dey available with `azd template list`
4. **Configure your IDE**: Arrange your development environment

## Support

If you get any problem:
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

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->