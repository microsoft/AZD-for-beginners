# Ваш први пројекат - Практичан водич

**Навигација поглављем:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Chapter 1 - Foundation & Quick Start
- **⬅️ Претходно**: [Installation & Setup](installation.md)
- **➡️ Следеће**: [Configuration](configuration.md)
- **🚀 Следеће поглавље**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Добродошли у ваш први Azure Developer CLI пројекат! Овај свеобухватни практични водич пружа потпун преглед креирања, распоређивања и управљања full-stack апликацијом на Azure користећи azd. Радићете са реалном todo апликацијом која укључује React фронтенд, Node.js API бекенд и MongoDB базу података.

## Циљеви учења

Комpletirajuћи овај туторијал, ви ћете:
- Овладати процесом иницијализације azd пројекта помоћу шаблона
- Разумети структуру Azure Developer CLI пројекта и конфигурационе датотеке
- Извршити потпуно распоређивање апликације на Azure са провизионисањем инфраструктуре
- Имплементирати стратегије ажурирања апликације и поновног распоређивања
- Управљати више окружења за развој и стагинг
- Применити праксе чишћења ресурса и управљања трошковима

## Исходи учења

Након завршетка, бићете у стању да:
- Иницијализујете и конфигуришете azd пројекте из шаблона самостално
- Навигујете и модификујете структуре azd пројекта ефикасно
- Распоређујете full-stack апликације на Azure једном командом
- Решавате уобичајене проблеме при распоређивању и аутентификацији
- Управљате више Azure окружења за различите фазе распореде
- Имплементирате континуиране токове развоја за ажурирање апликација

## Почетак

### Контролна листа предуслова
- ✅ Azure Developer CLI инсталиран ([Installation Guide](installation.md))
- ✅ Azure CLI инсталиран и аутентификован
- ✅ Git инсталиран на вашем систему
- ✅ Node.js 16+ (за овај туторијал)
- ✅ Visual Studio Code (препоручено)

### Потврдите вашу поставку
```bash
# Проверите инсталацију azd
azd version
```
### Провера Azure аутентификације

```bash
az account show
```

### Проверите верзију Node.js
```bash
node --version
```

## Корак 1: Изаберите и иницијализујте шаблон

Хајде да почнемо са популарним шаблоном todo апликације који обухвата React фронтенд и Node.js API бекенд.

```bash
# Прегледајте доступне шаблоне
azd template list

# Иницијализујте шаблон то-до апликације
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Пратите упутства:
# - Унесите име окружења: "dev"
# - Изаберите претплату (ако имате више претплата)
# - Изаберите регион: "East US 2" (или ваш жељени регион)
```

### Шта се управо десило?
- Преузет је код шаблона у ваш локални директоријум
- Креиран је фајл `azure.yaml` са дефиницијама сервиса
- Постављен је инфраструктурни код у директоријум `infra/`
- Креирана је конфигурација окружења

## Корак 2: Истражите структуру пројекта

Хајде да погледамо шта је azd креирао за нас:

```bash
# Прикажи структуру пројекта
tree /f   # Виндоус
# или
find . -type f | head -20   # macOS/Линукс
```

Требало би да видите:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Кључни фајлови које треба разумети

**azure.yaml** - Срце вашег azd пројекта:
```bash
# Прикажи конфигурацију пројекта
cat azure.yaml
```

**infra/main.bicep** - Дефиниција инфраструктуре:
```bash
# Погледајте код инфраструктуре
head -30 infra/main.bicep
```

## Корак 3: Прилагодите свој пројекат (опционо)

Пре распоређивања, можете прилагодити апликацију:

### Измените фронтенд
```bash
# Отворите React компоненту апликације
code src/web/src/App.tsx
```

Направите једноставну измену:
```typescript
// Пронађи наслов и промени га
<h1>My Awesome Todo App</h1>
```

### Подесите променљиве окружења
```bash
# Поставите прилагођене променљиве окружења
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Погледајте све променљиве окружења
azd env get-values
```

## Корак 4: Распоредите на Azure

Сада долази узбудљиви део - распоредите све на Azure!

```bash
# Размести инфраструктуру и апликацију
azd up

# Ова наредба ће:
# 1. Обезбедити Azure ресурсе (App Service, Cosmos DB итд.)
# 2. Изградити вашу апликацију
# 3. Разместити на обезбеђене ресурсе
# 4. Приказати URL апликације
```

