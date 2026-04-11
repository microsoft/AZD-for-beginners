# AI Workshop Lab: Правене на вашите AI решения съвместими с AZD-Deploy

**Навигация в главата:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-First Development
- **⬅️ Предишна**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следваща**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

## Преглед на лабораторията

Тази практическа лаборатория води разработчиците през процеса на вземане на съществуващ AI шаблон и неговото внедряване чрез Azure Developer CLI (AZD). Ще научите основните модели за внедряване на AI в продукция, използвайки услугите на Microsoft Foundry.

> **Забележка за валидиране (2026-03-25):** Тази лаборатория е прегледана с `azd` версия `1.23.12`. Ако вашата локална инсталация е по-стара, актуализирайте AZD преди да започнете, за да съвпадне процесът на автентикация, шаблони и внедряване с описаните по-долу стъпки.

**Продължителност:** 2-3 часа  
**Ниво:** Междинно  
**Предварителни изисквания:** Основни познания за Azure, запознатост с AI/ML концепции

## 🎓 Обучителни цели

Към края на тази лаборатория, ще можете:
- ✅ Да конвертирате съществуващо AI приложение да използва AZD шаблони
- ✅ Да конфигурирате Microsoft Foundry услуги с AZD
- ✅ Да внедрите сигурно управление на удостоверенията за AI услуги
- ✅ Да внедрите AI приложения, готови за продукция с мониторинг
- ✅ Да отстраните често срещани проблеми при внедряването на AI

## Предварителни условия

### Необходими инструменти
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Редактор на код (препоръчва се VS Code)

### Ресурси в Azure
- Абонамент в Azure с права на участник
- Достъп до Microsoft Foundry Models услуги (или възможност за заявка на достъп)
- Правомощия за създаване на група ресурси

### Познання
- Основи на Azure услуги
- Познания за команден ред
- Основни AI/ML понятия (API, модели, промптове)

## Настройка на лабораторията

### Стъпка 1: Подготовка на средата

1. **Проверете инсталациите на инструментите:**
```bash
# Проверка на инсталацията на AZD
azd version

# Проверка на Azure CLI
az --version

# Вход в Azure за работни потоци на AZD
azd auth login

# Вход в Azure CLI само ако планирате да изпълнявате az команди по време на диагностика
az login
```

Ако работите с множество доставчици или абонаментът не се открива автоматично, опитайте отново с `azd auth login --tenant-id <tenant-id>`.

2. **Клонирайте хранилището на лабораторията:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разбиране на структурата на AZD за AI приложения

### Анатомия на AI AZD шаблон

Разгледайте ключовите файлове в AI-готов AZD шаблон:

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

### **Лабораторно упражнение 1.1: Изследване на конфигурацията**

1. **Прегледайте файла azure.yaml:**
```bash
cat azure.yaml
```

**Неща за наблюдение:**
- Определения на услуги за AI компоненти
- Присвояване на променливи на средата
- Хост конфигурации

2. **Прегледайте основната инфраструктура main.bicep:**
```bash
cat infra/main.bicep
```

**Ключови AI модели за идентифициране:**
- Осигуряване на Microsoft Foundry Models услуга
- Интеграция на Cognitive Search
- Сигурно управление на ключове
- Конфигурации за мрежова сигурност

### **Дискусионен въпрос:** Защо тези модели са важни за AI

- **Зависимости на услугите:** AI приложения често изискват множество координирани услуги
- **Сигурност:** API ключовете и крайни точки трябва да се управляват сигурно
- **Мащабируемост:** AI натоварванията имат уникални изисквания за скалиране
- **Управление на разходите:** AI услугите могат да бъдат скъпи, ако не са правилно конфигурирани

## Модул 2: Внедряване на първото AI приложение

### Стъпка 2.1: Инициализиране на средата

1. **Създайте нова AZD среда:**
```bash
azd env new myai-workshop
```

2. **Задайте необходимите параметри:**
```bash
# Задайте предпочитания от вас регион на Azure
azd env set AZURE_LOCATION eastus

# Незадължително: Задайте специфичен модел на OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Стъпка 2.2: Внедряване на инфраструктурата и приложението

1. **Внедрете с AZD:**
```bash
azd up
```

**Какво се случва по време на `azd up`:**
- ✅ Осигурява Microsoft Foundry Models услуга
- ✅ Създава Cognitive Search услуга
- ✅ Настройва App Service за уеб приложението
- ✅ Конфигурира мрежа и сигурност
- ✅ Внедрява код на приложението
- ✅ Настройва мониторинг и логиране

2. **Следете прогреса на внедряването** и отбележете създаваните ресурси.

### Стъпка 2.3: Проверете внедряването си

1. **Проверете създадените ресурси:**
```bash
azd show
```

2. **Отворете внедреното приложение:**
```bash
azd show
```

Отворете уеб крайна точка, показана в изхода на `azd show`.

3. **Тествайте AI функционалността:**
   - Навигирайте до уеб приложението
   - Опитайте примерни заявки
   - Проверете дали AI отговорите работят

### **Лабораторно упражнение 2.1: Практика на отстраняване на проблеми**

**Сценарий**: Внедряването ви е успешно, но AI не отговаря.

**Чести проблеми за проверка:**
1. **OpenAI API ключове**: Проверете дали са правилно зададени
2. **Наличност на модела**: Проверете дали регионът ви поддържа модела
3. **Мрежова свързаност**: Уверете се, че услугите могат да комуникират
4. **Разрешения RBAC**: Проверете дали приложението има достъп до OpenAI

**Команди за отстраняване:**
```bash
# Проверете променливите на средата
azd env get-values

