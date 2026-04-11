# Посібник з встановлення та налаштування

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md)
- **➡️ Наступний**: [Ваш перший проєкт](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з акцентом на ШІ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Цей детальний посібник проведе вас крок за кроком через процес встановлення та налаштування Azure Developer CLI (azd) на вашій системі. Ви дізнаєтеся кілька способів встановлення для різних операційних систем, налаштування автентифікації та початкової конфігурації, щоб підготувати своє середовище розробки для розгортання Azure.

## Цілі навчання

По завершенні цього уроку ви:
- Успішно встановите Azure Developer CLI на вашу операційну систему
- Налаштуєте автентифікацію з Azure за допомогою різних методів
- Підготуєте своє середовище розробки з необхідними попередніми умовами
- Зрозумієте різні варіанти встановлення та коли їх слід використовувати
- Навчитеся усувати поширені проблеми з встановленням і налаштуванням

## Результати навчання

Після завершення уроку ви зможете:
- Встановити azd, використовуючи відповідний метод для вашої платформи
- Аутентифікуватися в Azure за допомогою команди azd auth login
- Перевірити встановлення та протестувати базові команди azd
- Налаштувати своє середовище розробки для оптимального використання azd
- Самостійно вирішувати поширені проблеми з встановленням

Цей посібник допоможе вам встановити та налаштувати Azure Developer CLI на вашій системі незалежно від операційної системи чи середовища розробки.

## Необхідні умови

Перед встановленням azd переконайтеся, що у вас є:
- **Підписка Azure** - [Створити безкоштовний акаунт](https://azure.microsoft.com/free/)
- **Azure CLI** - для автентифікації та управління ресурсами
- **Git** - для клонування шаблонів і контролю версій
- **Docker** (за бажанням) - для контейнерних застосунків

## Методи встановлення

### Windows

#### Варіант 1: Windows Package Manager (Рекомендовано)
```cmd
winget install microsoft.azd
```

#### Варіант 2: PowerShell скрипт встановлення
```powershell
# Корисно, коли winget недоступний
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Варіант 3: Chocolatey
```cmd
choco install azd
```

#### Варіант 4: Ручне встановлення
1. Завантажте останній реліз з [GitHub](https://github.com/Azure/azure-dev/releases)
2. Розпакуйте у `C:\Program Files\azd\`
3. Додайте до змінної середовища PATH

### macOS

#### Варіант 1: Homebrew (Рекомендовано)
```bash
brew tap azure/azd
brew install azd
```

#### Варіант 2: Скрипт встановлення
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 3: Ручне встановлення
```bash
# Завантажити та встановити
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Варіант 1: Скрипт встановлення (Рекомендовано)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 2: Менеджери пакетів

**Ручне встановлення з релізних пакетів:**
```bash
# Завантажте останній архів для вашої архітектури Linux з:
# https://github.com/Azure/azure-dev/releases
# Потім розпакуйте його та додайте двійковий файл azd до вашого PATH.
```

### GitHub Codespaces

Деякі середовища Codespaces і контейнерів для розробки вже містять `azd`, але вам слід це перевірити, а не припускати:

```bash
azd version
```

Якщо `azd` немає, встановіть його за допомогою стандартного скрипта для вашого середовища.

### Docker

```bash
# Запустіть azd у контейнері
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Створіть псевдонім для легшого використання
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Перевірка встановлення

Після встановлення переконайтеся, що azd працює правильно:

```bash
# Перевірити версію
azd version

# Переглянути допомогу
azd --help

# Показати наявні шаблони
azd template list
```

Очікуваний вивід:
```
azd version 1.x.x (commit xxxxxx)
```

**Примітка**: Фактичний номер версії може відрізнятися. Перевірте [релізи Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для останньої версії.

**✅ Контрольний список успішного встановлення:**
- [ ] `azd version` показує номер версії без помилок
- [ ] `azd --help` відображає документацію по командах
- [ ] `azd template list` показує доступні шаблони
- [ ] Ви можете створити тестовий каталог і успішно виконати `azd init`

**Якщо всі перевірки пройдені, можна переходити до [Вашого першого проекту](first-project.md)!**

## Налаштування автентифікації

### Рекомендоване налаштування для початківців

Для AZD-орієнтованих робочих процесів увійдіть за допомогою `azd auth login`.

```bash
# Необхідно для команд AZD, таких як azd up
azd auth login

# Перевірити стан автентифікації AZD
azd auth login --check-status
```

Використовуйте вхід через Azure CLI лише якщо плануєте запускати `az` команди самостійно під час курсу.

### Автентифікація через Azure CLI (за бажанням)
```bash
# Встановіть Azure CLI, якщо він ще не встановлений
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: дивіться документацію встановлення Azure CLI для вашого дистрибутива

# Увійдіть в Azure
az login

# Перевірте автентифікацію
az account show
```

### Який спосіб входу вам слід використовувати?

- Використовуйте `azd auth login`, якщо ви слідуєте початковому шляху AZD і переважно запускаєте команди `azd`.
- Використовуйте також `az login`, коли хочете запускати команди Azure CLI, як-от `az account show` або безпосередньо перевіряти ресурси.
- Якщо в завданні є і `azd`, і `az` команди, виконайте обидва способи входу один раз на початку.

### Автентифікація за допомогою Device Code
Якщо у вас безголова система або проблеми з браузером:
```bash
azd auth login --use-device-code
```

### Сервісний принципал (CI/CD)
Для автоматизованих середовищ:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Перевірте повну конфігурацію

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
# Встановити підписку за замовчуванням
azd config set defaults.subscription <subscription-id>

# Встановити місцезнаходження за замовчуванням
azd config set defaults.location eastus2

# Переглянути всі налаштування
azd config show
```

### Змінні середовища
Додайте до профілю вашої оболонки (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфігурація Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфігурація azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Увімкнути налагоджувальне логування
```

## Інтеграція з IDE

### Visual Studio Code
Встановіть розширення Azure Developer CLI:
1. Відкрийте VS Code
2. Перейдіть до розширень (Ctrl+Shift+X)
3. Знайдіть "Azure Developer CLI"
4. Встановіть розширення

Функції:
- IntelliSense для azure.yaml
- Інтегрований термінал
- Перегляд шаблонів
- Моніторинг розгортання

### GitHub Codespaces
Створіть файл `.devcontainer/devcontainer.json`:
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

## 🐛 Вирішення проблем з установкою

### Поширені проблеми

#### Відмовлено у доступі (Windows)
```powershell
# Запустіть PowerShell від імені адміністратора
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми зі змінною PATH
Додайте azd до вашого PATH вручну:

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
# Налаштувати проксі
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропустити перевірку SSL (не рекомендується для продакшну)
azd config set http.insecure true
```

#### Конфлікти версій
```bash
# Видалити старі інсталяції
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: видаліть попередній виконуваний файл azd або символічне посилання перед перевстановленням

# Очищення конфігурації
rm -rf ~/.azd
```

### Як отримати додаткову допомогу
```bash
# Увімкнути журналювання відлагодження
export AZD_DEBUG=true
azd <command> --debug

# Переглянути поточну конфігурацію
azd config show

# Переглянути поточний стан розгортання
azd show
```

## Оновлення azd

### Перевірка оновлень
azd попереджає, коли доступна нова версія, і ви можете перевірити вашу поточну збірку командою:
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

## 💡 Поширені запитання

<details>
<summary><strong>Чим azd відрізняється від az CLI?</strong></summary>

**Azure CLI (az)**: Інструмент низького рівня для управління окремими ресурсами Azure
- `az webapp create`, `az storage account create`
- Один ресурс за раз
- Орієнтація на управління інфраструктурою

**Azure Developer CLI (azd)**: Інструмент високого рівня для повного розгортання застосунків
- `azd up` розгортає весь додаток з усіма ресурсами
- Робочі процеси на основі шаблонів
- Фокус на продуктивність розробника

**Вам потрібні обидва**: azd використовує az CLI для автентифікації
</details>

<details>
<summary><strong>Чи можна використовувати azd з існуючими ресурсами Azure?</strong></summary>

Так! Ви можете:
1. Імпортувати існуючі ресурси в середовища azd
2. Посилатися на існуючі ресурси у ваших шаблонах Bicep
3. Використовувати azd для нових розгортань разом із існуючою інфраструктурою

Дивіться [Посібник з конфігурації](configuration.md) для деталей.
</details>

<details>
<summary><strong>Чи працює azd з Azure Government або Azure China?</strong></summary>

Так, налаштуйте хмару:
```bash
# Azure Уряд
az cloud set --name AzureUSGovernment
az login

# Azure Китай
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Чи можна використовувати azd у CI/CD конвеєрах?</strong></summary>

Абсолютно! azd створений для автоматизації:
- Інтеграція з GitHub Actions
- Підтримка Azure DevOps
- Автентифікація через сервісний принципал
- Режим без взаємодії з користувачем

Дивіться [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) для шаблонів CI/CD.
</details>

<details>
<summary><strong>Скільки коштує використання azd?</strong></summary>

azd є **повністю безкоштовним** та відкритим. Ви сплачуєте лише за:
- Ресурси Azure, які ви розгортаєте
- Витрати Azure на споживання (обчислювальні ресурси, сховище тощо)

Використовуйте `azd provision --preview` для оцінки вартості перед розгортанням.
</details>

## Наступні кроки

1. **Завершіть автентифікацію**: Переконайтеся, що можете отримати доступ до вашої підписки Azure
2. **Спробуйте перше розгортання**: Виконайте інструкції з [Першого проекту](first-project.md)
3. **Огляньте шаблони**: Перегляньте доступні шаблони за допомогою `azd template list`
4. **Налаштуйте IDE**: Підготуйте своє середовище розробки

## Підтримка

Якщо у вас виникли проблеми:
- [Офіційна документація](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Повідомити про помилки](https://github.com/Azure/azure-dev/issues)
- [Обговорення спільноти](https://github.com/Azure/azure-dev/discussions)
- [Підтримка Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - отримуйте підказки для команд Azure безпосередньо у редакторі за допомогою `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md)
- **➡️ Наступний**: [Ваш перший проєкт](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з акцентом на ШІ](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Встановлення завершено!** Продовжуйте до [Вашого першого проєкту](first-project.md) щоб почати працювати з azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматизовані переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння чи неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->