### Шта се дешава током распоређивања?

Команда `azd up` извршава следеће кораке:
1. **Provision** (`azd provision`) - Креира Azure ресурсе
2. **Package** - Саграђује код апликације
3. **Deploy** (`azd deploy`) - Распоређује код на Azure ресурсе

### Очекивани излаз
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Корак 5: Тестирајте вашу апликацију

### Приступите вашој апликацији
Кликните на URL који је дат у излазу распоређивања, или га набавите у било ком тренутку:
```bash
# Добијте крајње тачке апликације
azd show

# Отворите апликацију у вашем прегледачу
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирајте Todo апликацију
1. **Додајте ставку у todo** - Кликните „Додај задатак“ и унесите задатак
2. **Означите као завршено** - Ознаците завршене ставке
3. **Обришите ставке** - Уклоните todo ставке које вам више не требају

### Пратите вашу апликацију
```bash
# Отворите Azure портал за ваше ресурсе
azd monitor

# Погледајте дневнике апликације
azd monitor --logs

# Погледајте метрике у реалном времену
azd monitor --live
```

## Корак 6: Направите измене и поново распоредите

Хајде да направимо измену и видимо колико је лако ажурирати:

### Измените API
```bash
# Измени API код
code src/api/src/routes/lists.js
```

Додајте прилагођено заглавље одговора:
```javascript
// Пронађите обрађивач руте и додајте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Распоредите само измене у коду
```bash
# Размештите само код апликације (прескочите инфраструктуру)
azd deploy

# Ово је много брже од 'azd up' јер инфраструктура већ постоји
```

## Корак 7: Управљајте више окружења

Креирајте стагинг окружење да тестирате измене пре продукције:

```bash
# Креирај ново претпроизводно окружење
azd env new staging

# Размешти на претпроизводно окружење
azd up

# Врати се на развојно окружење
azd env select dev

# Прикажи сва окружења
azd env list
```

### Поређење окружења
```bash
# Прикажи развојно окружење
azd env select dev
azd show

# Прикажи предпроизводно окружење
azd env select staging
azd show
```

## Корак 8: Очистите ресурсе

Када завршите са експериментисањем, очистите ресурсе како бисте избегли сталне трошкове:

```bash
# Избриши све Azure ресурсе за тренутно окружење
azd down

# Принудно избриши без потврде и трајно очисти меко-избрисане ресурсе
azd down --force --purge

# Избриши конкретно окружење
azd env select staging
azd down --force --purge
```

## Класична апликација у односу на AI-покренуту апликацију: Исти радни ток

Управо сте распоредили традиционалну веб апликацију. Али шта ако бисте желели да уместо тога распоредите AI-покренуту апликацију — на пример, чет апликацију потпомогнуту Microsoft Foundry моделима?

Добра вест: **радни ток је идентичан.**

| Корак | Класична Todo апликација | AI Чет апликација |
|------|-------------------------|-------------------|
| Иницијализација | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Аутентификација | `azd auth login` | `azd auth login` |
| Распоређивање | `azd up` | `azd up` |
| Надгледање | `azd monitor` | `azd monitor` |
| Чишћење | `azd down --force --purge` | `azd down --force --purge` |

Једина разлика је у **шаблону** са којег почињете. AI шаблон укључује додатну инфраструктуру (као што је Microsoft Foundry Models ресурс или AI Search индекс), али azd све то решава за вас. Не морате да учите нове команде, усвајате другачији алат или мењате начин размишљања о распоређивању.

Ово је основни принцип azd: **један радни ток, било која радна оптерећења.** Вештине које сте вежбали у овом туторијалу — иницијализација, распоређивање, надгледање, поновно распоређивање и чишћење — подједнако важe за AI апликације и агенте.

---

## Шта сте научили

Честитамо! Успешно сте:
- ✅ Иницијализовали azd пројекат из шаблона
- ✅ Истражили структуру пројекта и кључне фајлове
- ✅ Распоредили full-stack апликацију на Azure
- ✅ Направили измене у коду и поново распоредили
- ✅ Управљали више окружења
- ✅ Одвежли ресурсе

## 🎯 Вежбе за проверу вештина

### Вежба 1: Распоредите другачији шаблон (15 минута)
**Циљ**: Покажите знање о azd init и процесу распоређивања

