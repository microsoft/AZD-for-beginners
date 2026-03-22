# AI лаборатория: Направете вашите AI решения разгръщаеми с AZD

**Навигация в главите:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-First Development
- **⬅️ Предишна**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следваща**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед на лабораторията

Това практическо упражнение води разработчиците през процеса на вземане на съществуващ AI шаблон и неговото разгръщане с помощта на Azure Developer CLI (AZD). Ще научите основни модели за продукционно разгръщане на AI, използващи Microsoft Foundry услуги.

**Продължителност:** 2-3 часа  
**Ниво:** Средно  
**Предварителни изисквания:** Основни познания за Azure, запознатост с AI/ML концепции

## 🎓 Учебни цели

Към края на този workshop ще можете да:
- ✅ Преобразувате съществуващо AI приложение да използва AZD шаблони
- ✅ Конфигурирате Microsoft Foundry услуги с AZD
- ✅ Внедрите сигурно управление на идентификационни данни за AI услуги
- ✅ Разгръщате AI приложения готови за продукция с мониторинг
- ✅ Отстранявате често срещани проблеми при разгръщане на AI

## Предварителни изисквания

### Необходими инструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Редактор на код (препоръчва се VS Code)

### Azure ресурси
- Абонамент в Azure с права на contributor
- Достъп до Microsoft Foundry Models услуги (или възможност за искане на достъп)
- Права за създаване на resource group

### Предварителни знания
- Основно разбиране на Azure услуги
- Запознатост с командни интерфейси
- Основни AI/ML концепции (APIs, модели, prompts)

## Настройка на лабораторията

### Стъпка 1: Подготовка на средата

1. **Проверете инсталациите на инструментите:**
```bash
# Проверете инсталацията на AZD
azd version

# Проверете Azure CLI
az --version

# Влезте в Azure
az login
azd auth login
```

2. **Клонирайте репозитория на workshop-а:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разбиране на структурата на AZD за AI приложения

### Анатомия на AI AZD шаблон

Разгледайте ключовите файлове в AZD шаблон, готов за AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Лаб упражнение 1.1: Разгледайте конфигурацията**

1. **Прегледайте файла azure.yaml:**
```bash
cat azure.yaml
```

**Какво да търсите:**
- Дефиниции на услуги за AI компоненти
- Съпоставяне на променливи на средата
- Конфигурации на хостове

2. **Прегледайте инфраструктурата main.bicep:**
```bash
cat infra/main.bicep
```

**Ключови AI модели за идентифициране:**
- Provision-ване на Microsoft Foundry Models услуга
- Интеграция с Cognitive Search
- Сигурно управление на ключове
- Конфигурации за мрежова сигурност

### **Точка за дискусия:** Защо тези модели са важни за AI

- **Зависимости на услугите**: AI приложенията често изискват няколко координирани услуги
- **Сигурност**: API ключовете и endpoints трябва да се управляват сигурно
- **Мащабируемост**: AI натоварванията имат специфични изисквания за мащабиране
- **Управление на разходите**: AI услугите могат да бъдат скъпи, ако не са правилно конфигурирани

## Модул 2: Разгръщане на първото ви AI приложение

### Стъпка 2.1: Инициализиране на средата

1. **Създайте нова AZD среда:**
```bash
azd env new myai-workshop
```

2. **Задайте необходимите параметри:**
```bash
# Задайте предпочитан Azure регион
azd env set AZURE_LOCATION eastus

# По избор: Задайте конкретен OpenAI модел
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Стъпка 2.2: Разгръщане на инфраструктурата и приложението

1. **Разгръщане с AZD:**
```bash
azd up
```

**Какво се случва по време на `azd up`:**
- ✅ Създава Microsoft Foundry Models услуга
- ✅ Създава Cognitive Search услуга
- ✅ Настройва App Service за уеб приложението
- ✅ Конфигурира мрежа и сигурност
- ✅ Разгръща кода на приложението
- ✅ Настройва мониторинг и логване

2. **Следете прогреса на разгръщането** и отбележете ресурсите, които се създават.

### Стъпка 2.3: Проверете своята инсталация

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
   - Опитайте примерни заявки
   - Потвърдете, че AI отговорите работят

### **Лаб упражнение 2.1: Практика за отстраняване на проблеми**

**Ситуация**: Разгръщането е успешно, но AI не отговаря.

**Често срещани проблеми за проверка:**
1. **OpenAI API ключове**: Проверете дали са правилно зададени
2. **Наличност на модела**: Проверете дали вашият регион поддържа модела
3. **Мрежова свързаност**: Уверете се, че услугите могат да комуникират
4. **RBAC права**: Потвърдете, че приложението може да достъпва OpenAI

**Команди за отстраняване на грешки:**
```bash
# Проверете променливите на средата
azd env get-values

