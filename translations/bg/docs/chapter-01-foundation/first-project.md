# Вашият първи проект - Практическо ръководство

**Навигация в главата:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталация и настройка](installation.md)
- **➡️ Следваща**: [Конфигурация](configuration.md)
- **🚀 Следваща глава**: [Глава 2: Развитие с приоритет AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Въведение

Добре дошли във вашия първи проект с Azure Developer CLI! Това изчерпателно практическо ръководство ви предоставя пълно преминаване през създаване, внедряване и управление на цялостно приложение с пълен стек в Azure, използвайки azd. Ще работите с реално приложение за задачи, което включва React frontend, Node.js API backend и MongoDB база данни.

## Обучителни цели

След завършване на това ръководство ще можете да:
- Овладеете работния процес за инициализация на azd проект с помощта на шаблони
- Разберете структурата на проекта на Azure Developer CLI и конфигурационните файлове
- Изпълнявате пълното внедряване на приложението в Azure с осигуряване на инфраструктура
- Прилагате стратегии за обновяване на приложението и повторно внедряване
- Управлявате множество среди за разработка и тестова среда
- Прилагате практики за почистване на ресурси и управление на разходите

## Резултати от обучението

След завършването ще можете да:
- Инициализирате и конфигурирате azd проекти от шаблони самостоятелно
- Навигирате и модифицирате структури на azd проекти ефективно
- Внедрявате пълностекови приложения в Azure с една команда
- Отстранявате често срещани проблеми при внедряване и автентикация
- Управлявате множество Azure среди за различни етапи на внедряване
- Прилагате непрекъснати работни процеси за внедряване при обновления на приложения

## Започнете

### Контролен списък с предварителни изисквания
- ✅ Инсталиран Azure Developer CLI ([Ръководство за инсталация](installation.md))
- ✅ Извършена автентикация с `azd auth login`
- ✅ Инсталиран Git на вашата система
- ✅ Node.js версия 16+ (за това ръководство)
- ✅ Visual Studio Code (препоръчително)

Преди да продължите, стартирайте валидатора за настройка от корена на хранилището:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Проверете настройката си
```bash
# Проверете инсталацията на azd
azd version

# Проверете автентикацията на AZD
azd auth login --check-status
```

### Проверете опционална автентикация в Azure CLI

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
# Прегледайте наличните шаблони
azd template list

# Инициализирайте шаблона за приложение за задачи
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Следвайте инструкциите:
# - Въведете име на средата: "dev"
# - Изберете абонамент (ако имате няколко)
# - Изберете регион: "Източна САЩ 2" (или предпочитания от вас регион)
```

### Какво се случи току-що?
- Изтеглен е кодът на шаблона в локалния ви каталог
- Създаден е файл `azure.yaml` с дефиниции на услуги
- Настроен е код за инфраструктурата в директорията `infra/`
- Създадена е конфигурация на средата

## Стъпка 2: Проучете структурата на проекта

Нека разгледаме какво е създал azd за нас:

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

### Ключови файлове за разбиране

**azure.yaml** - Сърцето на вашия azd проект:
```bash
# Преглед на конфигурацията на проекта
cat azure.yaml
```

**infra/main.bicep** - Дефиниция на инфраструктурата:
```bash
# Прегледайте инфраструктурния код
head -30 infra/main.bicep
```

## Стъпка 3: Персонализирайте проекта си (по избор)

Преди внедряване можете да персонализирате приложението:

### Променете фронтенда
```bash
# Отворете компонента на приложението React
code src/web/src/App.tsx
```

Направете проста промяна:
```typescript
// Намерете заглавието и го променете
<h1>My Awesome Todo App</h1>
```

### Конфигурирайте променливи на средата
```bash
# Задайте персонализирани променливи на средата
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Прегледайте всички променливи на средата
azd env get-values
```

## Стъпка 4: Внедряване в Azure

Сега идва вълнуващата част - внедрете всичко в Azure!

```bash
# Разгръщане на инфраструктурата и приложението
azd up

# Тази команда ще:
# 1. Създаде ресурси в Azure (App Service, Cosmos DB и др.)
# 2. Компилира приложението ви
# 3. Разгърне го в създадените ресурси
# 4. Показва URL адреса на приложението
```

### Какво се случва по време на внедряването?

Командата `azd up` изпълнява следните стъпки:
1. **Provision** (`azd provision`) - Създава Azure ресурси
2. **Package** - Изгражда вашия код на приложението
3. **Deploy** (`azd deploy`) - Внедрява кода в ресурсите на Azure

### Очакван резултат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Стъпка 5: Тествайте вашето приложение

### Достъп до приложението
Кликнете на URL адреса, предоставен в изхода от внедряването, или го вземете по всяко време:
```bash
# Вземете крайните точки на приложението
azd show

# Отворете приложението във вашия браузър
azd show --output json | jq -r '.services.web.endpoint'
```

### Тествайте приложението за задачи
1. **Добавяне на задача** - Натиснете "Add Todo" и въведете задача
2. **Маркиране като завършена** - Отметнете завършените задачи
3. **Изтриване на задачи** - Премахнете задачи, които вече не са необходими

### Мониторинг на приложението
```bash
# Отворете Azure портала за вашите ресурси
azd monitor

# Преглед на логовете на приложението
azd monitor --logs

# Преглед на текущи метрики
azd monitor --live
```

## Стъпка 6: Направете промени и повторно внедрете

Нека направим промяна и видим колко лесно е да обновите:

### Променете API-то
```bash
# Редактирайте API кода
code src/api/src/routes/lists.js
```

Добавете персонализиран заглавен отговор:
```javascript
// Намерете обработчик на маршрута и добавете:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Внедрете само промените в кода
```bash
# Разгръщайте само кода на приложението (пропуснете инфраструктурата)
azd deploy

# Това е много по-бързо от 'azd up', тъй като инфраструктурата вече съществува
```

## Стъпка 7: Управлявайте множество среди

Създайте тестова среда, за да тествате промените преди продукцията:

```bash
# Създаване на ново среда за тестване
azd env new staging

# Деплойте в средата за тестване
azd up

# Върнете се обратно към средата за разработка
azd env select dev

# Изброяване на всички среди
azd env list
```

### Сравнение на среди
```bash
# Преглед на средата за разработка
azd env select dev
azd show

# Преглед на етапна среда
azd env select staging
azd show
```

## Стъпка 8: Почистете ресурсите

Когато приключите с експериментите, почистете, за да избегнете допълнителни такси:

```bash
# Изтрийте всички Azure ресурси за текущата среда
azd down

# Принудително изтриване без потвърждение и изчистете меко изтритите ресурси
azd down --force --purge

# Изтрийте конкретна среда
azd env select staging
azd down --force --purge
```

## Класическо приложение срещу AI приложение: Същият работен процес

Току-що внедрихте традиционно уеб приложение. Ами ако искате да внедрите AI приложение, например чат приложение с Microsoft Foundry Models?

Добрата новина: **работният процес е идентичен.**

| Стъпка | Класическо приложение за задачи | AI чат приложение |
|------|-----------------|-------------|
| Инициализация | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Автентикация | `azd auth login` | `azd auth login` |
| Внедряване | `azd up` | `azd up` |
| Мониторинг | `azd monitor` | `azd monitor` |
| Почистване | `azd down --force --purge` | `azd down --force --purge` |

Единствената разлика е в **шаблона**, от който започвате. AI шаблонът включва допълнителна инфраструктура (като Microsoft Foundry Models ресурс или AI Search индекс), но azd се грижи за всичко това. Не е нужно да научавате нови команди, да използвате друг инструмент или да променяте мисленето си относно внедряването.

Това е основният принцип на azd: **един работен процес, всяка задача.** Уменията, които практикувахте в това ръководство – инициализиране, внедряване, мониторинг, повторно внедряване и почистване – се прилагат еднакво за AI приложения и агенти.

---

## Какво научихте

Поздравления! Вие успешно:
- ✅ Инициализирахте azd проект от шаблон
- ✅ Проучихте структурата на проекта и ключови файлове
- ✅ Внедрихте пълностеково приложение в Azure
- ✅ Направихте промени в кода и повторно внедрихте
- ✅ Управлявахте множество среди
- ✅ Почистихте ресурси

## 🎯 Упражнения за проверка на уменията

### Упражнение 1: Внедрете различен шаблон (15 минути)
**Цел**: Демонстрирайте овладяване на azd init и работния процес на внедряване

```bash
# Опитайте Python + MongoDB стек
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
- [ ] Приложението се внедрява без грешки
- [ ] Може да достъпите URL на приложението в браузъра
- [ ] Приложението функционира правилно (добавяне/премахване на задачи)
- [ ] Всички ресурси са почистени успешно

### Упражнение 2: Персонализиране на конфигурацията (20 минути)
**Цел**: Практика с конфигуриране на променливи на средата

```bash
cd my-first-azd-app

# Създаване на потребителска среда
azd env new custom-config

# Задаване на потребителски променливи
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Проверка на променливи
azd env get-values | grep APP_TITLE

# Разгръщане с потребителска конфигурация
azd up
```

**Критерии за успех:**
- [ ] Потребителска среда е създадена успешно
- [ ] Променливите на средата са зададени и могат да бъдат извлечени
- [ ] Приложението се внедрява с персонализирана конфигурация
- [ ] Може да потвърдите персонализираните настройки в внедреното приложение

### Упражнение 3: Работен процес с множество среди (25 минути)
**Цел**: Овладяване на управление на среди и стратегии за внедряване

```bash
# Създайте среда за разработка
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Запишете URL за разработка
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Създайте среда за тестване
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Запишете URL за тестване
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Сравнете средите
azd env list

# Тествайте и двете среди
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Почистете и двете
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерии за успех:**
- [ ] Създадени са две среди с различни конфигурации
- [ ] И двете среди са внедрени успешно
- [ ] Може да превключвате между среди с `azd env select`
- [ ] Променливите на средата се различават между средите
- [ ] И двете среди са почистени успешно

## 📊 Вашият напредък

**Инвестирано време**: ~60-90 минути  
**Придобити умения**:
- ✅ Инициализация на проект чрез шаблони
- ✅ Осигуряване на Azure ресурси
- ✅ Работни процеси за внедряване на приложения
- ✅ Управление на среди
- ✅ Управление на конфигурации
- ✅ Почистване на ресурси и управление на разходи

**Следващо ниво**: Готови сте за [Ръководство за конфигурация](configuration.md), за да научите напреднали конфигурационни модели!

## Отстраняване на често срещани проблеми

### Грешки при автентикация
```bash
# Повторна удостоверяване с Azure
az login

# Проверете достъпа до абонамента
az account show
```

### Провали при внедряване
```bash
# Активиране на отстраняването на грешки в логовете
export AZD_DEBUG=true
azd up --debug

# Преглед на логове на приложението в Azure
azd monitor --logs

# За контейнерни приложения, използвайте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти при имена на ресурси
```bash
# Използвайте уникално име на средата
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми с портове/мрежа
```bash
# Проверете дали портовете са налични
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следващи стъпки

След като завършихте първия си проект, разгледайте тези напреднали теми:

### 1. Персонализирана инфраструктура
- [Инфраструктура като код](../chapter-04-infrastructure/provisioning.md)
- [Добавяне на бази данни, хранилища и други услуги](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Настройване на CI/CD
- [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md) - Пълни CI/CD работни процеси
- [Документация за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурация на pipeline

### 3. Най-добри практики за продукция
- [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md) - Сигурност, производителност и мониторинг

### 4. Проучете още шаблони
```bash
# Прегледайте шаблони по категории
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Изпробвайте различни технологични стекове
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Допълнителни ресурси

### Обучителни материали
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Общество и поддръжка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Общност на Azure разработчици](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Официална галерия с шаблони](https://azure.github.io/awesome-azd/)
- [Шаблони от общността](https://github.com/Azure-Samples/azd-templates)
- [Корпоративни модели](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравления за завършването на вашия първи azd проект!** Сега сте готови да създавате и внедрявате удивителни приложения в Azure с увереност.

---

**Навигация в главата:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 1 - Основи и бърз старт
- **⬅️ Предишна**: [Инсталация и настройка](installation.md)
- **➡️ Следваща**: [Конфигурация](configuration.md)
- **🚀 Следваща глава**: [Глава 2: Развитие с приоритет AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следващ урок**: [Ръководство за внедряване](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за никакви недоразумения или неправилни тълкувания, възникнали от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->