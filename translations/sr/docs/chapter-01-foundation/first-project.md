# Ваш Први Пројекат - Практичан Туторијал

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и Брзи почетак
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој оријентисан на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Добродошли у ваш први Azure Developer CLI пројекат! Овај свеобухватни практични туторијал пружа комплетан корак-по-корак водич за креирање, развоj и управљање full-stack апликацијом на Azure-у користећи azd. Радићете са стварном todo апликацијом која укључује React фронтенд, Node.js API бекенд и MongoDB базу података.

## Циљеви учења

Завршавањем овог туторијала ви ћете:
- Савладати workflow иницијализације azd пројекта користећи шаблоне
- Разумети структуру azd пројекта и конфигурационе датотеке
- Извршити комплетно деплоy-овање апликације на Azure са провизиониањем инфраструктуре
- Имплементирати стратегије за ажурирање апликације и поновно деплоy-овање
- Управљати више окружења за развој и staging
- Примeнити праксе чишћења ресурса и управљања трошковима

## Исходи учења

По завршетку ћете бити у стању да:
- Самостално иницијализујете и конфигуришете azd пројекте из шаблона
- Ефикасно навигирате и мењате структуру azd пројекта
- Деплоy-ујете full-stack апликације на Azure једном командом
- Решавате уобичајене проблеме приликом деплоy-овања и аутентификације
- Управљате више Azure окружења за различите фазе деплоy-овања
- Имплементирате CI/CD токове за ажурирања апликација

## Почните

### Контролна листа предуслова
- ✅ Azure Developer CLI инсталиран ([Installation Guide](installation.md))
- ✅ AZD аутентификација завршена са `azd auth login`
- ✅ Git инсталиран на вашем систему
- ✅ Node.js 16+ (за овај туторијал)
- ✅ Visual Studio Code (препоручено)

Пре него што наставите, покрените валидатор подешавања из корена репозиторијума:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Потврдите ваше подешавање
```bash
# Проверите инсталацију azd
azd version

# Проверите аутентификацију AZD
azd auth login --check-status
```

### Потврдите опционалну Azure CLI аутентикацију

```bash
az account show
```

### Проверите верзију Node.js
```bash
node --version
```

## Корак 1: Изаберите и иницијализујте шаблон

Хајде да почнемо са популарним todo апликацијом која укључује React фронтенд и Node.js API бекенд.

```bash
# Прегледајте доступне шаблоне
azd template list

# Иницијализујте шаблон апликације за задатке
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Пратите упутства:
# - Унесите име окружења: "dev"
# - Изаберите претплату (ако имате више)
# - Изаберите регион: "East US 2" (или ваш жељени регион)
```

### Шта се управо догодило?
- Преузет је код шаблона у вашу локалну фасциклу
- Креиран је `azure.yaml` фајл са дефиницијама сервиса
- Подешен је код инфраструктуре у директоријуму `infra/`
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

**azure.yaml** - Срж вашег azd пројекта:
```bash
# Погледајте конфигурацију пројекта
cat azure.yaml
```

**infra/main.bicep** - Дефиниција инфраструктуре:
```bash
# Погледајте код инфраструктуре
head -30 infra/main.bicep
```

## Корак 3: Прилагодите ваш пројекат (опционо)

Пре деплоy-овања, можете прилагодити апликацију:

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

### Конфигуришите променљиве окружења
```bash
# Поставите прилагођене променљиве окружења
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Прикажите све променљиве окружења
azd env get-values
```

## Корак 4: Деплоy на Azure

Сада долази узбудљиви део - деплоy све на Azure!

```bash
# Размести инфраструктуру и апликацију
azd up

# Ова команда ће:
# 1. Обезбедити Azure ресурсе (App Service, Cosmos DB, итд.)
# 2. Изградити вашу апликацију
# 3. Разместити на обезбеђене ресурсе
# 4. Приказати URL апликације
```

### Шта се дешава током деплоy-овања?

Команда `azd up` извршава следеће кораке:
1. **Provision** (`azd provision`) - Креира Azure ресурсе
2. **Package** - Гради ваш апликациони код
3. **Deploy** (`azd deploy`) - Деплоy-ује код на Azure ресурсе

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
Кликните на URL који је наведен у излазу деплоy-а, или га добијте у било ком тренутку:
```bash
# Добијте крајње тачке апликације
azd show

# Отворите апликацију у вашем прегледачу
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирајте Todo апликацију
1. **Додајте todo ставку** - Кликните "Add Todo" и унесите задатак
2. **Означите као завршено** - Означите завршене ставке
3. **Обришите ставке** - Уклоните todo-ове које више не треба

### Надгледајте вашу апликацију
```bash
# Отворите Azure портал за ваше ресурсе
azd monitor

# Погледајте логове апликације
azd monitor --logs

# Погледајте метрике у реалном времену
azd monitor --live
```

## Корак 6: Направите измене и поново деплоy-ујте

Хајде да направимо измену и видимо колико је једноставно ажурирати:

### Измените API
```bash
# Измени API код
code src/api/src/routes/lists.js
```

Додајте прилагођени заглавље одговора:
```javascript
// Пронађите обрађивача руте и додајте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Деплоy само измене кода
```bash
# Разместите само код апликације (прескочите инфраструктуру)
azd deploy

# Ово је много брже од 'azd up' јер инфраструктура већ постоји
```

## Корак 7: Управљање вишеструким окружењима

Креирајте staging окружење да тестирате измене пре production-а:

