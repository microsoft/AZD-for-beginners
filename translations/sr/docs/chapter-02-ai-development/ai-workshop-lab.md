# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Поглавље 2 - AI-прво развијање
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Ова практична лаб-радина води развијаче кроз процес узимања постојећег AI шаблона и његовог распоређивања користећи Azure Developer CLI (AZD). Начићете основне обрасце за продукцијска AI распоређивања користећи Microsoft Foundry услуге.

> **Напомена валидације (2026-03-25):** Ова радионица је прегледана против `azd` `1.23.12`. Ако је ваша локална инсталација старија, ажурирајте AZD пре почетка да би аутентификација, шаблон и ток распоређивања одговарали корацима испод.

**Трајање:** 2-3 сата  
**Ниво:** Средњи  
**Преуслови:** Основно знање о Azure, познавање AI/ML концепата

## 🎓 Learning Objectives

На крају ове радионице моћи ћете да:
- ✅ Преведете постојећу AI апликацију да користи AZD шаблоне
- ✅ Конфигуришете Microsoft Foundry услуге помоћу AZD
- ✅ Имплементирате сигурно управљање акредитивима за AI услуге
- ✅ Распоредите продукционо спремне AI апликације са мониторингом
- ✅ Решавате уобичајене проблеме при распоређивању AI

## Преуслови

### Потребни алати
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Уредник кода (препоручује се VS Code)

### Azure ресурси
- Azure претплата са приступом као contributor
- Приступ Microsoft Foundry Models услугама (или могућност да захтевате приступ)
- Dozvole za kreiranje resource group-а

### Потребно знање
- Основно разумевање Azure услуга
- Познавање радa са командном линијом
- Основни AI/ML појмови (API-ји, модели, упити)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Проверите инсталацију AZD
azd version

# Проверите Azure CLI
az --version

# Пријавите се у Azure за AZD токове рада
azd auth login

# Пријавите се у Azure CLI само ако планирате да покрећете az наредбе током дијагностике
az login
```

Ако радите у више тенаната или ваша претплата није аутоматски откривена, покушајте поново са `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Истражите кључне датотеке у AZD шаблону спремном за AI:

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

### **Лабораторијска вежба 1.1: Истражите конфигурацију**

1. **Прегледајте датотеку azure.yaml:**
```bash
cat azure.yaml
```

**На шта обратити пажњу:**
- Дефиниције сервиса за AI компоненте
- Мапирања променљивих окружења
- Конфигурације хоста

2. **Прегледајте инфраструктуру main.bicep:**
```bash
cat infra/main.bicep
```

**Кључни AI обрасци које треба идентификовати:**
- Постављање сервиса Microsoft Foundry Models
- Интеграција Azure AI Search
- Сигурно управљање кључевима
- Конфигурације безбедности мреже

### **Tačka za diskusiju:** Зашто су ови обрасци важни за AI

- **Зависности сервиса**: AI апликације често захтевају више координисаних сервиса
- **Безбедност**: API кључеви и крајње тачке треба да буду сигурно управљани
- **Скалабилност**: AI оптерећења имају јединствене захтеве за скалирање
- **Управљање трошковима**: AI услуге могу бити скупе ако нису правилно конфигурисане

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Подесите жељени регион Azure-а
azd env set AZURE_LOCATION eastus

# Опционо: Подесите одређени модел OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**Шта се дешава током `azd up`:**
- ✅ Поставља сервис Microsoft Foundry Models
- ✅ Креира Azure AI Search сервис
- ✅ Поставља App Service за веб апликацију
- ✅ Конфигурише умрежавање и безбедност
- ✅ Распоређује код апликације
- ✅ Подешава мониторинг и логовање

2. **Пратите напредак распоређивања** и забележите ресурсе који се креирају.

### Step 2.3: Verify Your Deployment

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
   - Навигација до веб апликације
   - Испробајте пример упита
   - Потврдите да AI одговори раде

### **Лабораторијска вежба 2.1: Вежба решавања проблема**

**Сценарио**: Ваше распоређивање је успело, али AI не одговара.

**Чести проблеми које треба проверити:**
1. **OpenAI API кључеви**: Проверите да ли су исправно подешени
2. **Доступност модела**: Проверите да ли ваша регија подржава модел
3. **Мрежна повезаност**: Осигурајте да сервисима могу међусобно да комуницирају
4. **RBAC дозволе**: Проверите да ли апликација може да приступи OpenAI

