<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T11:17:11+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "bg"
}
-->
# AI Workshop Lab: Създаване на AI решения, готови за AZD разгръщане

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка с приоритет на AI
- **⬅️ Предишна**: [Разгръщане на AI модел](ai-model-deployment.md)
- **➡️ Следваща**: [Най-добри практики за AI в продукция](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)

## Преглед на работилницата

Тази практическа лаборатория води разработчиците през процеса на адаптиране на съществуващо AI приложение, за да бъде готово за разгръщане с помощта на Azure Developer CLI (AZD). Ще научите основни модели за разгръщане на AI в продукция, използвайки услугите на Azure AI Foundry.

**Продължителност:** 2-3 часа  
**Ниво:** Средно напреднали  
**Предварителни изисквания:** Основни познания за Azure, запознатост с концепции за AI/ML

## 🎓 Цели на обучението

До края на тази работилница ще можете:
- ✅ Да преобразувате съществуващо AI приложение, използвайки AZD шаблони
- ✅ Да конфигурирате услуги на Azure AI Foundry с AZD
- ✅ Да внедрите сигурно управление на идентификационни данни за AI услуги
- ✅ Да разгръщате AI приложения, готови за продукция, с мониторинг
- ✅ Да отстранявате често срещани проблеми при разгръщане на AI

## Предварителни изисквания

### Необходими инструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Редактор на код (препоръчва се VS Code)

### Ресурси в Azure
- Абонамент за Azure с достъп на ниво contributor
- Достъп до Azure OpenAI услуги (или възможност за заявка за достъп)
- Разрешения за създаване на ресурсни групи

### Знания
- Основно разбиране на услугите на Azure
- Запознатост с командни интерфейси
- Основни концепции за AI/ML (API, модели, подсказки)

## Настройка на лабораторията

### Стъпка 1: Подготовка на средата

1. **Проверете инсталираните инструменти:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Клонирайте хранилището на работилницата:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разбиране на структурата на AZD за AI приложения

### Анатомия на AI шаблон за AZD

Разгледайте ключовите файлове в шаблон, готов за AI:

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

### **Упражнение 1.1: Разгледайте конфигурацията**

1. **Прегледайте файла azure.yaml:**
```bash
cat azure.yaml
```

**Какво да търсите:**
- Дефиниции на услуги за AI компоненти
- Съответствия на променливи на средата
- Конфигурации на хостове

2. **Прегледайте основната инфраструктура main.bicep:**
```bash
cat infra/main.bicep
```

**Основни AI модели за идентифициране:**
- Осигуряване на услуга Azure OpenAI
- Интеграция с Cognitive Search
- Сигурно управление на ключове
- Конфигурации за мрежова сигурност

### **Точка за дискусия:** Защо тези модели са важни за AI

- **Зависимости на услугите**: AI приложенията често изискват координирани услуги
- **Сигурност**: API ключовете и крайните точки трябва да се управляват сигурно
- **Мащабируемост**: AI натоварванията имат уникални изисквания за мащабиране
- **Управление на разходите**: AI услугите могат да бъдат скъпи, ако не са правилно конфигурирани

## Модул 2: Разгръщане на първото ви AI приложение

### Стъпка 2.1: Инициализиране на средата

1. **Създайте нова AZD среда:**
```bash
azd env new myai-workshop
```

2. **Задайте необходимите параметри:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Стъпка 2.2: Разгръщане на инфраструктурата и приложението

1. **Разгръщане с AZD:**
```bash
azd up
```

**Какво се случва по време на `azd up`:**
- ✅ Осигурява услуга Azure OpenAI
- ✅ Създава услуга Cognitive Search
- ✅ Настройва App Service за уеб приложението
- ✅ Конфигурира мрежата и сигурността
- ✅ Разгръща код на приложението
- ✅ Настройва мониторинг и логове

2. **Наблюдавайте напредъка на разгръщането** и отбележете създадените ресурси.

### Стъпка 2.3: Проверка на разгръщането

1. **Проверете разгръщаните ресурси:**
```bash
azd show
```

2. **Отворете разгръщаното приложение:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Тествайте AI функционалността:**
   - Навигирайте до уеб приложението
   - Опитайте примерни заявки
   - Уверете се, че AI отговорите работят

### **Упражнение 2.1: Практика за отстраняване на проблеми**

**Сценарий**: Разгръщането е успешно, но AI не отговаря.

