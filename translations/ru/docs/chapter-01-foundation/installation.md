# Руководство по установке и настройке

**Навигация по главам:**
- **📚 Главная страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Основы AZD](azd-basics.md)
- **➡️ Следующая**: [Ваш первый проект](first-project.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Это комплексное руководство проведет вас через процесс установки и настройки Azure Developer CLI (azd) на вашей системе. Вы узнаете несколько способов установки для разных операционных систем, настройку аутентификации и первоначальную конфигурацию для подготовки вашей среды разработки к развертыванию в Azure.

## Цели обучения

К концу этого урока вы:
- Успешно установите Azure Developer CLI на вашу операционную систему
- Настроите аутентификацию в Azure с использованием нескольких методов
- Подготовите вашу среду разработки с необходимыми предпосылками
- Поймете различные варианты установки и когда использовать каждый из них
- Сможете устранить распространённые проблемы при установке и настройке

## Результаты обучения

После завершения этого урока вы сможете:
- Установить azd, используя подходящий для вашей платформы метод
- Аутентифицироваться в Azure с помощью команды azd auth login
- Проверить установку и опробовать базовые команды azd
- Настроить вашу среду разработки для оптимального использования azd
- Независимо решать типичные проблемы с установкой

Это руководство поможет вам установить и настроить Azure Developer CLI на вашей системе, независимо от используемой операционной системы или среды разработки.

## Предварительные требования

Перед установкой azd убедитесь, что у вас есть:
- **Подписка Azure** - [Создать бесплатный аккаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - Для аутентификации и управления ресурсами
- **Git** - Для клонирования шаблонов и контроля версий
- **Docker** (опционально) - Для контейнеризованных приложений

## Методы установки

### Windows

#### Вариант 1: Windows Package Manager (рекомендуется)
```cmd
winget install microsoft.azd
```

#### Вариант 2: Сценарий установки PowerShell
```powershell
# Полезно, когда winget недоступен
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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

#### Вариант 2: Сценарий установки
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Вариант 3: Ручная установка
```bash
# Загрузить и установить
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Вариант 1: Сценарий установки (рекомендуется)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Вариант 2: Менеджеры пакетов

**Ручная установка из артефактов релиза:**
```bash
# Скачайте последний архив для вашей архитектуры Linux с:
# https://github.com/Azure/azure-dev/releases
# Затем распакуйте его и добавьте бинарный файл azd в ваш PATH.
```

### GitHub Codespaces

Некоторые среды Codespaces и dev-контейнеры уже включают `azd`, но вам следует проверить это, а не предполагать:

```bash
azd version
```

Если `azd` отсутствует, установите его стандартным скриптом для вашей среды.

### Docker

```bash
# Запустить azd в контейнере
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Создать псевдоним для более удобного использования
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Проверка установки

После установки проверьте, что azd работает корректно:

```bash
# Проверить версию
azd version

# Просмотреть справку
azd --help

# Список доступных шаблонов
azd template list
```

Ожидаемый вывод:
```
azd version 1.x.x (commit xxxxxx)
```

**Примечание**: Номер версии может отличаться. Проверьте [релизы Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для актуальной версии.

**✅ Контрольный список успешной установки:**
- [ ] команда `azd version` показывает номер версии без ошибок
- [ ] команда `azd --help` выводит документацию по командам
- [ ] команда `azd template list` показывает доступные шаблоны
- [ ] вы можете создать тестовую папку и успешно выполнить `azd init`

**Если все проверки пройдены, вы готовы перейти к [Вашему первому проекту](first-project.md)!**

## Настройка аутентификации

### Рекомендуемая начальная настройка

Для рабочих процессов с приоритетом на AZD войдите с помощью `azd auth login`.

```bash
# Требуется для команд AZD, таких как azd up
azd auth login

# Проверить состояние аутентификации AZD
azd auth login --check-status
```

Используйте вход через Azure CLI только если планируете самостоятельно выполнять команды `az` во время курса.

### Аутентификация через Azure CLI (опционально)
```bash
# Установите Azure CLI, если он еще не установлен
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: см. документацию по установке Azure CLI для вашего дистрибутива

# Войдите в Azure
az login

# Проверьте аутентификацию
az account show
```

### Какой метод входа использовать?

- Используйте `azd auth login`, если следуете пути с AZD для начинающих и преимущественно запускаете команды `azd`.
- Используйте `az login`, если хотите запускать команды Azure CLI, например, `az account show` или просматривать ресурсы напрямую.
- Если упражнение включает команды `azd` и `az`, выполните оба входа один раз в начале.

### Аутентификация по коду устройства
Если вы используете систему без графического интерфейса или испытываете проблемы с браузером:
```bash
azd auth login --use-device-code
```

### Сервисный принципал (CI/CD)
Для автоматизированных сред:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Проверьте вашу полную настройку

Если хотите быстро проверить готовность перед началом Главы 1:

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
# Установить подписку по умолчанию
azd config set defaults.subscription <subscription-id>

# Установить местоположение по умолчанию
azd config set defaults.location eastus2

# Просмотреть все настройки
azd config show
```

### Переменные окружения
Добавьте в профиль вашего шелла (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфигурация Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфигурация azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Включить отладочный логирование
```

## Интеграция с IDE

### Visual Studio Code
Установите расширение Azure Developer CLI:
1. Откройте VS Code
2. Перейдите в Расширения (Ctrl+Shift+X)
3. Найдите "Azure Developer CLI"
4. Установите расширение

Возможности:
- IntelliSense для azure.yaml
- Команды в интегрированной терминале
- Просмотр шаблонов
- Мониторинг развертываний

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
2. Настройте Azure-учётные данные
3. Используйте интегрированный терминал для команд azd

## 🐛 Устранение проблем с установкой

### Распространённые проблемы

#### Отказ в доступе (Windows)
```powershell
# Запустите PowerShell от имени администратора
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблемы с PATH
Добавьте azd вручную в PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Сетевые/Прокси проблемы
```bash
# Настроить прокси
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропустить проверку SSL (не рекомендуется для использования в производстве)
azd config set http.insecure true
```

#### Конфликты версий
```bash
# Удалить старые установки
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: удалите предыдущий бинарный файл azd или символическую ссылку перед повторной установкой

# Очистить конфигурацию
rm -rf ~/.azd
```

### Дополнительная помощь
```bash
# Включить отладочное ведение журнала
export AZD_DEBUG=true
azd <command> --debug

# Просмотр текущей конфигурации
azd config show

# Просмотр текущего статуса развертывания
azd show
```

## Обновление azd

### Проверка обновлений
azd предупреждает, когда доступна новая версия, проверить текущую сборку можно командой:
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
- Один ресурс за раз
- Фокус на управлении инфраструктурой

**Azure Developer CLI (azd)**: Высокоуровневый инструмент для полного развертывания приложений
- `azd up` развертывает всё приложение вместе со всеми ресурсами
- Рабочие процессы на основе шаблонов
- Фокус на продуктивности разработчика

**Нужны оба инструмента:** azd использует az CLI для аутентификации
</details>

<details>
<summary><strong>Могу ли я использовать azd с существующими ресурсами Azure?</strong></summary>

Да! Вы можете:
1. Импортировать существующие ресурсы в среды azd
2. Использовать ссылки на существующие ресурсы в шаблонах Bicep
3. Использовать azd для новых развертываний вместе с существующей инфраструктурой

Смотрите [Руководство по конфигурации](configuration.md) для подробностей.
</details>

<details>
<summary><strong>Работает ли azd с Azure Government или Azure China?</strong></summary>

Да, настройте облако:
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Могу ли я использовать azd в CI/CD пайплайнах?</strong></summary>

Конечно! azd создан для автоматизации:
- Интеграция с GitHub Actions
- Поддержка Azure DevOps
- Аутентификация через сервисный принципал
- Безинтерактивный режим

Смотрите [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) для шаблонов CI/CD.
</details>

<details>
<summary><strong>Сколько стоит использование azd?</strong></summary>

azd сам по себе **полностью бесплатен** и с открытым исходным кодом. Вы платите только за:
- Azure-ресурсы, которые развертываете
- Потребление Azure (вычисления, хранение и т.д.)

Используйте `azd provision --preview`, чтобы оценить стоимость до развертывания.
</details>

## Следующие шаги

1. **Завершите аутентификацию**: убедитесь, что у вас есть доступ к подписке Azure
2. **Попробуйте первое развертывание**: следуйте [Руководству по первому проекту](first-project.md)
3. **Изучите шаблоны**: просмотрите доступные шаблоны с помощью `azd template list`
4. **Настройте вашу IDE**: подготовьте среду разработки

## Поддержка

Если у вас возникают проблемы:
- [Официальная документация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Сообщить о проблемах](https://github.com/Azure/azure-dev/issues)
- [Обсуждения сообщества](https://github.com/Azure/azure-dev/discussions)
- [Поддержка Azure](https://azure.microsoft.com/support/)
- [**Навыки агента Azure**](https://skills.sh/microsoft/github-copilot-for-azure) — Получайте подсказки по командам Azure прямо в вашем редакторе с помощью `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Основы AZD](azd-basics.md)
- **➡️ Следующая**: [Ваш первый проект](first-project.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Установка завершена!** Продолжайте к [Вашему первому проекту](first-project.md), чтобы начать работу с azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, пожалуйста, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется обращаться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникающие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->