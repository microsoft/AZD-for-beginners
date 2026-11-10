# Вашият първи проект - Практическо ръководство

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталация и настройка](installation.md)
- **➡️ Следваща**: [Донеси собствено приложение](bring-your-own-app.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с изкуствен интелект на първо място](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Добре дошли във вашия първи проект с Azure Developer CLI! Ще разгърнете приложение за задачи с React frontend, Node.js API и Azure Cosmos DB. Шаблонът запазва историческото име `todo-nodejs-mongo`; настоящата му инфраструктура използва Cosmos DB за NoSQL, затова прегледайте изтегления README и `infra/`, вместо да изваждате заключения за API-то на базата от името.

> Прегледано спрямо `azd 1.37.2` и публичния шаблон през ноември 2026. Примерите по-долу използват Bash; за извличане на JSON е необходим и `jq`. Разгръщанията в Azure носят такси и не са изпълнявани по време на този преглед.

## Учебни цели

С изпълнението на това ръководство вие ще:
- Запознаете се с работния процес за инициализация на azd проект чрез шаблони
- Разберете структурата на проекта и конфигурационните файлове за Azure Developer CLI
- Извършите пълно разгръщане на приложение в Azure с осигуряване на инфраструктура
- Реализирате стратегии за актуализации и повторно разгръщане на приложенията
- Управлявате множество среди за разработка и тестове
- Прилагате практики за почистване на ресурси и управление на разходите

## Резултати от обучението

След приключване ще можете:
- Самостоятелно да инициализирате и конфигурирате azd проекти по шаблони
- Ефективно да навигирате и модифицирате структури на azd проекти
- Да разгърнете пълни приложения в Azure с една команда
- Да отстранявате често срещани проблеми при разгръщане и автентикация
- Да управлявате множество среди в Azure за различни етапи на разгръщане
- Да прилагате работни процеси за непрекъснато разгръщане при актуализации на приложения

## Започваме

### Списък с предварителни изисквания
- ✅ Инсталиран Azure Developer CLI ([Ръководство за инсталиране](installation.md))
- ✅ Удостоверяване в AZD завършено с `azd auth login`
- ✅ Инсталиран Git на вашата система
- ✅ Node.js 22 LTS (или версия, поддържана от изтегления шаблон)
- ✅ Visual Studio Code (препоръчително)

Преди да продължите, пуснете валидатора на настройките от корена на хранилището:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Потвърдете настройките си
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Потвърдете опционалното удостоверяване в Azure CLI

```bash
az account show
```

### Проверете версията на Node.js
```bash
node --version
```

## Стъпка 1: Изберете и инициализирайте шаблон

Нека започнем с популярен шаблон за приложение за задачи, който включва React frontend и Node.js API backend.

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

### Какво се случи току-що?
- Изтеглихте кода на шаблона във вашата локална директория
- Създадохте файл `azure.yaml` с дефиниции на услуги
- Настроихте инфраструктурния код в директорията `infra/`
- Създадохте конфигурация на средата

## Стъпка 2: Разгледайте структурата на проекта

Нека видим какво е създал azd за нас:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Трябва да видите:
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

### Основни файлове за разбиране

**azure.yaml** - Сърцето на вашия azd проект:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Дефиниция на инфраструктурата:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Стъпка 3: Персонализирайте проекта си (по избор)

Преди разгръщане, можете да персонализирате приложението:

### Модифицирайте frontend-а
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Направете проста промяна:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Конфигурирайте променливи на средата
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Тези две потребителски стойности демонстрират само локално съхранение. Стандартният шаблон не използва `WEBSITE_TITLE` или `API_VERSION`, така че те не променят приложението. Явната редакция на източника по-горе променя показваното заглавие.

## Стъпка 4: Разгърнете в Azure

Сега към вълнуващата част - разгънете всичко в Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Какво се случва по време на разгръщане?

Работният процес осигурява инфраструктура и пакетира/разгръща код. Точният ред може да се персонализира чрез `workflows.up` в `azure.yaml`; този шаблон задава първо осигуряване, след това разгръщане. Не разчитайте на универсален ред на фазите за всеки шаблон.

### Очакван изход
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Стъпка 5: Тествайте приложението си

### Достъп до вашето приложение
Кликнете върху URL адреса, предоставен в изхода на разгръщането, или го вземете по всяко време:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Тествайте приложението за задачи
1. **Добавете задача** - Кликнете "Add Todo" и въведете задача
2. **Маркирайте като завършена** - Поставете отметка на завършени елементи
3. **Изтрийте елементи** - Премахнете задачи, които вече не ви трябват

### Мониторинг на вашето приложение
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Потвърдете разгръщането си

Преди да продължите, прегледайте бързия контролен списък, за да потвърдите, че всичко наистина работи — не приемайте, че „разгръщането е успешно“ означава „приложението работи“:

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

**Разгръщането е потвърдено, когато:**
- ✅ `azd show` показва достъпен URL на крайна точка
- ✅ URL адресът се отваря в браузъра без грешки
- ✅ Основните функции работят (добавяне/завършване/изтриване на задача)
- ✅ `azd monitor --logs` показва заявки без неочаквани грешки

Ако някоя проверка се провали, преминете към [Глава 7: Отстраняване на неизправности](../chapter-07-troubleshooting/README.md).

## Стъпка 6: Направете промени и разгърнете отново

Нека направим промяна и видим колко лесно е да се актуализира:

### Модифицирайте API-то
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Добавете персонализиран заглавен отговор:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разгърнете само промените в кода
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Стъпка 7: Управлявайте множество среди

Създайте тестова среда, в която да тествате промените преди продукция:

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

### Сравнение на среди
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Стъпка 8: Изчистете ресурсите

Когато приключите с експериментите, почистете, за да избегнете текущи разходи:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Класическо приложение срещу AI-приложение: Един и същ работен процес

Току-що разгрънахте традиционно уеб приложение. Но какво ако искате да разположите AI-приложение — например чат приложение, базирано на Microsoft Foundry Models?

Добрата новина: **работният процес е идентичен.**

| Стъпка | Класическо приложение за задачи | AI чат приложение |
|------|-----------------|-------------|
| Инициализация (празна директория) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Удостоверяване | `azd auth login` | `azd auth login` |
| Разгръщане | `azd up` | `azd up` |
| Мониторинг | `azd monitor` | `azd monitor` |
| Почистване | `azd down --force --purge` | `azd down --force --purge` |

Командите за жизнения цикъл са същите, но предпоставките се различават. AI шаблон може да изисква достъп до модел, регионален квот, прием на данни и допълнителна конфигурация. Прочетете README преди разгръщане; `azd up` не може да предостави липсващи разрешения или квот.

Това е основният принцип на azd: **един работен процес, всяко натоварване.** Уменията, които практикувахте в този урок — инициализиране, разгръщане, мониторинг, повторно разгръщане и почистване — важат еднакво за AI приложения и агенти.

---

## Какво научихте

Поздравления! Вие успешно:
- ✅ Инициализирахте azd проект от шаблон
- ✅ Изследвахте структурата на проекта и ключови файлове
- ✅ Разгърнахте пълно уеб приложение в Azure
- ✅ Направихте промени в кода и го разгърнахте отново
- ✅ Управлявахте множество среди
- ✅ Почистихте ресурсите

## 🎯 Упражнения за потвърждаване на умения

### Упражнение 1: Разгърнете различен шаблон (15 минути)
**Цел**: Демонстрирайте владеене на azd init и работния процес на разгръщане

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

**Критерии за успех:**
- [ ] Приложението се разгръща без грешки
- [ ] Можете да достъпите URL адреса на приложението в браузър
- [ ] Приложението функционира правилно (добавяне/премахване на задачи)
- [ ] Успешно почистихте всички ресурси

### Упражнение 2: Персонализиране на конфигурацията (20 минути)
**Цел**: Практикувайте съхранение на стойности за локална среда, без да ги бъркате с конфигурация по време на работа

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

**Критерии за успех:**
- [ ] Персонализирана среда е създадена успешно
- [ ] Променливите на средата са зададени и достъпни
- [ ] `azd env get-value APP_TITLE` показва `My Custom Todo App`
- [ ] Можете да обясните защо тези стойности не променят стандартното приложение, освен ако кодът/инфраструктурата не ги използват

### Упражнение 3: Работен процес с много среди (25 минути)
**Цел**: Овладейте управлението на среди и стратегии за разгръщане

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

**Критерии за успех:**
- [ ] Създадени са две среди с различни конфигурации
- [ ] И двете среди са успешно разгърнати
- [ ] Можете да превключвате между среди с `azd env select`
- [ ] Променливите на средата са различни между средите
- [ ] Успешно почистихте и двете среди

## 📊 Вашият напредък

**Инвестирано време**: ~60-90 минути  
**Придобити умения**:
- ✅ Инициализация на проект базиран на шаблон
- ✅ Осигуряване на Azure ресурси
- ✅ Работни процеси на разгръщане на приложения
- ✅ Управление на среди
- ✅ Управление на конфигурации
- ✅ Почистване на ресурси и управление на разходите

**Следващо ниво**: Вие сте готови за [Ръководство за конфигурация](../chapter-03-configuration/configuration.md), за да научите напреднали модели на конфигурация!

## Отстраняване на често срещани проблеми

### Грешки при удостоверяване
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Провали при разгръщане
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти с имена на ресурси
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми с порт/мрежа
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следващи стъпки

Сега, след като завършихте първия си проект, разгледайте тези напреднали теми:

### 1. Персонализирайте инфраструктурата
- [Инфраструктура като код](../chapter-04-infrastructure/provisioning.md)
- [Добавяне на инфраструктура за база данни](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Настройте CI/CD
- [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) - Пълни CI/CD работни процеси
- [Документация на Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурация на тръбопроводи

### 3. Най-добри практики за продукция
- [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) - Сигурност, производителност и мониторинг

### 4. Изследвайте още шаблони
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

## Допълнителни ресурси

### Материали за обучение
- [Документация на Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Център за архитектура на Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Framework за добре проектирани решения](https://learn.microsoft.com/en-us/azure/well-architected/)

### Общност и поддръжка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Общност на Azure разработчици](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Официална галерия на шаблони](https://azure.github.io/awesome-azd/)
- [Общностни приноси на шаблони](https://github.com/Azure/awesome-azd)
- [Източник на шаблона Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Поздравления за завършването на първия ви azd проект!** Сега сте готови да изграждате и разгръщате страхотни приложения в Azure с увереност.

---

**Навигация в глава:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталация и настройка](installation.md)
- **➡️ Следваща**: [Внесете собствено приложение](bring-your-own-app.md)
- **🚀 Следваща глава**: [Глава 2: Разработка с AI на първо място](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->