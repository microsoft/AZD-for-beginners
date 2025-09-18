<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-18T11:20:06+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "bg"
}
-->
# Ръководство за инсталация и настройка

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md)
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с приоритет на AI](../ai-foundry/azure-ai-foundry-integration.md)

## Въведение

Това подробно ръководство ще ви преведе през процеса на инсталиране и конфигуриране на Azure Developer CLI (azd) на вашата система. Ще научите различни методи за инсталация за различни операционни системи, настройка на автентикация и първоначална конфигурация, за да подготвите вашата среда за разработка за внедряване в Azure.

## Цели на обучението

До края на този урок ще можете:
- Успешно да инсталирате Azure Developer CLI на вашата операционна система
- Да конфигурирате автентикация с Azure чрез различни методи
- Да настроите вашата среда за разработка с необходимите предварителни условия
- Да разберете различните опции за инсталация и кога да използвате всяка от тях
- Да отстраните често срещани проблеми с инсталацията и настройката

## Резултати от обучението

След завършване на този урок ще можете:
- Да инсталирате azd, използвайки подходящия метод за вашата платформа
- Да се автентикирате с Azure чрез `azd auth login`
- Да проверите инсталацията си и да тествате основни команди на azd
- Да конфигурирате вашата среда за разработка за оптимално използване на azd
- Самостоятелно да разрешавате често срещани проблеми с инсталацията

Това ръководство ще ви помогне да инсталирате и конфигурирате Azure Developer CLI на вашата система, независимо от операционната система или средата за разработка.

## Предварителни условия

Преди да инсталирате azd, уверете се, че разполагате с:
- **Абонамент за Azure** - [Създайте безплатен акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - За автентикация и управление на ресурси
- **Git** - За клониране на шаблони и контрол на версиите
- **Docker** (по избор) - За контейнеризирани приложения

## Методи за инсталация

### Windows

#### Опция 1: PowerShell (Препоръчително)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Опция 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Опция 3: Chocolatey
```cmd
choco install azd
```

#### Опция 4: Ръчна инсталация
1. Изтеглете последната версия от [GitHub](https://github.com/Azure/azure-dev/releases)
2. Извлечете в `C:\Program Files\azd\`
3. Добавете към PATH променливата на средата

### macOS

#### Опция 1: Homebrew (Препоръчително)
```bash
brew tap azure/azd
brew install azd
```

#### Опция 2: Скрипт за инсталация
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 3: Ръчна инсталация
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Опция 1: Скрипт за инсталация (Препоръчително)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Опция 2: Мениджъри на пакети

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

azd е предварително инсталиран в GitHub Codespaces. Просто създайте codespace и започнете да използвате azd веднага.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка на инсталацията

След инсталацията, проверете дали azd работи правилно:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очакван резултат:
```
azd version 1.5.0 (commit abc123)
```

## Настройка на автентикация

### Автентикация чрез Azure CLI (Препоръчително)
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

### Автентикация чрез код на устройство
Ако сте на система без графичен интерфейс или имате проблеми с браузъра:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
За автоматизирани среди:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Конфигурация

### Глобална конфигурация
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Променливи на средата
Добавете към вашия shell профил (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Интеграция с IDE

### Visual Studio Code
Инсталирайте разширението Azure Developer CLI:
1. Отворете VS Code
2. Отидете на Extensions (Ctrl+Shift+X)
3. Потърсете "Azure Developer CLI"
4. Инсталирайте разширението

Функции:
- IntelliSense за azure.yaml
- Интегрирани терминални команди
- Преглед на шаблони
- Мониторинг на внедрявания

### GitHub Codespaces
Създайте `.devcontainer/devcontainer.json`:
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
1. Инсталирайте плъгина за Azure
2. Конфигурирайте Azure идентификационни данни
3. Използвайте интегрирания терминал за команди на azd

## 🐛 Отстраняване на проблеми с инсталацията

### Често срещани проблеми

#### Отказан достъп (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми с PATH
Ръчно добавете azd към PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Мрежови/прокси проблеми
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Конфликти на версии
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Получаване на допълнителна помощ
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Актуализиране на azd

### Автоматични актуализации
azd ще ви уведоми, когато има налични актуализации:
```bash
azd version --check-for-updates
```

### Ръчни актуализации

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

## Следващи стъпки

1. **Завършете автентикацията**: Уверете се, че имате достъп до вашия Azure абонамент
2. **Опитайте първото си внедряване**: Следвайте [Ръководството за първи проект](first-project.md)
3. **Разгледайте шаблони**: Прегледайте наличните шаблони с `azd template list`
4. **Конфигурирайте вашето IDE**: Настройте вашата среда за разработка

## Поддръжка

Ако срещнете проблеми:
- [Официална документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Докладване на проблеми](https://github.com/Azure/azure-dev/issues)
- [Обсъждания в общността](https://github.com/Azure/azure-dev/discussions)
- [Поддръжка на Azure](https://azure.microsoft.com/support/)

---

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Основи на AZD](azd-basics.md) 
- **➡️ Следваща**: [Вашият първи проект](first-project.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с приоритет на AI](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Инсталацията е завършена!** Продължете към [Вашият първи проект](first-project.md), за да започнете работа с azd.

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или погрешни интерпретации, произтичащи от използването на този превод.