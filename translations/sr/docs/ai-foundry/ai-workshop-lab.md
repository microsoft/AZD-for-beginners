<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T11:38:40+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "sr"
}
-->
# Радионица за AI: Припрема ваших AI решења за AZD-деплојмент

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 2 - Развој са AI као приоритетом
- **⬅️ Претходно**: [Деплојмент AI модела](ai-model-deployment.md)
- **➡️ Следеће**: [Најбоље праксе за AI у продукцији](production-ai-practices.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)

## Преглед радионице

Ова практична радионица води програмере кроз процес припреме постојеће AI апликације за деплојмент уз помоћ Azure Developer CLI (AZD). Научићете основне шаблоне за продукцијске AI деплојменте користећи Azure AI Foundry услуге.

**Трајање:** 2-3 сата  
**Ниво:** Средњи  
**Предуслови:** Основно познавање Azure-а, упознатост са AI/ML концептима

## 🎓 Циљеви учења

На крају радионице, моћи ћете да:
- ✅ Претворите постојећу AI апликацију у AZD шаблон
- ✅ Конфигуришете Azure AI Foundry услуге уз AZD
- ✅ Примените сигурно управљање акредитивима за AI услуге
- ✅ Деплојтујете AI апликације спремне за продукцију уз мониторинг
- ✅ Решавате уобичајене проблеме са AI деплојментом

## Предуслови

### Потребни алати
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Уређивач кода (препоручује се VS Code)

### Azure ресурси
- Azure претплата са приступом као сарадник
- Приступ Azure OpenAI услугама (или могућност да затражите приступ)
- Дозволе за креирање група ресурса

### Знање
- Основно разумевање Azure услуга
- Упознатост са командним линијама
- Основни AI/ML концепти (API-ји, модели, упити)

## Подешавање радионице

### Корак 1: Припрема окружења

1. **Проверите инсталацију алата:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Клонирајте репозиторијум радионице:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разумевање AZD структуре за AI апликације

### Анатомија AZD шаблона за AI

Истражите кључне датотеке у AZD шаблону спремном за AI:

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

### **Вежба 1.1: Истражите конфигурацију**

1. **Прегледајте azure.yaml датотеку:**
```bash
cat azure.yaml
```

**На шта обратити пажњу:**
- Дефиниције услуга за AI компоненте
- Мапирање променљивих окружења
- Конфигурације хоста

2. **Прегледајте main.bicep инфраструктуру:**
```bash
cat infra/main.bicep
```

**Кључни AI шаблони за идентификацију:**
- Провизионисање Azure OpenAI услуге
- Интеграција Cognitive Search-а
- Сигурно управљање кључевима
- Конфигурације мрежне сигурности

### **Тема за дискусију:** Зашто су ови шаблони важни за AI

- **Зависности услуга**: AI апликације често захтевају координацију више услуга
- **Сигурност**: API кључеви и крајње тачке морају бити сигурно управљани
- **Скалабилност**: AI радни задаци имају јединствене захтеве за скалирање
- **Управљање трошковима**: AI услуге могу бити скупе ако нису правилно конфигурисане

## Модул 2: Деплојтујте вашу прву AI апликацију

### Корак 2.1: Иницијализујте окружење

1. **Креирајте ново AZD окружење:**
```bash
azd env new myai-workshop
```

2. **Поставите потребне параметре:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Корак 2.2: Деплојтујте инфраструктуру и апликацију

1. **Деплојтујте уз AZD:**
```bash
azd up
```

**Шта се дешава током `azd up`:**
- ✅ Провизионише Azure OpenAI услугу
- ✅ Креира Cognitive Search услугу
- ✅ Поставља App Service за веб апликацију
- ✅ Конфигурише мрежу и сигурност
- ✅ Деплојтује код апликације
- ✅ Поставља мониторинг и логовање

2. **Пратите напредак деплојмента** и забележите креиране ресурсе.

### Корак 2.3: Проверите ваш деплојмент

1. **Проверите деплојтоване ресурсе:**
```bash
azd show
```

2. **Отворите деплојтовану апликацију:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Тестирајте AI функционалност:**
   - Отворите веб апликацију
   - Испробајте пример упита
   - Проверите да ли AI одговори функционишу

### **Вежба 2.1: Практична вежба решавања проблема**

**Сценарио**: Ваш деплојмент је успешан, али AI не одговара.

**Уобичајени проблеми за проверу:**
1. **OpenAI API кључеви**: Проверите да ли су правилно постављени
2. **Доступност модела**: Проверите да ли ваш регион подржава модел
3. **Мрежна повезаност**: Уверите се да услуге могу комуницирати
4. **RBAC дозволе**: Проверите да ли апликација има приступ OpenAI-у

