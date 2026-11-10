# Ваш први пројекат - Практичан туторијал

**Навигација кроз поглавља:**
- **📚 Почетак курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брз почетак
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој с фокусом на АИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Добродошли у ваш први Azure Developer CLI пројекат! Деплоираћете апликацију за обавезе са React фронтендом, Node.js API-јем и Azure Cosmos DB-ом. Темплејт носи историјски назив `todo-nodejs-mongo`; његова актуелна инфраструктура користи Cosmos DB за NoSQL, па проверите преузет README и `infra/` уместо да закључујете који API базе користи на основу имена.

> Прегледано према `azd 1.37.2` и јавном темплејту у новембру 2026. Примери испод користе Bash; JSON екстракција такође захтева `jq`. Azure деплоји могу изазвати трошкове и нису извршени током овог прегледа.

## Циљеви учења

Завршавањем овог туторијала, ви ћете:
- Савладати процес иницијализације azd пројекта помоћу темплејта
- Разумети структуру azd пројеката и конфигурационе фајлове
- Извршити комплетан деплој апликације на Azure са провизионисањем инфраструктуре
- Имплементирати стратегије ажурирања и поновног деплоја апликације
- Управљати вишеструким окружењима за развој и тестирање
- Применити праксе чишћења ресурса и управљања трошковима

## Исходи учења

По завршетку, моћи ћете да:
- Самостално иницијализујете и конфигуришете azd пројекте из темплејта
- Ефикасно навигирате и мењате структуру azd пројекта
- Деплојујете full-stack апликације на Azure једном командом
- Решите уобичајене проблеме са деплојем и аутентификацијом
- Управљате вишеструким Azure окружењима за различите фазе деплоя
- Имплементирате континуиране деплој радне токове за ажурирања апликација

## Почетак рада

### Листа предуслова
- ✅ Инсталиран Azure Developer CLI ([Installation Guide](installation.md))
- ✅ Комплетирана AZD аутентификација са `azd auth login`
- ✅ Инсталиран Git на вашем систему
- ✅ Node.js 22 LTS (или подржана верзија потребна за преузети темплејт)
- ✅ Visual Studio Code (препоручено)

Пре него што наставите, покрените валидатор подешавања из корена репозиторијума:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Потврдите ваше подешавање
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Потврда опционе Azure CLI аутентификације

```bash
az account show
```

### Провера верзије Node.js
```bash
node --version
```

## Корак 1: Изаберите и Иницијализујте Темплејт

Почнимо са популарним темплејтом апликације за обавезе који укључује React фронтенд и Node.js API бекенд.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Шта се управо десило?
- Преузет темплејт код у ваш локални директоријум
- Креиран `azure.yaml` фајл са дефиницијама сервиса
- Подешен инфраструктурни код у директоријуму `infra/`
- Креирана конфигурација окружења

## Корак 2: Истражите Структуру Пројекта

Погледајмо шта је azd креирао:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Требало би да видите:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Кључни фајлови које треба разумети

**azure.yaml** - Срж вашег azd пројекта:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Дефиниција инфраструктуре:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Корак 3: Прилагодите свој пројекат (опционо)

Пре деплоя можете прилагодити апликацију:

### Измените Фронтенд
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Направите једну просту измену:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Конфигуришите Променљиве Окружења
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ове две прилагођене вредности илуструју само локалну меморију. Стандардни темплејт не користи `WEBSITE_TITLE` или `API_VERSION`, тако да оне не мењају апликацију. Јасна измена горе мења приказани наслов.

## Корак 4: Деплој на Azure

Сада узбудљиви део - деплојујте све на Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Шта се дешава током деплоя?

Радни ток провизионише инфраструктуру и пакује/деплојује код. Тачан редослед може се прилагодити кроз `workflows.up` у `azure.yaml`; овај темплејт одређује провизионисање, па онда деплој. Не ослањајте се на општи редослед фаза за све темплејте.

### Очекујани Излаз
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Корак 5: Тестирајте Своју Апликацију

### Приступите својој апликацији
Кликните на URL излазног деплоя или га добијте било када:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Тестирајте Todo апликацију
1. **Додајте задатак** - Кликните "Add Todo" и унесите задатак
2. **Обележите као завршено** - Обележите завршене задатке
3. **Обришите задатке** - Уклоните незадате задатке

### Пратите своју апликацију
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Потврдите свој деплој

Пре него што наставите, прођите кроз ову брзу листу да бисте се уверили да све заиста ради—не претпостављајте да "деплој је успео" значи "апликација ради":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Деплој је потврђен када:**
- ✅ `azd show` приказује URL доступне крајње тачке
- ✅ URL се отвара у вашем прегледачу без грешака
- ✅ Основне функције раде (додавање/завршетак/брисање обавеза)
- ✅ `azd monitor --logs` показује захтеве без неочекиваних грешака

Ако било која провера не успе, пређите на [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/README.md).

