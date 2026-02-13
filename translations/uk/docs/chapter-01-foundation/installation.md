# Інструкція з встановлення та налаштування

**Chapter Navigation:**
- **📚 Course Home**: [AZD для початківців](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Цей всеосяжний посібник проведе вас через встановлення та налаштування Azure Developer CLI (azd) на вашій системі. Ви дізнаєтесь кілька методів встановлення для різних операційних систем, налаштування автентифікації та початкової конфігурації, щоб підготувати ваше середовище розробки для розгортання в Azure.

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
# Запустіть від імені адміністратора або з підвищеними правами
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
# Завантажте та встановіть
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
# Додати репозиторій пакетів Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Встановити azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Додати репозиторій пакетів Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd comes pre-installed in GitHub Codespaces. Simply create a codespace and start using azd immediately.

### Docker

```bash
# Запустіть azd у контейнері
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Створіть псевдонім для зручнішого використання
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

After installation, verify azd is working correctly:

```bash
# Перевірити версію
azd version

# Переглянути довідку
azd --help

# Перелічити доступні шаблони
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
# Встановіть Azure CLI, якщо він ще не встановлений
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Увійдіть у Azure
az login

# Перевірте автентифікацію
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
# Встановити підписку за замовчуванням
azd config set defaults.subscription <subscription-id>

# Встановити місцезнаходження за замовчуванням
azd config set defaults.location eastus2

# Переглянути всю конфігурацію
azd config list
```

### Environment Variables
Add to your shell profile (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфігурація Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфігурація azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Увімкнути логування для налагодження
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
# Запустіть PowerShell від імені адміністратора
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
# Налаштувати проксі
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропустити перевірку SSL (не рекомендується для використання в виробничому середовищі)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# Видалити старі встановлення
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Очистити конфігурацію
rm -rf ~/.azd
```

### Getting More Help
```bash
# Увімкнути налагоджувальне логування
export AZD_DEBUG=true
azd <command> --debug

# Переглянути поточну конфігурацію
azd config list

# Переглянути поточний стан розгортання
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
<summary><strong>У чому різниця між azd та az CLI?</strong></summary>

**Azure CLI (az)**: Інструмент низького рівня для керування окремими ресурсами Azure
- `az webapp create`, `az storage account create`
- Один ресурс за раз
- Зосереджено на управлінні інфраструктурою

**Azure Developer CLI (azd)**: Інструмент високого рівня для повного розгортання додатків
- `azd up` розгортає весь додаток з усіма ресурсами
- Робочі процеси на основі шаблонів
- Орієнтовано на підвищення продуктивності розробника

**Вам потрібні обидва**: azd використовує az CLI для автентифікації
</details>

<details>
<summary><strong>Чи можу я використовувати azd з існуючими ресурсами Azure?</strong></summary>

Так! Ви можете:
1. Імпортувати існуючі ресурси в середовища azd
2. Посилатися на існуючі ресурси у своїх шаблонах Bicep
3. Використовувати azd для нових розгортань поряд із наявною інфраструктурою

See [Configuration Guide](configuration.md) for details.
</details>

<details>
<summary><strong>Чи працює azd з Azure Government або Azure China?</strong></summary>

Так, налаштуйте хмару:
```bash
# Azure для уряду
az cloud set --name AzureUSGovernment
az login

# Azure для Китаю
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Чи можна використовувати azd у CI/CD пайплайнах?</strong></summary>

Абсолютно! azd призначено для автоматизації:
- GitHub Actions integration
- Azure DevOps support
- Service principal authentication
- Non-interactive mode

See [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) for CI/CD patterns.
</details>

<details>
<summary><strong>Яка вартість використання azd?</strong></summary>

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
- **📚 Course Home**: [AZD для початківців](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** Continue to [Your First Project](first-project.md) to start building with azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу машинного перекладу на основі штучного інтелекту [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується скористатися послугами професійного людського перекладача. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->