**Често срещани проблеми за проверка:**
1. **API ключове за OpenAI**: Уверете се, че са правилно зададени
2. **Наличност на модела**: Проверете дали вашият регион поддържа модела
3. **Мрежова свързаност**: Уверете се, че услугите могат да комуникират
4. **RBAC разрешения**: Уверете се, че приложението има достъп до OpenAI

**Команди за отстраняване на проблеми:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Персонализиране на AI приложения според вашите нужди

### Стъпка 3.1: Модифициране на AI конфигурацията

1. **Актуализирайте модела на OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

### Стъпка 3.2: Конфигурации, специфични за средата

**Най-добра практика**: Различни конфигурации за разработка и продукция.

1. **Създайте среда за продукция:**
```bash
azd env new myai-production
```

2. **Задайте параметри, специфични за продукция:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Упражнение 3.1: Оптимизация на разходите**

**Предизвикателство**: Конфигурирайте шаблона за икономична разработка.

**Задачи:**
1. Идентифицирайте кои SKUs могат да бъдат зададени на безплатни/основни нива
2. Конфигурирайте променливи на средата за минимални разходи
3. Разгърнете и сравнете разходите с конфигурацията за продукция

**Подсказки за решение:**
- Използвайте F0 (безплатно) ниво за Cognitive Services, когато е възможно
- Използвайте Basic ниво за Search Service в разработка
- Помислете за използване на Consumption план за Functions

## Модул 4: Сигурност и най-добри практики за продукция

### Стъпка 4.1: Сигурно управление на идентификационни данни

**Текущо предизвикателство**: Много AI приложения използват твърдо кодирани API ключове или несигурно съхранение.

**Решение на AZD**: Управлявана идентичност + интеграция с Key Vault.

1. **Прегледайте конфигурацията за сигурност във вашия шаблон:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Уверете се, че управляваната идентичност работи:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Стъпка 4.2: Мрежова сигурност

1. **Активирайте частни крайни точки** (ако не са конфигурирани):

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

### Стъпка 4.3: Мониторинг и наблюдение

1. **Конфигурирайте Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Настройте мониторинг, специфичен за AI:**

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

### **Упражнение 4.1: Одит на сигурността**

**Задача**: Прегледайте вашето разгръщане за най-добри практики за сигурност.

**Контролен списък:**
- [ ] Няма твърдо кодирани тайни в кода или конфигурацията
- [ ] Използвана управлявана идентичност за удостоверяване между услуги
- [ ] Key Vault съхранява чувствителна конфигурация
- [ ] Мрежовият достъп е правилно ограничен
- [ ] Мониторингът и логовете са активирани

## Модул 5: Преобразуване на вашето AI приложение

### Стъпка 5.1: Оценка на приложението

**Преди да преобразувате вашето приложение**, отговорете на тези въпроси:

1. **Архитектура на приложението:**
   - Какви AI услуги използва вашето приложение?
   - Какви изчислителни ресурси са необходими?
   - Нуждае ли се от база данни?
   - Какви са зависимостите между услугите?

2. **Изисквания за сигурност:**
   - Какви чувствителни данни обработва вашето приложение?
   - Какви изисквания за съответствие имате?
   - Нуждаете ли се от частна мрежа?

3. **Изисквания за мащабиране:**
   - Какво е очакваното натоварване?
   - Нуждаете ли се от автоматично мащабиране?
   - Има ли регионални изисквания?

### Стъпка 5.2: Създаване на вашия AZD шаблон

**Следвайте този модел, за да преобразувате вашето приложение:**

1. **Създайте основната структура:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

**infra/modules/openai.bicep** - Модул за OpenAI:
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

### **Упражнение 5.1: Предизвикателство за създаване на шаблон**

**Предизвикателство**: Създайте AZD шаблон за AI приложение за обработка на документи.

**Изисквания:**
- Azure OpenAI за анализ на съдържание
- Document Intelligence за OCR
- Storage Account за качване на документи
- Function App за логика на обработка
- Уеб приложение за потребителски интерфейс

**Бонус точки:**
- Добавете подходящо обработване на грешки
- Включете оценка на разходите
- Настройте мониторинг табла

## Модул 6: Отстраняване на често срещани проблеми

### Често срещани проблеми при разгръщане

#### Проблем 1: Превишена квота за OpenAI услуга
**Симптоми:** Разгръщането се проваля с грешка за квота
**Решения:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Моделът не е наличен в региона
**Симптоми:** AI отговорите се провалят или грешки при разгръщане на модела
**Решения:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблем 3: Проблеми с разрешенията
**Симптоми:** 403 Forbidden грешки при извикване на AI услуги
**Решения:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
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
3. Уверете се в мрежовата свързаност и латентност

