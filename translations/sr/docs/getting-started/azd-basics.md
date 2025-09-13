<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T22:37:44+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sr"
}
-->
# AZD Основе - Разумевање Azure Developer CLI

**Претходно:** [Инсталација и подешавање](installation.md) | **Следеће:** [Конфигурација](configuration.md)

## Увод

Ова лекција вас упознаје са Azure Developer CLI (azd), моћним алатом командне линије који убрзава ваш пут од локалног развоја до Azure деплоја. Научићете основне концепте, кључне функције и разумети како azd поједностављује деплој апликација за облак.

## Циљеви учења

На крају ове лекције, моћи ћете:
- Разумети шта је Azure Developer CLI и његову основну сврху
- Научити основне концепте шаблона, окружења и сервиса
- Истражити кључне функције, укључујући развој заснован на шаблонима и инфраструктуру као код
- Разумети структуру пројекта azd и ток рада
- Бити спремни за инсталацију и конфигурацију azd за ваш развојни окружење

## Исходи учења

Након завршетка ове лекције, моћи ћете:
- Објаснити улогу azd у модерним токовима рада за развој облака
- Идентификовати компоненте структуре azd пројекта
- Описати како шаблони, окружења и сервиси функционишу заједно
- Разумети предности инфраструктуре као код са azd
- Препознати различите azd команде и њихове сврхе

## Шта је Azure Developer CLI (azd)?

Azure Developer CLI (azd) је алат командне линије дизајниран да убрза ваш пут од локалног развоја до Azure деплоја. Поједностављује процес изградње, деплоја и управљања апликацијама за облак на Azure-у.

## Основни концепти

### Шаблони
Шаблони су основа azd. Они садрже:
- **Код апликације** - Ваш изворни код и зависности
- **Дефиниције инфраструктуре** - Azure ресурси дефинисани у Bicep-у или Terraform-у
- **Конфигурационе датотеке** - Подешавања и променљиве окружења
- **Скрипте за деплој** - Аутоматизовани токови деплоја

### Окружења
Окружења представљају различите циљеве деплоја:
- **Развој** - За тестирање и развој
- **Стагинг** - Предпродукцијско окружење
- **Продукција** - Живо продукцијско окружење

Свако окружење одржава своје:
- Azure ресурсне групе
- Конфигурациона подешавања
- Стање деплоја

### Сервиси
Сервиси су грађевински блокови ваше апликације:
- **Фронтенд** - Веб апликације, SPAs
- **Бекенд** - API-ји, микросервиси
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
- **Terraform** - Алат за инфраструктуру на више облака
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
Команда `azd down --force --purge` је моћан начин да потпуно уклоните ваше azd окружење и све повезане ресурсе. Ево шта свака опција ради:
```
--force
```
- Прескаче потврде.
- Корисно за аутоматизацију или скриптовање где ручни унос није могућ.
- Осигурава да уклањање иде без прекида, чак и ако CLI открије недоследности.

```
--purge
```
Брише **све повезане метаподатке**, укључујући:
Стање окружења
Локалну `.azure` фасциклу
Кеширане информације о деплоју
Спречава azd да "памти" претходне деплоје, што може изазвати проблеме као што су неусклађене ресурсне групе или застареле референце регистра.

### Зашто користити оба?
Када наиђете на проблеме са `azd up` због преосталог стања или делимичних деплоја, ова комбинација осигурава **чист почетак**.

Посебно је корисно након ручног брисања ресурса у Azure порталу или приликом промене шаблона, окружења или конвенција именовања ресурсних група.

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

### Праћење
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Најбоље праксе

### 1. Користите значајна имена
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
- Креирајте шаблоне који се могу поново користити у вашој организацији

### 3. Изолација окружења
- Користите одвојена окружења за развој/стајинг/продукцију
- Никада не деплојујте директно у продукцију са локалног рачунара
- Користите CI/CD токове за деплој у продукцију

### 4. Управљање конфигурацијом
- Користите променљиве окружења за осетљиве податке
- Чувајте конфигурацију у верзионој контроли
- Документирајте подешавања специфична за окружење

## Прогресија учења

### Почетник (1-2 недеље)
1. Инсталирајте azd и аутентификујте се
2. Деплојујте једноставан шаблон
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
3. Деплоји у више региона
4. Конфигурације на нивоу предузећа

## Следећи кораци

- [Инсталација и подешавање](installation.md) - Инсталирајте и конфигуришите azd
- [Ваш први пројекат](first-project.md) - Практична лекција
- [Водич за конфигурацију](configuration.md) - Напредне опције конфигурације

## Додатни ресурси

- [Azure Developer CLI Преглед](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Галерија шаблона](https://azure.github.io/awesome-azd/)
- [Примери из заједнице](https://github.com/Azure-Samples)

---

**Претходно:** [Инсталација и подешавање](installation.md) | **Следеће:** [Конфигурација](configuration.md)
- **Следећа лекција**: [Инсталација и подешавање](installation.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.