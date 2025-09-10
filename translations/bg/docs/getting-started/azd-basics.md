<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:13:12+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "bg"
}
-->
# Основи на AZD - Разбиране на Azure Developer CLI

## Въведение

Този урок ще ви запознае с Azure Developer CLI (azd), мощен инструмент за команден ред, който ускорява прехода ви от локална разработка към внедряване в Azure. Ще научите основните концепции, ключовите функции и как azd опростява внедряването на облачно-нативни приложения.

## Цели на обучението

До края на този урок ще можете:
- Да разберете какво представлява Azure Developer CLI и основната му цел
- Да научите основните концепции за шаблони, среди и услуги
- Да изследвате ключови функции, включително разработка, базирана на шаблони, и Infrastructure as Code
- Да разберете структурата и работния процес на проектите в azd
- Да сте подготвени за инсталиране и конфигуриране на azd за вашата среда за разработка

## Резултати от обучението

След като завършите този урок, ще можете:
- Да обясните ролята на azd в съвременните работни процеси за облачна разработка
- Да идентифицирате компонентите на структурата на проект в azd
- Да опишете как шаблоните, средите и услугите работят заедно
- Да разберете ползите от Infrastructure as Code с azd
- Да разпознавате различни команди на azd и техните цели

## Какво е Azure Developer CLI (azd)?

Azure Developer CLI (azd) е инструмент за команден ред, създаден да ускори прехода ви от локална разработка към внедряване в Azure. Той опростява процеса на създаване, внедряване и управление на облачно-нативни приложения в Azure.

## Основни концепции

### Шаблони
Шаблоните са основата на azd. Те съдържат:
- **Код на приложението** - Вашият изходен код и зависимости
- **Дефиниции на инфраструктурата** - Azure ресурси, дефинирани с Bicep или Terraform
- **Конфигурационни файлове** - Настройки и променливи на средата
- **Скриптове за внедряване** - Автоматизирани работни процеси за внедряване

### Среда
Средите представляват различни цели за внедряване:
- **Разработка** - За тестване и разработка
- **Staging** - Предпроизводствена среда
- **Производство** - Жива производствена среда

Всяка среда поддържа свои собствени:
- Група ресурси в Azure
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

### 3. Интегрирани работни процеси
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
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

## 🎪 Често срещани работни процеси

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
azd down --force --purge
```

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
- Персонализирайте според вашите нужди
- Създавайте повторно използваеми шаблони за вашата организация

### 3. Изолация на среди
- Използвайте отделни среди за разработка/staging/производство
- Никога не внедрявайте директно в производствена среда от локалната машина
- Използвайте CI/CD пайплайни за внедряване в производствена среда

### 4. Управление на конфигурацията
- Използвайте променливи на средата за чувствителни данни
- Поддържайте конфигурацията под версионен контрол
- Документирайте настройки, специфични за средата

## Прогресия на обучението

### Начинаещи (Седмица 1-2)
1. Инсталирайте azd и се автентикирайте
2. Внедрете прост шаблон
3. Разберете структурата на проекта
4. Научете основни команди (up, down, deploy)

### Средно напреднали (Седмица 3-4)
1. Персонализирайте шаблони
2. Управлявайте множество среди
3. Разберете кода за инфраструктурата
4. Настройте CI/CD пайплайни

### Напреднали (Седмица 5+)
1. Създавайте персонализирани шаблони
2. Напреднали инфраструктурни модели
3. Внедряване в множество региони
4. Конфигурации за корпоративно ниво

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
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматичните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия изходен език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Ние не носим отговорност за каквито и да било недоразумения или погрешни интерпретации, произтичащи от използването на този превод.