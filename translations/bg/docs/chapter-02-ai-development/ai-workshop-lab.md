# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD За начинаещи](../../README.md)
- **📖 Current Chapter**: Глава 2 - AI-първоначално развитие
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Workshop Overview

Този практичен лаб води разработчиците през процеса на взимане на съществуващ AI шаблон и неговото разгръщане с помощта на Azure Developer CLI (AZD). Ще научите основни модели за продукционни AI разгръщания, използвайки услугите на Microsoft Foundry.

> **Бележка за валидиране (2026-03-25):** Този работен материал беше прегледан срещу `azd` `1.23.12`. Ако вашата локална инсталация е по-стара, обновете AZD преди започване, за да съвпадне удостоверяването, шаблонът и работният процес на разгръщане със стъпките по-долу.

**Продължителност:** 2-3 часа  
**Ниво:** Средно  
**Предварителни изисквания:** Базови знания за Azure, запознатост с AI/ML концепции

## 🎓 Learning Objectives

Към края на този работен материал ще можете да:
- ✅ Конвертирате съществуващо AI приложение да използва AZD шаблони
- ✅ Конфигурирате Microsoft Foundry услуги с AZD
- ✅ Реализирате сигурно управление на креденшъли за AI услуги
- ✅ Разгърнете продукционно готови AI приложения с мониторинг
- ✅ Отстранявате често срещани проблеми при AI разгръщания

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Редактор на код (препоръчва се VS Code)

### Azure Resources
- Абонамент в Azure с права на Contributor
- Достъп до услугите на Microsoft Foundry Models (или възможност да поискате достъп)
- Права за създаване на ресурсни групи

### Knowledge Prerequisites
- Базово разбиране на услугите на Azure
- Умения с интерфейс на команден ред
- Основни AI/ML концепции (APIs, модели, подсказки)

## Lab Setup

### Step 1: Environment Preparation

1. **Проверете инсталациите на инструментите:**
```bash
# Проверете инсталацията на AZD
azd version

# Проверете Azure CLI
az --version

# Влезте в Azure за работните потоци на AZD
azd auth login

# Влезте в Azure CLI само ако планирате да изпълнявате команди az по време на диагностика
az login
```

Ако работите в множество тенанти или вашият абонамент не се открива автоматично, опитайте отново с `azd auth login --tenant-id <tenant-id>`.

2. **Клонирайте репозитория на работния материал:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Разгледайте ключовите файлове в AZD шаблон, подготвен за AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Прегледайте файла azure.yaml:**
```bash
cat azure.yaml
```

**Какво да търсите:**
- Дефиниции на услуги за AI компоненти
- Картиране на променливи на средата
- Конфигурации на хост

2. **Прегледайте main.bicep инфраструктурата:**
```bash
cat infra/main.bicep
```

**Ключови AI модели за идентифициране:**
- Създаване на услуга Microsoft Foundry Models
- Интеграция с Azure AI Search
- Сигурно управление на ключове
- Конфигурации за мрежова сигурност

### **Discussion Point:** Why These Patterns Matter for AI

- **Зависимости на услугите**: AI приложенията често изискват множество координирани услуги
- **Сигурност**: API ключовете и крайни точки трябва да се управляват сигурно
- **Мащабируемост**: AI натоварванията имат специфични изисквания за мащабиране
- **Управление на разходите**: AI услугите могат да бъдат скъпи, ако не са правилно конфигурирани

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Създайте нова AZD среда:**
```bash
azd env new myai-workshop
```

2. **Задайте необходимите параметри:**
```bash
# Задайте предпочитания регион за Azure
azd env set AZURE_LOCATION eastus

# По избор: Задайте конкретен модел на OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Разгръщане с AZD:**
```bash
azd up
```

**Какво се случва по време на `azd up`:**
- ✅ Провизира услуга Microsoft Foundry Models
- ✅ Създава Azure AI Search услуга
- ✅ Настройва App Service за уеб приложението
- ✅ Конфигурира мрежа и сигурност
- ✅ Разгръща кода на приложението
- ✅ Настройва мониторинг и логване

2. **Наблюдавайте напредъка на разгръщането** и отбелязвайте ресурсите, които се създават.

### Step 2.3: Verify Your Deployment

1. **Проверете разположените ресурси:**
```bash
azd show
```

2. **Отворете разположеното приложение:**
```bash
azd show
```

Отворете уеб крайния адрес, показан в изхода на `azd show`.

3. **Тествайте AI функционалността:**
   - Навигирайте до уеб приложението
   - Пробвайте примерни заявки
   - Потвърдете, че AI отговорите работят

### **Lab Exercise 2.1: Troubleshooting Practice**

**Сценарий**: Разгръщането ви е успешно, но AI не отговаря.

**Често срещани проблеми за проверка:**
1. **OpenAI API ключове**: Проверете дали са правилно зададени
2. **Наличност на модела**: Проверете дали регионът ви поддържа модела
3. **Мрежова свързаност**: Уверете се, че услугите могат да комуникират
4. **RBAC права**: Проверете дали приложението може да достъпва OpenAI

**Команди за отстраняване на грешки:**
```bash
# Проверете променливите на средата
azd env get-values