# Прегледайте логовете на разгръщането
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверете статуса на разгръщането на OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Персонализиране на AI приложения за вашите нужди

### Стъпка 3.1: Модифицирайте конфигурацията на AI

1. **Обновете OpenAI модела:**
```bash
# Смяна към друг модел (ако е наличен във вашия регион)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Преразгънете с новата конфигурация
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

**Добра практика**: Различни конфигурации за разработка и продукция.

1. **Създайте производствена среда:**
```bash
azd env new myai-production
```

2. **Задайте параметри за продукция:**
```bash
# В производството обикновено се използват по-високи SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Активиране на допълнителни функции за сигурност
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лабораторно упражнение 3.1: Оптимизация на разходите**

**Задача**: Конфигурирайте шаблона за икономично развитие.

**Задания:**
1. Идентифицирайте кои SKU могат да бъдат настроени на безплатни/базови нива
2. Конфигурирайте променливи на средата за минимални разходи
3. Внедрете и сравнете разходите с производствената конфигурация

**Подсказки за решение:**
- Използвайте F0 (безплатен) план за Cognitive Services, когато е възможно
- Използвайте Basic план за Search Service в разработката
- Обмислете използването на план Consumption за Functions

## Модул 4: Сигурност и добри практики за продукция

### Стъпка 4.1: Сигурно управление на удостоверения

**Текущ проблем**: Много AI приложения втвърждават API ключове или използват несигурно съхранение.

**Решението на AZD**: Управлявана идентичност + интеграция с Key Vault.

1. **Прегледайте конфигурацията за сигурност във вашия шаблон:**
```bash
# Потърсете конфигурация на Key Vault и управлявана идентичност
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверете работата на управляваната идентичност:**
```bash
# Проверете дали уеб приложението има правилната конфигурация на идентичността
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

### Стъпка 4.3: Мониторинг и наблюдаемост

1. **Конфигурирайте Application Insights:**
```bash
# Application Insights трябва да бъде автоматично конфигуриран
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

### **Лабораторно упражнение 4.1: Одит на сигурността**

**Задача**: Прегледайте внедряването си за най-добри сигурностни практики.

**Контролен списък:**
- [ ] Без втвърдени тайни в кода или конфигурацията
- [ ] Използван Managed Identity за аутентикация услуга-услуга
- [ ] Key Vault съхранява чувствителна конфигурация
- [ ] Мрежовият достъп е правилно ограничен
- [ ] Мониторинг и логиране са активирани

## Модул 5: Конвертиране на ваше AI приложение

### Стъпка 5.1: Работен лист за оценка

**Преди да конвертирате приложението си**, отговорете на тези въпроси:

1. **Архитектура на приложението:**
   - Какви AI услуги използва вашето приложение?
   - Какви изчислителни ресурси му трябват?
   - Изисква ли база данни?
   - Какви са зависимостите между услугите?

2. **Изисквания за сигурност:**
   - Какви чувствителни данни обработва приложението ви?
   - Какви изисквания за съответствие имате?
   - Трябва ли ви частна мрежа?

3. **Изисквания за мащабиране:**
   - Какво е очакваното натоварване?
   - Трябва ли автоматично скалиране?
   - Има ли регионални изисквания?

### Стъпка 5.2: Създайте вашия AZD шаблон

**Следвайте този модел, за да конвертирате приложението си:**

1. **Създайте основната структура:**
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

### **Лабораторно упражнение 5.1: Предизвикателство за създаване на шаблон**

**Предизвикателство**: Създайте AZD шаблон за AI приложение за обработка на документи.

**Изисквания:**
- Microsoft Foundry Models за анализ на съдържание
- Document Intelligence за OCR
- Storage Account за качване на документи
- Function App за обработваща логика
- Уеб приложение за потребителски интерфейс

**Бонус точки:**
- Добавете правилно обработване на грешки
- Включете оценка на разходите
- Настройте табла за мониторинг

## Модул 6: Отстраняване на често срещани проблеми

### Често срещани проблеми при внедряване

#### Проблем 1: Превишена квота за OpenAI услуга
**Симптоми:** Внедряването се проваля с грешка за квота  
**Решения:**
```bash
# Проверете текущите квоти
az cognitiveservices usage list --location eastus

# Заявете увеличение на квотата или опитайте различен регион
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Моделът не е наличен в региона
**Симптоми:** AI отговорите не работят или има грешки при внедряване на модела  
**Решения:**
```bash
# Проверете наличността на модела по региони
az cognitiveservices model list --location eastus

# Актуализиране на наличния модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблем 3: Проблеми с разрешенията
**Симптоми:** Грешки 403 Forbidden при извикване на AI услуги  
**Решения:**
```bash
# Проверка на разпределенията на роли
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Добавяне на липсващи роли
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми с производителността