## Корак 6: Направите измене и поново деплојујте

Хајде да направимо измену и видимо колико је лако ажурирати:

### Измените API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Додајте прилагођени одговор заглавља:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Деплојујте само измене кода
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Корак 7: Управљајте вишеструким окружењима

Креирајте тестно окружење за испитивање измена пре продукције:

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

Кад завршите експерименте, очистите ресурсе да бисте избегли поновне трошкове:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Класицна апликација у односу на апликацију са АИ: Исти радни ток

Управо сте деплојовали традиционалну веб апликацију. Али шта ако желите да деплојујете апликацију са АИ, као што је чет апликација заснована на Microsoft Foundry моделима?

Добра вест: **радни ток је идентичан.**

| Корак | Класицна Todo апликација | AI Chat апликација |
|------|-----------------|-------------|
| Иницијализација (празан директоријум) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Аутентификација | `azd auth login` | `azd auth login` |
| Деплој | `azd up` | `azd up` |
| Надгледање | `azd monitor` | `azd monitor` |
| Чишћење | `azd down --force --purge` | `azd down --force --purge` |

Команде животног циклуса су исте, али предуслови се разликују. AI темплејт може захтевати приступ моделу, регионални квоту, унос података и додатне конфигурације. Прочитајте његов README пре деплоя; `azd up` не може обезбедити недостајуће дозволе или квоту.

Ово је главни принцип azd: **један радни ток, сваки оптерећење.** Вештине које сте вежбали у овом туторијалу—иницијализација, деплој, надгледање, поновљени деплој и чишћење—једнако важe за AI апликације и агенте.

---

## Шта сте научили

Честитамо! Успешно сте:
- ✅ Иницијализовали azd пројекат из темплејта
- ✅ Истражили структуру пројекта и кључне фајлове
- ✅ Деплојовали full-stack апликацију на Azure
- ✅ Направили измене кода и поново деплојовали
- ✅ Управљали вишеструким окружењима
- ✅ Очистили ресурсе

## 🎯 Вежбе за проверу знања

### Вежба 1: Деплој другачијег темплејта (15 минута)
**Циљ**: Покажите владање azd init и деплој радним током

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Апликација се деплојује без грешака
- [ ] Можете приступити URL-у апликације у прегледачу
- [ ] Апликација ради исправно (додавање/уклањање задатака)
- [ ] Успешно очистили све ресурсе

### Вежба 2: Прилагодите конфигурацију (20 минута)
**Циљ**: Вежбајте чување локалних вредности окружења без мешања са конфигурацијом у радном времену

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Критеријуми успеха:**
- [ ] Прилагођено окружење успешно креирано
- [ ] Променљиве окружења подешене и доступне
- [ ] `azd env get-value APP_TITLE` исписује `My Custom Todo App`
- [ ] Можете објаснити зашто ове вредности не мењају стандардну апликацију осим ако их код/инфраструктура не користи

### Вежба 3: Радни ток за вишеструка окружења (25 минута)
**Циљ**: Савладајте управљање окружењима и стратегије деплоя

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Креирана два окружења са различитим конфигурацијама
- [ ] Обе окружења су успешно деплојоване
- [ ] Можете се пребацивати између окружења користећи `azd env select`
- [ ] Променљиве окружења се разликују између окружења
- [ ] Успешно сте очистили оба окружења

## 📊 Ваш напредак

**Уложено време**: ~60-90 минута  
**Стечене вештине**:
- ✅ Иницијализација пројекта помоћу темплејта
- ✅ Провизионисање Azure ресурса
- ✅ Радни токови деплоя апликације
- ✅ Управљање окружењима
- ✅ Управљање конфигурацијом
- ✅ Чишћење ресурса и управљање трошковима

**Следећи ниво**: Спремни сте за [Configuration Guide](../chapter-03-configuration/configuration.md) да научите напредне конфигурационе обрасце!

## Решавање уобичајених проблема

### Грешке аутентификације
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Неуспеси у деплоју
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти имена ресурса
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Порт/мрежни проблеми
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следећи кораци

Сада када сте завршили први пројекат, истражите ове напредне теме:

### 1. Прилагодите инфраструктуру
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Додајте базу података](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Подесите CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Комплетни CI/CD радни токови
- [Azure Developer CLI документација](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурација пипелина

### 3. Најбоље праксе за производњу
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Безбедност, перформансе и надгледање

### 4. Истражите више темплејта
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Додатни ресурси

### Материјали за учење
- [Azure Developer CLI документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Заједница и подршка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Темплејти и примери
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Template Contributions](https://github.com/Azure/awesome-azd)
- [Todo Template Source](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Честитамо на завршетку вашег првог azd пројекта!** Сада сте спремни да са поверењем градите и деплојујете невероватне апликације на Azure.

---

**Навигација кроз поглавља:**
- **📚 Почетак курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа и брз почетак
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој с фокусом на АИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->