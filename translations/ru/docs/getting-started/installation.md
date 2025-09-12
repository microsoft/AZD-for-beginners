<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T18:34:14+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ru"
}
-->
# Руководство по установке и настройке

**Предыдущая:** [Основная документация](../../README.md) | **Следующая:** [Основы AZD](azd-basics.md)

## Введение

Это подробное руководство поможет вам установить и настроить Azure Developer CLI (azd) на вашей системе. Вы узнаете о различных методах установки для разных операционных систем, настройке аутентификации и начальной конфигурации, чтобы подготовить вашу среду разработки для развертывания в Azure.

## Цели обучения

К концу этого урока вы сможете:
- Успешно установить Azure Developer CLI на вашей операционной системе
- Настроить аутентификацию с Azure различными способами
- Подготовить вашу среду разработки с необходимыми предварительными условиями
- Понять различные варианты установки и их применение
- Решать распространенные проблемы, связанные с установкой и настройкой

## Результаты обучения

После завершения урока вы сможете:
- Установить azd, используя подходящий метод для вашей платформы
- Аутентифицироваться с Azure с помощью команды `azd auth login`
- Проверить установку и протестировать базовые команды azd
- Настроить вашу среду разработки для оптимального использования azd
- Самостоятельно решать распространенные проблемы, связанные с установкой

Это руководство поможет вам установить и настроить Azure Developer CLI на вашей системе, независимо от операционной системы или среды разработки.

## Предварительные условия

Перед установкой azd убедитесь, что у вас есть:
- **Подписка Azure** - [Создайте бесплатный аккаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - Для аутентификации и управления ресурсами
- **Git** - Для клонирования шаблонов и контроля версий
- **Docker** (опционально) - Для контейнеризированных приложений

## Методы установки

### Windows

#### Вариант 1: PowerShell (рекомендуется)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Вариант 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Вариант 3: Chocolatey
```cmd
choco install azd
```

#### Вариант 4: Ручная установка
1. Скачайте последнюю версию с [GitHub](https://github.com/Azure/azure-dev/releases)
2. Распакуйте в `C:\Program Files\azd\`
3. Добавьте путь в переменную PATH

### macOS

#### Вариант 1: Homebrew (рекомендуется)
```bash
brew tap azure/azd
brew install azd
```

#### Вариант 2: Скрипт установки
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Вариант 3: Ручная установка
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Вариант 1: Скрипт установки (рекомендуется)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Вариант 2: Менеджеры пакетов

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

azd уже установлен в GitHub Codespaces. Просто создайте codespace и начните использовать azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка установки

После установки убедитесь, что azd работает корректно:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Ожидаемый результат:
```
azd version 1.5.0 (commit abc123)
```

## Настройка аутентификации

### Аутентификация через Azure CLI (рекомендуется)
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

### Аутентификация через код устройства
Если вы используете систему без графического интерфейса или сталкиваетесь с проблемами браузера:
```bash
az login --use-device-code
```

### Сервисный принципал (CI/CD)
Для автоматизированных сред:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Конфигурация

### Глобальная конфигурация
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Переменные окружения
Добавьте в профиль вашей оболочки (`.bashrc`, `.zshrc`, `.profile`):
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
Установите расширение Azure Developer CLI:
1. Откройте VS Code
2. Перейдите в раздел расширений (Ctrl+Shift+X)
3. Найдите "Azure Developer CLI"
4. Установите расширение

Функции:
- IntelliSense для azure.yaml
- Интегрированные команды терминала
- Просмотр шаблонов
- Мониторинг развертывания

### GitHub Codespaces
Создайте файл `.devcontainer/devcontainer.json`:
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
1. Установите плагин Azure
2. Настройте учетные данные Azure
3. Используйте интегрированный терминал для команд azd

## 🐛 Устранение неполадок при установке

### Распространенные проблемы

#### Отказ в доступе (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблемы с PATH
Добавьте azd в PATH вручную:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблемы с сетью/прокси
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Конфликты версий
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Дополнительная помощь
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Обновление azd

### Автоматические обновления
azd уведомит вас, когда будут доступны обновления:
```bash
azd version --check-for-updates
```

### Ручное обновление

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

## Следующие шаги

1. **Завершите настройку аутентификации**: Убедитесь, что у вас есть доступ к вашей подписке Azure
2. **Попробуйте первое развертывание**: Следуйте [руководству по первому проекту](first-project.md)
3. **Изучите шаблоны**: Просмотрите доступные шаблоны с помощью `azd template list`
4. **Настройте вашу IDE**: Подготовьте вашу среду разработки

## Поддержка

Если вы столкнулись с проблемами:
- [Официальная документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Сообщить о проблемах](https://github.com/Azure/azure-dev/issues)
- [Обсуждения сообщества](https://github.com/Azure/azure-dev/discussions)
- [Поддержка Azure](https://azure.microsoft.com/support/)

---

**Предыдущая:** [Основная документация](../../README.md) | **Следующая:** [Основы AZD](azd-basics.md)

**Установка завершена!** Перейдите к [вашему первому проекту](first-project.md), чтобы начать работу с azd.

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.