#### Проблем 4: Бавни AI отговори
**Стъпки за разследване:**
1. Проверете Application Insights за метрики на производителността  
2. Прегледайте метрики на OpenAI услугата в Azure портала  
3. Проверете мрежовата свързаност и латентността

**Решения:**
- Внедрете кеширане за чести заявки  
- Използвайте подходящ OpenAI модел за вашия случай  
- Помислете за read replicas при висок товар  

### **Лабораторно упражнение 6.1: Предизвикателство за отстраняване на грешки**

**Сценарий**: Внедряването е успешно, но приложението връща грешки 500.

**Задачи за отстраняване:**
1. Проверете логовете на приложението  
2. Потвърдете свързаността на услугата  
3. Тествайте автентикацията  
4. Прегледайте конфигурацията  

**Използвани инструменти:**
- `azd show` за преглед на внедряването  
- Azure портал за детайлни логове на услуги  
- Application Insights за телеметрия на приложението  

## Модул 7: Мониторинг и оптимизация

### Стъпка 7.1: Настройка на обстоен мониторинг

1. **Създайте персонализирани табла:**

Отидете в Azure портала и създайте табло с:  
- Брой заявки и латентност към OpenAI  
- Честота на грешки в приложението  
- Натоварване на ресурсите  
- Следене на разходите

2. **Настройте аларми:**
```bash
# Предупреждение за висок процент на грешки
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
# Използвайте Azure CLI за получаване на разходни данни
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Внедрете контрол на разходите:**
- Настройте бюджетни аларми  
- Използвайте политики за автоскалиране  
- Внедрете кеширане на заявките  
- Мониторирайте използването на токени за OpenAI

### **Лабораторно упражнение 7.1: Оптимизация на производителността**

**Задача**: Оптимизирайте AI приложението си за производителност и разходи.

**Метрики за подобрение:**
- Намалете средното време за отговор с 20%  
- Намалете месечните разходи с 15%  
- Поддържайте 99.9% работно време  

**Стратегии за опит:**
- Внедрете кеширане на отговори  
- Оптимизирайте промптовете за ефективност на токените  
- Използвайте подходящи SKU за изчисления  
- Настройте правилно автоскалиране  

## Финално предизвикателство: Изпълнение от край до край

### Сценарий на предизвикателството

Вие сте поставени да създадете AI чатбот за обслужване на клиенти, готов за продукция, с тези изисквания:

**Функционални изисквания:**
- Уеб интерфейс за взаимодействие с клиенти  
- Интеграция с Microsoft Foundry Models за отговори  
- Търсене на документи с Cognitive Search  
- Интеграция с налична клиентска база данни  
- Поддръжка на много езици  

**Нефункционални изисквания:**
- Обработка на 1000 едновременни потребители  
- SLA с 99.9% време на работа  
- Съответствие със SOC 2  
- Разходи под $500/месечно  
- Внедряване в множество среди (разработка, тестване, продукция)  

### Стъпки за изпълнение

1. Проектирайте архитектурата  
2. Създайте AZD шаблона  
3. Внедрете мерки за сигурност  
4. Настройте мониторинг и аларми  
5. Създайте конвейери за внедряване  
6. Документирайте решението  

### Критерии за оценка

- ✅ **Функционалност**: Отговаря ли на всички изисквания?  
- ✅ **Сигурност**: Прилагани ли са добри практики?  
- ✅ **Мащабируемост**: Може ли да поеме натоварването?  
- ✅ **Поддръжка**: Добре ли е организиран кодът и инфраструктурата?  
- ✅ **Разходи**: В рамките на бюджет?  

## Допълнителни ресурси

### Документация на Microsoft
- [Документация за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документация за Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документация на Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Примерни шаблони
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Общностни ресурси
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат за завършване

Поздравления! Вие завършихте лабораторията на AI Workshop. Сега трябва да можете да:

- ✅ Преобразувате съществуващи AI приложения в AZD шаблони
- ✅ Деплойвате продукционно готови AI приложения
- ✅ Прилагате най-добри практики за сигурност за AI натоварвания
- ✅ Наблюдавате и оптимизирате производителността на AI приложенията
- ✅ Отстранявате често срещани проблеми при деплоймент

### Следващи стъпки
1. Прилагане на тези модели във вашите AI проекти
2. Принос на шаблони обратно към общността
3. Присъединяване към Microsoft Foundry Discord за постоянна подкрепа
4. Изследване на напреднали теми като деплоймент в много региони

---

**Обратна връзка за работилницата**: Помогнете ни да подобрим тази работилница, като споделите опита си в [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-ориентирана разработка
- **⬅️ Предишна**: [Деплоймент на AI модел](ai-model-deployment.md)
- **➡️ Следваща**: [Най-добри практики за продукционен AI](production-ai-practices.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

**Нуждаете се от помощ?** Присъединете се към нашата общност за подкрепа и дискусии относно AZD и AI деплойменти.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматичните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да било недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->