**Команде за отклањање грешака:**
```bash
# Проверите променљиве окружења
azd env get-values

# Погледајте записе распоређивања
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Проверите статус распоређивања OpenAI-а
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Ажурирајте OpenAI модел:**
```bash
# Промените на други модел (ако је доступан у вашем региону)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Поново распоредите користећи нову конфигурацију
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

### Step 3.2: Environment-Specific Configurations

**Добра пракса**: Различите конфигурације за развој и продукцију.

1. **Креирајте продукционо окружење:**
```bash
azd env new myai-production
```

2. **Подесите параметре специфичне за продукцију:**
```bash
# У производњи се обично користе SKU-ови вишег ранга
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Омогућите додатне безбедносне функције
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Лабораторијска вежба 3.1: Оптимизација трошкова**

**Изазов**: Конфигуришите шаблон за штедљив развој.

**Задаци:**
1. Идентификовати које SKU-ове можете поставити на free/basic нивое
2. Конфигурисати променљиве окружења за минималне трошкове
3. Распоредити и упоредити трошкове са продукционом конфигурацијом

**Савети за решење:**
- Користите F0 (free) ниво за Azure AI услуге када је могуће
- Користите Basic ниво за Search сервис у развоју
- Размотрите коришћење Consumption плана за Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Тренутни изазов**: Много AI апликација убацује API кључеве у код или користи небезбедно складиште.

**AZD решење**: Интеграција Managed Identity + Key Vault.

1. **Прегледајте безбедносну конфигурацију у свом шаблону:**
```bash
# Потражите конфигурацију Key Vault-а и Managed Identity-а
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверите да Managed Identity ради:**
```bash
# Проверите да ли веб апликација има исправну конфигурацију идентитета
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Омогућите приватне крајње тачке** (ако већ нису конфигурисане):

Додајте у свој bicep шаблон:
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

1. **Конфигуришите Application Insights:**
```bash
# Application Insights требало би да буде аутоматски конфигурисан
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

### **Лабораторијска вежба 4.1: Безбедносни аудиторски преглед**

**Задатак**: Прегледајте своје распоређивање у погледу најбољих безбедносних пракси.

**Контрола листа:**
- [ ] Ниједан hardcoded секрет у коду или конфигурацији
- [ ] Managed Identity се користи за аутентификацију сервис–сервис
- [ ] Key Vault чува осетљиву конфигурацију
- [ ] Приступ мрежи је правилно ограничен
- [ ] Мониторинг и логовање су омогућени

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Пре конверзије апликације**, одговорите на ова питања:

1. **Архитектура апликације:**
   - Које AI услуге ваша апликација користи?
   - Које рачунарске ресурсе захтева?
   - Да ли захтева базу података?
   - Које су зависности међу сервисима?

2. **Безбедносни захтеви:**
   - Које осетљиве податке ваша апликација рукује?
   - Који захтеви у погледу усаглашености постоје?
   - Да ли вам је потребна приватна мрежа?

3. **Захтеви за скалирање:**
   - Које је очекивано оптерећење?
   - Да ли вам је потребно ауто-скалирање?
   - Постоје ли регионални захтеви?

### Step 5.2: Create Your AZD Template

**Пратите овај образац да конвертујете своју апликацију:**

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

### **Лабораторијска вежба 5.1: Изазов креирања шаблона**

**Изазов**: Креирајте AZD шаблон за AI апликацију за обраду докумената.

**Захтеви:**
- Microsoft Foundry Models за анализу садржаја
- Document Intelligence за OCR
- Storage Account за отпремање докумената
- Function App за логику обраде
- Web апликација за кориснички интерфејс

**Бонус поени:**
- Додајте правилно руковање грешкама
- Укључите процену трошкова
- Подесите мониторинг контролне табле

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Симптоми:** Распоређивање не успева због грешке квоте
**Решења:**
```bash
# Проверите тренутне квоте
az cognitiveservices usage list --location eastus

# Затражите повећање квоте или пробајте други регион
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Симптоми:** AI одговори не успевају или има грешака при распоређивању модела
**Решења:**
```bash
# Провери доступност модела по регијама
az cognitiveservices model list --location eastus

# Ажурирај на доступан модел
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
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

### Performance Issues

#### Issue 4: Slow AI Responses
**Степени истраге:**
1. Проверите Application Insights за метрике перформанси
2. Прегледајте OpenAI метрике у Azure порталу
3. Верификујте мрежну повезаност и латенцију

