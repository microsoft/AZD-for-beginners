# Вашият първи проект - Практическо ръководство

**Навигация в глава:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталиране и настройка](installation.md)
- **➡️ Следваща**: [Конфигурация](configuration.md)
- **🚀 Следваща глава**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Добре дошли във вашия първи проект с Azure Developer CLI! Това изчерпателно практическо ръководство предоставя пълен проход през създаване, разгръщане и управление на пълнофункционално приложение в Azure с помощта на azd. Ще работите с реално приложение за задачи (todo), което включва frontend с React, backend API на Node.js и база данни MongoDB.

## Цели на обучението

След завършване на това ръководство ще:
- Усвоите работния поток за инициализация на azd проект чрез шаблони
- Разберете структурата на проекта и конфигурационните файлове на Azure Developer CLI
- Изпълнявате пълно разгръщане на приложението в Azure с осигуряване на инфраструктура
- Прилагате стратегии за актуализиране и повторно разгръщане на приложението
- Управлявате множество среди за разработка и стейджинг
- Прилагате практики за почистване на ресурси и управление на разходите

## Резултати от обучението

След приключване ще можете да:
- Инициализирате и конфигурирате azd проекти от шаблони самостоятелно
- Навигирате и модифицирате структури на azd проекти ефективно
- Разгръщате пълнофункционални приложения в Azure с една команда
- Отстранявате често срещани проблеми при разгръщане и автентикация
- Управлявате множество Azure среди за различни етапи на разгръщане
- Прилагате работни потоци за непрекъснато разгръщане за актуализации на приложенията

## Започваме

### Контролен списък с предварителни изисквания
- ✅ Azure Developer CLI инсталиран ([Ръководство за инсталиране](installation.md))
- ✅ Аутентикация в AZD завършена с `azd auth login`
- ✅ Git инсталиран на вашата система
- ✅ Node.js 16+ (за това ръководство)
- ✅ Visual Studio Code (препоръчително)

Преди да продължите, стартирайте валидатора за настройка от корена на репозитория:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Проверете вашата настройка
```bash
# Проверете инсталацията на azd
azd version

# Проверете удостоверяването в AZD
azd auth login --check-status
```

### Проверете допълнителната автентикация на Azure CLI

```bash
az account show
```

### Проверете версията на Node.js
```bash
node --version
```

## Стъпка 1: Изберете и инициализирайте шаблон

Да започнем с популярен шаблон за приложение за задачи (todo), който включва React frontend и Node.js API backend.

```bash
# Прегледайте наличните шаблони
azd template list

# Инициализирайте шаблона за приложение за задачи
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Следвайте подканите:
# - Въведете име на среда: "dev"
# - Изберете абонамент (ако имате няколко)
# - Изберете регион: "East US 2" (или предпочитания от вас регион)
```

### Какво току-що се случи?
- Изтеглихте кода на шаблона в локалната си директория
- Създадохте файл `azure.yaml` с дефиниции на услуги
- Настроихте инфраструктурния код в директорията `infra/`
- Създадохте конфигурация на среда

## Стъпка 2: Разгледайте структурата на проекта

Нека прегледаме какво azd създаде за нас:

```bash
# Преглед на структурата на проекта
tree /f   # Windows
# или
find . -type f | head -20   # macOS/Linux
```

Трябва да виждате:
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

### Ключови файлове за разбиране

**azure.yaml** - Сърцето на вашия azd проект:
```bash
# Преглед на конфигурацията на проекта
cat azure.yaml
```

**infra/main.bicep** - Дефиниция на инфраструктурата:
```bash
# Прегледайте кода на инфраструктурата
head -30 infra/main.bicep
```

## Стъпка 3: Персонализирайте проекта си (по избор)

Преди да разпределите, можете да персонализирате приложението:

### Модифицирайте фронтенда
```bash
# Отворете компонента на React приложението
code src/web/src/App.tsx
```

Направете малка промяна:
```typescript
// Намерете заглавието и го променете
<h1>My Awesome Todo App</h1>
```

### Конфигурирайте променливите на средата
```bash
# Задаване на потребителски променливи на средата
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Преглед на всички променливи на средата
azd env get-values
```

## Стъпка 4: Разположете в Azure

Сега за вълнуващата част - разположете всичко в Azure!

```bash
# Разгръщане на инфраструктурата и приложението
azd up

# Тази команда ще:
# 1. Осигуряване на ресурси в Azure (App Service, Cosmos DB и др.)
# 2. Изграждане на вашето приложение
# 3. Разгръщане в предоставените ресурси
# 4. Показване на URL адреса на приложението
```

