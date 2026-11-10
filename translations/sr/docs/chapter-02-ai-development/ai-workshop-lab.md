# AI Radionica: Kako da vaša AI rešenja budu AZD-Deploy-abilna

**Navigacija kroz poglavlja:**
- **📚 Početna strana kursa**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-First razvoj
- **⬅️ Prethodno**: [Deploy AI modela](ai-model-deployment.md)
- **➡️ Sledeće**: [Najbolje prakse za AI u produkciji](../chapter-08-production/production-ai-practices.md)
- **🚀 Sledeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled radionice

Ova praktična radionica vodi developere kroz proces preuzimanja postojećeg AI šablona i njegovog deploy-ovanja korišćenjem Azure Developer CLI (AZD). Naučićete osnovne obrasce za produkcitjsko AI deploy-ovanje koristeći Microsoft Foundry servise.

> **Pregled objave (2026-11-04):** Uputstvo za AZD komande i imena uzoraka konfiguracije su provereni u odnosu na `azd` `1.37.2` verziju i trenutnu konfiguraciju povezanog uzorka. Ovo je pregled dokumentacije, ne validacija živog deploy-a. RAG laboratorija ne zahteva agent ekstenziju; za evaluaciju agenata koristite posebnu `azure.ai.evaluations` ekstenziju i [trenutni tok evaluacije](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), a ne zastarele komande za evaluaciju agenata.

**Trajanje:** 2-3 sata  
**Nivo:** Srednji  
**Preduslovi:** Osnovno znanje Azure-a, upoznatost sa AI/ML konceptima

## 🎓 Ciljevi učenja

Do kraja ove radionice ćete moći da:
- ✅ Istražite postojeći AI AZD šablon i isplanirate konverziju vaše aplikacije
- ✅ Konfigurišete Microsoft Foundry servise korišćenjem AZD
- ✅ Implementirate sigurno upravljanje akreditivima za AI servise
- ✅ Deploy-ujete AI referentnu aplikaciju sa monitoringom
- ✅ Rešavate uobičajene probleme prilikom AI deploy-ovanja

## Preduslovi

