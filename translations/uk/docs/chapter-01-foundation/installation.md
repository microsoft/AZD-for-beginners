# Посібник з встановлення та налаштування

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD Для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md)
- **➡️ Наступний**: [Ваш перший проєкт](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з пріоритетом на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Вступ

Цей всеосяжний посібник проведе вас через процес встановлення та налаштування Azure Developer CLI (azd) на вашій системі. Ви дізнаєтеся кілька методів встановлення для різних операційних систем, налаштування аутентифікації та початкову конфігурацію для підготовки вашого середовища розробки до розгортання в Azure.

## Цілі навчання

Після завершення цього уроку ви:
- Успішно встановите Azure Developer CLI на вашу операційну систему
- Налаштуєте автентифікацію з Azure за допомогою кількох методів
- Підготуєте своє середовище розробки з необхідними передумовами
- Зрозумієте різні варіанти встановлення та коли кожен з них використовувати
- Навчитесь усувати поширені проблеми при встановленні та налаштуванні

## Результати навчання

Після проходження цього уроку ви зможете:
- Встановлювати azd за відповідним методом для вашої платформи
- Аутентифікуватись у Azure за допомогою azd auth login
- Перевірити встановлення та протестувати базові команди azd
- Налаштувати своє середовище розробки для оптимального використання azd
- Самостійно розв’язувати поширені проблеми з встановленням

Цей посібник допоможе вам встановити та налаштувати Azure Developer CLI на вашій системі, незалежно від операційної системи або середовища розробки.

## Передумови

Перед встановленням azd переконайтеся, що у вас є:
- **Підписка Azure** - [Створіть безкоштовний обліковий запис](https://azure.microsoft.com/free/)
- **Azure CLI** - для аутентифікації та керування ресурсами
- **Git** - для клонування шаблонів та контролю версій
- **Docker** (необов’язково) - для контейнеризованих додатків

## Методи встановлення

### Windows

#### Варіант 1: PowerShell (рекомендовано)
```powershell
# Запустіть від імені адміністратора або з підвищеними правами
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Варіант 2: Менеджер пакетів Windows (winget)
```cmd
winget install Microsoft.Azd
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

#### Варіант 2: Інсталяційний скрипт
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 3: Ручне встановлення
```bash
# Завантажити та встановити
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Варіант 1: Інсталяційний скрипт (рекомендовано)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Варіант 2: Менеджери пакетів

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
# Додати репозиторій пакунків Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd встановлено за замовчуванням у GitHub Codespaces. Просто створіть codespace і починайте використовувати azd одразу.

### Docker

```bash
# Запустіть azd у контейнері
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Створіть псевдонім для легшого використання
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Перевірка встановлення

Після встановлення перевірте, чи azd працює коректно:

```bash
# Перевірити версію
azd version

# Переглянути допомогу
azd --help

# Список доступних шаблонів
azd template list
```

Очікуваний результат:
```
azd version 1.x.x (commit xxxxxx)
```

**Примітка**: Фактичний номер версії може змінюватись. Перевірте [релізи Azure Developer CLI](https://github.com/Azure/azure-dev/releases) для останньої версії.

**✅ Контрольний список успішного встановлення:**
- [ ] `azd version` показує номер версії без помилок
- [ ] `azd --help` відображає документацію з команд
- [ ] `azd template list` показує наявні шаблони
- [ ] `az account show` показує вашу підписку Azure
- [ ] Ви можете створити тестовий каталог і успішно виконати `azd init`

**Якщо всі перевірки пройдені, ви готові перейти до [Вашого першого проєкту](first-project.md)!**

## Налаштування аутентифікації

### Аутентифікація через Azure CLI (рекомендовано)
```bash
# Встановіть Azure CLI, якщо він ще не встановлений
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Увійдіть в Azure
az login

# Перевірте автентифікацію
az account show
```

### Аутентифікація через код пристрою
Якщо ви працюєте в системі без інтерфейсу або маєте проблеми з браузером:
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

## Конфігурація

### Глобальна конфігурація
```bash
# Встановити підписку за замовчуванням
azd config set defaults.subscription <subscription-id>

# Встановити місцезнаходження за замовчуванням
azd config set defaults.location eastus2

# Переглянути всі налаштування
azd config list
```

### Змінні оточення
Додайте у ваш профіль shell (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Конфігурація Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Конфігурація azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Увімкнути ведення журналу відлагодження
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
- Огляд шаблонів
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

## 🐛 Усунення неполадок встановлення

### Поширені проблеми

#### Відмова в доступі (Windows)
```powershell
# Запустіть PowerShell від імені адміністратора
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Проблеми зі змінною PATH
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
# Налаштувати проксі
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Пропустити перевірку SSL (не рекомендується для виробництва)
azd config set http.insecure true
```

#### Конфлікти версій
```bash
# Видалити старі інсталяції
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Очистити конфігурацію
rm -rf ~/.azd
```

### Отримання додаткової допомоги
```bash
# Увімкнути журналювання відладки
export AZD_DEBUG=true
azd <command> --debug

# Переглянути поточну конфігурацію
azd config list

# Переглянути поточний статус розгортання
azd show
```

## Оновлення azd

### Автоматичні оновлення
azd повідомить вас, коли доступні оновлення:
```bash
azd version --check-for-updates
```

### Ручні оновлення

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

## 💡 Часті питання

<details>
<summary><strong>У чому різниця між azd та az CLI?</strong></summary>

**Azure CLI (az)**: Низькорівневий інструмент для керування окремими ресурсами Azure
- `az webapp create`, `az storage account create`
- По одному ресурсу за раз
- Орієнтований на управління інфраструктурою

**Azure Developer CLI (azd)**: Високорівневий інструмент для повного розгортання додатків
- `azd up` розгортає увесь додаток з усіма ресурсами
- Робочі процеси на основі шаблонів
- Орієнтований на продуктивність розробника

**Вам потрібні обидва**: azd використовує az CLI для аутентифікації
</details>

<details>
<summary><strong>Чи можна використовувати azd з існуючими ресурсами Azure?</strong></summary>

Так! Ви можете:
1. Імпортувати існуючі ресурси в середовища azd
2. Посилатися на існуючі ресурси у ваших шаблонах Bicep
3. Використовувати azd для нових розгортань поряд із існуючою інфраструктурою

Деталі дивіться у [Посібнику з конфігурації](configuration.md).
</details>

<details>
<summary><strong>Чи працює azd з Azure Government або Azure China?</strong></summary>

Так, налаштуйте відповідне хмарне середовище:
```bash
# Azure урядовий
az cloud set --name AzureUSGovernment
az login

# Azure Китай
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Чи можна використовувати azd у CI/CD пайплайнах?</strong></summary>

Звичайно! azd створено для автоматизації:
- Інтеграція з GitHub Actions
- Підтримка Azure DevOps
- Аутентифікація сервісним обліковим записом
- Безінтерактивний режим

Дивіться [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) для прикладів CI/CD.
</details>

<details>
<summary><strong>Які витрати пов'язані з використанням azd?</strong></summary>

azd є **повністю безкоштовним** та з відкритим кодом. Ви сплачуєте лише за:
- Ресурси Azure, які ви розгортаєте
- Вартість споживання Azure (обчислення, зберігання тощо)

Використовуйте `azd provision --preview` для оцінки витрат перед розгортанням.
</details>

## Наступні кроки

1. **Завершіть аутентифікацію**: Переконайтеся, що маєте доступ до вашої підписки Azure
2. **Спробуйте перше розгортання**: Дотримуйтесь [Посібника першого проєкту](first-project.md)
3. **Огляньте шаблони**: Перегляньте доступні шаблони за допомогою `azd template list`
4. **Налаштуйте ваше IDE**: Підготуйте середовище розробки

## Підтримка

Якщо виникнуть проблеми:
- [Офіційна документація](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Повідомити про проблему](https://github.com/Azure/azure-dev/issues)
- [Обговорення спільноти](https://github.com/Azure/azure-dev/discussions)
- [Підтримка Azure](https://azure.microsoft.com/support/)
- [**Навички агента Azure**](https://skills.sh/microsoft/github-copilot-for-azure) – отримуйте підказки команд Azure прямо у вашому редакторі за допомогою `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD Для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 1 - Основи та швидкий старт
- **⬅️ Попередній**: [Основи AZD](azd-basics.md)
- **➡️ Наступний**: [Ваш перший проєкт](first-project.md)
- **🚀 Наступний розділ**: [Розділ 2: Розробка з пріоритетом на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Встановлення завершено!** Продовжуйте до [Вашого першого проєкту](first-project.md), щоб почати роботу з azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->