# Посібник з встановлення та налаштування

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md)
- **➡️ Наступний**: [Ваш перший проєкт](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з першого погляду AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Цей всебічний посібник проведе вас через встановлення та налаштування Azure Developer CLI (azd) на вашій системі. Ви дізнаєтеся про кілька методів встановлення для різних операційних систем, налаштування аутентифікації та початкової конфігурації, щоб підготувати середовище розробки до розгортання в Azure.

## Цілі навчання

До кінця цього уроку ви:
- Успішно встановите Azure Developer CLI на вашу операційну систему
- Налаштуєте аутентифікацію з Azure за допомогою кількох методів
- Підготуєте середовище розробки з необхідними попередніми налаштуваннями
- Зрозумієте різні варіанти встановлення та коли кожен з них варто використовувати
- Вирішаєте поширені проблеми при встановленні та налаштуванні

## Очікувані результати навчання

Після завершення уроку ви зможете:
- Встановлювати azd за допомогою відповідного методу для вашої платформи
- Виконувати аутентифікацію в Azure за допомогою команди azd auth login
- Перевіряти встановлення та тестувати базові команди azd
- Налаштовувати середовище розробки для оптимального використання azd
- Самостійно вирішувати поширені проблеми при встановленні

Цей посібник допоможе вам встановити та налаштувати Azure Developer CLI незалежно від вашої операційної системи або середовища розробки.

## Необхідні умови

Перш ніж встановлювати azd, переконайтеся, що у вас є:
- **Підписка Azure** - [Створіть безкоштовний обліковий запис](https://azure.microsoft.com/free/)
- **Azure CLI** (необов’язково) - Для прикладів, які явно запускають `az`; azd аутентифікується самостійно
- **Git** - Для клонування шаблонів та контролю версій
- **Docker** (необов’язково) - Для контейнеризованих програм

**Шлях Foundry GA для Розділу 2:** Використовуйте AZD **1.37.0 або новіший**, встановіть пакет за `azd ext install microsoft.foundry`, та використовуйте Python **3.13+** і поточний **uv** для зразка hosted-agent. Режим розгортання коду будує віддалено, тому локальна збірка Docker не потрібна. Права Foundry, регіональна доступність моделей та квоти все ще потрібні; дивіться [налаштування hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Методи встановлення

### Windows

#### Варіант 1: Windows Package Manager (рекомендовано)
```cmd
winget install microsoft.azd
```

#### Варіант 2: PowerShell скрипт встановлення
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Варіант 3: Chocolatey
```cmd
choco install azd
```

#### Варіант 4: Ручне встановлення
1. Завантажте останній реліз з [GitHub](https://github.com/Azure/azure-dev/releases)
2. Розпакуйте в `C:\Program Files\azd\`
3. Додайте до змінної середовища PATH

### macOS

#### Варіант 1: Homebrew (рекомендовано)
```bash
brew tap azure/azd
brew install azd
```

#### Варіант 2: Скрипт встановлення
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 3: Ручне встановлення
Завантажте архів для вашої архітектури macOS з [ресурсів релізу](https://github.com/Azure/azure-dev/releases), розпакуйте його та додайте двійковий файл `azd` до вашого `PATH`.

### Linux

#### Варіант 1: Скрипт встановлення (рекомендовано)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 2: Менеджери пакетів

**Ручне встановлення з ресурсів релізу:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Деякі середовища Codespaces і dev container вже містять `azd`, але краще перевірити, ніж припускати:

```bash
azd version
```

Якщо `azd` відсутній, встановіть його за допомогою стандартного скрипта для цього середовища.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Цей тимчасовий контейнер не зберігає стан входу між запусками. Для повторних розгортань використовуйте [налаштування dev container](dev-containers.md); збірка контейнерів також потребує доступного демона Docker всередині контейнера.

## ✅ Перевірка встановлення

Після встановлення перевірте коректну роботу azd:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Очікуваний вивід:
```
azd version 1.x.x (commit xxxxxx)
```

**Примітка**: Реальний номер версії може відрізнятися. Перевірте [релізи Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для останньої версії.

**✅ Контрольний список успішного встановлення:**
- [ ] `azd version` показує номер версії без помилок
- [ ] `azd --help` відображає документацію команд
- [ ] `azd template list` показує доступні шаблони
- [ ] Ви можете створити тестовий каталог і успішно виконати `azd init`

**Якщо всі перевірки успішні, можна переходити до [Вашого першого проєкту](first-project.md)!**

## Налаштування аутентифікації

### Рекомендоване налаштування для початківців

Для робочих процесів, орієнтованих на AZD, увійдіть через `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Використовуйте вхід через Azure CLI лише якщо плануєте самостійно запускати команди `az` під час курсу.

### Аутентифікація через Azure CLI (необов’язково)
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

### Який спосіб входу варто використовувати?

- Використовуйте `azd auth login`, якщо проходите шлях початківця з AZD і в основному виконуєте команди `azd`.
- Використовуйте також `az login`, коли хочете запускати команди Azure CLI, наприклад, `az account show`, або напряму переглядати ресурси.
- Якщо вправа включає як `azd`, так і `az`, виконайте обидва входи один раз на початку.

### Аутентифікація через код пристрою
Якщо ви працюєте на системі без головного інтерфейсу або маєте проблеми з браузером:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Для автоматизованих середовищ:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Перевірка повного налаштування

Якщо ви хочете швидко перевірити готовність перед початком Розділу 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Конфігурація

### Глобальна конфігурація
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Змінні середовища
Додайте до свого профілю shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Інтеграція з IDE

### Visual Studio Code
Встановіть розширення Azure Developer CLI:
1. Відкрийте VS Code
2. Перейдіть до Розширень (Ctrl+Shift+X)
3. Знайдіть "Azure Developer CLI"
4. Встановіть розширення

Особливості:
- IntelliSense для azure.yaml
- Інтегрований термінал
- Перегляд шаблонів
- Моніторинг розгортань

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

## 🐛 Вирішення проблем при встановленні

### Поширені проблеми

#### Відмова у доступі (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми з PATH
Додайте azd вручну до вашого PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Проблеми мережі/проксі
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Конфлікти версій
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Додаткова допомога
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Оновлення azd

### Перевірка оновлень
azd повідомляє про наявність новішої версії, і ви можете перевірити поточну збірку:
```bash
azd version
```

### Ручне оновлення

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

## 💡 Часті питання

<details>
<summary><strong>В чому різниця між azd та az CLI?</strong></summary>

**Azure CLI (az)**: Інструмент низького рівня для управління окремими ресурсами Azure
- `az webapp create`, `az storage account create`
- Один ресурс за раз
- Орієнтація на управління інфраструктурою

**Azure Developer CLI (azd)**: Інструмент високого рівня для повного розгортання додатків
- `azd up` розгортає весь додаток зі всіма ресурсами
- Робочі процеси на основі шаблонів
- Орієнтація на продуктивність розробника

**Вони незалежні**: azd за замовчуванням використовує власну аутентифікацію. Встановлюйте та увійдіть в Azure CLI лише для команд `az` або явно обирайте `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Чи можна використовувати azd з існуючими ресурсами Azure?</strong></summary>

Так! Ви можете:
1. Імпортувати існуючі ресурси в середовища azd
2. Посилатися на існуючі ресурси у ваших Bicep-шаблонах
3. Використовувати azd для нових розгортань разом із існуючою інфраструктурою

Деталі дивіться у [Посібнику з конфігурації](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Чи працює azd з Azure Government чи Azure China?</strong></summary>

Так, налаштуйте хмару:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Якщо ви також використовуєте Azure CLI, налаштуйте `az cloud set --name ...` окремо. Послуги шаблонів та доступність моделей залежать від конкретної хмари.
</details>

<details>
<summary><strong>Чи можна використовувати azd у CI/CD конвеєрах?</strong></summary>

Звичайно! azd створений для автоматизації:
- Інтеграція з GitHub Actions
- Підтримка Azure DevOps
- Аутентифікація за допомогою service principal
- Неінтерактивний режим

Деталі дивіться у [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) для CI/CD.
</details>

<details>
<summary><strong>Яка вартість використання azd?</strong></summary>

azd є **повністю безкоштовним** та з відкритим кодом. Ви платите лише за:
- Ресурси Azure, які розгортаєте
- Витрати на використання Azure (обчислення, зберігання тощо)

Використовуйте `azd provision --preview` для перевірки пропонованих ресурсів, потім оцінюйте їхню вартість за допомогою [Калькулятора цін Azure](https://azure.microsoft.com/pricing/calculator/). Попередній перегляд не обчислює ціни.
</details>

## Наступні кроки

1. **Завершіть аутентифікацію**: Переконайтеся, що у вас є доступ до підписки Azure
2. **Спробуйте ваше перше розгортання**: Дотримуйтесь [Посібника першого проєкту](first-project.md)
3. **Огляньте шаблони**: Перегляньте доступні шаблони за допомогою `azd template list`
4. **Налаштуйте вашу IDE**: Підготуйте середовище розробки

## Підтримка

Якщо у вас виникнуть проблеми:
- [Офіційна документація](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Повідомити про проблеми](https://github.com/Azure/azure-dev/issues)
- [Обговорення спільноти](https://github.com/Azure/azure-dev/discussions)
- [Підтримка Azure](https://azure.microsoft.com/support/)
- [**Навички агента Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Отримуйте підказки команд Azure прямо у вашому редакторі за допомогою `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md) 
- **➡️ Наступний**: [Ваш перший проєкт](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з першого погляду AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Встановлення завершено!** Продовжуйте до [Вашого першого проєкту](first-project.md), щоб почати роботу з azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->