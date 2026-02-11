# Вашият първи проект - Практически урок

**Навигация в глава:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи & Бърз старт
- **⬅️ Предишна**: [Installation & Setup](installation.md)
- **➡️ Следваща**: [Configuration](configuration.md)
- **🚀 Следваща глава**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Добре дошли в първия си проект с Azure Developer CLI! Този изчерпателен практически урок предоставя пълно ръководство за създаване, разгъване и управление на пълностеково приложение в Azure с помощта на azd. Ще работите с реално todo приложение, което включва React фронтенд, Node.js API бекенд и MongoDB база данни.

## Учебни цели

Като завършите този урок, ще:
- Овладеете работния процес за инициализация на azd проект чрез шаблони
- Разберете структурата на проекта Azure Developer CLI и конфигурационните файлове
- Изпълните пълно разгръщане на приложението в Azure с предварително осигуряване на инфраструктура
- Прилагате стратегии за актуализация и повторно разгръщане на приложението
- Управлявате множество среди за разработка и staging
- Прилагате практики за почистване на ресурси и управление на разходите

## Очаквани резултати от обучението

След завършване ще можете да:
- Самостоятелно инициализирате и конфигурирате azd проекти от шаблони
- Навигирате и модифицирате структурите на azd проекти ефективно
- Разгръщате пълностекови приложения в Azure с една команда
- Отстранявате често срещани проблеми при разгръщане и проблеми с удостоверяването
- Управлявате множество Azure среди за различни етапи на разгръщане
- Прилагате работни потоци за непрекъснато разгръщане за актуализации на приложението

## Започване

### Списък с предварителни изисквания
- ✅ Azure Developer CLI инсталиран ([Ръководство за инсталиране](installation.md))
- ✅ Azure CLI инсталиран и удостоверен
- ✅ Git инсталиран на вашата система
- ✅ Node.js 16+ (за този урок)
- ✅ Visual Studio Code (препоръчително)

### Проверете настройката си
```bash
# Проверете инсталацията на azd
azd version
```
### Проверка на удостоверяването в Azure

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
# Разгледайте наличните шаблони
azd template list

# Инициализирайте шаблона на приложението за задачи
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Следвайте подканите:
# - Въведете име на средата: "dev"
# - Изберете абонамент (ако имате няколко)
# - Изберете регион: "East US 2" (или предпочитания от вас регион)
```

### Какво току-що се случи?
- Изтеглихте кода от шаблона в локалния си директориум
- Създаде се файл `azure.yaml` със дефиниции на услугите
- Настроен е инфраструктурен код в директорията `infra/`
- Създадена е конфигурация на средата

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

### Ключови файлове, които да разберете

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

## Стъпка 3: Персонализирайте проекта си (по избор)

Преди разгръщане можете да персонализирате приложението:

### Променете фронтенда
```bash
# Отворете компонента на React приложението
code src/web/src/App.tsx
```

Направете проста промяна:
```typescript
// Намерете заглавието и го променете.
<h1>My Awesome Todo App</h1>
```

### Конфигуриране на променливи на средата
```bash
# Задайте потребителски променливи на средата
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Прегледайте всички променливи на средата
azd env get-values
```

## Стъпка 4: Разгърнете в Azure

Сега за вълнуващата част - разгърнете всичко в Azure!

```bash
# Разгръщане на инфраструктурата и приложението
azd up

# Тази команда ще:
# 1. Осигурява ресурси в Azure (App Service, Cosmos DB и др.)
# 2. Изгражда вашето приложение
# 3. Разгръща в осигурените ресурси
# 4. Показва URL адреса на приложението
```

### Какво се случва по време на разгръщането?

Командата `azd up` изпълнява следните стъпки:
1. **Provision** (`azd provision`) - Създава ресурси в Azure
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

## Стъпка 5: Тествайте вашето приложение

### Достъп до приложението ви
Кликнете върху URL адреса, предоставен в изхода от разгръщането, или го вземете по всяко време:
```bash
# Вземете крайните точки на приложението
azd show

# Отворете приложението в браузъра си
azd show --output json | jq -r '.services.web.endpoint'
```

### Тествайте Todo приложението
1. **Добавете елемент todo** - Натиснете "Add Todo" и въведете задача
2. **Маркирайте като завършено** - Отметнете завършените елементи
3. **Изтрийте елементи** - Премахнете todo-та, които вече не са ви нужни

### Наблюдавайте вашето приложение
```bash
# Отворете портала на Azure за вашите ресурси
azd monitor

# Прегледайте логовете на приложението
azd monitor --logs

# Прегледайте метриките в реално време
azd monitor --live
```

## Стъпка 6: Направете промени и повторно разгръщане

Нека направим промяна и да видим колко лесно е да се актуализира:

### Променете API-то
```bash
# Редактирайте кода на API
code src/api/src/routes/lists.js
```

Добавете персонализиран header в отговора:
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

## Стъпка 7: Управление на множество среди

Създайте staging среда, за да тествате промените преди продукция:

```bash
# Създайте нова стейджинг среда
azd env new staging

