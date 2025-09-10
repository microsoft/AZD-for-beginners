<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:39:12+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "bg"
}
-->
# Основи на AZD - Разбиране на Azure Developer CLI

## Въведение

Този урок ще ви запознае с Azure Developer CLI (azd), мощен инструмент за команден ред, който ускорява прехода ви от локална разработка към внедряване в Azure. Ще научите основните концепции, ключовите функции и как azd опростява внедряването на облачни приложения.

## Цели на обучението

До края на този урок ще можете:
- Да разберете какво представлява Azure Developer CLI и основната му цел
- Да научите основните концепции за шаблони, среди и услуги
- Да изследвате ключови функции като разработка, базирана на шаблони, и Infrastructure as Code
- Да разберете структурата и работния процес на проектите в azd
- Да сте подготвени за инсталиране и конфигуриране на azd за вашата среда за разработка

## Резултати от обучението

След завършване на този урок ще можете:
- Да обясните ролята на azd в съвременните работни процеси за облачна разработка
- Да идентифицирате компонентите на структурата на проект в azd
- Да опишете как шаблоните, средите и услугите работят заедно
- Да разберете предимствата на Infrastructure as Code с azd
- Да разпознавате различни команди на azd и техните цели

## Какво е Azure Developer CLI (azd)?

Azure Developer CLI (azd) е инструмент за команден ред, създаден да ускори прехода ви от локална разработка към внедряване в Azure. Той опростява процеса на изграждане, внедряване и управление на облачни приложения в Azure.

## Основни концепции

### Шаблони
Шаблоните са основата на azd. Те съдържат:
- **Код на приложението** - Вашият изходен код и зависимости
- **Дефиниции на инфраструктурата** - Azure ресурси, дефинирани с Bicep или Terraform
- **Конфигурационни файлове** - Настройки и променливи на средата
- **Скриптове за внедряване** - Автоматизирани работни потоци за внедряване

### Среди
Средите представляват различни цели за внедряване:
- **Разработка** - За тестване и разработка
- **Staging** - Предпроизводствена среда
- **Производство** - Жива производствена среда

Всяка среда поддържа свои собствени:
- Azure ресурсна група
- Конфигурационни настройки
- Състояние на внедряване

### Услуги
Услугите са градивните елементи на вашето приложение:
- **Frontend** - Уеб приложения, SPAs
- **Backend** - API-та, микросървиси
- **База данни** - Решения за съхранение на данни
- **Съхранение** - Файлово и blob съхранение

## Ключови функции

### 1. Разработка, базирана на шаблони
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Домейн-специфичен език на Azure
- **Terraform** - Инструмент за мултиоблачна инфраструктура
- **ARM Templates** - Шаблони на Azure Resource Manager

### 3. Интегрирани работни потоци
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Управление на среди
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Структура на проекта

Типична структура на проект в azd:
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

## 🔧 Конфигурационни файлове

### azure.yaml
Основният конфигурационен файл на проекта:
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
Конфигурация, специфична за средата:
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

## 🎪 Често срещани работни потоци

### Стартиране на нов проект
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Цикъл на разработка
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
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Разбиране на `azd down --force --purge`
Командата `azd down --force --purge` е мощен начин за пълно премахване на вашата azd среда и всички свързани ресурси. Ето разбивка на това, което прави всеки флаг:
```
--force
```
- Пропуска потвърждаващите подкани.
- Полезно за автоматизация или скриптове, където ръчното въвеждане не е възможно.
- Гарантира, че премахването продължава без прекъсване, дори ако CLI открие несъответствия.

```
--purge
```
Изтрива **цялата свързана метаинформация**, включително:
Състояние на средата  
Локалната папка `.azure`  
Кеширана информация за внедряване  
Предотвратява "запомнянето" на предишни внедрявания от azd, което може да причини проблеми като несъответстващи ресурсни групи или остарели препратки към регистри.

### Защо да използвате и двете?
Когато срещнете проблеми с `azd up` поради остатъчно състояние или частични внедрявания, тази комбинация осигурява **чиста основа**.

Особено полезно е след ръчно изтриване на ресурси в Azure портала или при смяна на шаблони, среди или конвенции за именуване на ресурсни групи.

### Управление на множество среди
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

## 🧭 Команди за навигация

### Откриване
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Управление на проекти
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Мониторинг
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Най-добри практики

### 1. Използвайте смислени имена
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Възползвайте се от шаблони
- Започнете с налични шаблони
- Персонализирайте според нуждите си
- Създавайте повторно използваеми шаблони за вашата организация

### 3. Изолация на среди
- Използвайте отделни среди за разработка/staging/производство
- Никога не внедрявайте директно в производството от локалната машина
- Използвайте CI/CD тръбопроводи за внедрявания в производството

### 4. Управление на конфигурацията
- Използвайте променливи на средата за чувствителни данни
- Поддържайте конфигурацията под версия контрол
- Документирайте настройките, специфични за средата

## Прогресия на обучението

### Начинаещи (Седмица 1-2)
1. Инсталирайте azd и се автентикирайте
2. Внедрете прост шаблон
3. Разберете структурата на проекта
4. Научете основни команди (up, down, deploy)

### Средно ниво (Седмица 3-4)
1. Персонализирайте шаблони
2. Управлявайте множество среди
3. Разберете инфраструктурния код
4. Настройте CI/CD тръбопроводи

### Напреднали (Седмица 5+)
1. Създавайте персонализирани шаблони
2. Напреднали инфраструктурни модели
3. Внедрявания в множество региони
4. Конфигурации на корпоративно ниво

## Следващи стъпки

- [Инсталиране и настройка](installation.md) - Инсталирайте и конфигурирайте azd
- [Вашият първи проект](first-project.md) - Практическо ръководство
- [Ръководство за конфигурация](configuration.md) - Разширени опции за конфигурация

## Допълнителни ресурси

- [Преглед на Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Галерия с шаблони](https://azure.github.io/awesome-azd/)
- [Примерни проекти от общността](https://github.com/Azure-Samples)

---

**Навигация**
- **Предишен урок**: [README](../../README.md)
- **Следващ урок**: [Инсталиране и настройка](installation.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматичните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия изходен език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Ние не носим отговорност за каквито и да е недоразумения или погрешни интерпретации, произтичащи от използването на този превод.