```bash
# Испробајте стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Проверите распоређивање
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очистите
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Апликација се распоређује без грешака
- [ ] Могућ приступ URL-у апликације у прегледачу
- [ ] Апликација функционише исправно (додавање/брисање todo ставки)
- [ ] Успешно очишћени сви ресурси

### Вежба 2: Прилагодите конфигурацију (20 минута)
**Циљ**: Вежбати конфигурацију променљивих окружења

```bash
cd my-first-azd-app

# Креирај прилагођено окружење
azd env new custom-config

# Постави прилагођене променљиве
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Провери променљиве
azd env get-values | grep APP_TITLE

# Размешти са прилагођеном конфигурацијом
azd up
```

**Критеријуми успеха:**
- [ ] Прилагођено окружење успешно креирано
- [ ] Променљиве окружења подешене и доступне
- [ ] Апликација распоређена са прилагођеном конфигурацијом
- [ ] Могуће проверити прилагођена подешавања у распоређеној апликацији

### Вежба 3: Радни ток више окружења (25 минута)
**Циљ**: Овладати управљањем окружењима и стратегијама распореза

```bash
# Креирај развојно окружење
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Запиши URL развојног окружења
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Креирај предпродукционо окружење
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Запиши URL предпродукционог окружења
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Упореди окружења
azd env list

# Тестирај оба окружења
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Очисти оба окружења
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Креирана су два окружења са различитим конфигурацијама
- [ ] Обa окружења успешно распоређена
- [ ] Могућност пребацивања између окружења помоћу `azd env select`
- [ ] Променљиве окружења се разликују између окружења
- [ ] Успешно очишћена оба окружења

## 📊 Ваш напредак

**Уложено време**: ~60-90 минута  
**Стечене вештине**:
- ✅ Иницијализација пројекта помоћу шаблона
- ✅ Провизионисање Azure ресурса
- ✅ Радни токови распоређивања апликација
- ✅ Управљање окружењима
- ✅ Управљање конфигурацијом
- ✅ Чишћење ресурса и управљање трошковима

**Следећи ниво**: Спремни сте за [Водич за конфигурацију](configuration.md) да научите напредне шаблоне конфигурације!

## Решавање уобичајених проблема

### Грешке при аутентификацији
```bash
# Поново се аутентификујте у Azure
az login

# Проверите приступ претплати
az account show
```

### Неуспеси при распоређивању
```bash
# Омогући дебаг логовање
export AZD_DEBUG=true
azd up --debug

# Погледај логове апликације у Azure
azd monitor --logs

# За Container Apps, користи Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти назива ресурса
```bash
# Користите јединствено име окружења
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми са портом/мрежом
```bash
# Провери да ли су портови доступни
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следећи кораци

Сада када сте завршили свој први пројекат, истражите ове напредне теме:

### 1. Прилагодите инфраструктуру
- [Инфраструктура као код](../chapter-04-infrastructure/provisioning.md)
- [Додајте базе података, складиште и друге услуге](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Подесите CI/CD
- [Водич за распоређивање](../chapter-04-infrastructure/deployment-guide.md) - Комплетни CI/CD радни токови
- [Документација Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурација pipeline-а

### 3. Најбоље праксе за продукцију
- [Водич за распоређивање](../chapter-04-infrastructure/deployment-guide.md) - Безбедност, перформансе и надгледање

### 4. Истражите још шаблона
```bash
# Прегледајте шаблоне по категоријама
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Испробајте различите технолошке стекове
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Додатни ресурси

### Материјали за учење
- [Документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Заједница и подршка
- [Azure Developer CLI на GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer заједница](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Честитамо на завршетку вашег првог azd пројекта!** Сада сте спремни да са поверењем правите и распоређујете невероватне апликације на Azure.

---

**Навигација поглављем:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Chapter 1 - Foundation & Quick Start
- **⬅️ Претходно**: [Installation & Setup](installation.md)
- **➡️ Следеће**: [Configuration](configuration.md)
- **🚀 Следеће поглавље**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следећа лекција**: [Водич за распоређивање](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Искључење одговорности**:
Овај документ је преведен помоћу услуге за превођење коју покреће вештачка интелигенција [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу да садрже грешке или нетачности. Изворни документ на његовом матичном језику треба сматрати ауторитетом. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->