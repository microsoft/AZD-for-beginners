# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-First Development
- **⬅️ Предишна**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следваща**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед на лабораторията

Тази практическа лаборатория напътства разработчиците през процеса на взимане на съществителен AI шаблон и неговото разгръщане с помощта на Azure Developer CLI (AZD). Ще научите основни модели за продукционно разгръщане на AI, използвайки Microsoft Foundry услуги.

**Продължителност:** 2-3 часа  
**Ниво:** Средно  
**Предварителни изисквания:** Основни познания за Azure, запознатост с AI/ML концепции

## 🎓 Учебни цели

Към края на тази лаборатория ще можете да:
- ✅ Превърнете съществуващо AI приложение да използва AZD шаблони
- ✅ Конфигурирате Microsoft Foundry услуги с AZD
- ✅ Имплементирате сигурно управление на удостоверения за AI услуги
- ✅ Разгърнете продукционно готови AI приложения с мониторинг
- ✅ Отстранявате често срещани проблеми при разгръщане на AI

## Предварителни изисквания

### Изисквани инструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Редактор на код (препоръчва се VS Code)

### Ресурси в Azure
- Абонамент в Azure с достъп на contributor
- Достъп до Azure OpenAI услуги (или възможност да поискате достъп)
- Разрешения за създаване на ресурсна група

### Предварителни знания
- Основно разбиране на Azure услуги
- Запознатост с интерфейси команден ред
- Основни AI/ML концепции (APIs, модели, prompts)

## Настройка на лабораторията

### Стъпка 1: Подготовка на средата

1. **Проверете инсталациите на инструментите:**
```bash
# Провери инсталацията на AZD
azd version

# Провери Azure CLI
az --version

# Влез в Azure
az login
azd auth login
```

2. **Клонирайте репозитория на лабораторията:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разбиране на структурата на AZD за AI приложения

### Анатомия на AI AZD шаблон

Разгледайте ключовите файлове в AZD шаблон готов за AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Практическо упражнение 1.1: Разгледайте конфигурацията**

1. **Прегледайте файла azure.yaml:**
```bash
cat azure.yaml
```

**Какво да търсите:**
- Дефиниции на услуги за AI компоненти
- Съпоставяне на променливи на средата
- Конфигурации на хостовете

2. **Прегледайте инфраструктурния main.bicep:**
```bash
cat infra/main.bicep
```

**Ключови AI модели за идентифициране:**
- Provision-ване на Azure OpenAI услуга
- Интеграция с Cognitive Search
- Сигурно управление на ключове
- Конфигурации за мрежова сигурност

### **Точката за дискусия:** Защо тези модели са важни за AI

- **Зависимости на услуги**: AI приложенията често изискват множество координирани услуги
- **Сигурност**: API ключове и крайни точки трябва да се управляват сигурно
- **Мащабируемост**: AI натоварвания имат специфични изисквания за мащабиране
- **Управление на разходите**: AI услугите могат да бъдат скъпоструващи, ако не са правилно конфигурирани

## Модул 2: Разгръщане на първото ви AI приложение

### Стъпка 2.1: Инициализиране на средата

1. **Създайте нова AZD среда:**
```bash
azd env new myai-workshop
```

2. **Задайте необходимите параметри:**
```bash
# Задайте предпочитания регион на Azure
azd env set AZURE_LOCATION eastus

# По избор: Задайте конкретен модел на OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Стъпка 2.2: Разгръщане на инфраструктурата и приложението

1. **Разгърнете с AZD:**
```bash
azd up
```

**Какво се случва по време на `azd up`:**
- ✅ Provision-ва Azure OpenAI услуга
- ✅ Създава Cognitive Search услуга
- ✅ Настройва App Service за уеб приложението
- ✅ Конфигурира мрежи и сигурност
- ✅ Разгръща кода на приложението
- ✅ Настройва мониторинг и логване

2. **Следете прогреса на разгръщането** и отбележете създаваните ресурси.

### Стъпка 2.3: Проверете вашето разгръщане

1. **Проверете разположените ресурси:**
```bash
azd show
```

2. **Отворете разположеното приложение:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Тествайте AI функционалността:**
   - Навигирайте до уеб приложението
   - Изпробвайте примерни заявки
   - Потвърдете, че AI отговорите работят

### **Практическо упражнение 2.1: Практика по отстраняване на неизправности**

**Сценарий**: Вашето разгръщане е успешно, но AI не отговаря.

**Чести проблеми за проверка:**
1. **OpenAI API ключове**: Проверете дали са зададени правилно
2. **Наличност на моделите**: Проверете дали вашият регион поддържа модела
3. **Мрежова свързаност**: Уверете се, че услугите могат да комуникират
4. **RBAC разрешения**: Проверете дали приложението може да достъпи OpenAI

**Команди за отстраняване на грешки:**
```bash
# Проверете променливите на средата
azd env get-values

# Прегледайте логовете за внедряване
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверете статуса на внедряването на OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Персонализиране на AI приложенията за вашите нужди

### Стъпка 3.1: Променете AI конфигурацията