**Решения:**
- Внедрете кеширане за често срещани заявки
- Използвайте подходящ OpenAI модел за вашия случай
- Помислете за реплики за четене при високо натоварване

### **Упражнение 6.1: Предизвикателство за отстраняване на проблеми**

**Сценарий**: Разгръщането е успешно, но приложението връща 500 грешки.

**Задачи за отстраняване на проблеми:**
1. Проверете логовете на приложението
2. Уверете се в свързаността на услугите
3. Тествайте удостоверяването
4. Прегледайте конфигурацията

**Инструменти за използване:**
- `azd show` за преглед на разгръщането
- Azure портал за подробни логове на услугите
- Application Insights за телеметрия на приложението

## Модул 7: Мониторинг и оптимизация

### Стъпка 7.1: Настройка на цялостен мониторинг

1. **Създайте персонализирани табла:**

Навигирайте до Azure портала и създайте табло с:
- Брой заявки и латентност на OpenAI
- Процент на грешки в приложението
- Използване на ресурси
- Проследяване на разходите

2. **Настройте известия:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Внедрете контрол на разходите:**
- Настройте известия за бюджет
- Използвайте политики за автоматично мащабиране
- Внедрете кеширане на заявки
- Мониторирайте използването на токени за OpenAI

### **Упражнение 7.1: Оптимизация на производителността**

**Задача**: Оптимизирайте вашето AI приложение за производителност и разходи.

**Метрики за подобрение:**
- Намалете средното време за отговор с 20%
- Намалете месечните разходи с 15%
- Поддържайте 99.9% наличност

**Стратегии за опитване:**
- Внедрете кеширане на отговори
- Оптимизирайте подсказките за ефективност на токените
- Използвайте подходящи SKUs за изчисления
- Настройте правилно автоматично мащабиране

## Финално предизвикателство: Цялостна имплементация

### Сценарий на предизвикателството

Вашата задача е да създадете AI-базиран чатбот за обслужване на клиенти, готов за продукция, със следните изисквания:

**Функционални изисквания:**
- Уеб интерфейс за взаимодействие с клиенти
- Интеграция с Azure OpenAI за отговори
- Търсене в документи с Cognitive Search
- Интеграция със съществуваща база данни на клиенти
- Поддръжка на много езици

**Нефункционални изисквания:**
- Обработка на 1000 едновременни потребители
- SLA за наличност от 99.9%
- Съответствие със SOC 2
- Разходи под $500/месец
- Разгръщане в множество среди (разработка, тестване, продукция)

### Стъпки за имплементация

1. **Проектирайте архитектурата**
2. **Създайте AZD шаблона**
3. **Внедрете мерки за сигурност**
4. **Настройте мониторинг и известия**
5. **Създайте разгръщащи се конвейери**
6. **Документи
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 Сертификат за завършване  

Поздравления! Успешно завършихте лабораторията на AI Workshop. Вече трябва да можете да:  

- ✅ Преобразувате съществуващи AI приложения в AZD шаблони  
- ✅ Разгръщате AI приложения, готови за продукция  
- ✅ Прилагате най-добрите практики за сигурност при AI натоварвания  
- ✅ Наблюдавате и оптимизирате производителността на AI приложения  
- ✅ Отстранявате често срещани проблеми при разгръщане  

### Следващи стъпки  
1. Приложете тези модели към вашите собствени AI проекти  
2. Допринасяйте с шаблони обратно към общността  
3. Присъединете се към Azure AI Foundry Discord за текуща поддръжка  
4. Разгледайте напреднали теми като разгръщане в множество региони  

---  

**Обратна връзка за работилницата**: Помогнете ни да подобрим тази работилница, като споделите вашия опит в [Azure AI Foundry Discord #Azure канала](https://discord.gg/microsoft-azure).  

---  

**Навигация по глави:**  
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)  
- **📖 Текуща глава**: Глава 2 - Разработка с приоритет на AI  
- **⬅️ Предишна**: [Разгръщане на AI модели](ai-model-deployment.md)  
- **➡️ Следваща**: [Най-добри практики за продукционен AI](production-ai-practices.md)  
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)  

**Нуждаете се от помощ?** Присъединете се към нашата общност за поддръжка и дискусии относно AZD и AI разгръщания.  

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да било недоразумения или погрешни интерпретации, произтичащи от използването на този превод.