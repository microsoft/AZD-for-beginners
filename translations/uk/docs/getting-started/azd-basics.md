<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:15:16+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "uk"
}
-->
# Основи AZD - Розуміння Azure Developer CLI

## Вступ

Цей урок знайомить вас із Azure Developer CLI (azd), потужним інструментом командного рядка, який прискорює ваш шлях від локальної розробки до розгортання в Azure. Ви дізнаєтеся про основні концепції, ключові функції та зрозумієте, як azd спрощує розгортання хмарних додатків.

## Цілі навчання

До кінця цього уроку ви:
- Зрозумієте, що таке Azure Developer CLI і його основне призначення
- Вивчите основні концепції шаблонів, середовищ і сервісів
- Ознайомитеся з ключовими функціями, включаючи розробку на основі шаблонів та Infrastructure as Code
- Зрозумієте структуру проекту azd і робочий процес
- Будете готові встановити та налаштувати azd для вашого середовища розробки

## Результати навчання

Після завершення цього уроку ви зможете:
- Пояснити роль azd у сучасних робочих процесах хмарної розробки
- Визначити компоненти структури проекту azd
- Описати, як шаблони, середовища та сервіси працюють разом
- Зрозуміти переваги Infrastructure as Code з azd
- Розпізнавати різні команди azd та їх призначення

## Що таке Azure Developer CLI (azd)?

Azure Developer CLI (azd) — це інструмент командного рядка, створений для прискорення вашого переходу від локальної розробки до розгортання в Azure. Він спрощує процес створення, розгортання та управління хмарними додатками на Azure.

## Основні концепції

### Шаблони
Шаблони є основою azd. Вони містять:
- **Код додатка** - Ваш вихідний код і залежності
- **Визначення інфраструктури** - Ресурси Azure, визначені в Bicep або Terraform
- **Файли конфігурації** - Налаштування та змінні середовища
- **Скрипти розгортання** - Автоматизовані робочі процеси розгортання

### Середовища
Середовища представляють різні цілі розгортання:
- **Розробка** - Для тестування та розробки
- **Стадія** - Передвиробниче середовище
- **Виробництво** - Робоче виробниче середовище

Кожне середовище має власні:
- Групу ресурсів Azure
- Налаштування конфігурації
- Стан розгортання

### Сервіси
Сервіси є будівельними блоками вашого додатка:
- **Фронтенд** - Веб-додатки, SPA
- **Бекенд** - API, мікросервіси
- **База даних** - Рішення для зберігання даних
- **Сховище** - Файлове та блобове сховище

## Ключові функції

### 1. Розробка на основі шаблонів
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Спеціалізована мова Azure
- **Terraform** - Інструмент для багатохмарної інфраструктури
- **ARM Templates** - Шаблони Azure Resource Manager

### 3. Інтегровані робочі процеси
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Управління середовищами
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Структура проекту

Типова структура проекту azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Файли конфігурації

### azure.yaml
Основний файл конфігурації проекту:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Конфігурація, специфічна для середовища:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Загальні робочі процеси

### Початок нового проекту
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Цикл розробки
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Управління кількома середовищами
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Команди навігації

### Відкриття
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Управління проектом
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Моніторинг
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Найкращі практики

### 1. Використовуйте змістовні назви
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Використовуйте шаблони
- Починайте з існуючих шаблонів
- Налаштовуйте під свої потреби
- Створюйте багаторазові шаблони для вашої організації

### 3. Ізоляція середовищ
- Використовуйте окремі середовища для розробки/стадії/виробництва
- Ніколи не розгортайте безпосередньо у виробництво з локальної машини
- Використовуйте CI/CD конвеєри для розгортання у виробництво

### 4. Управління конфігурацією
- Використовуйте змінні середовища для конфіденційних даних
- Зберігайте конфігурацію у системі контролю версій
- Документуйте налаштування, специфічні для середовища

## Прогрес навчання

### Початківець (1-2 тиждень)
1. Встановіть azd і автентифікуйтеся
2. Розгорніть простий шаблон
3. Зрозумійте структуру проекту
4. Вивчіть основні команди (up, down, deploy)

### Середній рівень (3-4 тиждень)
1. Налаштуйте шаблони
2. Управляйте кількома середовищами
3. Зрозумійте код інфраструктури
4. Налаштуйте CI/CD конвеєри

### Просунутий рівень (5+ тиждень)
1. Створюйте власні шаблони
2. Складні інфраструктурні патерни
3. Розгортання у кількох регіонах
4. Конфігурації корпоративного рівня

## Наступні кроки

- [Встановлення та налаштування](installation.md) - Встановіть та налаштуйте azd
- [Ваш перший проект](first-project.md) - Практичний урок
- [Посібник з конфігурації](configuration.md) - Розширені параметри конфігурації

## Додаткові ресурси

- [Огляд Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Галерея шаблонів](https://azure.github.io/awesome-azd/)
- [Зразки спільноти](https://github.com/Azure-Samples)

---

**Навігація**
- **Попередній урок**: [README](../../README.md)
- **Наступний урок**: [Встановлення та налаштування](installation.md)

---

**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.