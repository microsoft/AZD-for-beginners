<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T11:40:59+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sr"
}
-->
# Ваш Први Пројекат - Практични Туторијал

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD За Почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и Брзи Почетак
- **⬅️ Претходно**: [Инсталација и Подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој са AI у Првом Плану](../ai-foundry/azure-ai-foundry-integration.md)

## Увод

Добродошли у ваш први Azure Developer CLI пројекат! Овај свеобухватни практични туторијал пружа комплетан водич за креирање, постављање и управљање апликацијом са пуним стеком на Azure-у користећи azd. Радићете са правом todo апликацијом која укључује React фронтенд, Node.js API бекенд и MongoDB базу података.

## Циљеви учења

Завршетком овог туторијала, научићете:
- Како да савладате процес иницијализације azd пројекта користећи шаблоне
- Структуру пројекта Azure Developer CLI и конфигурационе датотеке
- Комплетно постављање апликације на Azure уз обезбеђивање инфраструктуре
- Стратегије за ажурирање апликације и поновно постављање
- Управљање више окружења за развој и тестирање
- Примена пракси за чишћење ресурса и управљање трошковима

## Резултати учења

По завршетку, бићете способни да:
- Самостално иницијализујете и конфигуришете azd пројекте из шаблона
- Ефикасно навигирате и модификујете структуру azd пројеката
- Поставите апликације са пуним стеком на Azure користећи једноставне команде
- Решавате уобичајене проблеме са постављањем и аутентификацијом
- Управљате више Azure окружења за различите фазе постављања
- Примените континуиране радне токове за ажурирање апликација

## Почетак

### Контролна листа предуслова
- ✅ Инсталиран Azure Developer CLI ([Водич за инсталацију](installation.md))
- ✅ Инсталиран и аутентификован Azure CLI
- ✅ Инсталиран Git на вашем систему
- ✅ Node.js 16+ (за овај туторијал)
- ✅ Visual Studio Code (препоручено)

### Проверите вашу конфигурацију
```bash
# Check azd installation
azd version
```
### Проверите Azure аутентификацију

```bash
az account show
```

### Проверите верзију Node.js
```bash
node --version
```

## Корак 1: Изаберите и иницијализујте шаблон

Почнимо са популарним шаблоном todo апликације који укључује React фронтенд и Node.js API бекенд.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Шта се управо догодило?
- Преузет је код шаблона у ваш локални директоријум
- Креирана је датотека `azure.yaml` са дефиницијама сервиса
- Постављен је код инфраструктуре у директоријуму `infra/`
- Креирана је конфигурација окружења

## Корак 2: Истражите структуру пројекта

Хајде да погледамо шта је azd креирао за нас:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Требало би да видите:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Кључне датотеке које треба разумети

**azure.yaml** - Срце вашег azd пројекта:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Дефиниција инфраструктуре:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Корак 3: Прилагодите ваш пројекат (опционо)

Пре постављања, можете прилагодити апликацију:

### Измените фронтенд
```bash
# Open the React app component
code src/web/src/App.tsx
```

Направите једноставну измену:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Конфигуришите променљиве окружења
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Корак 4: Поставите на Azure

Сада долази узбудљиви део - поставите све на Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Шта се дешава током постављања?

Команда `azd up` извршава следеће кораке:
1. **Обезбеђивање** (`azd provision`) - Креира Azure ресурсе
2. **Паковање** - Гради код ваше апликације
3. **Постављање** (`azd deploy`) - Поставља код на Azure ресурсе

### Очекивани излаз
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Корак 5: Тестирајте вашу апликацију

### Приступите вашој апликацији
Кликните на URL који је обезбеђен у излазу постављања, или га добијте у било ком тренутку:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирајте Todo апликацију
1. **Додајте ставку** - Кликните "Add Todo" и унесите задатак
2. **Означите као завршено** - Означите завршене ставке
3. **Обришите ставке** - Уклоните ставке које вам више нису потребне

### Пратите вашу апликацију
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Корак 6: Направите измене и поново поставите

Хајде да направимо измену и видимо колико је лако ажурирати:

### Измените API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Додајте прилагођени одговор у заглављу:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Поставите само измене у коду
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Корак 7: Управљајте више окружења

Креирајте тестно окружење за проверу измена пре продукције:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Поређење окружења
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Корак 8: Очистите ресурсе

Када завршите са експериментисањем, очистите ресурсе како бисте избегли сталне трошкове:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Шта сте научили

Честитамо! Успешно сте:
- Иницијализовали azd пројекат из шаблона
- Истражили структуру пројекта и кључне датотеке
- Поставили апликацију са пуним стеком на Azure
- Направили измене у коду и поново поставили
- Управљали више окружења
- Очистили ресурсе

## Решавање уобичајених проблема

### Грешке у аутентификацији
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Неуспеси у постављању
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Конфликти у именима ресурса
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми са портовима/мрежом
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следећи кораци

Сада када сте завршили ваш први пројекат, истражите ове напредне теме:

### 1. Прилагодите инфраструктуру
- [Инфраструктура као код](../deployment/provisioning.md)
- [Додајте базе података, складиште и друге услуге](../deployment/provisioning.md#adding-services)

### 2. Поставите CI/CD
- [Интеграција са GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Пипелини](../deployment/cicd-integration.md#azure-devops)

### 3. Најбоље праксе за продукцију
- [Конфигурације безбедности](../deployment/best-practices.md#security)
- [Оптимизација перформанси](../deployment/best-practices.md#performance)
- [Праћење и логовање](../deployment/best-practices.md#monitoring)

### 4. Истражите више шаблона
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Додатни ресурси

### Материјали за учење
- [Документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Архитектонски Центар](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Добро Осмишљен Оквир](https://learn.microsoft.com/en-us/azure/well-architected/)

### Заједница и подршка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Заједница](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Званична Галерија Шаблона](https://azure.github.io/awesome-azd/)
- [Шаблони Заједнице](https://github.com/Azure-Samples/azd-templates)
- [Ентерпрајз Шаблони](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Честитамо на завршетку вашег првог azd пројекта!** Сада сте спремни да са самопоуздањем градите и постављате невероватне апликације на Azure.

---

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD За Почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и Брзи Почетак
- **⬅️ Претходно**: [Инсталација и Подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој са AI у Првом Плану](../ai-foundry/azure-ai-foundry-integration.md)
- **Следећи час**: [Водич за Постављање](../deployment/deployment-guide.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.