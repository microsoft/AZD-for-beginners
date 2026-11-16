# Посібник з встановлення та налаштування

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md)
- **➡️ Наступний**: [Ваш перший проект](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з акцентом на ШІ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Цей детальний посібник проведе вас крок за кроком через процес встановлення та налаштування Azure Developer CLI (azd) на вашій системі. Ви дізнаєтеся кілька способів встановлення для різних операційних систем, налаштування автентифікації та початкової конфігурації для підготовки вашого середовища розробки до розгортання в Azure.

## Цілі навчання

Наприкінці цього уроку ви зможете:
- Успішно встановити Azure Developer CLI на вашу операційну систему
- Налаштувати автентифікацію з Azure за допомогою різних методів
- Підготувати середовище розробки з усіма необхідними залежностями
- Розуміти різні варіанти встановлення та коли їх застосовувати
- Успішно усувати поширені проблеми під час встановлення та налаштування

## Результати навчання

Після проходження уроку ви зможете:
- Встановити azd відповідним способом для вашої платформи
- Увійти в Azure за допомогою команди azd auth login
- Перевірити встановлення та протестувати базові команди azd
- Налаштувати середовище розробки для оптимального використання azd
- Самостійно вирішувати поширені проблеми встановлення

Цей посібник допоможе вам встановити та налаштувати Azure Developer CLI на вашій системі, незалежно від операційної системи чи середовища розробки.

## Вимоги

Перед встановленням azd переконайтеся, що у вас є:
- **Підписка Azure** - [Створіть безкоштовний акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** (необов’язково) - Для прикладів, які явно запускають `az`; azd автентифікується незалежно
- **Git** - для клонування шаблонів і контролю версій
- **Docker** (необов’язково) - для контейнеризованих додатків

## Способи встановлення

### Windows

#### Варіант 1: Менеджер пакетів Windows (рекомендовано)
```cmd
winget install microsoft.azd
```

#### Варіант 2: Скрипт встановлення PowerShell
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
2. Розпакуйте у `C:\Program Files\azd\`
3. Додайте до змінної оточення PATH

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
Завантажте архів для вашої архітектури macOS з [релізів](https://github.com/Azure/azure-dev/releases), розпакуйте його та додайте бінарний файл `azd` до вашого `PATH`.

### Linux

#### Варіант 1: Скрипт встановлення (рекомендовано)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 2: Менеджери пакетів

**Ручне встановлення з релізів:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Деякі середовища Codespaces і dev container вже містять `azd`, але вам слід перевірити це, а не припускати:

```bash
azd version
```

Якщо `azd` відсутній, встановіть його за допомогою стандартного скрипта для вашого середовища.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Цей епhemeral-контейнер не зберігає стан входу між запусками. Для повторних розгортань використовуйте [налаштування dev-контейнера](dev-containers.md); будівництво контейнерів також вимагає доступного Docker-демона всередині контейнера.

## ✅ Перевірка встановлення

Після встановлення перевірте коректність роботи azd:

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

**Примітка**: Фактичний номер версії може відрізнятися. Перевірте [релізи Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для останньої версії.

**✅ Контрольний список успішного встановлення:**
- [ ] `azd version` показує номер версії без помилок
- [ ] `azd --help` відображає документацію команд
- [ ] `azd template list` показує доступні шаблони
- [ ] Ви можете створити тестову директорію і успішно запустити `azd init`

**Якщо всі перевірки пройшли, ви готові перейти до [Вашого першого проекту](first-project.md)!**

## Налаштування автентифікації

### Рекомендоване налаштування для початківців

Для AZD-перших робочих процесів увійдіть за допомогою `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Використовуйте вхід через Azure CLI лише коли збираєтесь виконувати команди `az` особисто у процесі курсу.

### Автентифікація через Azure CLI (необов’язково)
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

- Використовуйте `azd auth login`, якщо ви слідуєте початковому шляху AZD і в основному запускаєте команди `azd`.
- Використовуйте також `az login`, коли хочете виконувати команди Azure CLI, такі як `az account show`, або безпосередньо переглядати ресурси.
- Якщо вправа містить і `azd`, і `az`, виконайте обидві команди входу один раз на початку.

### Аутентифікація через код пристрою
Якщо ви працюєте на безголовій системі або маєте проблеми з браузером:
```bash
azd auth login --use-device-code
```

### Сервісний принципал (CI/CD)
Для автоматизованих середовищ:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Перевірка повного налаштування

Якщо хочете швидко перевірити готовність перед початком Розділу 1:

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
Додайте у ваш профіль оболонки (`.bashrc`, `.zshrc`, `.profile`):
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
2. Перейдіть у Розширення (Ctrl+Shift+X)
3. Знайдіть "Azure Developer CLI"
4. Встановіть розширення

Функції:
- IntelliSense для azure.yaml
- Інтегрований термінал для команд
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

#### Відмовлено в доступі (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми з PATH
Додайте azd до PATH вручну:

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
azd попереджає, коли доступна новіша версія, і ви можете перевірити свою поточну збірку за допомогою:
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
<summary><strong>Яка різниця між azd та az CLI?</strong></summary>

**Azure CLI (az)**: Інструмент низького рівня для керування окремими ресурсами Azure
- `az webapp create`, `az storage account create`
- Один ресурс за раз
- Орієнтація на управління інфраструктурою

**Azure Developer CLI (azd)**: Інструмент високого рівня для повного розгортання додатків
- `azd up` розгортає весь додаток з усіма ресурсами
- Робочі процеси на основі шаблонів
- Орієнтація на продуктивність розробника

**Вони незалежні**: azd за замовчуванням використовує власну автентифікацію. Встановлюйте та входьте в Azure CLI лише для `az` команд або явного вибору `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Чи можна використовувати azd з існуючими ресурсами Azure?</strong></summary>

Звичайно! Ви можете:
1. Імпортувати існуючі ресурси в azd середовища
2. Посилатися на існуючі ресурси у ваших Bicep шаблонах
3. Використовувати azd для нових розгортань поруч із наявною інфраструктурою

Докладніше дивіться в [Посібнику з конфігурації](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Чи працює azd з Azure Government або Azure China?</strong></summary>

Так, налаштуйте хмару:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Якщо ви також використовуєте Azure CLI, окремо налаштуйте `az cloud set --name ...`. Сервери шаблонів і доступність моделей залежать від хмари.
</details>

<details>
<summary><strong>Чи можна використовувати azd у CI/CD конвеєрах?</strong></summary>

Звичайно! azd створений для автоматизації:
- Інтеграція з GitHub Actions
- Підтримка Azure DevOps
- Автентифікація через сервісний принципал
- Неінтерактивний режим

Детальніше у [Посібнику з розгортання](../chapter-04-infrastructure/deployment-guide.md) щодо CI/CD патернів.
</details>

<details>
<summary><strong>Яка вартість використання azd?</strong></summary>

azd сам по собі є **повністю безкоштовним** та відкритим програмним забезпеченням. Ви платите лише за:
- Ресурси Azure, які ви розгортаєте
- Вартість споживання Azure (обчислення, зберігання тощо)

Використовуйте `azd provision --preview` для перегляду пропонованих ресурсів, а потім оцінюйте їхню вартість за допомогою [Калькулятора цін Azure](https://azure.microsoft.com/pricing/calculator/). Перегляд не обчислює ціни.
</details>

## Наступні кроки

1. **Завершіть автентифікацію**: Переконайтеся, що маєте доступ до підписки Azure
2. **Спробуйте перше розгортання**: Слідуйте [Посібнику першого проекту](first-project.md)
3. **Ознайомтесь з шаблонами**: Перегляньте доступні шаблони за допомогою `azd template list`
4. **Налаштуйте IDE**: Підготуйте своє середовище розробки

## Підтримка

Якщо виникають проблеми:
- [Офіційна документація](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Повідомити про проблеми](https://github.com/Azure/azure-dev/issues)
- [Обговорення спільноти](https://github.com/Azure/azure-dev/discussions)
- [Підтримка Azure](https://azure.microsoft.com/support/)
- [**Навички агента Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Отримуйте допомогу з командами Azure безпосередньо у вашому редакторі через `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md) 
- **➡️ Наступний**: [Ваш перший проект](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з акцентом на ШІ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Встановлення завершено!** Продовжуйте з [Вашим першим проектом](first-project.md), щоб почати розробку з azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->