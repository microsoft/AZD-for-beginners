<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-18T11:19:32+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "bg"
}
-->
# Вашият първи проект - Практическо ръководство

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталация и настройка](installation.md)
- **➡️ Следваща**: [Конфигурация](configuration.md)
- **🚀 Следваща глава**: [Глава 2: AI-First разработка](../ai-foundry/azure-ai-foundry-integration.md)

## Въведение

Добре дошли в първия ви проект с Azure Developer CLI! Това подробно практическо ръководство ще ви преведе през целия процес на създаване, разгръщане и управление на full-stack приложение в Azure с помощта на azd. Ще работите с реално приложение за задачи, което включва React фронтенд, Node.js API бекенд и MongoDB база данни.

## Цели на обучението

След завършване на това ръководство ще:
- Усвоите процеса на инициализация на azd проект с помощта на шаблони
- Разберете структурата на проектите и конфигурационните файлове в Azure Developer CLI
- Изпълните пълно разгръщане на приложение в Azure с осигуряване на инфраструктура
- Прилагате стратегии за актуализация и повторно разгръщане на приложения
- Управлявате множество среди за разработка и тестване
- Прилагате практики за почистване на ресурси и управление на разходите

## Резултати от обучението

След завършване ще можете:
- Самостоятелно да инициализирате и конфигурирате azd проекти от шаблони
- Ефективно да навигирате и модифицирате структурата на azd проекти
- Да разгръщате full-stack приложения в Azure с единични команди
- Да отстранявате често срещани проблеми с разгръщането и автентикацията
- Да управлявате множество Azure среди за различни етапи на разгръщане
- Да прилагате непрекъснати работни потоци за разгръщане на актуализации на приложения

## Първи стъпки

### Контролен списък с предварителни изисквания
- ✅ Инсталиран Azure Developer CLI ([Ръководство за инсталация](installation.md))
- ✅ Инсталиран и автентикиран Azure CLI
- ✅ Инсталиран Git на вашата система
- ✅ Node.js 16+ (за това ръководство)
- ✅ Visual Studio Code (препоръчително)

### Проверка на настройките
```bash
# Check azd installation
azd version
```
### Проверка на автентикацията в Azure

```bash
az account show
```

### Проверка на версията на Node.js
```bash
node --version
```

## Стъпка 1: Избор и инициализация на шаблон

Нека започнем с популярен шаблон за приложение за задачи, който включва React фронтенд и Node.js API бекенд.

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

### Какво се случи?
- Изтеглихте кода на шаблона в локалната си директория
- Създадохте файл `azure.yaml` с дефиниции на услуги
- Настроихте инфраструктурния код в директорията `infra/`
- Създадохте конфигурация на среда

## Стъпка 2: Разглеждане на структурата на проекта

Нека разгледаме какво създаде azd за нас:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Трябва да видите:
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

## Стъпка 3: Персонализиране на проекта (по избор)

Преди разгръщане можете да персонализирате приложението:

### Модифициране на фронтенда
```bash
# Open the React app component
code src/web/src/App.tsx
```

Направете проста промяна:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Конфигуриране на променливи на средата
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Стъпка 4: Разгръщане в Azure

Сега идва вълнуващата част - разгръщане на всичко в Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Какво се случва по време на разгръщането?

Командата `azd up` изпълнява следните стъпки:
1. **Осигуряване** (`azd provision`) - Създава ресурси в Azure
2. **Пакетиране** - Компилира кода на приложението
3. **Разгръщане** (`azd deploy`) - Разгръща кода в ресурсите на Azure

### Очакван изход
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Стъпка 5: Тестване на приложението

### Достъп до приложението
Кликнете върху URL адреса, предоставен в изхода от разгръщането, или го вземете по всяко време:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестване на приложението за задачи
1. **Добавяне на задача** - Кликнете "Add Todo" и въведете задача
2. **Отбелязване като завършена** - Отметнете завършените задачи
3. **Изтриване на задачи** - Премахнете задачи, които вече не са необходими

### Мониторинг на приложението
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Стъпка 6: Направете промени и повторно разгръщане

Нека направим промяна и видим колко лесно е да актуализираме:

### Модифициране на API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Добавете персонализиран заглавен отговор:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разгръщане само на промените в кода
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Стъпка 7: Управление на множество среди

Създайте тестова среда, за да тествате промените преди продукция:

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

## Стъпка 8: Почистване на ресурси

Когато приключите с експериментите, почистете, за да избегнете текущи разходи:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Какво научихте

Поздравления! Успешно:
- Инициализирахте azd проект от шаблон
- Разгледахте структурата на проекта и основните файлове
- Разгърнахте full-stack приложение в Azure
- Направихте промени в кода и повторно разгръщане
- Управлявахте множество среди
- Почистихте ресурси

## Отстраняване на често срещани проблеми

### Грешки при автентикация
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Провали при разгръщане
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Конфликти с имена на ресурси
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми с портове/мрежа
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следващи стъпки

Сега, след като завършихте първия си проект, разгледайте тези разширени теми:

### 1. Персонализиране на инфраструктурата
- [Инфраструктура като код](../deployment/provisioning.md)
- [Добавяне на бази данни, хранилища и други услуги](../deployment/provisioning.md#adding-services)

### 2. Настройка на CI/CD
- [Интеграция с GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Най-добри практики за продукция
- [Конфигурации за сигурност](../deployment/best-practices.md#security)
- [Оптимизация на производителността](../deployment/best-practices.md#performance)
- [Мониторинг и логове](../deployment/best-practices.md#monitoring)

### 4. Разгледайте още шаблони
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

## Допълнителни ресурси

### Учебни материали
- [Документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Център за архитектура на Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Рамка за добре проектирани решения в Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Общност и поддръжка
- [GitHub на Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Общност на Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Официална галерия с шаблони](https://azure.github.io/awesome-azd/)
- [Шаблони от общността](https://github.com/Azure-Samples/azd-templates)
- [Модели за предприятия](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравления за завършването на първия ви azd проект!** Вече сте готови да създавате и разгръщате невероятни приложения в Azure с увереност.

---

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталация и настройка](installation.md)
- **➡️ Следваща**: [Конфигурация](configuration.md)
- **🚀 Следваща глава**: [Глава 2: AI-First разработка](../ai-foundry/azure-ai-foundry-integration.md)
- **Следващ урок**: [Ръководство за разгръщане](../deployment/deployment-guide.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.