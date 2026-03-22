# Вашият първи проект - Практическо ръководство

**Навигация на главата:**
- **📚 Course Home**: [AZD за начинаещи](../../README.md)
- **📖 Current Chapter**: Глава 1 - Основи & Бърз старт
- **⬅️ Previous**: [Инсталиране & Настройка](installation.md)
- **➡️ Next**: [Конфигурация](configuration.md)
- **🚀 Next Chapter**: [Глава 2: Разработка, водена от AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Добре дошли във вашия първи проект с Azure Developer CLI! Това изчерпателно практическо ръководство предлага пълен проход на създаване, разгъване и управление на пълностеково приложение в Azure, използвайки azd. Ще работите с реално todo приложение, което включва React фронтенд, Node.js API бекенд и MongoDB база данни.

## Цели за обучение

Като завършите това ръководство, вие ще:
- Усвоите работния процес за инициализация на проект azd, използвайки шаблони
- Разберете структурата на проекта Azure Developer CLI и конфигурационните файлове
- Извършвате пълно разгръщане на приложението в Azure с предоставяне на инфраструктура
- Прилагате стратегии за обновяване на приложението и повторно разгъване
- Управлявате множество среди за разработка и подготвителна (staging) среда
- Прилагате практики за почистване на ресурси и управление на разходите

## Резултати от обучението

След завършване ще можете:
- Да инициализирате и конфигурирате azd проекти от шаблони самостоятелно
- Да навигирате и модифицирате структури на azd проекти ефективно
- Да разгръщате пълностекови приложения в Azure с една команда
- Да отстранявате често срещани проблеми при разгръщане и автентикация
- Да управлявате няколко Azure среди за различни етапи на разгръщане
- Да внедрявате работни потоци за непрекъснато разгръщане за обновления на приложенията

## Как да започнете

### Списък с предварителни изисквания
- ✅ Инсталиран Azure Developer CLI ([Ръководство за инсталиране](installation.md))
- ✅ Инсталиран Azure CLI и автентикиран
- ✅ Инсталиран Git на вашата система
- ✅ Node.js 16+ (за това ръководство)
- ✅ Visual Studio Code (препоръчително)

### Проверете вашата среда
```bash
# Проверете инсталацията на azd
azd version
```
### Проверка на Azure автентикацията

```bash
az account show
```

### Проверете версията на Node.js
```bash
node --version
```

## Стъпка 1: Изберете и инициализирайте шаблон

Нека започнем с популярен шаблон за todo приложение, който включва React фронтенд и Node.js API бекенд.

```bash
# Прегледайте наличните шаблони
azd template list

# Инициализирайте шаблона за приложение за задачи
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Следвайте подсказките:
# - Въведете име на средата: "dev"
# - Изберете абонамент (ако имате повече от един)
# - Изберете регион: "East US 2" (или предпочитания от вас регион)
```

### Какво току-що се случи?
- Изтеглен код на шаблона във вашата локална директория
- Създаден файл `azure.yaml` с дефиниции на услуги
- Настроен код за инфраструктура в директорията `infra/`
- Създадена конфигурация на средата

## Стъпка 2: Разгледайте структурата на проекта

Нека разгледаме какво azd създаде за нас:

```bash
# Преглед на структурата на проекта
tree /f   # Windows
# или
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

### Ключови файлове, които трябва да разберете

**azure.yaml** - Сърцето на вашия azd проект:
```bash
# Прегледайте конфигурацията на проекта
cat azure.yaml
```

**infra/main.bicep** - Дефиниция на инфраструктурата:
```bash
# Прегледайте кода на инфраструктурата
head -30 infra/main.bicep
```

## Стъпка 3: Персонализирайте проекта си (незадължително)

Преди разгъщане можете да персонализирате приложението:

### Променете фронтенда
```bash
# Отворете компонента на React приложението
code src/web/src/App.tsx
```

Направете проста промяна:
```typescript
// Намерете заглавието и го променете
<h1>My Awesome Todo App</h1>
```

### Конфигурирайте променливите на средата
```bash
# Задайте потребителски променливи на средата
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Прегледайте всички променливи на средата
azd env get-values
```

## Стъпка 4: Разгръщане в Azure

Сега за вълнуващата част - разгърнете всичко в Azure!

```bash
# Разгръщане на инфраструктурата и приложението
azd up

# Тази команда ще:
# 1. Осигури ресурси в Azure (App Service, Cosmos DB и др.)
# 2. Компилира вашето приложение
# 3. Разположи в осигурените ресурси
# 4. Покажи URL адреса на приложението
```

### Какво се случва по време на разгъщането?

Командата `azd up` изпълнява следните стъпки:
1. **Provision** (`azd provision`) - Създава Azure ресурси
2. **Package** - Пакетира кода на вашето приложение
3. **Deploy** (`azd deploy`) - Разгръща кода в Azure ресурсите

### Очакван изход
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Стъпка 5: Тествайте вашето приложение

### Достъп до вашето приложение
Кликнете на URL, предоставен в изхода от разгъщането, или го вземете по всяко време:
```bash
# Вземете крайните точки на приложението
azd show

# Отворете приложението в браузъра си
azd show --output json | jq -r '.services.web.endpoint'
```

### Тествайте Todo приложението
1. **Добавете задача** - Натиснете "Add Todo" и въведете задача
2. **Отбележете като завършено** - Отметнете завършените елементи
3. **Изтрийте елементи** - Премахнете задачи, от които вече нямате нужда

### Наблюдавайте вашето приложение
```bash
# Отворете портала на Azure за вашите ресурси
azd monitor

# Прегледайте логовете на приложението
azd monitor --logs

# Прегледайте метрики в реално време
azd monitor --live
```

## Стъпка 6: Направете промени и повторно разгърнете

Нека направим промяна и видим колко лесно е да обновите:

### Променете API-то
```bash
# Редактирайте кода на API
code src/api/src/routes/lists.js
```

Добавете персонализиран заглавен отговор:
```javascript
// Намерете обработчик на маршрут и добавете:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разгърнете само промените в кода
```bash
# Разгръщайте само кода на приложението (пропуснете инфраструктурата)
azd deploy

# Това е много по-бързо от 'azd up', тъй като инфраструктурата вече съществува
```

## Стъпка 7: Управлявайте множество среди

Създайте подготвителна среда, за да тествате промените преди продукция:

```bash
# Създаване на нова предпускова среда
azd env new staging

# Разгръщане в предпусковата среда
azd up

# Превключване обратно към средата за разработка
azd env select dev

# Изброяване на всички среди
azd env list
```

### Сравнение на средите
```bash
# Преглед на среда за разработка
azd env select dev
azd show

# Преглед на подготвителна среда
azd env select staging
azd show
```

## Стъпка 8: Почистване на ресурси

Когато приключите с експериментите, почистете ресурсите, за да избегнете продължаващи такси:

```bash
# Изтрийте всички Azure ресурси за текущата среда
azd down

# Принудително изтриване без потвърждение и премахване на временно изтрити ресурси
azd down --force --purge

# Изтрийте конкретна среда
azd env select staging
azd down --force --purge
```

## Класическо приложение срещу приложение с AI: Същият работен процес

Току-що разгръхте традиционно уеб приложение. Но какво ако искате да разгърнете приложение с AI — например чат приложение, базирано на Microsoft Foundry Models?

Добрата новина: **работният процес е идентичен.**

| Step | Класическо Todo приложение | AI чат приложение |
|------|---------------------------|-------------------|
| Инициализиране | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Удостоверяване | `azd auth login` | `azd auth login` |
| Разгръщане | `azd up` | `azd up` |
| Мониторинг | `azd monitor` | `azd monitor` |
| Почистване | `azd down --force --purge` | `azd down --force --purge` |

Единствената разлика е **шаблонът**, от който започвате. AI шаблон включва допълнителна инфраструктура (като ресурс Microsoft Foundry Models или AI Search индекс), но azd се грижи за всичко това вместо вас. Не е нужно да учите нови команди, да възприемате различен инструмент или да променяте начина, по който мислите за разгръщането.

Това е основният принцип на azd: **един работен процес, за всички видове натоварване.** Уменията, които упражнявахте в това ръководство — инициализация, разгръщане, мониторинг, повторно разгръщане и почистване — се прилагат еднакво за AI приложения и агенти.

---

## Какво научихте

Поздравления! Вие успешно:
- ✅ Инициализирахте azd проект от шаблон
- ✅ Разгледахте структурата на проекта и ключовите файлове
- ✅ Разгръхте пълностеково приложение в Azure
- ✅ Направихте промени в кода и повторно разгърнахте
- ✅ Управлявахте множество среди
- ✅ Почистихте ресурсите

## 🎯 Упражнения за проверка на уменията

### Упражнение 1: Разгръщане на различен шаблон (15 минути)
**Цел**: Демонстрирайте усвояване на azd init и работния процес за разгръщане

```bash
# Опитайте стека Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Проверете разгръщането
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Почистете
azd down --force --purge
```

**Критерии за успех:**
- [ ] Приложението се разгъща без грешки
- [ ] Можете да достъпите URL на приложението в браузър
- [ ] Приложението функционира правилно (добавяне/премахване на задачи)
- [ ] Успешно почистени всички ресурси

### Упражнение 2: Персонализиране на конфигурацията (20 минути)
**Цел**: Упражнете конфигуриране на променливи на средата

```bash
cd my-first-azd-app

# Създайте персонализирана среда
azd env new custom-config

# Задайте персонализирани променливи
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Проверете променливите
azd env get-values | grep APP_TITLE

# Разгърнете с персонализирана конфигурация
azd up
```

**Критерии за успех:**
- [ ] Създадена е персонализирана среда успешно
- [ ] Променливите на средата са зададени и могат да бъдат извлечени
- [ ] Приложението се разгъва с персонализираната конфигурация
- [ ] Можете да проверите персонализираните настройки в разгърнатото приложение

### Упражнение 3: Много-средов работен процес (25 минути)
**Цел**: Усвоете управлението на среди и стратегии за разгръщане

```bash
# Създайте dev среда
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Запишете URL на dev средата
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Създайте staging среда
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Запишете URL на staging средата
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
- [ ] Двете среди са разгърнати успешно
- [ ] Можете да превключвате между среди с `azd env select`
- [ ] Променливите на средата се различават между средите
- [ ] Успешно почистихте и двете среди

## 📊 Вашият прогрес

**Отделено време**: ~60-90 минути  
**Придобити умения**:
- ✅ Инициализация на проект от шаблон
- ✅ Предоставяне на Azure ресурси
- ✅ Работни потоци за разгръщане на приложения
- ✅ Управление на среди
- ✅ Управление на конфигурации
- ✅ Почистване на ресурси и управление на разходите

**Следващо ниво**: Готови сте за [Ръководство за конфигурация](configuration.md) за да научите напреднали модели на конфигуриране!

## Отстраняване на често срещани проблеми

### Грешки при автентикация
```bash
# Повторно удостоверяване в Azure
az login

# Проверете достъпа до абонамента
az account show
```

### Неуспешни разгръщания
```bash
# Активиране на регистрирането за отстраняване на грешки
export AZD_DEBUG=true
azd up --debug

# Преглед на логовете на приложението в Azure
azd monitor --logs

# За Container Apps използвайте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти на имена на ресурси
```bash
# Използвайте уникално име за среда
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми с порт/мрежа
```bash
# Проверете дали портовете са налични
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следващи стъпки

Сега, когато завършихте първия си проект, разгледайте тези напреднали теми:

### 1. Персонализиране на инфраструктурата
- [Инфраструктура като код](../chapter-04-infrastructure/provisioning.md)
- [Добавяне на бази данни, сторидж и други услуги](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Настройване на CI/CD
- [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) - Пълни CI/CD работни процеси
- [Документация за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурация на пайплайна

### 3. Най-добри практики за продукция
- [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md) - Сигурност, производителност и мониторинг

### 4. Разгледайте още шаблони
```bash
# Разгледайте шаблоните по категории
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
- [Център за архитектура на Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Рамка Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Общност и поддръжка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Общност на Azure разработчиците](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Официална галерия с шаблони](https://azure.github.io/awesome-azd/)
- [Шаблони от общността](https://github.com/Azure-Samples/azd-templates)
- [Корпоративни модели](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравления за завършването на първия ви azd проект!** Вече сте готови да изграждате и разгръщате страхотни приложения в Azure с увереност.

---

**Навигация на главата:**
- **📚 Course Home**: [AZD за начинаещи](../../README.md)
- **📖 Current Chapter**: Глава 1 - Основи & Бърз старт
- **⬅️ Previous**: [Инсталиране & Настройка](installation.md)
- **➡️ Next**: [Конфигурация](configuration.md)
- **🚀 Next Chapter**: [Глава 2: Разработка, водена от AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следващ урок**: [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->