### Какво се случва по време на разполагането?

Командата `azd up` извършва следните стъпки:
1. **Provision** (`azd provision`) - Създава Azure ресурси
2. **Package** - Изгражда кода на вашето приложение
3. **Deploy** (`azd deploy`) - Разгръща кода към ресурсите в Azure

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
Кликнете на URL адреса, предоставен в изхода от разгръщането, или го вземете по всяко време:
```bash
# Вземете крайните точки на приложението
azd show

# Отворете приложението в браузъра си
azd show --output json | jq -r '.services.web.endpoint'
```

### Тествайте приложението за задачи
1. **Добавете задача** - Кликнете "Add Todo" и въведете задача
2. **Маркирайте като завършена** - Отбележете изпълнените елементи
3. **Изтрийте елементи** - Премахнете задачи, които повече не са ви нужни

### Наблюдавайте приложението си
```bash
# Отворете портала на Azure за ресурсите си
azd monitor

# Преглед на логовете на приложението
azd monitor --logs

# Преглед на метриките в реално време
azd monitor --live
```

### ✅ Потвърдете разгръщането

Преди да продължите, преминете през този бърз контролен списък, за да потвърдите, че всичко действително работи — не приемайте, че "разгръщането е успешно" означава "приложението работи":

```bash
# 1. Потвърдете, че крайната точка съществува и е достъпна
azd show

# 2. Извършете бърз тест на крайната точка (очаква HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Проверете крайна точка за здравето, ако приложението ви предоставя такава
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Разгръщането е потвърдено когато:**
- ✅ `azd show` показва достъпен URL крайна точка
- ✅ URL адресът се отваря в браузъра ви без грешки
- ✅ Основните функции работят (добавяне/маркиране/изтриване на задача)
- ✅ `azd monitor --logs` показва пристигащи заявки без неочаквани грешки

Ако някоя проверка не успее, преминете към [Глава 7: Отстраняване на проблеми](../chapter-07-troubleshooting/README.md).

## Стъпка 6: Направете промени и повторно разположете

Нека направим промяна и да видим колко лесно е да актуализирате:

### Модифицирайте API-то
```bash
# Редактирайте кода на API
code src/api/src/routes/lists.js
```

Добавете персонализиран заглавен отговор:
```javascript
// Намерете обработчик на маршрут и добавете:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разположете само промените в кода
```bash
# Разгръщайте само кода на приложението (пропуснете инфраструктурата)
azd deploy

# Това е много по-бързо от 'azd up', тъй като инфраструктурата вече съществува
```

## Стъпка 7: Управлявайте множество среди

Създайте стейджинг среда, за да тествате промени преди продукцията:

```bash
# Създайте нова предварителна среда
azd env new staging

# Разположете в предварителната среда
azd up

# Върнете се обратно към средата за разработка
azd env select dev

# Изброете всички среди
azd env list
```

### Сравнение на среди
```bash
# Преглед на среда за разработка
azd env select dev
azd show

# Преглед на предпускова среда
azd env select staging
azd show
```

## Стъпка 8: Почистете ресурсите

Когато приключите с експериментите, почистете, за да избегнете продължаващи разходи:

```bash
# Изтрий всички Azure ресурси за текущата среда
azd down

# Принудително изтрий без потвърждение и окончателно премахни временно изтритите ресурси
azd down --force --purge

# Изтрий конкретна среда
azd env select staging
azd down --force --purge
```

## Класическо приложение срещу приложение с AI: Същият работен процес

Току-що разположихте традиционно уеб приложение. Но какво ако искате да разположите приложение с AI — например чат приложение, подсигурено от Microsoft Foundry Models?

Добрата новина: **работният процес е идентичен.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Единствената разлика е **шаблонът**, от който започвате. AI шаблонът включва допълнителна инфраструктура (като ресурс Microsoft Foundry Models или AI Search индекс), но azd се грижи за всичко това вместо вас. Не е нужно да учите нови команди, да приемате различен инструмент или да променяте начина си на мислене за разполагането.

Това е основният принцип на azd: **един работен процес — всяка работна задача.** Уменията, които упражнявахте в това ръководство — инициализация, разгръщане, наблюдение, повторно разгръщане и почистване — се прилагат еднакво за AI приложения и агенти.

---

## Какво научихте