**Команде за дебаговање:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Прилагођавање AI апликација вашим потребама

### Корак 3.1: Модификујте AI конфигурацију

1. **Ажурирајте OpenAI модел:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Додајте додатне AI услуге:**

Измените `infra/main.bicep` да додате Document Intelligence:

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

### Корак 3.2: Конфигурације специфичне за окружење

**Најбоља пракса**: Различите конфигурације за развој и продукцију.

1. **Креирајте продукцијско окружење:**
```bash
azd env new myai-production
```

2. **Поставите параметре специфичне за продукцију:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Вежба 3.1: Оптимизација трошкова**

**Изазов**: Конфигуришите шаблон за економичан развој.

**Задаци:**
1. Идентификујте које SKUs могу бити постављене на бесплатне/основне нивое
2. Конфигуришите променљиве окружења за минималне трошкове
3. Деплојтујте и упоредите трошкове са продукцијском конфигурацијом

**Савети за решење:**
- Користите F0 (бесплатни) ниво за Cognitive Services кад год је могуће
- Користите основни ниво за Search Service у развоју
- Размотрите коришћење Consumption плана за Functions

## Модул 4: Сигурност и најбоље праксе за продукцију

### Корак 4.1: Сигурно управљање акредитивима

**Тренутни изазов**: Многе AI апликације користе хардкодоване API кључеве или несигурно складиште.

**AZD решење**: Managed Identity + Key Vault интеграција.

1. **Прегледајте сигурносну конфигурацију у вашем шаблону:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверите да ли Managed Identity функционише:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Корак 4.2: Мрежна сигурност

1. **Омогућите приватне крајње тачке** (ако већ нису конфигурисане):

Додајте у ваш bicep шаблон:
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

### Корак 4.3: Мониторинг и опсервабилност

1. **Конфигуришите Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Поставите мониторинг специфичан за AI:**

Додајте прилагођене метрике за AI операције:
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

### **Вежба 4.1: Сигурносна ревизија**

**Задатак**: Прегледајте ваш деплојмент за најбоље праксе сигурности.

**Контролна листа:**
- [ ] Нема хардкодованих тајни у коду или конфигурацији
- [ ] Managed Identity се користи за аутентификацију између услуга
- [ ] Key Vault чува осетљиву конфигурацију
- [ ] Мрежни приступ је правилно ограничен
- [ ] Мониторинг и логовање су омогућени

## Модул 5: Претварање ваше AI апликације

### Корак 5.1: Радни лист за процену

**Пре него што претворите вашу апликацију**, одговорите на ова питања:

1. **Архитектура апликације:**
   - Које AI услуге ваша апликација користи?
   - Које ресурсе за рачунање су јој потребни?
   - Да ли јој је потребна база података?
   - Које су зависности између услуга?

2. **Захтеви за сигурност:**
   - Које осетљиве податке ваша апликација обрађује?
   - Које захтеве за усклађеност имате?
   - Да ли вам је потребна приватна мрежа?

3. **Захтеви за скалирање:**
   - Које је ваше очекивано оптерећење?
   - Да ли вам је потребно аутоматско скалирање?
   - Да ли постоје регионални захтеви?

### Корак 5.2: Креирајте ваш AZD шаблон

**Пратите овај шаблон да претворите вашу апликацију:**

1. **Креирајте основну структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Креирајте azure.yaml:**
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

3. **Креирајте инфраструктурне шаблоне:**

**infra/main.bicep** - Главни шаблон:
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

### **Вежба 5.1: Изазов креирања шаблона**

**Изазов**: Креирајте AZD шаблон за апликацију за обраду докумената.

**Захтеви:**
- Azure OpenAI за анализу садржаја
- Document Intelligence за OCR
- Storage Account за отпремање докумената
- Function App за логику обраде
- Веб апликација за кориснички интерфејс

**Бонус поени:**
- Додајте правилно руковање грешкама
- Укључите процену трошкова
- Поставите мониторинг табле

## Модул 6: Решавање уобичајених проблема

### Уобичајени проблеми са деплојментом

#### Проблем 1: Прекорачен OpenAI сервисни квота
**Симптоми:** Деплојмент не успева са грешком квоте
**Решења:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Модел није доступан у региону
**Симптоми:** AI одговори не успевају или грешке у деплојменту модела
**Решења:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Проблем 3: Проблеми са дозволама
**Симптоми:** 403 Forbidden грешке приликом позивања AI услуга
**Решења:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми са перформансама