# Прегледайте логовете за разгръщане
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверете статуса на разгръщането на OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Персонализиране на AI приложенията според вашите нужди

### Стъпка 3.1: Променете AI конфигурацията

1. **Актуализирайте OpenAI модела:**
```bash
# Преминете към друг модел (ако е наличен във вашия регион)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Разгърнете отново с новата конфигурация
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
# В продукция обикновено се използват SKU от по-висок клас
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Активирайте допълнителни функции за сигурност
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лаб упражнение 3.1: Оптимизация на разходите**

**Предизвикателство**: Конфигурирайте шаблона за икономично развитие.

**Задачи:**
1. Идентифицирайте кои SKU-та могат да бъдат зададени на free/basic нива
2. Конфигурирайте променливи на средата за минимални разходи
3. Разгърнете и сравнете разходите с production конфигурацията

**Подсказки за решение:**
- Използвайте F0 (free) tier за Cognitive Services когато е възможно
- Използвайте Basic tier за Search Service в development
- Помислете за използване на Consumption план за Functions

## Модул 4: Сигурност и добри практики за продукция

### Стъпка 4.1: Сигурно управление на идентификационни данни

**Текущо предизвикателство**: Много AI приложения вграждат API ключове или използват несигурно съхранение.

**AZD решение**: Managed Identity + Key Vault интеграция.

1. **Прегледайте сигурната конфигурация в шаблона си:**
```bash
# Потърсете конфигурацията на Key Vault и Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверете дали Managed Identity работи:**
```bash
# Проверете дали уеб приложението има правилната конфигурация за идентичност
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Стъпка 4.2: Мрежова сигурност

1. **Активирайте private endpoints** (ако не са вече конфигурирани):

Добавете към вашия bicep шаблон:
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

Добавете потребителски метрики за AI операции:
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

### **Лаб упражнение 4.1: Аудит за сигурност**

**Задача**: Прегледайте вашето разгръщане за добри практики за сигурност.

**Контролен списък:**
- [ ] Няма вградени (hardcoded) тайни в кода или конфигурацията
- [ ] Използвана е Managed Identity за удостоверяване между услуги
- [ ] Key Vault съхранява чувствителна конфигурация
- [ ] Мрежовият достъп е правилно ограничен
- [ ] Мониторингът и логването са активирани

## Модул 5: Преобразуване на вашето AI приложение

### Стъпка 5.1: Работен лист за оценка

**Преди да преобразувате вашето приложение**, отговорете на тези въпроси:

1. **Архитектура на приложението:**
   - Кои AI услуги използва вашето приложение?
   - Какви изчислителни ресурси му трябват?
   - Изисква ли база данни?
   - Какви са зависимостите между услугите?

2. **Изисквания за сигурност:**
   - Какви чувствителни данни обработва приложението?
   - Какви изисквания за съответствие имате?
   - Нуждаете ли се от частна мрежа?

3. **Изисквания за мащабиране:**
   - Какво е очакваното натоварване?
   - Нуждаете ли се от автоматично мащабиране?
   - Има ли регионални изисквания?

### Стъпка 5.2: Създайте вашия AZD шаблон

**Следвайте този модел, за да преобразувате вашето приложение:**

1. **Създайте базовата структура:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Инициализирайте шаблона AZD
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

### **Лаб упражнение 5.1: Предизвикателство за създаване на шаблон**

**Предизвикателство**: Създайте AZD шаблон за AI приложение за обработка на документи.

**Изисквания:**
- Microsoft Foundry Models за анализ на съдържание
- Document Intelligence за OCR
- Storage Account за качване на документи
- Function App за логика на обработка
- Уеб приложение за потребителски интерфейс

**Бонус точки:**
- Добавете правилна обработка на грешки
- Включете оценка на разходите
- Настройте monitoring dashboards

## Модул 6: Отстраняване на често срещани проблеми

### Често срещани проблеми при разгръщане

#### Проблем 1: Превишен quota на OpenAI услугата
**Симптоми:** Разгръщането се проваля с грешка за quota
**Решения:**
```bash
# Проверете текущите квоти
az cognitiveservices usage list --location eastus

# Поискайте увеличение на квотите или опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Моделът не е наличен в региона
**Симптоми:** AI отговорите се провалят или разгръщането на модела дава грешка
**Решения:**
```bash
# Проверете наличността на модела по регион
az cognitiveservices model list --location eastus

# Актуализирайте до наличен модел
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблем 3: Проблеми с разрешенията
**Симптоми:** 403 Forbidden грешки при извикване на AI услуги
**Решения:**
```bash
# Проверете разпределенията на роли
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Добавете липсващите роли
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми с производителността

