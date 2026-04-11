# How to Install & Set Up

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dis full guide go carry you step-by-step to install and configure Azure Developer CLI (azd) for your system. You go learn different ways to install for different operating systems, how to set up authentication, and how to do the first configuration to make your development environment ready for Azure deployments.

## Learning Goals

By the end of dis lesson, you go:
- Fit install Azure Developer CLI for your operating system
- Configure authentication with Azure using different methods
- Set up your development environment with wetin you need
- Understand different installation options and when to use each one
- Troubleshoot common installation and setup wahalas

## Learning Outcomes

After you finish dis lesson, you go sabi:
- Install azd using the correct method for your platform
- Authenticate with Azure using azd auth login
- Verify say your installation correct and test basic azd commands
- Configure your development environment to use azd well
- Solve common installation problems by yourself

Dis guide go help you install and configure Azure Developer CLI on your system, no matter which operating system or development environment you dey use.

## Prerequisites

Before you install azd, make sure say you get:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - For authentication and resource management
- **Git** - For cloning templates and version control
- **Docker** (optional) - For containerized applications

## Installation Methods

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# E dey useful when winget no dey available
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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
# Download an install am
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# Download di latest archive wey match your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract am and put di azd binary for your PATH.
```

### GitHub Codespaces

Some Codespaces and dev container environments don already include `azd`, but you suppose check first make you no assume:

```bash
azd version
```

If `azd` dey missing, install am with the standard script for the environment.

### Docker

```bash
# Make azd run inside one container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Make one alias so e go easy to use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After you install, check say azd dey work fine:

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

**Note**: The real version number fit change. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] You fit create a test directory and run `azd init` successfully

**If all checks pass, you ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Recommended Beginner Setup

For AZD-first workflows, sign in with `azd auth login`.

```bash
# E necessary for AZD commands like azd up
azd auth login

# Make sure say AZD don authenticate
azd auth login --check-status
```

Use Azure CLI sign-in only when you go run `az` commands yourself during the course.

### Azure CLI Authentication (Optional)
```bash
# Install Azure CLI if e never don install
# Windows: run dis command - winget install Microsoft.AzureCLI
# macOS: run dis command - brew install azure-cli
# Linux: check di Azure CLI install docs wey match your distribution

# Login go Azure
az login

# Make sure say authentication correct
az account show
```

### Which Sign-In Flow Should You Use?

- Use `azd auth login` if you dey follow the beginner AZD path and you dey mainly run `azd` commands.
- Use `az login` too when you wan run Azure CLI commands like `az account show` or inspect resources directly.
- If exercise get both `azd` and `az` commands, run both sign-in commands one time at the start.

### Device Code Authentication
If you dey on headless system or your browser dey give you wahala:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
For automated environments:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Validate Your Complete Setup

If you want quick check before you start Chapter 1:

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
# Put di subscription wey go be default
azd config set defaults.subscription <subscription-id>

# Put di location wey go be default
azd config set defaults.location eastus2

# See all di configuration dem
azd config show
```

### Environment Variables
Add am to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
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
# Make you run PowerShell as Administrator
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
# Set di proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# No verify SSL (no dey recommend for production)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Comot di old installations
# Windows: use winget uninstall microsoft.azd
# macOS: use brew uninstall azd
# Linux: comot di previous azd binary or symlink bifo you reinstall am

# Clean di configuration
rm -rf ~/.azd
```

### Getting More Help
```bash
# Make debug logging dey on
export AZD_DEBUG=true
azd <command> --debug

# See di current configuration
azd config show

# See di status of di current deployment
azd show
```

## Updating azd

### Update Check
azd go warn you when new release dey, and you fit confirm your current build with:
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
<summary><strong>Wetin be difference between azd and az CLI?</strong></summary>

**Azure CLI (az)**: Low-level tool wey you dey use to manage individual Azure resources
- `az webapp create`, `az storage account create`
- One resource at a time
- Infrastructure management focus

**Azure Developer CLI (azd)**: High-level tool for complete application deployments
- `azd up` dey deploy whole app with all resources
- Template-based workflows
- Developer productivity focus

**You need both**: azd dey use az CLI for authentication
</details>

<details>
<summary><strong>Fit I use azd with existing Azure resources?</strong></summary>

Yes! You fit:
1. Import existing resources into azd environments
2. Reference existing resources for your Bicep templates
3. Use azd for new deployments side-by-side with existing infrastructure

See [Configuration Guide](configuration.md) for details.
</details>

<details>
<summary><strong>Azd dey work with Azure Government or Azure China?</strong></summary>

Yes, just configure the cloud:
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

Sure! azd design make automation easy:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>How much e go cost to use azd?</strong></summary>

azd self dey **completely free** and open-source. The only thing you go pay for na:
- Azure resources wey you deploy
- Azure consumption costs (compute, storage, etc.)

Use `azd provision --preview` to estimate costs before deployment.
</details>

## Next Steps

1. **Complete authentication**: Make sure say you fit access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you meet wahala:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Get Azure command guidance straight inside your editor with `npx skills add microsoft/github-copilot-for-azure`

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
Dis dokument don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get errors or inaccuracies. Di original dokument for im native language suppose be di authoritative source. For critical information, e better make professional human translation handle am. We no dey liable for any misunderstandings or misinterpretations wey fit arise from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->