#### Проблем 4: Спори AI одговори
**Кораци истраге:**
1. Проверите метрике перформанси у Application Insights
2. Прегледајте метрике OpenAI услуге у Azure порталу
3. Проверите мрежну повезаност и кашњење

**Решења:**
- Примените кеширање за уобичајене упите
- Користите одговарајући OpenAI модел за ваш случај употребе
- Размотрите реплике за читање за сценарије са великим оптерећењем

### **Вежба 6.1: Изазов дебаговања**

**Сценарио**: Ваш деплојмент је успешан, али апликација враћа 500 грешке.

**Задаци дебаговања:**
1. Проверите логове апликације
2. Проверите повезаност услуга
3. Тестирајте аутентификацију
4. Прегледајте конфигурацију

**Алатке за коришћење:**
- `azd show` за преглед деплојмента
- Azure портал за детаљне логове услуга
- Application Insights за телеметрију апликације

## Модул 7: Мониторинг и оптимизација

### Корак 7.1: Поставите свеобухватни мониторинг

1. **Креирајте прилагођене табле:**

Навигирајте до Azure портала и креирајте таблу са:
- Број захтева и кашњење OpenAI-а
- Стопе грешака апликације
- Искоришћење ресурса
- Праћење трошкова

2. **Поставите аларме:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Корак 7.2: Оптимизација трошкова

1. **Анализирајте тренутне трошкове:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Примените контролу трошкова:**
- Поставите аларме за буџет
- Користите политике аутоматског скалирања
- Примените кеширање захтева
- Пратите употребу токена за OpenAI

### **Вежба 7.1: Оптимизација перформанси**

**Задатак**: Оптимизујте вашу AI апликацију за перформансе и трошкове.

**Метрике за побољшање:**
- Смањите просечно време одговора за 20%
- Смањите месечне трошкове за 15%
- Одржавајте 99.9% доступности

**Стратегије за пробати:**
- Примените кеширање одговора
- Оптимизујте упите за ефикасност токена
- Користите одговарајуће SKUs за рачунање
- Поставите правилно аутоматско скалирање

## Завршни изазов: Имплементација од почетка до краја

### Сценарио изазова

Задатак вам је да креирате продукцијски спреман AI chatbot за корисничку подршку са следећим захтевима:

**Функционални захтеви:**
- Веб интерфејс за интеракцију са корисницима
- Интеграција са Azure OpenAI за одговоре
- Претраживање докумената уз Cognitive Search
- Интеграција са постојећом базом података корисника
- Подршка за више језика

**Нефункционални захтеви:**
- Обрада 1000 истовремених корисника
- SLA доступности од 99.9%
- Усклађеност са SOC 2
- Трошкови испод $500 месечно
- Деплојмент у више окружења (развој, тестирање, продукција)

### Кораци имплементације

1. **Дизајнирајте архитектуру**
2. **Креирајте AZ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 Сертификат о завршетку  

Честитамо! Завршили сте радионицу о вештачкој интелигенцији. Сада би требало да будете у могућности да:  

- ✅ Претворите постојеће апликације засноване на вештачкој интелигенцији у AZD шаблоне  
- ✅ Деплојујете апликације засноване на вештачкој интелигенцији спремне за продукцију  
- ✅ Примените најбоље праксе за безбедност радних оптерећења заснованих на вештачкој интелигенцији  
- ✅ Пратите и оптимизујете перформансе апликација заснованих на вештачкој интелигенцији  
- ✅ Решавате уобичајене проблеме приликом деплоја  

### Следећи кораци  
1. Примените ове шаблоне на сопствене пројекте засноване на вештачкој интелигенцији  
2. Допринесите шаблонима заједници  
3. Придружите се Azure AI Foundry Discord серверу за континуирану подршку  
4. Истражите напредне теме као што су деплоји у више региона  

---  

**Повратне информације о радионици**: Помозите нам да унапредимо ову радионицу тако што ћете поделити своје искуство у [Azure AI Foundry Discord #Azure каналу](https://discord.gg/microsoft-azure).  

---  

**Навигација кроз поглавља:**  
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)  
- **📖 Текуће поглавље**: Поглавље 2 - Развој заснован на вештачкој интелигенцији  
- **⬅️ Претходно**: [Деплој модела вештачке интелигенције](ai-model-deployment.md)  
- **➡️ Следеће**: [Најбоље праксе за продукцију засновану на вештачкој интелигенцији](production-ai-practices.md)  
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)  

**Потребна помоћ?** Придружите се нашој заједници за подршку и дискусије о AZD и деплојима заснованим на вештачкој интелигенцији.  

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не сносимо одговорност за било каква погрешна тумачења или неспоразуме који могу произаћи из коришћења овог превода.