### Potrebni alati
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) инсталиран
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) инсталиран
- [Git](https://git-scm.com/) инсталиран
- Уређивач кода (препоручује се VS Code)

Ови блокови команди користе Bash синтаксу (укључујући наставке линија и `grep`). На Windows-у користите Git Bash/WSL или их преведите у PowerShell. Такође инсталирајте алате за језик, менаџер пакета и контејнере наведенe у [примеру локалног подешавања окружења](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure ресурси
- Azure претплата са дозволама за креирање ресурса и додељивање улога (само Contributor не може правити RBAC доделе; користите овлашћеног администратора улога или документациони еквивалент примера)
- Приступ услугама Microsoft Foundry Models (или могућност захтева за приступ)
- Дозволе за креирање групе ресурса

### Предзнање
- Основно разумевање Azure услуга
- Познавање командне линије
- Основни појмови из AI/ML (API-ји, модели, упити)

## Подешавање лабораторије

### Корак 1: Припрема окружења

1. **Проверите инсталацију алата:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Ако радите преко више закупаца или претплата се не детектује аутоматски, покушајте поново са `azd auth login --tenant-id <tenant-id>`.

2. **Клонирајте репозиторијум радионице:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Модул 1: Разумевање AZD структуре за AI апликације

### Анатомија AI AZD шаблона

Истражите кључне фајлове у AI-прилагођеном AZD шаблону:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Проверани пример може да се промени; `.azure/` се појављује након иницијализације окружења, не нужно у свежеј копији. Испитајте стварну копију уместо да креирате недостајуће фасцикле како бисте одговарали овој шеми.

### **Вежба 1.1: Истражите конфигурацију**

1. **Погледајте azure.yaml фајл:**
```bash
cat azure.yaml
```

**Шта тражити:**
- Дефиниције сервиса за AI компоненте
- Мапирања променљивих окружења
- Конфигурације хоста

2. **Прегледајте главни main.bicep инфраструктурни фајл:**
```bash
cat infra/main.bicep
```

**Кључни AI обрасци:**
- Пружање Microsoft Foundry Models услуге
- Интеграција Azure AI Search
- Сигурно управљање кључевима
- Конфигурације безбедности мреже

### **Тема за дискусију:** Зашто су ови образци битни за AI

- **Зависности сервиса**: AI апликације често захтевају више координисаних сервиса
- **Безбедност**: API кључеви и крајње тачке морају бити сигурно управљани
- **Скалабилност**: AI радни оптерећења имају специфичне захтеве за скалирање
- **Управљање трошковима**: AI услуге могу бити скупе ако нису исправно конфигурисане

## Модул 2: Деплоирајте своју прву AI апликацију

### Корак 2.1: Иницијализација окружења

1. **Креирајте ново AZD окружење:**
```bash
azd env new myai-workshop
```

2. **Подесите потребне параметре:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Корак 2.2: Деплоирање инфраструктуре и апликације

1. **Деплоирајте помоћу AZD:**
```bash
azd up
```

**Шта се дешава током `azd up`:**
- ✅ Пружа Microsoft Foundry Models услугу
- ✅ Креира Azure AI Search услугу
- ✅ Конфигурише Azure Container Apps за позадину и спаковани фронт-енд (стандардни пример)
- ✅ Конфигурише мрежу и сигурност
- ✅ Деплоји апликациони код
- ✅ Поставља мониторинг и логовање

2. **Пратите напредак деплоирања** и забележите које ресурсе креира.

### Корак 2.3: Проверите ваш деплоирање

1. **Проверавате деплоирне ресурсе:**
```bash
azd show
```

2. **Отворите деплоирану апликацију:**
```bash
azd show
```

Отворите веб крајњу тачку приказану у `azd show` излазу.

3. **Тестирајте AI функционалност:**
   - Наравите веб апликацију
   - Испробајте пример упита
   - Проверите да ли AI одговори раде

### **Вежба 2.1: Практична дијагностика проблема**

**Сценарио**: Ваш деплоирање је успешно али AI не одговара.

**Уобичајени проблеми за проверу:**
1. **Аутентификација**: Проверите Managed Identity и доделе улога; проверите API кључеве само ако сте намерно омогућили аутентификацију базирану на кључу
2. **Доступност модела**: Проверите да ли ваш регион подржава модел
3. **Мрежна повезаност**: Проверите да ли услуге могу комуницирати
4. **RBAC дозволе**: Проверите да ли апликација има приступ OpenAI

**Команде за дијагностику:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Модул 3: Прилагођавање AI апликација вашим потребама

### Корак 3.1: Измена AI конфигурације

1. **Ажурирајте OpenAI модел:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Додајте додатне AI услуге:**

Измените `infra/main.bicep` да додате Document Intelligence:

Следећи фрагмент је илустративан, није комплетан шаблон. Пример може већ да пружа услуге обраде докумената: пре додавања дупликата проверите његову тренутну инфраструктуру. Прилагођене додатке треба повезати са излазима, идентитетима и конфигурацијом апликације.

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

2. **Подесите параметре специфичне за продукцију:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Ова имена долазе из [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) примера. `azd env set` чува вредност али не активира произвољну променљиву: шаблон је мора конзумирати. Пре онемогућавања јавног приступа, погледајте [водич за изолацију мреже](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) примера и користите `azd up` за примену инфраструктурних промена. Само OpenAI SKU `S0` не одређује проток модела; важна је и врста и капацитет поставке модела.

### **Вежба 3.1: Оптимизација трошкова**

**Изазов**: Конфигуришите шаблон за економичан развој.

**Задаци:**
1. Изаберите disposable радионичко окружење: `azd env select myai-workshop`.
2. Запишите тренутни Search SKU и капацитет модела из `infra/main.parameters.json` и изабраног окружења.
3. Користите подржане уносе у наставку, након провере квоте за модел/регион:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Проверите Search SKU и капацитет деплоирања на порталу и процените разлику помоћу калкулатора цена. Немојте очекивати тренутну обнову података о тарифама.

**Критеријум успеха:** Search користи Basic, чат деплоирање има затражени подржани капацитет, и апликација још увек одговара на пример питања. Капацитет `10` је ограничење у броју захтева, не попуст на цену токена. Промене Search нивоа могу бити ограничене или захтевати ре-креирање; не експериментишите на продукционим ресурсима. F0 је специфично за услугу и није Azure OpenAI моделски SKU.

## Модул 4: Безбедност и најбоље праксе за продукцију

### Корак 4.1: Сигурно управљање акредитивима

**Тренутни проблем:** Многе AI апликације кодирају API кључеве или користе несигурно складиштење.

**AZD решење:** Managed Identity + интеграција са Key Vault-ом.

1. **Прегледајте безбедносну конфигурацију у вашем шаблону:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Проверите да Managed Identity ради:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Корак 4.2: Мрежна безбедност

1. **Омогућите приватне крајње тачке** користећи подржану мрежну конфигурацију примера (ако није већ подешено).

За ваш властит шаблон, овај илустративни фрагмент показује повезивање OpenAI крајње тачке. Такође је потребан VNet, приватна DNS конфигурација и повезаност апликације; немојте га лепити нетакнутог у пример, који већ садржи модуле за приватне крајње тачке:
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

### Корак 4.3: Мониторинг и опсервабилитет

1. **Конфигуришите Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Омогућите интеграцију Application Insights из примера:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Инструментација примера емитује телеметрију; произвољно подешавање `OPENAI_MONITOR_ENABLED` не укључује AI метрике. Прегледајте траговања позива модела, латенције, неуспеха и потрошње токена, и избегавајте снимање осетљивих упита или одговора.

### **Вежба 4.1: Безбедносни аудит**

**Задатак:** Прегледајте своје деплоирање за најбоље безбедносне праксе.

**Контролна листа:**
- [ ] Нема хардкодованих тајни у коду или конфигурацији
- [ ] Managed Identity коришћен за аутентификацију сервис-сервис
- [ ] Key Vault чува осетљиву конфигурацију
- [ ] Мрежни приступ је правилно ограничен
- [ ] Мониторинг и логовање су омогућени

## Модул 5: Претварање ваше власте AI апликације

### Корак 5.1: Радни лист процене

**Пре претварања апликације**, одговорите на ова питања:

1. **Архитектура апликације:**
   - Које AI услуге ваша апликација користи?
   - Које рачунарске ресурсе захтева?
   - Да ли му је потребна база података?
   - Које су зависности између сервиса?

2. **Безбедносни захтеви:**
   - Које осетљиве податке апликација обрађује?
   - Које стандарде усаглашености треба да испуни?
   - Да ли вам је потребна приватна мрежа?

3. **Захтеви за скалирање:**
   - Које је очекивано оптерећење?
   - Да ли је потребно аутоматско скалирање?
   - Има ли регионалних захтева?

### Корак 5.2: Креирајте свој AZD шаблон

**Пратите овај образац за претварање ваше апликације:**

**Само скелетон:** Овај одељак не пружа извор API/веб апликације, хост инфраструктуру, распоређивање модела, идентитет/RBAC или готов `main.parameters.json`. Bicep ограничен на групу ресурса илуструје састав модула; типичан AZD улазни фајл који је ограничен на претплату мора да креира групу ресурса и позове га у том опсегу. Немојте очекивати да `azd up` деплојује комплетну апликацију након копирања само ових фрагмената. За извршну базу наставите да користите RAG шаблон из Модула 1.

1. **Креирајте основну структуру:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Вежба 5.1: Изазов у креирању шаблона**

**Изазов**: Креирајте AZD шаблон за AI апликацију за обраду докумената.

**Захтеви:**
- Microsoft Foundry Models за анализу садржаја
- Document Intelligence за OCR
- Storage Account за отпрему докумената
- Function App за логику обраде
- Веб апликација за кориснички интерфејс

**Бонус поени:**
- Додајте исправно руковање грешкама
- Укључите процену трошкова
- Подесите контролне табле за мониторинг

## Модул 6: Решавање уобичајених проблема

### Уобичајени проблеми при деплойменту

#### Проблем 1: Прекорачење квоте OpenAI услуге
**Симптоми:** Деплоирање неуспешно са поруком о квоти
**Решења:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Проблем 2: Модел није доступан у региону
**Симптоми:** AI не одговара или грешке при распоређивању модела
**Решења:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Проблем 3: Проблеми са дозволама
**Симптоми:** 403 Forbidden грешке приликом позива AI услуга
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
1. Проверите метрике у Application Insights
2. Прегледајте метрике OpenAI услуге на Azure порталу
3. Проверите мрежну повезаност и латенцију

**Решења:**
- Имплементирајте кеширање за често коришћене упите
- Користите одговарајући OpenAI модел за ваш случај употребе
- Скалирајте реплике апликације тек након провере ограничења RPM/TPM модела; Azure OpenAI распоређивања не нуде општи подешавач "read replica" као база података

### **Вежба 6.1: Изазов у решавању грешака**

**Сценарио**: Ваш деплоирање је успело, али апликација враћа грешке 500.

**Задаци за дијагностику:**
1. Проверите логове апликације
2. Проверите повезаност услуга
3. Тестирање аутентификације
4. Преглед конфигурације

**Алатке за коришћење:**
- `azd show` за преглед распоређивања
- Azure портал за детаљне записнике услуга
- Application Insights за телеметрију апликације

## Модул 7: Мониторинг и оптимизација

### Корак 7.1: Подешавање свеобухватног мониторинга

1. **Креирајте прилагођене контролне табле:**

Идите на Azure портал и креирајте контролну таблу са:
- бројем и латенцијом захтева OpenAI
- стопом грешака апликације
- искоришћењем ресурса
- праћењем трошкова

2. **Подесите упозорења:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Проверите да ли компонент шаље телеметрију захтева и додајте групу акција ако су потребне обавештења. Метрика је број, а не проценат неуспеха; упозорење за стопу захтева треба одговарајући упит и именитеља.

### Корак 7.2: Оптимизација трошкова

1. **Анализирајте тренутне трошкове:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Замените места за датуме. Подршка Consumption API зависи од уговора о наплати; користите Cost Management у порталу ако детаљи употребе нису доступни. Трошкови касне, нису тест у реалном времену.

2. **Спроведите контролу трошкова:**
- Подесите упозорења за буџет
- Користите аутоматске скалабилне политике
- Спроводите кеширање захтева
- Пратите употребу токена за OpenAI

### **Лабораторијска вежба 7.1: Оптимизација перформанси**

**Задатак**: Оптимизујте вашу AI апликацију и по перформансама и по ценама.

**Метрике за побољшање:**
- Смањите просечно време одговора за 20%
- Смањите месечне трошкове за 15%
- Дефинишите СЛО доступности од 99.9% и мерићно време (краћа вежба не може доказати месечни рад)

**Стратегије за пробу:**
- Спроводите кеширање одговора
- Оптимизујте упите ради ефикасније употребе токена
- Користите одговарајуће скупље рачунарске ресурсе (SKU)
- Подесите правилно аутоматско скалирање

## Завршни изазов: Имплементација од почетка до краја

### Сценарио изазова

Ово је **опциони архитектонски/дизајнерски изазов**, не испоручена извршна вежба или сертификат за продукцију. Предложите AI-чатбот за корисничку службу и документујте које ће потребе морати да се даље имплементирају и докажу:

**Функционални захтеви:**
- Веб интерфејс за интеракцију с корисницима
- Интеграција са Microsoft Foundry моделима за одговоре
- Претрага докумената уз Azure AI Search
- Интеграција са постојећом базом корисника
- Подршка за више језика

**Не-функционални захтеви:**
- Подршка за 1000 истовремених корисника
- СЛА са 99.9% доступности
- Усклађеност с SOC 2
- Трошкови испод $500 месечно
- Распоређивање у више окружења (dev, staging, prod)

Ово су хипотетички захтеви заинтересованих страна, не нужно сагласни или оствариви сви одједном. Дефинишите учесталост захтева, величине упита/одговора и трајање сесија пре процене трошкова; 1,000 паралелних корисника није довољно да изгради оптерећење или докаже да је буџет од $500 реалан. SOC 2 је резултат организационог аудита, а не функција укључена AZD шаблоном. Утврдите компромисе и одбаците неисправне захтеве са доказима.

### Кораци имплементације

1. **Дизајнирајте архитектуру**
2. **Креирајте AZD шаблон**
3. **Спроводите мере безбедности**
4. **Подесите мониторинг и упозорења**
5. **Креирајте развојне линије за распоређивање**
6. **Документујте решење**

### Критеријуми евалуације

- ✅ **Функционалност**: Да ли су имплементиране могућности показане и преостале празнине јасне?
- ✅ **Безбедност**: Да ли су најбоље праксе спроведене?
- ✅ **Скалибилност**: Да ли може да поднесе оптерећење?
- ✅ **Одрживост**: Да ли су код и инфраструктура добро организовани?
- ✅ **Трошкови**: Да ли се држи буџета?

## Додатни ресурси

### Microsoft документација
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Примери шаблона
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ресурси за заједницу
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Контролна тачка завршетка

Честитамо! Завршили сте AI Workshop Lab. Сада треба да можете да:

- ✅ Објасните како прилагодити постојећу AI апликацију AZD шаблону
- ✅ Распоредите и тестирате AI референтну апликацију
- ✅ Спроведете безбедносне најбоље праксе за AI радне оптерећења
- ✅ Пратите и оптимизујте перформансе AI апликације
- ✅ Решавајте честе проблеме са распоређивањем

**Очистите:** Покрените `azd env list`, изаберите свако привремено окружење креирано у овој лабораторији (`myai-workshop`, а ако је распоређено `myai-production`/`myai-quota-test`) и покрените `azd down` у сваком. Прегледајте план брисања; брисање локалне конфигурације окружења само не брише Azure ресурсе. Избегавајте `--purge` осим ако не разумете неповратно уклањање механизама меких брисања.

### Следећи кораци
1. Примените ове шаблоне у вашим AI пројектима
2. Допринесите шаблоне заједници
3. Придружите се Microsoft Foundry Discord ради сталне подршке
4. Истражите напредне теме као што су распоређивања у више региона

---

**Повратне информације о радионици**: Помозите нам да побољшамо ову радионицу тако што ћете поделити своје искуство у [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Навигација по поглављима:**
- **📚 Почетак курса**: [AZD За почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-First развој
- **⬅️ Претходно**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Следеће**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

**Треба помоћ?** Придружите се нашој заједници за подршку и дискусије о AZD и AI распоређивањима.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->