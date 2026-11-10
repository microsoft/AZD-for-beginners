# Руководство по установке и настройке

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Основы AZD](azd-basics.md)
- **➡️ Следующая**: [Ваш первый проект](first-project.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Это подробное руководство шаг за шагом проведет вас через процесс установки и настройки Azure Developer CLI (azd) на вашей системе. Вы узнаете несколько способов установки для разных операционных систем, настройку аутентификации и начальную конфигурацию для подготовки вашей среды разработки к развертыванию в Azure.

## Цели обучения

К концу этого урока вы сможете:
- Успешно установить Azure Developer CLI на вашу операционную систему
- Настроить аутентификацию с Azure несколькими способами
- Подготовить среду разработки с необходимыми предварительными условиями
- Понять различные варианты установки и когда их использовать
- Решать распространённые проблемы установки и настройки

## Результаты обучения

После завершения урока вы сможете:
- Установить azd с помощью подходящего метода для вашей платформы
- Аутентифицироваться в Azure с помощью azd auth login
- Проверить установку и выполнить базовые команды azd
- Настроить среду разработки для оптимального использования azd
- Самостоятельно решить распространённые проблемы установки

Это руководство поможет вам установить и настроить Azure Developer CLI на вашей системе, независимо от операционной системы или среды разработки.

## Предварительные требования

Перед установкой azd убедитесь, что у вас есть:
- **Подписка Azure** - [Создайте бесплатный аккаунт](https://azure.microsoft.com/free/)
- **Azure CLI** (необязательно) - Для примеров, явно запускающих `az`; azd аутентифицируется самостоятельно
- **Git** - Для клонирования шаблонов и контроля версий
- **Docker** (необязательно) - Для контейнеризованных приложений

## Методы установки

### Windows

#### Вариант 1: Менеджер пакетов Windows (рекомендуется)
```cmd
winget install microsoft.azd
```

#### Вариант 2: Установочный скрипт PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Вариант 3: Chocolatey
```cmd
choco install azd
```

#### Вариант 4: Ручная установка
1. Скачайте последнюю версию с [GitHub](https://github.com/Azure/azure-dev/releases)
2. Распакуйте в `C:\Program Files\azd\`
3. Добавьте в переменную среды PATH

### macOS

#### Вариант 1: Homebrew (рекомендуется)
```bash
brew tap azure/azd
brew install azd
```

#### Вариант 2: Установочный скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Вариант 3: Ручная установка
Скачайте архив для вашей архитектуры macOS из [релизных ресурсов](https://github.com/Azure/azure-dev/releases), распакуйте и добавьте бинарник `azd` в ваш `PATH`.

### Linux

#### Вариант 1: Установочный скрипт (рекомендуется)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Вариант 2: Менеджеры пакетов

**Ручная установка из релизных ресурсов:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Некоторые среды Codespaces и контейнеры для разработки уже включают `azd`, но лучше проверить это, а не предполагать:

```bash
azd version
```

Если `azd` отсутствует, установите его стандартным скриптом для вашей среды.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Этот временный контейнер не сохраняет состояние входа между запусками. Для повторных развертываний используйте [настройку среды разработки контейнера](dev-containers.md); для создания контейнеров также требуется доступ к демону Docker изнутри контейнера.

## ✅ Проверка установки

После установки проверьте корректность работы azd:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Ожидаемый вывод:
```
azd version 1.x.x (commit xxxxxx)
```

**Примечание**: Фактический номер версии может отличаться. Проверьте [релизы Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для последней версии.

**✅ Контрольный список успешной установки:**
- [ ] `azd version` выводит номер версии без ошибок
- [ ] `azd --help` отображает документацию по командам
- [ ] `azd template list` показывает доступные шаблоны
- [ ] Вы можете создать тестовую папку и успешно выполнить `azd init`

**Если все проверки пройдены, вы готовы перейти к [Вашему первому проекту](first-project.md)!**

## Настройка аутентификации

### Рекомендуемая настройка для начинающих

Для рабочих процессов с приоритетом azd войдите с помощью `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Используйте вход через Azure CLI только если планируете выполнять команды `az` самостоятельно в ходе курса.

### Аутентификация через Azure CLI (необязательно)
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

### Какой вариант входа использовать?

- Используйте `azd auth login`, если вы следуете пути начинающего azd и в основном запускаете команды `azd`.
- Используйте также `az login`, если хотите запускать команды Azure CLI, такие как `az account show`, или напрямую просматривать ресурсы.
- Если упражнение включает и `azd`, и `az`, выполните оба входа один раз в начале.

### Аутентификация через код устройства
Если вы находитесь на системе без графического интерфейса или возникают проблемы с браузером:
```bash
azd auth login --use-device-code
```

### Сервисный принципал (CI/CD)
Для автоматизированных сред:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Проверка полной настройки

Если хотите быстро проверить готовность перед началом Глава 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Конфигурация

### Глобальная конфигурация
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Переменные окружения
Добавьте в профиль вашей оболочки (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Интеграция с IDE

### Visual Studio Code
Установите расширение Azure Developer CLI:
1. Откройте VS Code
2. Перейдите в Расширения (Ctrl+Shift+X)
3. Найдите "Azure Developer CLI"
4. Установите расширение

Функции:
- IntelliSense для azure.yaml
- Команды в интегрированном терминале
- Просмотр шаблонов
- Мониторинг развертываний

### GitHub Codespaces
Создайте `.devcontainer/devcontainer.json`:
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
2. Настройте Azure учетные данные
3. Используйте интегрированный терминал для команд azd

## 🐛 Поиск и устранение неисправностей установки

### Распространённые проблемы

#### Доступ запрещён (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблемы с PATH
Добавьте azd вручную в вашу PATH:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Конфликты версий
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Дополнительная помощь
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Обновление azd

### Проверка обновлений
azd предупреждает, когда доступна новая версия, и вы можете проверить текущую сборку с помощью:
```bash
azd version
```

### Ручное обновление

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

## 💡 Часто задаваемые вопросы

<details>
<summary><strong>В чем разница между azd и az CLI?</strong></summary>

**Azure CLI (az)**: Низкоуровневый инструмент для управления отдельными ресурсами Azure
- `az webapp create`, `az storage account create`
- Управление по одному ресурсу
- Фокус на управлении инфраструктурой

**Azure Developer CLI (azd)**: Высокоуровневый инструмент для полного развертывания приложений
- `azd up` разворачивает всё приложение с ресурсами
- Шаблонные рабочие процессы
- Фокус на продуктивности разработчика

**Они независимы**: azd по умолчанию использует собственную аутентификацию. Устанавливайте и входите в Azure CLI только для команд `az` или если явно хотите использовать `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Можно ли использовать azd с существующими ресурсами Azure?</strong></summary>

Да! Вы можете:
1. Импортировать существующие ресурсы в среды azd
2. Ссылаться на существующие ресурсы в шаблонах Bicep
3. Использовать azd для новых развертываний вместе с существующей инфраструктурой

Подробнее смотрите в [Руководстве по конфигурации](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Работает ли azd с Azure Government или Azure China?</strong></summary>

Да, настройте облако:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Если вы также используете Azure CLI, настройте `az cloud set --name ...` отдельно. Сервисы шаблонов и доступность моделей зависят от облака.
</details>

<details>
<summary><strong>Можно ли использовать azd в CI/CD-пайплайнах?</strong></summary>

Абсолютно! azd разработан для автоматизации:
- Интеграция с GitHub Actions
- Поддержка Azure DevOps
- Аутентификация через сервисный принципал
- Безинтерактивный режим

Смотрите [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) для шаблонов CI/CD.
</details>

<details>
<summary><strong>Какова стоимость использования azd?</strong></summary>

azd сам по себе **полностью бесплатен** и с открытым исходным кодом. Вы платите только за:
- Ресурсы Azure, которые вы развертываете
- Затраты на потребление Azure (вычисления, хранение и пр.)

Используйте `azd provision --preview` для просмотра предлагаемых ресурсов, а затем оцените их стоимость с помощью [Калькулятора цен Azure](https://azure.microsoft.com/pricing/calculator/). Предварительный просмотр не вычисляет цены.
</details>

## Следующие шаги

1. **Завершите аутентификацию**: Убедитесь, что у вас есть доступ к вашей подписке Azure
2. **Попробуйте первое развертывание**: Следуйте [Руководству по первому проекту](first-project.md)
3. **Исследуйте шаблоны**: Просматривайте доступные шаблоны с помощью `azd template list`
4. **Настройте вашу IDE**: Подготовьте вашу среду разработки

## Поддержка

Если вы столкнулись с проблемами:
- [Официальная документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Сообщить о проблемах](https://github.com/Azure/azure-dev/issues)
- [Обсуждения в сообществе](https://github.com/Azure/azure-dev/discussions)
- [Поддержка Azure](https://azure.microsoft.com/support/)
- [**Навыки агента Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Получите подсказки по командам Azure прямо в редакторе с помощью `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Основы AZD](azd-basics.md) 
- **➡️ Следующая**: [Ваш первый проект](first-project.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Установка завершена!** Продолжайте к [Вашему первому проекту](first-project.md), чтобы начать работу с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->