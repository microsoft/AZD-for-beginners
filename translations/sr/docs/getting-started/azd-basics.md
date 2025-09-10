<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:13:35+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sr"
}
-->
# Основе AZD - Разумевање Azure Developer CLI

## Увод

Ова лекција вас упознаје са Azure Developer CLI (azd), моћним алатом командне линије који убрзава ваш пут од локалног развоја до Azure имплементације. Научићете основне концепте, кључне функције и како azd поједностављује имплементацију cloud-native апликација.

## Циљеви учења

До краја ове лекције, моћи ћете да:
- Разумете шта је Azure Developer CLI и његова основна сврха
- Научите основне концепте шаблона, окружења и услуга
- Истражите кључне функције, укључујући развој заснован на шаблонима и Infrastructure as Code
- Разумете структуру и ток рада azd пројекта
- Будете спремни за инсталацију и конфигурацију azd за ваше развојно окружење

## Исходи учења

Након завршетка ове лекције, бићете у могућности да:
- Објасните улогу azd у савременим cloud развојним токовима
- Идентификујете компоненте структуре azd пројекта
- Описујете како шаблони, окружења и услуге функционишу заједно
- Разумете предности Infrastructure as Code са azd
- Препознате различите azd команде и њихове сврхе

## Шта је Azure Developer CLI (azd)?

Azure Developer CLI (azd) је алат командне линије дизајниран да убрза ваш пут од локалног развоја до Azure имплементације. Поједностављује процес изградње, имплементације и управљања cloud-native апликацијама на Azure-у.

## Основни концепти

### Шаблони
Шаблони су основа azd-а. Они садрже:
- **Код апликације** - Ваш изворни код и зависности
- **Дефиниције инфраструктуре** - Azure ресурси дефинисани у Bicep-у или Terraform-у
- **Конфигурационе датотеке** - Подешавања и променљиве окружења
- **Скрипте за имплементацију** - Аутоматизовани токови имплементације

### Окружења
Окружења представљају различите циљеве имплементације:
- **Развојно** - За тестирање и развој
- **Staging** - Предпродукционо окружење
- **Продукционо** - Живо продукционо окружење

Свака окружење одржава своје:
- Azure ресурсне групе
- Конфигурационе поставке
- Стање имплементације

### Услуге
Услуге су градивни блокови ваше апликације:
- **Frontend** - Веб апликације, SPA-ови
- **Backend** - API-ји, микросервисе
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

### 2. Infrastructure as Code
- **Bicep** - Azure-ов доменски специфичан језик
- **Terraform** - Алат за мулти-cloud инфраструктуру
- **ARM шаблони** - Azure Resource Manager шаблони

### 3. Интегрисани токови рада
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
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
azd down --force --purge
```

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

### Управљање пројектом
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

### 1. Користите смислене називе
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
- Користите одвојена окружења за развој/staging/продукцију
- Никада не имплементирајте директно у продукцију са локалног рачунара
- Користите CI/CD токове за продукционе имплементације

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

- [Инсталација и подешавање](installation.md) - Инсталирајте и конфигуришите azd
- [Ваш први пројекат](first-project.md) - Практични туторијал
- [Водич за конфигурацију](configuration.md) - Напредне опције конфигурације

## Додатни ресурси

- [Azure Developer CLI Преглед](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Галерија шаблона](https://azure.github.io/awesome-azd/)
- [Примери из заједнице](https://github.com/Azure-Samples)

---

**Навигација**
- **Претходна лекција**: [README](../../README.md)
- **Следећа лекција**: [Инсталација и подешавање](installation.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не сносимо одговорност за било каква неспоразумевања или погрешна тумачења која могу произаћи из коришћења овог превода.