1. **Актуализирайте OpenAI модела:**
```bash
# Преминете към друг модел (ако е наличен във вашия регион)
azd env set AZURE_OPENAI_MODEL gpt-4

# Внедрете отново с новата конфигурация
azd deploy
```

2. **Добавете допълнителни AI услуги:**

Редактирайте `infra/main.bicep`, за да добавите Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Стъпка 3.2: Конфигурации специфични за средата

**Добра практика**: Различни конфигурации за development и production.

1. **Създайте production среда:**
```bash
azd env new myai-production
```

2. **Задайте параметри специфични за production:**
```bash
# В продукционна среда обикновено се използват по-високи SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Активирайте допълнителни функции за сигурност
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Практическо упражнение 3.1: Оптимизация на разходите**

**Предизвикателство**: Конфигурирайте шаблона за икономично развитие.

**Задачи:**
1. Идентифицирайте кои SKUs могат да бъдат зададени на free/basic нива
2. Конфигурирайте променливите на средата за минимални разходи
3. Разгърнете и сравнете разходите с production конфигурацията

**Подсказки за решение:**
- Използвайте F0 (free) tier за Cognitive Services когато е възможно
- Използвайте Basic tier за Search Service в development
- Помислете за използване на Consumption план за Functions

## Модул 4: Сигурност и продукционни добри практики

### Стъпка 4.1: Сигурно управление на удостоверения

**Текущ проблем**: Много AI приложения вграждат API ключове или използват несигурно съхранение.

**AZD решение**: Managed Identity + Key Vault интеграция.

1. **Прегледайте конфигурацията за сигурност в вашия шаблон:**
```bash
# Потърсете конфигурацията на Key Vault и управляваната идентичност
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверете дали Managed Identity работи:**
```bash
# Провери дали уеб приложението има правилната конфигурация на идентичността
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Стъпка 4.2: Мрежова сигурност

1. **Активирайте private endpoints** (ако още не са конфигурирани):

Добавете във вашия bicep шаблон:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Стъпка 4.3: Мониторинг и наблюдаемост

1. **Конфигурирайте Application Insights:**
```bash
# Application Insights трябва да бъде конфигуриран автоматично
# Проверете конфигурацията:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Настройте AI-специфичен мониторинг:**

Добавете персонализирани метрики за AI операции:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Практическо упражнение 4.1: Одит на сигурността**

**Задача**: Прегледайте вашето разгръщане за добри практики по сигурността.

**Контролен списък:**
- [ ] Няма вградени (hardcoded) тайни в кода или конфигурацията
- [ ] Managed Identity се използва за удостоверяване между услуги
- [ ] Key Vault съхранява чувствителната конфигурация
- [ ] Мрежовият достъп е правилно ограничен
- [ ] Мониторинг и логване са активирани

## Модул 5: Превръщане на собственото ви AI приложение

### Стъпка 5.1: Работен лист за оценка

**Преди да конвертирате вашето приложение**, отговорете на следните въпроси:

1. **Архитектура на приложението:**
   - Какви AI услуги използва вашето приложение?
   - Какви изчислителни ресурси са му необходими?
   - Нуждае ли се от база данни?
   - Какви са зависимостите между услугите?

2. **Изисквания за сигурност:**
   - Какви чувствителни данни обработва приложението?
   - Какви са изискванията за съответствие (compliance)?
   - Нуждаете ли се от частна мрежа?

3. **Изисквания за мащабиране:**
   - Какъв е очакваният ви трафик?
   - Нуждаете ли се от авто-скалиране?
   - Има ли регионални изисквания?

### Стъпка 5.2: Създайте вашия AZD шаблон

**Следвайте този модел, за да конвертирате вашето приложение:**

1. **Създайте базовата структура:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Инициализиране на шаблона AZD
azd init --template minimal
```

2. **Създайте azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Създайте инфраструктурни шаблони:**

**infra/main.bicep** - Основен шаблон:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI модул:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Практическо упражнение 5.1: Предизвикателство за създаване на шаблон**

**Предизвикателство**: Създайте AZD шаблон за AI приложение за обработка на документи.

**Изисквания:**
- Azure OpenAI за анализ на съдържанието
- Document Intelligence за OCR
- Storage Account за качване на документи
- Function App за логика за обработка
- Web app за потребителски интерфейс

**Бонус точки:**
- Добавете адекватно обработване на грешки
- Включете оценка на разходите
- Настройте мониторинг табла

## Модул 6: Отстраняване на чести проблеми

### Чести проблеми при разгръщане

#### Проблем 1: Изчерпан quota за OpenAI услуга
**Симптоми:** Разгръщането се проваля с грешка за quota
**Решения:**
```bash
# Проверете текущите квоти
az cognitiveservices usage list --location eastus

# Поискайте увеличаване на квотата или опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Моделът не е наличен в региона
**Симптоми:** AI отговорите не работят или има грешки при разгръщане на модела
**Решения:**
```bash
# Проверете наличността на модела по региони
az cognitiveservices model list --location eastus

# Актуализирайте към наличния модел
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблем 3: Проблеми с разрешенията
**Симптоми:** 403 Forbidden грешки при извикване на AI услуги
**Решения:**
```bash
# Провери разпределението на ролите
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Добави липсващите роли
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми с производителността