Честито! Успешно:
- ✅ Инициализирахте azd проект от шаблон
- ✅ Разгледахте структурата на проекта и ключовите файлове
- ✅ Разположихте пълнофункционално приложение в Azure
- ✅ Направихте промени в кода и повторно разположихте
- ✅ Управлявахте множество среди
- ✅ Почистихте ресурсите

## 🎯 Упражнения за валидиране на уменията

### Упражнение 1: Разположете друг шаблон (15 минути)
**Цел**: Демонстрирайте владеене на работния поток за `azd init` и разгръщане

```bash
# Опитайте стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Проверете внедряването
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Почистете
azd down --force --purge
```

**Критерии за успех:**
- [ ] Приложението се разгръща без грешки
- [ ] Може да достъпите URL адреса на приложението в браузъра
- [ ] Приложението функционира правилно (добавяне/премахване на задачи)
- [ ] Всички ресурси са успешно почистени

### Упражнение 2: Персонализирайте конфигурацията (20 минути)
**Цел**: Упражнение в конфигуриране на променливи на средата

```bash
cd my-first-azd-app

# Създаване на персонализирана среда
azd env new custom-config

# Задаване на персонализирани променливи
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Проверка на променливите
azd env get-values | grep APP_TITLE

# Разгръщане с персонализирана конфигурация
azd up
```

**Критерии за успех:**
- [ ] Персонализирана среда е създадена успешно
- [ ] Променливите на средата са зададени и могат да бъдат извлечени
- [ ] Приложението се разгръща с персонализирана конфигурация
- [ ] Може да потвърдите персонализираните настройки в разположеното приложение

### Упражнение 3: Работен поток с множество среди (25 минути)
**Цел**: Усвоете управлението на среди и стратегии за разгръщане

```bash
# Създайте среда за разработка
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Запишете URL на средата за разработка
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Създайте стейджинг среда
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Запишете URL на стейджинг средата
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Сравнете средите
azd env list

# Тествайте и двете среди
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Почистете и двете среди
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерии за успех:**
- [ ] Създадени са две среди с различни конфигурации
- [ ] И двете среди са разположени успешно
- [ ] Можете да превключвате между средите с `azd env select`
- [ ] Променливите на средата се различават между средите
- [ ] Двете среди са успешно почистени

## 📊 Вашият прогрес

**Инвестирано време**: ~60-90 минути  
**Придобити умения**:
- ✅ Инициализация на проект от шаблон
- ✅ Осигуряване на Azure ресурси
- ✅ Работни потоци за разгръщане на приложения
- ✅ Управление на среди
- ✅ Управление на конфигурация
- ✅ Почистване на ресурси и управление на разходите

**Следващо ниво**: Вие сте готови за [Ръководство за конфигурация](configuration.md), за да научите напреднали конфигурационни модели!

## Отстраняване на често срещани проблеми

### Грешки при автентикация
```bash
# Повторно удостоверяване в Azure
az login

# Проверете достъпа до абонамента
az account show
```

### Провали при разгръщане
```bash
# Активирайте логването за отстраняване на грешки
export AZD_DEBUG=true
azd up --debug

# Прегледайте логовете на приложението в Azure
azd monitor --logs

# За Container Apps използвайте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти на имена на ресурси
```bash
# Използвайте уникално име на средата
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми с порт/мрежа
```bash
# Проверете дали портовете са достъпни
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следващи стъпки

Сега когато сте завършили вашия първи проект, изследвайте тези напреднали теми:

### 1. Персонализирайте инфраструктурата
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Добавете бази данни, сторидж и други услуги](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Настройте CI/CD
- [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) - Пълни CI/CD работни потоци
- [Документация за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигуриране на pipeline

### 3. Добри практики за продукция
- [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) - Сигурност, производителност и мониторинг

### 4. Разгледайте още шаблони
```bash
# Прегледайте шаблони по категория
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Опитайте различни технологични стекове
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Допълнителни ресурси

### Учебни материали
- [Документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Общност и поддръжка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Официална галерия със шаблони](https://azure.github.io/awesome-azd/)
- [Шаблони от общността](https://github.com/Azure-Samples/azd-templates)
- [Предприятелни модели](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Честито за завършването на първия ви azd проект!** Сега сте готови да изграждате и разгръщате невероятни приложения в Azure с увереност.

---

**Навигация в глава:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталиране и настройка](installation.md)
- **➡️ Следваща**: [Използване на собствено приложение](bring-your-own-app.md)
- **🚀 Следваща глава**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->