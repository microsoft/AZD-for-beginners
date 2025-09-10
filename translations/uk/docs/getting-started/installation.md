<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-10T06:06:09+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "uk"
}
-->
# Посібник з встановлення та налаштування

## Вступ

Цей детальний посібник допоможе вам встановити та налаштувати Azure Developer CLI (azd) на вашій системі. Ви дізнаєтеся про різні методи встановлення для різних операційних систем, налаштування автентифікації та початкову конфігурацію для підготовки вашого середовища розробки до розгортання в Azure.

## Цілі навчання

До кінця цього уроку ви:
- Успішно встановите Azure Developer CLI на вашу операційну систему
- Налаштуєте автентифікацію з Azure за допомогою різних методів
- Підготуєте середовище розробки з необхідними передумовами
- Зрозумієте різні варіанти встановлення та коли їх використовувати
- Навчитеся вирішувати поширені проблеми з встановленням та налаштуванням

## Результати навчання

Після завершення цього уроку ви зможете:
- Встановити azd, використовуючи відповідний метод для вашої платформи
- Автентифікуватися з Azure за допомогою команди azd auth login
- Перевірити встановлення та протестувати базові команди azd
- Налаштувати середовище розробки для оптимального використання azd
- Самостійно вирішувати поширені проблеми з встановленням

Цей посібник допоможе вам встановити та налаштувати Azure Developer CLI на вашій системі, незалежно від операційної системи чи середовища розробки.

## Передумови

Перед встановленням azd переконайтеся, що у вас є:
- **Підписка на Azure** - [Створіть безкоштовний акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - Для автентифікації та управління ресурсами
- **Git** - Для клонування шаблонів та контролю версій
- **Docker** (опціонально) - Для контейнеризованих додатків

## Методи встановлення

### Windows

#### Варіант 1: PowerShell (рекомендовано)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Варіант 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Варіант 3: Chocolatey
```cmd
choco install azd
```

#### Варіант 4: Ручне встановлення
1. Завантажте останню версію з [GitHub](https://github.com/Azure/azure-dev/releases)
2. Розпакуйте до `C:\Program Files\azd\`
3. Додайте до змінної середовища PATH

### macOS

#### Варіант 1: Homebrew (рекомендовано)
```bash
brew tap azure/azd
brew install azd
```

#### Варіант 2: Сценарій встановлення
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 3: Ручне встановлення
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Варіант 1: Сценарій встановлення (рекомендовано)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 2: Менеджери пакетів

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

azd попередньо встановлений у GitHub Codespaces. Просто створіть codespace і починайте використовувати azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Перевірка встановлення

Після встановлення перевірте, чи azd працює правильно:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очікуваний результат:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 Налаштування автентифікації

### Автентифікація через Azure CLI (рекомендовано)
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

### Автентифікація через код пристрою
Якщо ви працюєте на системі без графічного інтерфейсу або маєте проблеми з браузером:
```bash
az login --use-device-code
```

### Сервісний обліковий запис (CI/CD)
Для автоматизованих середовищ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ Конфігурація

### Глобальна конфігурація
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Змінні середовища
Додайте до профілю вашої оболонки (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 Інтеграція з IDE

### Visual Studio Code
Встановіть розширення Azure Developer CLI:
1. Відкрийте VS Code
2. Перейдіть до розширень (Ctrl+Shift+X)
3. Знайдіть "Azure Developer CLI"
4. Встановіть розширення

Функції:
- IntelliSense для azure.yaml
- Інтегровані команди терміналу
- Перегляд шаблонів
- Моніторинг розгортання

### GitHub Codespaces
Створіть `.devcontainer/devcontainer.json`:
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
1. Встановіть плагін Azure
2. Налаштуйте облікові дані Azure
3. Використовуйте інтегрований термінал для команд azd

## 🐛 Вирішення проблем з встановленням

### Поширені проблеми

#### Відмова в доступі (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми з PATH
Ручно додайте azd до PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблеми з мережею/проксі
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Конфлікти версій
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Де отримати допомогу
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Оновлення azd

### Автоматичні оновлення
azd повідомить вас, коли будуть доступні оновлення:
```bash
azd version --check-for-updates
```

### Ручне оновлення

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

## Наступні кроки

1. **Завершіть автентифікацію**: Переконайтеся, що ви маєте доступ до вашої підписки Azure
2. **Спробуйте перше розгортання**: Дотримуйтесь [Посібника з першого проєкту](first-project.md)
3. **Досліджуйте шаблони**: Перегляньте доступні шаблони за допомогою `azd template list`
4. **Налаштуйте ваш IDE**: Підготуйте середовище розробки

## Підтримка

Якщо ви зіткнулися з проблемами:
- [Офіційна документація](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Повідомити про проблеми](https://github.com/Azure/azure-dev/issues)
- [Обговорення спільноти](https://github.com/Azure/azure-dev/discussions)
- [Підтримка Azure](https://azure.microsoft.com/support/)

---

**Навігація**
- **Попередній урок**: [Основи AZD](azd-basics.md)
- **Наступний урок**: [Конфігурація](configuration.md)

**Встановлення завершено!** Перейдіть до [Вашого першого проєкту](first-project.md), щоб почати працювати з azd.

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.