# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

This comprehensive guide will walk you through installing and configuring Azure Developer CLI (azd) on your system. You'll learn multiple installation methods for different operating systems, authentication setup, and initial configuration to prepare your development environment for Azure deployments.

## Learning Goals

By the end of this lesson, you will:
- Successfully install Azure Developer CLI on your operating system
- Configure authentication with Azure using multiple methods
- Set up your development environment with necessary prerequisites
- Understand different installation options and when to use each
- Troubleshoot common installation and setup issues

## Learning Outcomes

After completing this lesson, you will be able to:
- Install azd using the appropriate method for your platform
- Authenticate with Azure using azd auth login
- Verify your installation and test basic azd commands
- Configure your development environment for optimal azd usage
- Resolve common installation problems independently

This guide will help you install and configure Azure Developer CLI on your system, regardless of your operating system or development environment.

## Prerequisites

Before installing azd, ensure you have:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - For authentication and resource management
- **Git** - For cloning templates and version control
- **Docker** (optional) - For containerized applications

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# Rulați ca Administrator sau cu privilegii ridicate
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
# Descarcă și instalează
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
# Adăugați depozitul de pachete Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instalați azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Adaugă depozitul de pachete Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd comes pre-installed in GitHub Codespaces. Simply create a codespace and start using azd immediately.

### Docker

```bash
# Rulează azd într-un container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Creează un alias pentru o utilizare mai ușoară
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After installation, verify azd is working correctly:

```bash
# Verifică versiunea
azd version

# Afișează ajutorul
azd --help

# Listează șabloanele disponibile
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: The actual version number will vary. Check [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) for the latest version.

**✅ Installation Success Checklist:**
- [ ] `azd version` shows version number without errors
- [ ] `azd --help` displays command documentation
- [ ] `azd template list` shows available templates
- [ ] `az account show` displays your Azure subscription
- [ ] You can create a test directory and run `azd init` successfully

**If all checks pass, you're ready to proceed to [Your First Project](first-project.md)!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# Instalați Azure CLI dacă nu este deja instalat
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Conectați-vă la Azure
az login

# Verificați autentificarea
az account show
```

### Device Code Authentication
If you're on a headless system or having browser issues:
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
# Setează abonamentul implicit
azd config set defaults.subscription <subscription-id>

# Setează locația implicită
azd config set defaults.location eastus2

# Vizualizează întreaga configurație
azd config list
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Configurare Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configurare azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Activează înregistrarea pentru depanare
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
# Rulați PowerShell ca Administrator
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
# Configurează proxy-ul
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Omită verificarea SSL (nu este recomandat pentru producție)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Eliminați instalările vechi
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Curățați configurația
rm -rf ~/.azd
```

### Getting More Help
```bash
# Activează jurnalizarea de depanare
export AZD_DEBUG=true
azd <command> --debug

# Vizualizează configurația curentă
azd config list

# Vizualizează starea curentă a implementării
azd show
```

## Updating azd

### Automatic Updates
azd will notify you when updates are available:
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
<summary><strong>Care este diferența dintre azd și az CLI?</strong></summary>

**Azure CLI (az)**: Low-level tool for managing individual Azure resources
- `az webapp create`, `az storage account create`
- One resource at a time
- Infrastructure management focus

**Azure Developer CLI (azd)**: High-level tool for complete application deployments
- `azd up` deploys entire app with all resources
- Template-based workflows
- Developer productivity focus

**You need both**: azd uses az CLI for authentication
</details>

<details>
<summary><strong>Pot folosi azd cu resurse Azure existente?</strong></summary>

Yes! You can:
1. Import existing resources into azd environments
2. Reference existing resources in your Bicep templates
3. Use azd for new deployments alongside existing infrastructure

See [Configuration Guide](configuration.md) for details.
</details>

<details>
<summary><strong>Funcționează azd cu Azure Government sau Azure China?</strong></summary>

Yes, configure the cloud:
```bash
# Azure pentru guvern
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Pot folosi azd în pipeline-uri CI/CD?</strong></summary>

Absolutely! azd is designed for automation:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>Cât costă folosirea azd?</strong></summary>

azd itself is **completely free** and open-source. You only pay for:
- Azure resources you deploy
- Azure consumption costs (compute, storage, etc.)

Use `azd provision --preview` to estimate costs before deployment.
</details>

## Next Steps

1. **Complete authentication**: Ensure you can access your Azure subscription
2. **Try your first deployment**: Follow the [First Project Guide](first-project.md)
3. **Explore templates**: Browse available templates with `azd template list`
4. **Configure your IDE**: Set up your development environment

## Support

If you encounter issues:
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
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autoritativă. Pentru informații critice se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări eronate care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->