# AI радионица: Како учинити ваша AI решења распоређивим помоћу AZD

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-први развој
- **⬅️ Претходно**: [Распоређивање AI модела](ai-model-deployment.md)
- **➡️ Следеће**: [Најбоље праксе за AI у продукцији](production-ai-practices.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

## Преглед радионице

Ова практична лаб вежба води програмере кроз процес преузимања постојећег AI шаблона и његовог распоредења помоћу Azure Developer CLI (AZD). Научићете основне обрасце за продукцијско распоредење AI-а користећи Microsoft Foundry сервисе.

> **Напомена за валидацију (2026-03-25):** Ова радионица је рецензирана против `azd` `1.23.12`. Ако је ваша локална инсталација старија, ажурирајте AZD пре почетка тако да аутентификација, шаблон и ток распоредења одговарају корацима испод.

**Трајање:** 2-3 сата  
**Ниво:** Средњи  
**Предуслови:** Основно знање о Azure-у, познавање AI/ML концепата

## 🎓 Циљеви учења

На крају ове радионице бићете у стању да:
- ✅ Конвертујете постојећу AI апликацију да користи AZD шаблоне
- ✅ Конфигуришете Microsoft Foundry сервисе помоћу AZD
- ✅ Имплементирате безбедно управљање акредитивима за AI сервисе
- ✅ Распоредите продукцијски спремне AI апликације са мониторингом
- ✅ Решавате уобичајене проблеме приликом распореде AI-а

## Предуслови

### Потребни алати
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Уређивач кода (препоручује се VS Code)

### Azure ресурси
- Azure претплата са приступом као contributor
- Приступ Microsoft Foundry Models сервисима (или могућност захтева за приступ)
- Дозволе за креирање resource group-ова

### Знања и предуслови
- Основно разумевање Azure сервиса
- Познавање командне линије
- Основни AI/ML концепти (APIs, модели, промптови)

## Подешавање лабораторије

### Корак 1: Припрема окружења

1. **Проверите инсталацију алата:**
```bash
# Проверите инсталацију AZD
azd version

# Проверите Azure CLI
az --version

# Пријавите се у Azure за AZD радне токове
azd auth login

# Пријавите се у Azure CLI само ако планирате да током дијагностике покрећете az команде
az login
```

Ако радите преко више тенаната или ваша претплата није аутоматски откривена, покушајте поново са `azd auth login --tenant-id <tenant-id>`.

2. **Клонирајте репозиторијум радионице:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разумевање AZD структуре за AI апликације

### Анатомија AI AZD шаблона

Истражите кључне фајлове у AZD шаблону спремном за AI:

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

### **Лаб вежба 1.1: Истражите конфигурацију**

1. **Погледајте фајл azure.yaml:**
```bash
cat azure.yaml
```

**На шта обратити пажњу:**
- Дефиниције сервиса за AI компоненте
- Мапирање променљивих окружења
- Конфигурације хоста

2. **Прегледајте инфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Кључни AI обрасци које треба идентификовати:**
- Провизионисање Microsoft Foundry Models сервиса
- Интеграција Cognitive Search-а
- Безбедно управљање кључевима
- Конфигурације мрежне безбедности

### **Тема за дискусију:** Зашто су ови обрасци важни за AI

- **Зависности сервиса**: AI апликације често захтевају више координисаних сервиса
- **Безбедност**: API кључеви и крајње тачке морају бити безбедно управљани
- **Скалирање**: AI радни задаци имају јединствене захтеве за скалирање
- **Управљање трошковима**: AI сервиси могу бити скупи ако нису исправно конфигурисани

## Модул 2: Распоредите вашу прву AI апликацију

### Корак 2.1: Иницијализујте окружење

1. **Креирајте ново AZD окружење:**
```bash
azd env new myai-workshop
```

2. **Поставите потребне параметре:**
```bash
# Подесите жељени Azure регион
azd env set AZURE_LOCATION eastus

# Опционо: Подесите одређени OpenAI модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Корак 2.2: Распоредите инфраструктуру и апликацију

1. **Распоредите помоћу AZD:**
```bash
azd up
```

**Шта се дешава током `azd up`:**
- ✅ Провизионише Microsoft Foundry Models сервис
- ✅ Креира Cognitive Search сервис
- ✅ Постави App Service за веб апликацију
- ✅ Конфигурише мрежу и безбедност
- ✅ Распоређује код апликације
- ✅ Поставља мониторинг и логовање

2. **Пратите напредак распоредења** и забележите ресурсе који се креирају.

### Корак 2.3: Верификујте ваше распоредење

1. **Проверите распоређене ресурсе:**
```bash
azd show
```

2. **Отворите распоређену апликацију:**
```bash
azd show
```

Отворите веб крајњу тачку која је приказана у излазу `azd show`.

3. **Тестирајте AI функционалност:**
   - Идите до веб апликације
   - Испробајте пример упита
   - Потврдите да AI одговори функционишу

### **Лаб вежба 2.1: Практична вежба решавања проблема**

**Сценарио**: Ваше распоредење је успело, али AI не одговара.

**Уобичајени проблеми које треба проверити:**
1. **OpenAI API кључеви**: Потврдите да су исправно подешени
2. **Доступност модела**: Проверите да ли ваша регија подржава модел
3. **Мрежна повезаност**: Осигурате да сервиси могу да комуницирају
4. **RBAC дозволе**: Потврдите да апликација може да приступи OpenAI

**Команде за отклањање грешака:**
```bash
# Провери променљиве окружења
azd env get-values

# Погледај логове распоређивања
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Провери статус распоређивања OpenAI-а
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Прилагођавање AI апликација вашим потребама

### Корак 3.1: Измените AI конфигурацију

1. **Ажурирајте OpenAI модел:**
```bash
# Пређите на други модел (ако је доступан у вашој регији)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Поново примените нову конфигурацију
azd deploy
```

2. **Додајте додатне AI сервисе:**

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
# У продукцији се обично користе SKU-ови вишег ранга
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Омогућите додатне безбедносне функције
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лаб вежба 3.1: Оптимизација трошкова**

**Изазов**: Конфигуришите шаблон за економичан развој.

**Задаци:**
1. Идентификујте које SKU-ове можете подесити на free/basic нивое
2. Конфигуришите променљиве окружења за минималне трошкове
3. Распоредите и упоредите трошкове са продукцијском конфигурацијом

**Савети за решење:**
- Користите F0 (free) ниво за Cognitive Services када је могуће
- Користите Basic ниво за Search Service у развоју
- Размотрите употребу Consumption плана за Functions

## Модул 4: Безбедност и најбоље праксе за продукцију

### Корак 4.1: Сигурно управљање акредитивима

**Тренутни изазов**: Много AI апликација убацује API кључеве у код или користи небезбедно складиштење.

**AZD решење**: Managed Identity + интеграција са Key Vault-ом.

1. **Прегледајте безбедносну конфигурацију у вашем шаблону:**
```bash
# Потражите конфигурацију Key Vault-а и управљаног идентитета.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Потврдите да Managed Identity функционише:**
```bash
# Проверите да ли веб апликација има исправну конфигурацију идентитета
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Корак 4.2: Мрежна безбедност

1. **Омогућите приватне ендпоинте** (ако већ нису конфигурисани):

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

### Корак 4.3: Мониторинг и посматрање

1. **Конфигуришите Application Insights:**
```bash
# Application Insights треба да буде аутоматски конфигурисан
# Проверите конфигурацију:
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

### **Лаб вежба 4.1: Безбедносни аудит**

**Задатак**: Прегледајте ваше распоредење у складу са најбољим безбедносним праксама.

**Контролна листа:**
- [ ] Нема уткнутих тајни у коду или конфигурацији
- [ ] Managed Identity се користи за аутентикацију сервис-до-сервис
- [ ] Key Vault чува осетљиву конфигурацију
- [ ] Приступ мрежи је правилно ограничен
- [ ] Мониторинг и логовање су омогућени

## Модул 5: Конвертовање ваше AI апликације

### Корак 5.1: Радни лист за процену

**Пре конверзије апликације**, одговорите на следећа питања:

1. **Архитектура апликације:**
   - Које AI сервисе ваша апликација користи?
   - Које рачунске ресурсе захтева?
   - Да ли захтева базу података?
   - Које су зависности између сервиса?

2. **Безбедносни захтеви:**
   - Које осетљиве податке ваша апликација обрађује?
   - Које регулаторне/усаглашености имате?
   - Да ли вам је потребна приватна мрежа?

3. **Захтеви за скалирање:**
   - Какво је очекивано оптерећење?
   - Да ли вам је потребно аутоматско скалирање?
   - Постоје ли регионални захтеви?

### Корак 5.2: Креирајте ваш AZD шаблон

**Пратите овај образац да бисте конвертовали вашу апликацију:**

1. **Креирајте основну структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Иницијализуј AZD шаблон
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

### **Лаб вежба 5.1: Изазов креирања шаблона**

**Изазов**: Креирајте AZD шаблон за AI апликацију за обраду докумената.

**Захтеви:**
- Microsoft Foundry Models за анализу садржаја
- Document Intelligence за OCR
- Storage Account за отпремање докумената
- Function App за логику обраде
- Веб апликација за кориснички интерфејс

**Бонус поени:**
- Додајте правилно управљање грешкама
- Укључите процену трошкова
- Подесите мониторинг табле

## Модул 6: Решавање уобичајених проблема

### Уобичајени проблеми приликом распореде

#### Проблем 1: Прекорачена квота OpenAI сервиса
**Симптоми:** Распоређивање не успева због грешке квоте  
**Решења:**
```bash
# Проверите тренутне квоте
az cognitiveservices usage list --location eastus

# Затражите повећање квоте или покушајте у другој регији
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Модел није доступан у регији
**Симптоми:** AI одговори не успевају или има грешака у развоју модела  
**Решења:**
```bash
# Проверити доступност модела по регионима
az cognitiveservices model list --location eastus

# Ажурирати на доступан модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Проблем 3: Проблеми са дозволама
**Симптоми:** 403 Forbidden грешке приликом позива AI сервиса  
**Решења:**
```bash
# Проверите доделе улога
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Додајте недостајуће улоге
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Проблеми са перформансама

#### Проблем 4: Спори AI одговори
**Кораци за истрагу:**
1. Проверите Application Insights за метрике перформанси
2. Прегледајте метрике OpenAI сервиса у Azure порталу
3. Потврдите мрежну повезаност и латенцију

**Решења:**
- Имплементирајте кеширање за честе упите
- Користите одговарајући OpenAI модел за ваш случај употребе
- Размотрите read реплике за сценарије са великим оптерећењем

### **Лаб вежба 6.1: Изазов отклањања грешака**

**Сценарио**: Ваше распоредење је успело, али апликација враћа 500 грешке.

**Задаци за отклањање грешака:**
1. Проверите логове апликације
2. Потврдите повезаност сервиса
3. Тестирајте аутентикацију
4. Прегледајте конфигурацију

**Алати за коришћење:**
- `azd show` за преглед распоредења
- Azure портал за детаљне логове сервиса
- Application Insights за телеметрију апликације

## Модул 7: Мониторинг и оптимизација

### Корак 7.1: Поставите свеобухватан мониторинг

1. **Креирајте прилагођене табле (dashboards):**

Идите у Azure портал и креирајте таблу са:
- Бројем и латенцијом OpenAI захтева
- Стопом грешака апликације
- Користењем ресурса
- Праћењем трошкова

2. **Поставите упозорења:**
```bash
# Упозорење за високу стопу грешака
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
# Користите Azure CLI да бисте добили податке о трошковима
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Имплементирајте контролу трошкова:**
- Подесите budget упозорења
- Користите политике аутоскалирања
- Имплементирајте кеширање захтева
- Пратите коришћење токена за OpenAI

### **Лаб вежба 7.1: Оптимизација перформанси**

**Задатак**: Оптимизујте вашу AI апликацију за перформансе и трошкове.

**Метрике за унапређење:**
- Смањите просечно време одговора за 20%
- Смањите месечне трошкове за 15%
- Одржавајте 99.9% dostupnosti

**Стратегије за испробавање:**
- Имплементирајте кеширање одговора
- Оптимизујте промптове за ефикасност токена
- Користите одговарајуће compute SKU-ове
- Подесите правилно аутоскалирање

## Финални изазов: Имплементација од краја до краја

### Сценарио изазова

Треба да креирате продукцијски спремног AI чатбот-а за корисничку подршку са следећим захтевима:

**Функционални захтеви:**
- Веб интерфејс за корисничку интеракцију
- Интеграција са Microsoft Foundry Models за одговоре
- Претрага докумената користећи Cognitive Search
- Интеграција са постојећом базом података корисника
- Подршка за више језика

**Нефункционални захтеви:**
- Обрада 1000 истовремених корисника
- 99.9% SLA доступност
- SOC 2 усаглашеност
- Трошак испод $500/месечно
- Распоређивање у више окружења (dev, staging, prod)

### Кораци имплементације

1. **Дизајнирајте архитектуру**
2. **Креирајте AZD шаблон**
3. **Имплементирајте мере безбедности**
4. **Подесите мониторинг и упозоравања**
5. **Креирајте pipeline-ове за распоредење**
6. **Документујте решење**

### Критеријуми оцењивања

- ✅ **Функционалност**: Да ли испуњава све захтеве?
- ✅ **Безбедност**: Да ли су примењене најбоље праксе?
- ✅ **Скалибилност**: Да ли може да поднесе оптерећење?
- ✅ **Одрживост**: Да ли су код и инфраструктура добро организовани?
- ✅ **Трошкови**: Да ли је у оквиру буџета?

## Додатни ресурси

### Microsoft документација
- [Документација Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документација Microsoft Foundry Models сервиса](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Документација Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Примери шаблона
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси за заједницу
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Сертификат о завршетку

Честитамо! Завршили сте AI Workshop Lab. Сада би требало да можете:

- ✅ Претворити постојеће AI апликације у AZD шаблоне
- ✅ Разместити продукционо спремне AI апликације
- ✅ Примeнити најбоље безбедносне праксе за AI радна оптерећења
- ✅ Пратити и оптимизовати перформансе AI апликација
- ✅ Решавати уобичајене проблеме при распоређивању

### Следећи кораци
1. Примените ове шаблоне на своје AI пројекте
2. Допринесите шаблонима за заједницу
3. Придружите се Microsoft Foundry Discord за континуирану подршку
4. Истражите напредне теме попут распоређивања у више регија

---

**Workshop Feedback**: Help us improve this workshop by sharing your experience in the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Навигација поглављем:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој вођен AI
- **⬅️ Претходно**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следеће**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Следеће поглавље**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Потребна помоћ?** Придружите се нашој заједници за подршку и дискусије о AZD и распоређивању AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Овај документ је преведен помоћу сервиса за превођење заснованог на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Изворни документ на оригиналном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод који изводи људски преводилац. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистичу из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->