# Прегледайте логовете за разгръщане
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверете статуса на разгръщането в OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

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

### Step 3.2: Environment-Specific Configurations

**Добра практика**: Различни конфигурации за development и production.

1. **Създайте production среда:**
```bash
azd env new myai-production
```

2. **Задайте параметри специфични за production:**
```bash
# В продукционна среда обикновено се използват по-високи SKU-та
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Активирайте допълнителни функции за сигурност
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Предизвикателство**: Конфигурирайте шаблона за икономично разработване.

**Задачи:**
1. Идентифицирайте кои SKUs могат да бъдат настроени на free/basic нива
2. Конфигурирайте променливи на средата за минимални разходи
3. Разпънете и сравнете разходите с production конфигурацията

**Подсказки за решение:**
- Използвайте F0 (free) tier за Azure AI услуги, когато е възможно
- Използвайте Basic tier за Search Service в development
- Обмислете използване на Consumption план за Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Текущо предизвикателство**: Много AI приложения хардкодират API ключове или използват несигурно съхранение.

**AZD решение**: Managed Identity + Key Vault интеграция.

1. **Прегледайте сигурната конфигурация в шаблона си:**
```bash
# Проверете конфигурацията на Key Vault и на управляваната идентичност
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверете дали Managed Identity работи:**
```bash
# Проверете дали уеб приложението има правилната конфигурация на идентичността
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Активирайте private endpoints** (ако не са вече конфигурирани):

Добавете в бип шаблона си:
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

### Step 4.3: Monitoring and Observability

1. **Конфигурирайте Application Insights:**
```bash
# Application Insights трябва автоматично да се конфигурира
# Проверете конфигурацията:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Настройте мониторинг специфичен за AI:**

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

### **Lab Exercise 4.1: Security Audit**

**Задача**: Прегледайте вашето разгръщане за най-добри практики по сигурността.

**Контролен списък:**
- [ ] Няма хардкодирани тайни в кода или конфигурацията
- [ ] Използвана е Managed Identity за удостоверяване услуга-към-услуга
- [ ] Key Vault съхранява чувствителната конфигурация
- [ ] Достъпът в мрежата е правилно ограничен
- [ ] Мониторингът и логването са активирани

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Преди да конвертирате вашето приложение**, отговорете на тези въпроси:

1. **Архитектура на приложението:**
   - Кои AI услуги използва вашето приложение?
   - Какви изчислителни ресурси са му необходими?
   - Изисква ли база данни?
   - Какви са зависимостите между услугите?

2. **Изисквания за сигурност:**
   - Какви чувствителни данни обработва вашето приложение?
   - Какви изисквания за съответствие имате?
   - Нуждаете ли се от частна мрежа?

3. **Изисквания за мащабиране:**
   - Какво е очакваното натоварване?
   - Нуждаете ли се от автоматично мащабиране?
   - Има ли регионални изисквания?

### Step 5.2: Create Your AZD Template

**Следвайте този модел, за да конвертирате вашето приложение:**

1. **Създайте базовата структура:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Инициализиране на AZD шаблон
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

### **Lab Exercise 5.1: Template Creation Challenge**

**Предизвикателство**: Създайте AZD шаблон за AI приложение за обработка на документи.

**Изисквания:**
- Microsoft Foundry Models за анализ на съдържание
- Document Intelligence за OCR
- Storage Account за качване на документи
- Function App за логика на обработка
- Уеб приложение за потребителски интерфейс

**Бонус точки:**
- Добавете правилно обработване на грешки
- Включете оценка на разходите
- Настройте табла за мониторинг

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Симптоми:** Разгръщането се проваля с грешка за квота
**Решения:**
```bash
# Проверете текущите квоти
az cognitiveservices usage list --location eastus

# Поискайте увеличение на квотата или опитайте друг регион
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Симптоми:** AI отговорите не работят или има грешки при разгръщането на модела
**Решения:**
```bash
# Проверете наличността на модела по региони
az cognitiveservices model list --location eastus

