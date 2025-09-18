<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-18T11:42:16+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sr"
}
-->
# AZD Основе - Разумевање Azure Developer CLI

# AZD Основе - Кључни концепти и основе

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и брзи почетак
- **⬅️ Претходно**: [Преглед курса](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Следеће**: [Инсталација и подешавање](installation.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој заснован на вештачкој интелигенцији](../ai-foundry/azure-ai-foundry-integration.md)

## Увод

Ова лекција вас упознаје са Azure Developer CLI (azd), моћним алатом командне линије који убрзава ваш пут од локалног развоја до Azure имплементације. Научићете основне концепте, кључне функције и како azd поједностављује имплементацију апликација у облаку.

## Циљеви учења

На крају ове лекције, моћи ћете да:
- Разумете шта је Azure Developer CLI и његову основну сврху
- Научите кључне концепте као што су шаблони, окружења и услуге
- Истражите главне функције, укључујући развој заснован на шаблонима и инфраструктуру као код
- Разумете структуру и ток рада azd пројекта
- Будете спремни за инсталацију и конфигурацију azd-а за ваше развојно окружење

## Исходи учења

Након завршетка ове лекције, бићете у могућности да:
- Објасните улогу azd-а у савременим радним токовима развоја у облаку
- Идентификујете компоненте структуре azd пројекта
- Описујете како шаблони, окружења и услуге функционишу заједно
- Разумете предности инфраструктуре као кода са azd-ом
- Препознате различите azd команде и њихове сврхе

## Шта је Azure Developer CLI (azd)?

Azure Developer CLI (azd) је алат командне линије дизајниран да убрза ваш пут од локалног развоја до Azure имплементације. Поједностављује процес изградње, имплементације и управљања апликацијама у облаку на Azure-у.

## Кључни концепти

### Шаблони
Шаблони су основа azd-а. Они садрже:
- **Код апликације** - Ваш изворни код и зависности
- **Дефиниције инфраструктуре** - Azure ресурси дефинисани у Bicep-у или Terraform-у
- **Конфигурационе датотеке** - Подешавања и променљиве окружења
- **Скрипте за имплементацију** - Аутоматизовани токови имплементације

### Окружења
Окружења представљају различите циљеве имплементације:
- **Развојно** - За тестирање и развој
- **Сценско** - Предпродукцијско окружење
- **Продукцијско** - Живо продукцијско окружење

Свака средина одржава своје:
- Azure групе ресурса
- Конфигурационе поставке
- Стање имплементације

### Услуге
Услуге су градивни блокови ваше апликације:
- **Фронтенд** - Веб апликације, SPA-ови
- **Бекенд** - API-ји, микросервисе
- **База података** - Решења за складиштење података
- **Складиште** - Фајлови и blob складиште

## Кључне функције

### 1. Развој заснован на шаблонима
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Инфраструктура као код
- **Bicep** - Azure-ов доменски специфичан језик
- **Terraform** - Алат за мулти-облачну инфраструктуру
- **ARM шаблони** - Azure Resource Manager шаблони

### 3. Интегрисани токови рада
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Управљање окружењима
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Структура пројекта

Типична структура azd пројекта:
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

## 🔧 Конфигурационе датотеке

### azure.yaml
Главна конфигурациона датотека пројекта:
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
Конфигурација специфична за окружење:
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

## 🎪 Уобичајени токови рада

### Започињање новог пројекта
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Циклус развоја
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

## Разумевање `azd down --force --purge`
Команда `azd down --force --purge` је моћан начин за потпуно уклањање вашег azd окружења и свих повезаних ресурса. Ево шта свака опција ради:
```
--force
```
- Прескаче потврде.
- Корисно за аутоматизацију или скриптовање где ручни унос није могућ.
- Осигурава да се уклањање настави без прекида, чак и ако CLI открије недоследности.

```
--purge
```
Брише **све повезане метаподатке**, укључујући:
Стање окружења  
Локалну `.azure` фасциклу  
Кеширане информације о имплементацији  
Спречава azd да "памти" претходне имплементације, што може изазвати проблеме као што су неусклађене групе ресурса или застареле референце регистра.

### Зашто користити оба?
Када наиђете на проблеме са `azd up` због преосталог стања или делимичних имплементација, ова комбинација осигурава **чист почетак**.

Посебно је корисно након ручног брисања ресурса у Azure порталу или приликом промене шаблона, окружења или конвенција именовања група ресурса.

### Управљање више окружења
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

## 🧭 Команде за навигацију

### Откривање
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Управљање пројектима
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Надгледање
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Најбоље праксе

### 1. Користите смислена имена
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Искористите шаблоне
- Почните са постојећим шаблонима
- Прилагодите их својим потребама
- Креирајте поново употребљиве шаблоне за вашу организацију

### 3. Изолација окружења
- Користите одвојена окружења за развој/сценско/продукцијско
- Никада не имплементирајте директно у продукцију са локалног рачунара
- Користите CI/CD токове за продукцијске имплементације

### 4. Управљање конфигурацијом
- Користите променљиве окружења за осетљиве податке
- Чувајте конфигурацију у систему за контролу верзија
- Документујте подешавања специфична за окружење

## Прогресија учења

### Почетник (1-2 недеље)
1. Инсталирајте azd и аутентификујте се
2. Имплементирајте једноставан шаблон
3. Разумите структуру пројекта
4. Научите основне команде (up, down, deploy)

### Средњи ниво (3-4 недеље)
1. Прилагодите шаблоне
2. Управљајте више окружења
3. Разумите инфраструктурни код
4. Поставите CI/CD токове

### Напредни ниво (5+ недеља)
1. Креирајте прилагођене шаблоне
2. Напредни инфраструктурни обрасци
3. Имплементације у више региона
4. Конфигурације за предузећа

## Следећи кораци

**📖 Наставите учење у Поглављу 1:**
- [Инсталација и подешавање](installation.md) - Инсталирајте и конфигуришите azd
- [Ваш први пројекат](first-project.md) - Завршите практични туторијал
- [Водич за конфигурацију](configuration.md) - Напредне опције конфигурације

**🎯 Спремни за следеће поглавље?**
- [Поглавље 2: Развој заснован на вештачкој интелигенцији](../ai-foundry/azure-ai-foundry-integration.md) - Почните са изградњом AI апликација

## Додатни ресурси

- [Azure Developer CLI Преглед](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Галерија шаблона](https://azure.github.io/awesome-azd/)
- [Примери из заједнице](https://github.com/Azure-Samples)

---

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и брзи почетак  
- **⬅️ Претходно**: [Преглед курса](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Следеће**: [Инсталација и подешавање](installation.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој заснован на вештачкој интелигенцији](../ai-foundry/azure-ai-foundry-integration.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.