#### Проблем 4: Бавни AI отговори
**Стъпки за разследване:**
1. Проверете Application Insights за метрики за производителност
2. Прегледайте метриките на OpenAI услугата в Azure портала
3. Проверете мрежовата свързаност и латентността

**Решения:**
- Имплементирайте кеширане за често задавани заявки
- Използвайте подходящ OpenAI модел за вашия случай
- Помислете за read replicas при високо натоварване

### **Практическо упражнение 6.1: Предизвикателство за отстраняване на грешки**

**Сценарий**: Вашето разгръщане е успешно, но приложението връща 500 грешки.

**Задачи за отстраняване на грешки:**
1. Проверете логовете на приложението
2. Потвърдете свързаността на услугите
3. Тествайте удостоверяването
4. Прегледайте конфигурацията

**Инструменти за използване:**
- `azd show` за преглед на разгръщането
- Azure портал за детайлни логове на услугите
- Application Insights за телеметрия на приложението

## Модул 7: Мониторинг и оптимизация

### Стъпка 7.1: Настройте комплексен мониторинг

1. **Създайте персонализирани табла:**

Навигирайте до Azure портала и създайте табло с:
- Брой заявки и латентност за OpenAI
- Процент на грешки в приложението
- Използване на ресурси
- Проследяване на разходите

2. **Настройте аларми:**
```bash
# Предупреждение за висок процент грешки
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Стъпка 7.2: Оптимизация на разходите

1. **Анализирайте текущите разходи:**
```bash
# Използвайте Azure CLI, за да получите данни за разходите
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Имплементирайте контрол на разходите:**
- Настройте бюджетни аларми
- Използвайте политики за autoscaling
- Имплементирайте кеширане на заявки
- Наблюдавайте използването на токени за OpenAI

### **Практическо упражнение 7.1: Оптимизация на производителността**

**Задача**: Оптимизирайте вашето AI приложение както за производителност, така и за разходи.

**Метрики за подобрение:**
- Намалете средното време за отговор с 20%
- Намалете месечните разходи с 15%
- Поддържайте 99.9% време на работа

**Стратегии за пробване:**
- Имплементирайте кеширане на отговори
- Оптимизирайте prompts за ефективност на токените
- Използвайте подходящи compute SKUs
- Настройте адекватно autoscaling

## Финално предизвикателство: Имплементация от край до край

### Сценарий на предизвикателството

Вие сте натоварени със създаването на продукционно готов чатбот за обслужване на клиенти, захранван от AI, със следните изисквания:

**Функционални изисквания:**
- Уеб интерфейс за взаимодействие с клиенти
- Интеграция с Azure OpenAI за отговори
- Търсене на документи чрез Cognitive Search
- Интеграция със съществуваща клиентска база данни
- Поддръжка на много езици

**Нефункционални изисквания:**
- Обработка на 1000 едновременни потребители
- 99.9% SLA за време на работа
- SOC 2 съвместимост
- Разходи под $500/месец
- Разгръщане в множество среди (dev, staging, prod)

### Стъпки за имплементация

1. **Проектирайте архитектурата**
2. **Създайте AZD шаблона**
3. **Имплементирайте мерки за сигурност**
4. **Настройте мониторинг и аларми**
5. **Създайте pipeline-ове за разгръщане**
6. **Документирайте решението**

### Критерии за оценка

- ✅ **Функционалност**: Отговаря ли на всички изисквания?
- ✅ **Сигурност**: Прилагани ли са добри практики?
- ✅ **Мащабируемост**: Може ли да поеме натоварването?
- ✅ **Поддръжка**: Организиран ли е кодът и инфраструктурата?
- ✅ **Разходи**: Остава ли в бюджета?

## Допълнителни ресурси

### Документация на Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Примерни шаблони
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Общностни ресурси
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат за завършване
Congratulations! You've completed the AI Workshop Lab. You should now be able to:

- ✅ Преобразуване на съществуващи AI приложения в AZD шаблони
- ✅ Разгръщане на продукционно готови AI приложения
- ✅ Прилагане на най-добри практики за сигурност за AI натоварвания
- ✅ Наблюдение и оптимизиране на производителността на AI приложения
- ✅ Отстраняване на често срещани проблеми при разгръщане

### Следващи стъпки
1. Приложете тези модели към собствените си AI проекти
2. Допринасяйте с шаблони към общността
3. Присъединете се към Microsoft Foundry Discord за постоянна поддръжка
4. Проучете напреднали теми като разгръщания в множество региони

---

**Обратна връзка за работилницата**: Помогнете ни да подобрим тази работилница, като споделите вашия опит в [канал #Azure в Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка, водена от AI
- **⬅️ Предишна**: [Разгръщане на AI модели](ai-model-deployment.md)
- **➡️ Следваща**: [Добри практики за продукционен AI](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към нашата общност за поддръжка и дискусии относно AZD и разгръщания на AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматичните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия първичен език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за никакви недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->