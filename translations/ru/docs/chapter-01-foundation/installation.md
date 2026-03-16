# Руководство по установке и настройке

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Основы AZD](azd-basics.md)
- **➡️ Следующая**: [Ваш первый проект](first-project.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Это подробное руководство проведет вас через процесс установки и настройки Azure Developer CLI (azd) на вашей системе. Вы узнаете о различных способах установки для разных операционных систем, настройке аутентификации и начальной конфигурации, чтобы подготовить вашу среду разработки для развертывания в Azure.

## Цели обучения

К концу этого урока вы:
- Успешно установите Azure Developer CLI на вашу операционную систему
- Настроите аутентификацию с Azure разными методами
- Подготовите вашу среду разработки с необходимыми предварительными условиями
- Поймете различные варианты установки и когда использовать каждый из них
- Научитесь устранять типовые проблемы установки и настройки

## Результаты обучения

После завершения урока вы сможете:
- Установить azd, используя подходящий метод для вашей платформы
- Аутентифицироваться в Azure с помощью azd auth login
- Проверить установку и протестировать базовые команды azd
- Настроить вашу среду разработки для оптимального использования azd
- Самостоятельно решать распространённые проблемы с установкой

Это руководство поможет вам установить и настроить Azure Developer CLI на вашей системе, независимо от используемой ОС или среды разработки.

## Предварительные требования

Перед установкой azd убедитесь, что у вас есть:
- **Подписка Azure** - [Создайте бесплатный аккаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - Для аутентификации и управления ресурсами
- **Git** - Для клонирования шаблонов и контроля версий
- **Docker** (необязательно) - Для контейнеризованных приложений

## Методы установки

### Windows

#### Вариант 1: PowerShell (рекомендуется)
```powershell
# Запустите от имени администратора или с повышенными привилегиями
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Вариант 2: Менеджер пакетов Windows (winget)
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
3. Добавьте в переменную окружения PATH

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
# Скачать и установить
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
# Добавить репозиторий пакетов Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Установить azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Добавить репозиторий пакетов Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd установлен по умолчанию в GitHub Codespaces. Просто создайте codespace и сразу начинайте использовать azd.

### Docker

```bash
# Запустите azd в контейнере
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Создайте псевдоним для удобства использования
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка установки

После установки проверьте, что azd работает корректно:

```bash
# Проверить версию
azd version

# Посмотреть справку
azd --help

# Список доступных шаблонов
azd template list
```

Ожидаемый вывод:
```
azd version 1.x.x (commit xxxxxx)
```

**Примечание**: Номер версии будет отличаться. Проверьте [релизы Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для получения последней версии.

**✅ Контрольный список успешной установки:**
- [ ] `azd version` показывает номер версии без ошибок
- [ ] `azd --help` отображает документацию по командам
- [ ] `azd template list` показывает доступные шаблоны
- [ ] `az account show` отображает вашу подписку Azure
- [ ] Вы можете создать тестовую директорию и успешно выполнить `azd init`

**Если все проверки пройдены, вы готовы перейти к [Вашему первому проекту](first-project.md)!**

## Настройка аутентификации

### Аутентификация через Azure CLI (рекомендуется)
```bash
# Установите Azure CLI, если он еще не установлен
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Войдите в Azure
az login

# Проверьте аутентификацию
az account show
```

### Аутентификация через Device Code
Если вы используете систему без GUI или возникают проблемы с браузером:
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
# Установить подписку по умолчанию
azd config set defaults.subscription <subscription-id>

# Установить местоположение по умолчанию
azd config set defaults.location eastus2

# Просмотреть всю конфигурацию
azd config list
```

### Переменные окружения
Добавьте в профиль оболочки (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфигурация Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфигурация azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Включить отладочное логирование
```

## Интеграция с IDE

### Visual Studio Code
Установите расширение Azure Developer CLI:
1. Откройте VS Code
2. Перейдите в Extensions (Ctrl+Shift+X)
3. Найдите "Azure Developer CLI"
4. Установите расширение

Возможности:
- IntelliSense для azure.yaml
- Интегрированный терминал для команд
- Обзор шаблонов
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

## 🐛 Устранение проблем при установке

### Распространенные проблемы

#### Отказ в доступе (Windows)
```powershell
# Запустите PowerShell от имени администратора
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблемы с PATH
Добавьте azd в переменную PATH вручную:

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
# Настроить прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропустить проверку SSL (не рекомендуется для продакшена)
azd config set http.insecure true
```

#### Конфликты версий
```bash
# Удалить старые установки
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Очистить конфигурацию
rm -rf ~/.azd
```

### Дополнительная помощь
```bash
# Включить отладочное логирование
export AZD_DEBUG=true
azd <command> --debug

# Просмотреть текущую конфигурацию
azd config list

# Просмотреть текущий статус развертывания
azd show
```

## Обновление azd

### Автоматические обновления
azd уведомит вас о доступных обновлениях:
```bash
azd version --check-for-updates
```

### Ручные обновления

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

## 💡 Часто задаваемые вопросы

<details>
<summary><strong>В чем разница между azd и Azure CLI?</strong></summary>

**Azure CLI (az)**: Низкоуровневый инструмент для управления отдельными ресурсами Azure
- `az webapp create`, `az storage account create`
- По одному ресурсу за раз
- Фокус на управлении инфраструктурой

**Azure Developer CLI (azd)**: Высокоуровневый инструмент для комплексного развертывания приложений
- `azd up` разворачивает всё приложение с ресурсами
- Шаблонные рабочие процессы
- Фокус на продуктивности разработчика

**Вам нужны оба**: azd использует az CLI для аутентификации
</details>

<details>
<summary><strong>Можно ли использовать azd с существующими ресурсами Azure?</strong></summary>

Да! Вы можете:
1. Импортировать существующие ресурсы в среды azd
2. Ссылаться на существующие ресурсы в шаблонах Bicep
3. Использовать azd для новых развертываний вместе с текущей инфраструктурой

Подробности смотрите в [Руководстве по конфигурации](configuration.md).
</details>

<details>
<summary><strong>Работает ли azd с Azure Government или Azure China?</strong></summary>

Да, настройте облако:
```bash
# Правительство Azure
az cloud set --name AzureUSGovernment
az login

# Azure Китай
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Можно ли использовать azd в CI/CD пайплайнах?</strong></summary>

Конечно! azd разработан для автоматизации:
- Интеграция с GitHub Actions
- Поддержка Azure DevOps
- Аутентификация через сервисный принципал
- Безинтерактивный режим

Смотрите [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) для примеров использования в CI/CD.
</details>

<details>
<summary><strong>Сколько стоит использование azd?</strong></summary>

azd абсолютно **бесплатен** и с открытым исходным кодом. Оплата взимается только за:
- Развернутые ресурсы Azure
- Потребление ресурсов Azure (вычисление, хранилище и т.д.)

Используйте `azd provision --preview` для оценки затрат перед развертыванием.
</details>

## Следующие шаги

1. **Завершите аутентификацию**: Убедитесь, что у вас есть доступ к подписке Azure
2. **Попробуйте первое развертывание**: Следуйте [Руководству по первому проекту](first-project.md)
3. **Изучите шаблоны**: Просмотрите доступные шаблоны командой `azd template list`
4. **Настройте IDE**: Подготовьте вашу среду разработки

## Поддержка

Если у вас возникли проблемы:
- [Официальная документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Сообщить о проблеме](https://github.com/Azure/azure-dev/issues)
- [Обсуждения сообщества](https://github.com/Azure/azure-dev/discussions)
- [Поддержка Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Получайте подсказки по командам Azure прямо в вашем редакторе через `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Основы AZD](azd-basics.md) 
- **➡️ Следующая**: [Ваш первый проект](first-project.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Установка завершена!** Продолжайте с [Вашим первым проектом](first-project.md), чтобы начать работу с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Данный документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется использование профессионального перевода человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->