```bash
# Креирај ново стејџинг окружење
azd env new staging

# Размешти на стејџинг окружење
azd up

# Пребаци се назад на развојно окружење
azd env select dev

# Прикажи сва окружења
azd env list
```

### Поређење окружења
```bash
# Погледајте развојно окружење
azd env select dev
azd show

# Погледајте претпродукцијско окружење
azd env select staging
azd show
```

## Корак 8: Очистите ресурсе

Када завршите са експериментисањем, очистите ресурсе да бисте избегли текуће трошкове:

```bash
# Обришите све Azure ресурсе за тренутно окружење
azd down

# Присилно обришите без потврде и трајно уклоните привремено обрисане ресурсе
azd down --force --purge

# Обришите одређено окружење
azd env select staging
azd down --force --purge
```

## Класична апликација у односу на апликацију покретану AI-јем: Исти радни ток

Управо сте деплоy-овали традиционалну веб апликацију. Али шта ако бисте желели да деплоy-ујете апликацију покретану AI-јем — рецимо, чат апликацију која користи Microsoft Foundry Models?

Добра вест: **радни ток је идентичан.**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Једина разлика је у **шаблону** од којег почињете. AI шаблон укључује додатну инфраструктуру (као ресурс Microsoft Foundry Models или AI Search индекс), али azd се брине о свему томе за вас. Не морате да учите нове команде, прихватате други алат, или мењате начин на који размишљате о деплоy-овању.

Ово је основни принцип azd: **један радни ток, било који оптерећења.** Вештине које сте вежбали у овом туторијалу — иницијализација, деплоy, надгледање, поновно деплоy-овање и чишћење — подједнако се примењују и на AI апликације и агенте.

---

## Шта сте научили

Честитамо! Успешно сте:
- ✅ Иницијализовали azd пројекат из шаблона
- ✅ Истражили структуру пројекта и кључне фајлове
- ✅ Деплоy-овали full-stack апликацију на Azure
- ✅ Направили измене у коду и поново деплоy-овали
- ✅ Управљали вишеструким окружењима
- ✅ Очистили ресурсе

## 🎯 Вежбе за валидацију вештина

### Вежба 1: Деплоy различит шаблон (15 минута)
**Циљ**: Демонстрирати познавање azd init и workflow деплоy-овања

```bash
# Испробај Python + MongoDB стек
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Провери распоређивање
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очисти
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Апликација се деплоy-ује без грешака
- [ ] Можете приступити URL-у апликације у прегледачу
- [ ] Апликација функционише исправно (додавање/уклањање todo-ова)
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

# Распореди са прилагођеном конфигурацијом
azd up
```

**Критеријуми успеха:**
- [ ] Прилагођено окружење успешно креирано
- [ ] Променљиве окружења подешене и извучиве
- [ ] Апликација деплоy-ована са прилагођеном конфигурацијом
- [ ] Можете проверити прилагођена подешавања у деплоy-ованој апликацији

### Вежба 3: Радни ток са више окружења (25 минута)
**Циљ**: Савладати управљање окружењима и стратегије деплоy-овања

```bash
# Креирај развојно окружење
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Забележи УРЛ развојног окружења
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Креирај стејџинг окружење
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Забележи УРЛ стејџинг окружења
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
- [ ] Обa окружења успешно деплоy-ована
- [ ] Можете пребацивати окружења користећи `azd env select`
- [ ] Променљиве окружења се разликују између окружења
- [ ] Успешно очишћена оба окружења

## 📊 Ваш напредак

**Уложено време**: ~60-90 минута  
**Стечене вештине**:
- ✅ Иницијализација пројекта из шаблона
- ✅ Провизионисање Azure ресурса
- ✅ Workflow-ови деплоy-овања апликација
- ✅ Управљање окружењима
- ✅ Управљање конфигурацијом
- ✅ Чишћење ресурса и управљање трошковима

**Следећи ниво**: Спремни сте за [Configuration Guide](configuration.md) да научите напредне шаблоне конфигурације!

## Решавање уобичајених проблема

### Грешке при аутентикацији
```bash
# Поново се аутентификујте у Azure
az login

# Проверите приступ претплати
az account show
```

### Неуспеси при деплоy-овању
```bash
# Омогући логовање за отклањање грешака
export AZD_DEBUG=true
azd up --debug

# Прегледај логове апликације у Azure
azd monitor --logs

# За Container Apps, користите Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Суочавање са конфликтима имена ресурса
```bash
# Користите јединствено име окружења
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми са портовима/мрежом
```bash
# Проверити да ли су портови доступни
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следећи кораци

Сада када сте завршили ваш први пројекат, истражите ове напредне теме:

### 1. Прилагодите инфраструктуру
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Додајте базе података, складиште и друге сервисе](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Подесите CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Комплетни CI/CD токови
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурација пипелина

### 3. Најбоље праксе за продукцију
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Безбедност, перформансе и надгледање

### 4. Истражите више шаблона
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
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Заједница и подршка
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Честитамо на завршетку вашег првог azd пројекта!** Сада сте спремни да са самопоуздањем градите и деплоy-ујете невероватне апликације на Azure-у.

---

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и Брзи почетак
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој оријентисан на AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следећа лекција**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу услуге за превођење засноване на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо прецизност, имајте у виду да аутоматски преводи могу да садрже грешке или нетачности. Оригинални документ на изворном језику треба сматрати обавезујућим извором. За критичне информације препоручује се професионални превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->