**Решења:**
- Имплементирајте кеширање за честе упите
- Користите одговарајући OpenAI модел за ваш случај коришћења
- Размотрите read replica решења за велика оптерећења

### **Лабораторијска вежба 6.1: Изазов отклањања грешака**

**Сценарио**: Ваше распоређивање је успело, али апликација враћа грешке 500.

**Задаци за отклањање грешака:**
1. Проверите логове апликације
2. Верификујте повезаност сервиса
3. Тестирајте аутентикацију
4. Прегледајте конфигурацију

**Алате које треба користити:**
- `azd show` за преглед распоређивања
- Azure портал за детаљне логове сервиса
- Application Insights за телеметрију апликације

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Креирајте прилагођене контролне табле:**

Идите у Azure портал и креирајте контролну таблу са:
- Бројем OpenAI захтева и латенцијом
- Стопом грешака апликације
- Користењем ресурса
- Праћењем трошкова

2. **Подесите упозорења:**
```bash
# Упозорење о високој стопи грешака
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Анализирајте тренутне трошкове:**
```bash
# Користите Azure CLI да бисте добили податке о трошковима
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Имплементирајте контроле трошкова:**
- Подесите budget alerts
- Користите политике аутоскалирања
- Имплементирајте кеширање захтева
- Пратите употребу токена за OpenAI

### **Лабораторијска вежба 7.1: Оптимизација перформанси**

**Задатак**: Оптимизујте своју AI апликацију за перформансе и трошкове.

**Метрике за побољшање:**
- Смањите просечно време одговора за 20%
- Смањите месечне трошкове за 15%
- Одржите 99.9% uptime

**Стратегије које треба пробати:**
- Имплементирајте кеширање одговора
- Оптимизујте упите (prompts) за ефикасност токена
- Користите одговарајуће compute SKU-ове
- Подесите правилно аутоскалирање

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Поверени сте да креирате продукционо спремног AI чатбота за корисничку подршку са следећим захтевима:

**Функционални захтеви:**
- Веб интерфејс за корисничке интеракције
- Интеграција са Microsoft Foundry Models за одговоре
- Претраживање докумената користећи Azure AI Search
- Интеграција са постојећом базом корисника
- Подршка више језика

**Нефункционални захтеви:**
- Обрада 1000 истовремених корисника
- 99.9% SLA за доступност
- SOC 2 усаглашеност
- Трошак испод $500/месечно
- Распоређивање у више окружења (dev, staging, prod)

### Implementation Steps

1. **Дизајнирајте архитектуру**
2. **Креирајте AZD шаблон**
3. **Имплементирајте мере безбедности**
4. **Подесите мониторинг и упозорења**
5. **Креирајте CI/CD pipeline-ове**
6. **Документирајте решење**

### Evaluation Criteria

- ✅ **Функционалност**: Да ли испуњава све захтеве?
- ✅ **Безбедност**: Да ли су најбоље праксе имплементиране?
- ✅ **Скалабилност**: Да ли може поднети оптерећење?
- ✅ **Одрживост**: Да ли је код и инфраструктура добро организована?
- ✅ **Трошкови**: Да ли се уклапа у буџет?

## Additional Resources

### Microsoft Documentation
- [Документација Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Документација сервиса Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry документација](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat апликација](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App - брзи почетак](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси заједнице
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Потврда о завршетку

Честитамо! Завршили сте AI радионицу. Сада бисте требали бити у стању да:

- ✅ Претворите постојеће AI апликације у AZD шаблоне
- ✅ Разместите AI апликације спремне за производњу
- ✅ Имплементирате најбоље праксе безбедности за AI радне оптерећења
- ✅ Праћујете и оптимизујете перформансе AI апликација
- ✅ Решавате уобичајене проблеме приликом размештања

### Следећи кораци
1. Примените ове образце на своје AI пројекте
2. Допринесите шаблонима за заједницу
3. Придружите се Microsoft Foundry Discord ради континуиране подршке
4. Истражите напредне теме као што су размештања у више региона

---

**Повратне информације о радионици**: Помозите нам да унапредимо ову радионицу тако што ћете поделити своје искуство у [Microsoft Foundry Discord #Azure каналу](https://discord.gg/microsoft-azure).

---

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој усмерен на AI
- **⬅️ Претходно**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следеће**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Следеће поглавље**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Потребна помоћ?** Придружите се нашој заједници за подршку и дискусије о AZD и размештањима AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->