# Разгърнете в стейджинг среда
azd up

# Превключете обратно към средата за разработка
azd env select dev

# Изброете всички среди
azd env list
```

### Сравнение на среди
```bash
# Преглед на dev средата
azd env select dev
azd show

# Преглед на staging средата
azd env select staging
azd show
```

## Стъпка 8: Почистете ресурсите

Когато приключите с експериментите, почистете ресурси, за да избегнете продължаващи разходи:

```bash
# Изтрий всички ресурси в Azure за текущата среда
azd down

# Принудително изтриване без потвърждение и изчистване на временно изтритите ресурси
azd down --force --purge

# Изтрий конкретна среда
azd env select staging
azd down --force --purge
```

## Какво научихте

Поздравления! Успешно:
- ✅ Инициализирахте azd проект от шаблон
- ✅ Разгледахте структурата на проекта и ключовите файлове
- ✅ Разгърнахте пълностеково приложение в Azure
- ✅ Направихте промени в кода и повторно разгръщане
- ✅ Управлявахте множество среди
- ✅ Почистихте ресурси

## 🎯 Упражнения за проверка на уменията

### Упражнение 1: Разгърнете друг шаблон (15 минути)
**Цел**: Демонстрирайте майсторство в azd init и работния процес на разгръщане

```bash
# Пробвайте стека Python + MongoDB
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
- [ ] Можете да достъпите URL адреса на приложението в браузъра
- [ ] Приложението функционира правилно (добавяне/премахване на todo-та)
- [ ] Успешно почистихте всички ресурси

### Упражнение 2: Персонализирайте конфигурацията (20 минути)
**Цел**: Практикувайте конфигуриране на променливи на средата

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

# Разположете с персонализирана конфигурация
azd up
```

**Критерии за успех:**
- [ ] Персонализирана среда създадена успешно
- [ ] Променливите на средата са зададени и могат да бъдат извлечени
- [ ] Приложението се разгъва с персонализирана конфигурация
- [ ] Можете да потвърдите персонализираните настройки в разположеното приложение

### Упражнение 3: Работен поток с няколко среди (25 минути)
**Цел**: Овладяване на управлението на среди и стратегии за разгръщане

```bash
# Създаване на среда за разработка
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Отбележете URL на средата за разработка
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Създаване на стейджинг среда
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Отбележете URL на стейджинг средата
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
- [ ] Създадени две среди с различни конфигурации
- [ ] И двете среди са разгърнати успешно
- [ ] Можете да превключвате между среди с `azd env select`
- [ ] Променливите на средата се различават между средите
- [ ] Успешно почистихте и двете среди

## 📊 Вашият прогрес

**Време, инвестирано**: ~60-90 минути  
**Придобити умения**:
- ✅ Инициализация на проект чрез шаблон
- ✅ Осигуряване на ресурси в Azure
- ✅ Работни потоци за разгръщане на приложения
- ✅ Управление на среди
- ✅ Управление на конфигурации
- ✅ Почистване на ресурси и управление на разходите

**Следващо ниво**: Вие сте готови за [Configuration Guide](configuration.md) за да научите напреднали конфигурационни модели!

## Отстраняване на често срещани проблеми

### Грешки при удостоверяване
```bash
# Повторно удостоверяване в Azure
az login

# Проверка на достъпа до абонамента
az account show
```

### Неуспехи при разгръщане
```bash
# Активирай регистриране за отстраняване на грешки
export AZD_DEBUG=true
azd up --debug

# Прегледай логовете на приложението в Azure
azd monitor --logs

# За Container Apps, използвайте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти в имената на ресурси
```bash
# Използвайте уникално име за средата
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми с порт/мрежа
```bash
# Проверете дали портовете са свободни
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следващи стъпки

Сега, когато сте завършили първия си проект, разгледайте тези напреднали теми:

### 1. Персонализиране на инфраструктурата
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Добавете бази данни, сторидж и други услуги](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Настройване на CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Пълни работни потоци за CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурация на pipeline

### 3. Най-добри практики за продукция
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Сигурност, производителност и наблюдение

### 4. Разгледайте още шаблони
```bash
# Прегледайте шаблоните по категории
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
- [Документация на Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Общност и поддръжка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Официална галерия с шаблони](https://azure.github.io/awesome-azd/)
- [Шаблони от общността](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравления за завършването на първия ви azd проект!** Сега сте готови да изграждате и разгъщате невероятни приложения в Azure с увереност.

---

**Навигация в глава:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи & Бърз старт
- **⬅️ Предишна**: [Installation & Setup](installation.md)
- **➡️ Следваща**: [Configuration](configuration.md)
- **🚀 Следваща глава**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следен урок**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на услуга за превод, използваща изкуствен интелект (Co‑op Translator: https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от квалифициран преводач. Не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->