# Актуализирайте до наличния модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Симптоми:** 403 Forbidden грешки при извикване на AI услуги
**Решения:**
```bash
# Провери назначенията на ролите
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Добави липсващите роли
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Стъпки за разследване:**
1. Проверете Application Insights за метрики на производителността
2. Прегледайте метриките на OpenAI услугата в Azure портала
3. Потвърдете мрежовата свързаност и латентност

**Решения:**
- Реализирайте кеширане за често срещани заявки
- Използвайте подходящ OpenAI модел за вашия случай на употреба
- Помислете за read реплики при високо натоварване

### **Lab Exercise 6.1: Debugging Challenge**

**Сценарий**: Разгръщането ви е успешно, но приложението връща 500 грешки.

**Задачи за отстраняване на грешки:**
1. Проверете логовете на приложението
2. Потвърдете свързаността на услугите
3. Тествайте удостоверяването
4. Прегледайте конфигурацията

**Инструменти за използване:**
- `azd show` за преглед на разгръщането
- Azure портал за детайлни логове на услугите
- Application Insights за телеметрия на приложението

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Създайте потребителски табла:**

Навигирайте до Azure портала и създайте табло с:
- Брой заявки към OpenAI и латентност
- Честота на грешки в приложението
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

### Step 7.2: Cost Optimization

1. **Анализирайте текущите разходи:**
```bash
# Използвайте Azure CLI, за да получите данни за разходите
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Реализирайте контрол на разходите:**
- Настройте бюджетни аларми
- Използвайте политики за авто-скалиране
- Реализирайте кеширане на заявки
- Наблюдавайте използването на токени за OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Задача**: Оптимизирайте вашето AI приложение за производителност и разходи.

**Метрики за подобряване:**
- Намалете средното време за отговор с 20%
- Намалете месечните разходи с 15%
- Поддържайте 99.9% време на работа

**Стратегии за опитване:**
- Реализирайте кеширане на отговори
- Оптимизирайте подсказките за ефективност на токените
- Използвайте подходящи compute SKUs
- Настройте правилно авто-скалиране

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Вие сте натоварени със създаване на продукционно готов чатбот за обслужване на клиенти, захранван с AI, със следните изисквания:

**Функционални изисквания:**
- Уеб интерфейс за взаимодействие с клиенти
- Интеграция с Microsoft Foundry Models за отговори
- Търсене в документи с Azure AI Search
- Интеграция със съществуваща клиентска база данни
- Поддръжка на множество езици

**Нефункционални изисквания:**
- Обработка на 1000 едновременни потребители
- 99.9% SLA за време на работа
- SOC 2 съвместимост
- Разход под $500/месец
- Разгръщане в множество среди (dev, staging, prod)

### Implementation Steps

1. **Проектирайте архитектурата**
2. **Създайте AZD шаблона**
3. **Реализирайте мерки за сигурност**
4. **Настройте мониторинг и аларми**
5. **Създайте пайплайни за разгръщане**
6. **Документирайте решението**

### Evaluation Criteria

- ✅ **Функционалност**: Отговаря ли на всички изисквания?
- ✅ **Сигурност**: Прилагани ли са най-добрите практики?
- ✅ **Мащабируемост**: Може ли да поеме натоварването?
- ✅ **Поддръжка**: Подреден ли е кодът и инфраструктурата?
- ✅ **Разходи**: Остава ли в рамките на бюджета?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Общностни ресурси
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат за завършване

Поздравления! Завършихте AI Workshop Lab. Сега би трябвало да можете да:

- ✅ Конвертирате съществуващи AI приложения в AZD шаблони
- ✅ Разполагате продукционно готови AI приложения
- ✅ Прилагате най-добрите практики за сигурност при AI натоварвания
- ✅ Наблюдавате и оптимизирате производителността на AI приложенията
- ✅ Отстранявате често срещани проблеми при разполагането

### Следващи стъпки
1. Приложете тези модели към собствените си AI проекти
2. Допринасяйте с шаблони обратно към общността
3. Присъединете се към Microsoft Foundry Discord за постоянна подкрепа
4. Разгледайте напреднали теми като разгръщане в няколко региона

---

**Обратна връзка за работилницата**: Помогнете ни да подобрим тази работилница, като споделите своя опит в [канал #Azure в Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Навигация между главите:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка, ориентирана към AI
- **⬅️ Предишна**: [Разгръщане на AI модел](ai-model-deployment.md)
- **➡️ Следваща**: [Най-добри практики за продукционен AI](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете ли се от помощ?** Присъединете се към нашата общност за поддръжка и обсъждания относно AZD и разгръщане на AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->