#### Проблем 4: Бавни AI отговори
**Стъпки за разследване:**
1. Проверете Application Insights за метрики на производителността
2. Прегледайте метриките на OpenAI услугата в Azure портала
3. Потвърдете мрежовата свързаност и латентността

**Решения:**
- Внедрете кеширане за често задавани заявки
- Използвайте подходящ OpenAI модел за вашия случай на употреба
- Помислете за read реплики при високо натоварване

### **Лаб упражнение 6.1: Предизвикателство за дебъгване**

**Ситуация**: Разгръщането е успешно, но приложението връща 500 грешки.

**Задачи за дебъгване:**
1. Проверете логовете на приложението
2. Потвърдете свързаността между услугите
3. Тествайте удостоверяването
4. Прегледайте конфигурацията

**Инструменти за използване:**
- `azd show` за обзор на разгръщането
- Azure портал за детайлни логове на услугите
- Application Insights за телеметрия на приложението

## Модул 7: Мониторинг и оптимизация

### Стъпка 7.1: Настройте всеобхватен мониторинг

1. **Създайте персонализирани табла:**

Навигирайте до Azure портала и създайте табло с:
- Брой и латентност на заявки към OpenAI
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

2. **Внедрете контролни мерки за разходи:**
- Настройте бюджетни аларми
- Използвайте политики за автоматично мащабиране
- Внедрете кеширане на заявки
- Наблюдавайте използването на токени за OpenAI

### **Лаб упражнение 7.1: Оптимизация на производителността**

**Задача**: Оптимизирайте AI приложението си както за производителност, така и за разходи.

**Метрики за подобрение:**
- Намалете средното време за отговор с 20%
- Намалете месечните разходи с 15%
- Поддържайте 99.9% време на работа

**Стратегии за опит:**
- Внедрете кеширане на отговорите
- Оптимизирайте prompts за ефективност на токените
- Използвайте подходящи compute SKU-та
- Настройте правилно автоматично мащабиране

## Финално предизвикателство: Реализация от край до край

### Сценарий на предизвикателството

Вие сте натоварени със създаването на продукционно готов чатбот за обслужване на клиенти, базиран на AI, със следните изисквания:

**Функционални изисквания:**
- Уеб интерфейс за взаимодействие с клиенти
- Интеграция с Microsoft Foundry Models за отговори
- Търсене в документи чрез Cognitive Search
- Интеграция със съществуваща база данни за клиенти
- Поддръжка на много езици

**Нефункционални изисквания:**
- Да обработва 1000 едновременно свързани потребители
- SLA 99.9% uptime
- SOC 2 съответствие
- Разходи под $500/месец
- Разгръщане в няколко среди (dev, staging, prod)

### Стъпки за реализация

1. **Проектирайте архитектурата**
2. **Създайте AZD шаблона**
3. **Внедрете мерки за сигурност**
4. **Настройте мониторинг и алармиране**
5. **Създайте конвейери за разгръщане**
6. **Документирайте решението**

### Критерии за оценка

- ✅ **Функционалност**: Отговаря ли на всички изисквания?
- ✅ **Сигурност**: Прилагани ли са добри практики?
- ✅ **Мащабируемост**: Може ли да понесе натоварването?
- ✅ **Поддръжка**: Подреден ли е кодът и инфраструктурата?
- ✅ **Разходи**: Остава ли в рамките на бюджета?

## Допълнителни ресурси

### Документация на Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Примерни шаблони
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси на общността
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат за завършване

Поздравления! Завършихте AI лабораторията. Сега би трябвало да можете да:
- ✅ Преобразувайте съществуващи AI приложения в AZD шаблони
- ✅ Разположете продукционно готови AI приложения
- ✅ Прилагайте добри практики за сигурност при AI натоварвания
- ✅ Наблюдавайте и оптимизирайте производителността на AI приложенията
- ✅ Отстранявайте често срещани проблеми при разгръщане

### Следващи стъпки
1. Приложете тези подходи към собствените си AI проекти
2. Допринесете със шаблони за общността
3. Присъединете се към Microsoft Foundry Discord за непрекъсната поддръжка
4. Разгледайте напреднали теми като многорегионално разгръщане

---

**Обратна връзка за семинара**: Помогнете ни да подобрим този семинар, като споделите своя опит в [Microsoft Foundry Discord канал #Azure](https://discord.gg/microsoft-azure).

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка с фокус върху AI
- **⬅️ Предишна**: [Разгръщане на AI модел](ai-model-deployment.md)
- **➡️ Следваща**: [Най-добри практики за продукционен AI](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към нашата общност за подкрепа и дискусии относно AZD и разгръщания на AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Докато се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на родния му език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->