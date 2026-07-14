# AI радионица лабораторија: Како направити да ваша AI решења буду AZD-Deployable

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-први развој
- **⬅️ Претходно**: [Деплоирање AI модела](ai-model-deployment.md)
- **➡️ Следеће**: [Најбоље праксе за производни AI](production-ai-practices.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед радионице

Ова радионица са практичним примерима води програмере кроз процес коришћења постојећег AI шаблона и његовог распоређивања користећи Azure Developer CLI (AZD). Научићете кључне шаблоне за производни AI деплои користећи Microsoft Foundry услуге.

> **Напомена о валидацији (2026-07-13):** Ова радионица је прегледана против `azd` верзије `1.27.1`. Ако је ваша локална инсталација старија, ажурирајте AZD пре почетка како би аутентикација, шаблон и ток деплоирања одговарали корацима у наставку.

**Трајање:** 2-3 сата  
**Нивоум:** Средњи  
**Претходна знања:** Основно знање о Azure-у, упознавање са AI/ML концептима

## 🎓 Циљеви учења

До краја ове радионице моћи ћете да:
- ✅ Претворите постојећу AI апликацију да користи AZD шаблоне
- ✅ Конфигуришете Microsoft Foundry услуге са AZD
- ✅ Имплементирате безбедно управљање креденцијалима за AI услуге
- ✅ Распоредите AI апликације спремне за производњу са мониторингом
- ✅ Решавате уобичајене проблеме при деплоирању AI

## Претходни услови

### Потребни алати
- Инсталиран [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Инсталиран [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Инсталиран [Git](https://git-scm.com/)
- Уредник кода (препоручује се VS Code)

### Azure ресурси
- Azure претплата са приступом на нивоу сарадника
- Приступ Microsoft Foundry Models услугама (или могућност захтева за приступ)
- Дозволе за креирање ресурса

### Знања претходно
- Основно разумевање Azure услуга
- Познавање командне линије
- Основни AI/ML концепти (API-ји, модели, упити)

## Подешавање лабораторије

### Корак 1: Припрема окружења

1. **Проверите инсталацију алата:**
```bash
# Провери инсталацију AZD-а
azd version

# Провери Azure CLI
az --version

# Пријави се у Azure за AZD токове рада
azd auth login

# Пријави се у Azure CLI само ако планираш да користиш az команде током дијагностике
az login
```

Ако радите у више тенаната или ваша претплата није аутоматски препозната, покушајте поново са `azd auth login --tenant-id <tenant-id>`.

2. **Клонирајте репозиторијум радионице:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разумевање AZD структуре за AI апликације

### Анатомија AI AZD шаблона

Истражите кључне датотеке у AI-спремном AZD шаблону:

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

### **Вежба 1.1: Истражите конфигурацију**

1. **Погледајте azure.yaml датотеку:**
```bash
cat azure.yaml
```

**На шта обратити пажњу:**
- Дефиниције услуга за AI компоненте
- Мапирања окружења променљивих
- Конфигурација хоста

2. **Прегледајте инфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Кључни AI шаблони за идентификацију:**
- Пружање Microsoft Foundry Models услуге
- Интеграција Azure AI претраге
- Безбедно управљање кључевима
- Конфигурација безбедности мреже

### **Тема за дискусију:** Зашто су ови шаблони важни за AI

- **Зависности услуга**: AI апликације често захтевају више координисаних услуга
- **Безбедност**: API кључеви и крајње тачке треба да буду сигурно управљани
- **Скалабилност**: AI радни оптерећења имају јединствене захтеве за скалабилношћу
- **Контрола трошкова**: AI услуге могу бити скупе ако нису правилно конфигурисане

## Модул 2: Распоредите вашу прву AI апликацију

### Корак 2.1: Иницијализација окружења

1. **Креирајте ново AZD окружење:**
```bash
azd env new myai-workshop
```

2. **Подесите потребне параметре:**
```bash
# Поставите жељени Azure регион
azd env set AZURE_LOCATION eastus

# Опционо: Поставите конкретан OpenAI модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Корак 2.2: Деплоирајте инфраструктуру и апликацију

1. **Деплоирајте уз помоћ AZD:**
```bash
azd up
```

**Шта се дешава током `azd up`:**
- ✅ Пружа Microsoft Foundry Models услугу
- ✅ Креира Azure AI Search услугу
- ✅ Подешава App Service за веб апликацију
- ✅ Конфигурише мрежу и безбедност
- ✅ Распоређује код апликације
- ✅ Подешава мониторинг и логовање

2. **Пратите напредак деплоирања** и забележите креиране ресурсе.

### Корак 2.3: Проверите ваш деплоирање

1. **Проверите деплојиране ресурсе:**
```bash
azd show
```

2. **Отворите деплојирану апликацију:**
```bash
azd show
```

Отворите веб крајњу тачку приказану у `azd show` излазу.

3. **Тестирајте AI функционалност:**
   - Посетите веб апликацију
   - Испробајте пример упита
   - Потврдите да AI одговори функционишу

### **Вежба 2.1: Практична потрага за грешкама**

**Сценарио**: Ваш деплој је успео, али AI не одговара.

**Уобичајени проблеми које треба проверити:**
1. **OpenAI API кључеви**: Проверите да ли су исправно подешени
2. **Доступност модела**: Проверите да ли ваш регион подржава модел
3. **Мрежна повезаност**: Обезбедите да услуге могу комуницирати
4. **RBAC дозволе**: Потврдите да апликација може приступити OpenAI

**Команде за отклањање грешака:**
```bash
# Проверите променљиве окружења
azd env get-values

# Погледајте дневнике распореда
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверите статус распореда OpenAI-а
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Прилагођавање AI апликација вашим потребама

### Корак 3.1: Измена AI конфигурације

1. **Ажурирајте OpenAI модел:**
```bash
# Пребаци на други модел (ако је доступан у вашем региону)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Редејлајт са новом конфигурацијом
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

**Најбоља пракса**: Различите конфигурације за развој и производњу.

1. **Креирајте производно окружење:**
```bash
azd env new myai-production
```

2. **Подесите параметре специфичне за производњу:**
```bash
# Производња обично користи виши број СКУ-а
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Омогући додатне безбедносне функције
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Вежба 3.1: Оптимизација трошкова**

**Изазов**: Конфигуришите шаблон ради економичног развоја.

**Задаци:**
1. Идентификујте које SKU-ове можете поставити на бесплатни/основни ниво
2. Подесите променљиве окружења за минималне трошкове
3. Распоредите и упоредите трошкове са производном конфигурацијом

**Савети за решење:**
- Користите F0 (бесплатни) ниво за Azure AI услуге кад год је могуће
- Користите Basic ниво за Search Service током развоја
- Размотрите коришћење Consumption планa за Functions

## Модул 4: Безбедност и најбоље праксе за производњу

### Корак 4.1: Безбедно управљање креденцијалима

**Тренутни изазов**: Много AI апликација има у коду закодиране API кључеве или користи несигурно складиште.

**AZD решење**: Интеграција Managed Identity и Key Vault.

1. **Прегледајте безбедносну конфигурацију у вашем шаблону:**
```bash
# Потражите конфигурацију Key Vault и Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверите да ли Managed Identity функционише:**
```bash
# Проверите да ли веб апликација има исправну конфигурацију идентитета
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Корак 4.2: Безбедност мреже

1. **Омогућите приватне крајње тачке** (ако већ нису конфигурисане):

Додајте у ваш бицеп шаблон:
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

### Корак 4.3: Мониторинг и посматрање

1. **Конфигуришите Application Insights:**
```bash
# Апликациони увиди треба да буду аутоматски конфигурисани
# Проверите конфигурацију:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Подесите мониторинг специфичан за AI:**

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

### **Вежба 4.1: Аудит безбедности**

**Задаци:** Прегледајте ваше деплојирање у смеру најбољих пракси безбедности.

**Контрола листа:**
- [ ] Нема закодираних тајни у коду или конфигурацији
- [ ] Коришћена Managed Identity за аутентификацију услуга
- [ ] Key Vault чува осетљиву конфигурацију
- [ ] Приступ мрежи је адекватно ограничаен
- [ ] Мониторинг и логовање су омогућени

## Модул 5: Конвертовање ваше сопствене AI апликације

### Корак 5.1: Радни лист за процену

**Пре него што конвертујете вашу апликацију**, одговорите на ова питања:

1. **Архитектура апликације:**
   - Које AI услуге ваша апликација користи?
   - Које ресурсе за обраду захтева?
   - Да ли захтева базу података?
   - Које су зависности између услуга?

2. **Безбедносни захтеви:**
   - Које осетљиве податке ваша апликација обрађује?
   - Које захтеве усклађености морате испунити?
   - Да ли вам је потребна приватна мрежа?

3. **Захтеви за скалирање:**
   - Које је очекивано оптерећење?
   - Да ли вам је потребно аутоматско скалирање?
   - Да ли постоје регионални захтеви?

### Корак 5.2: Креирајте ваш AZD шаблон

**Пратите овај образац да конвертујете вашу апликацију:**

1. **Креирајте основну структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Иницијализујте AZD шаблон
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

**Изазов**: Направите AZD шаблон за AI апликацију обраде докумената.

**Захтеви:**
- Microsoft Foundry Models за анализу садржаја
- Document Intelligence за OCR
- Складишни налог за учитавање докумената
- Function App за логичку обраду
- Веб апликација за кориснички интерфејс

**Бонус поени:**
- Додајте правилно руковање грешкама
- Укључите процену трошкова
- Подесите надзорне контролне табле

## Модул 6: Решавање уобичајених проблема

### Уобичајени проблеми при деплоирању

#### Проблем 1: Прекорачење квоте OpenAI услуге
**Симптоми:** Деплој не успева због грешке квоте
**Решења:**
```bash
# Провери тренутне квоте
az cognitiveservices usage list --location eastus

# Захтевај повећање квоте или пробај другу регију
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Модел није доступан у региону
**Симптоми:** AI одговори не успевају или грешке деплоирања модела
**Решења:**
```bash
# Проверите доступност модела по регионима
az cognitiveservices model list --location eastus

# Ажурирајте на доступан модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблем 3: Проблеми са дозволама
**Симптоми:** 403 Forbidden грешке при позиву AI услуга
**Решења:**
```bash
# Провери доделе улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Додај недостајуће улоге
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми са перформансама

#### Проблем 4: Спори AI одговори
**Кораци истраге:**
1. Проверите метрике у Application Insights
2. Прегледајте метрике OpenAI услуге у Azure порталу
3. Потврдите мрежну повезаност и латенцију

**Решења:**
- Имплементирајте кеширање за често коришћене упите
- Користите одговарајући OpenAI модел за ваш случај употребе
- Размотрите реплике за читање у сценаријима високог оптерећења

### **Вежба 6.1: Изазов у отклањању грешака**

**Сценарио**: Деплој је успео, али апликација враћа 500 грешке.

**Задаци за дебаговање:**
1. Проверите логе апликације
2. Потврдите повезаност услуге
3. Тестирајте аутентикацију
4. Прегледајте конфигурацију

**Алати за коришћење:**
- `azd show` за преглед деплоирања
- Azure портал за детаљне логе услуге
- Application Insights за телеметрију апликације

## Модул 7: Мониторинг и оптимизација

### Корак 7.1: Подешавање свеобухватног монитора

1. **Креирајте прилагођене контролне табле:**

Посетите Azure портал и направите контролну таблу са:
- Бројем и латенцијом OpenAI захтева
- Стопом грешки апликације
- Користењем ресурса
- Праћењем трошкова

2. **Подесите упозорења:**
```bash
# Упућење за висок ниво грешака
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
# Користите Azure CLI за добијање података о трошковима
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Имплементирајте контроле трошкова:**
- Поставите упозорења за бюджет
- Користите политику аутоматског скалирања
- Имплементирајте кеширање захтева
- Пратите употребу токена за OpenAI

### **Вежба 7.1: Оптимизација перформанси**

**Задаци:** Оптимизујте вашу AI апликацију како за перформансе тако и за трошкове.

**Метрике за побољшање:**
- Смањити просечно време одговора за 20%
- Смањити месечне трошкове за 15%
- Одржавати 99.9% доступности

**Стратегије за испробавање:**
- Имплементирати кеширање одговора
- Оптимизовати упите за ефикасност токена
- Користити одговарајуће SKU-ове за обраду
- Подесити правилно аутоматско скалирање

## Завршни изазов: Комплетна имплементација

### Сценарио изазова

Добијате задатак да направите производно-спремног AI чатбота за корисничку подршку са следећим захтевима:

**Функционални захтеви:**
- Веб интерфејс за корисничке интеракције
- Интеграција са Microsoft Foundry Models за одговоре
- Могућност претраге докумената користећи Azure AI Search
- Интеграција са постојећом базом података клијената
- Подршка за више језика

**Нефункционални захтеви:**
- Подршка за 1000 истовремених корисника
- 99.9% Сервисни ниво договора (SLA)
- Усклађеност са SOC 2
- Трошкови испод $500 месечно
- Распоређивање у више окружења (dev, staging, prod)

### Кораци имплементације

1. **Дизајнирајте архитектуру**
2. **Направите AZD шаблон**
3. **Имплементирајте безбедносне мере**
4. **Подесите мониторинг и узбуњивања**
5. **Креирајте пипелајне за деплој**
6. **Документујте решење**

### Критеријуми за процену

- ✅ **Функционалност**: Да ли испуњава све захтеве?
- ✅ **Безбедност**: Да ли су најбоље праксе имплементиране?
- ✅ **Скалабилност**: Да ли може да поднесе оптерећење?
- ✅ **Одрживост**: Да ли су код и инфраструктура добро организовани?
- ✅ **Трошкови**: Да ли је у оквиру буџета?

## Додатни ресурси

### Microsoft документација
- [Azure Developer CLI документација](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models услуга документација](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry документација](https://learn.microsoft.com/azure/ai-studio/)

### Пример шаблона
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси за заједницу
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Одлични AZD шаблони](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат о завршетку

Честитамо! Успешно сте завршили AI радну лабораторију. Сада би требало да будете у могућности да:

- ✅ Претворите постојеће AI апликације у AZД шаблоне
- ✅ Распоредите AI апликације спремне за производњу
- ✅ Имплементирате најбоље безбедносне праксе за AI радне токове
- ✅ Пратите и оптимизујте перформансе AI апликација
- ✅ Решавате уобичајене проблеме при распоредању

### Следећи кораци
1. Примените ове шаблоне на своје AI пројекте
2. Допринесите шаблонима заједници
3. Придружите се Microsoft Foundry Discord за континуирану подршку
4. Истражите напредне теме као што су распоређивања у више региона

---

**Повратне информације о радионици**: Помозите нам да унапредимо ову радионицу тако што ћете подијелити своје искуство у [Microsoft Foundry Discord #Azure каналу](https://discord.gg/microsoft-azure).

---

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD За почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој са приоритетом на AI
- **⬅️ Претходно**: [Распоређивање AI модела](ai-model-deployment.md)
- **➡️ Следеће**: [Најбоље праксе за производство AI](production-ai-practices.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Треба вам помоћ?** Придружите се нашој заједници за подршку и дискусију о AZD и AI распоредањима.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->