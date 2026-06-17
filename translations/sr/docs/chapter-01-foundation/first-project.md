# Ваш први пројекат - Практичан туторијал

**Навигација поглављем:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и брзи почетак
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: AI-први развој](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Добродошли у ваш први Azure Developer CLI пројекат! Овај свеобухватни практичан туторијал пружа потпун корак-по-корак преглед креирања, деплоја и управљања full-stack апликацијом на Azure користећи azd. Радићете са правом todo апликацијом која укључује React фронтенд, Node.js API бекенд и MongoDB базу података.

## Циљеви учења

Прошавањем овог туторијала, ви ћете:
- Савладати радни ток иницијализације azd пројекта помоћу шаблона
- Разумети структуру Azure Developer CLI пројекта и конфигурационе фајлове
- Извршити потпуно деплојовање апликације на Azure са провизионисањем инфраструктуре
- Имплементирати стратегије ажурирања апликације и поновног деплоја
- Управљати више окружења за развој и staging
- Применити праксе за чишћење ресурса и контролу трошкова

## Очекивани исходи

По завршетку, моћи ћете да:
- Самостално иницијализујете и конфигуришете azd пројекте из шаблона
- Ефикасно навигате и модификујете структуру azd пројекта
- Деплојујете full-stack апликације на Azure једном командом
- Решавате уобичајене проблеме деплоја и проблеме са аутентикацијом
- Управљате више Azure окружења за различите фазе деплоја
- Имплементирате CI/CD радне токове за ажурирања апликације

## Почетак

### Контролна листа предуслова
- ✅ Azure Developer CLI инсталиран ([Водич за инсталацију](installation.md))
- ✅ Аутентификација у AZD завршена са `azd auth login`
- ✅ Git инсталиран на вашем систему
- ✅ Node.js 16+ (за овај туторијал)
- ✅ Visual Studio Code (препоручено)

Пре него што наставите, покрените проверу подешавања из коренског директоријума репозиторијума:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Проверите своје подешавање
```bash
# Проверите инсталацију azd
azd version

# Проверите AZD аутентификацију
azd auth login --check-status
```

### Потврдите опциону Azure CLI аутентификацију

```bash
az account show
```

### Проверите верзију Node.js
```bash
node --version
```

## Корак 1: Изаберите и иницијализујте шаблон

Хајде да почнемо са популарним шаблоном todo апликације који укључује React фронтенд и Node.js API бекенд.

```bash
# Прегледајте доступне шаблоне
azd template list

# Иницијализујте шаблон апликације за задатке
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Пратите упутства:
# - Унесите име окружења: "dev"
# - Изаберите претплату (ако имате више претплата)
# - Изаберите регион: "East US 2" (или регион по вашем избору)
```

### Шта се управо догодило?
- Преузет је код шаблона у ваш локални директоријум
- Креиран је фајл `azure.yaml` са дефиницијама сервиса
- Постављен је инфраструктурни код у `infra/` директоријум
- Креирана је конфигурација окружења

## Корак 2: Истражите структуру пројекта

Хајде да погледамо шта је azd креирао за нас:

```bash
# Прегледај структуру пројекта
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

## Корак 3: Прилагодите ваш пројекат (опционо)

Пре деплоја можете прилагодити апликацију:

### Измените фронтенд
```bash
# Отворите компоненту React апликације
code src/web/src/App.tsx
```

Направите једну једноставну измену:
```typescript
// Пронађи наслов и промени га
<h1>My Awesome Todo App</h1>
```

### Конфигуришите променљиве окружења
```bash
# Постави прилагођене променљиве окружења
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Прикажи све променљиве окружења
azd env get-values
```

## Корак 4: Деплој на Azure

Сада долази узбудљиви део — деплојујте све на Azure!

```bash
# Разместити инфраструктуру и апликацију
azd up

# Ова команда ће:
# 1. Обезбедити Azure ресурсе (App Service, Cosmos DB, итд.)
# 2. Изградити вашу апликацију
# 3. Разместити на обезбеђене ресурсе
# 4. Приказати URL апликације
```

### Шта се дешава током деплоја?

Команда `azd up` извршава следеће кораке:
1. **Провизионисање** (`azd provision`) - Креира Azure ресурсе
2. **Паковање** - Гради код ваше апликације
3. **Деплој** (`azd deploy`) - Деплојује код на Azure ресурсе

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
Кликните на URL који је дат у излазу деплоја, или га добијте у било ком тренутку:
```bash
# Добијте крајње тачке апликације
azd show

# Отворите апликацију у вашем прегледачу
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирајте Todo апликацију
1. **Додајте ставку у todo листу** - Кликните на "Додај задатак" и унесите задатак
2. **Означите као завршаено** - Означите ставке које су завршене
3. **Избришите ставке** - Уклоните додате задатке које више не требате

### Надгледајте вашу апликацију
```bash
# Отворите Azure портал за ваше ресурсе
azd monitor

# Погледајте записе апликације
azd monitor --logs

# Погледајте метрике уживо
azd monitor --live
```

### ✅ Потврдите ваш деплој

Пре него што наставите, прођите кроз ову кратку контролну листу да потврдите да све заправо ради—немојте претпостављати да "деплој је успео" значи "апликација ради":

```bash
# 1. Потврдите да крајња тачка постоји и да је доступна
azd show

# 2. Извршите брзи тест крајње тачке (очекује се HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Проверите ендпоинт за здравље ако ваша апликација излаже такав
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Деплој је потврђен када:**
- ✅ `azd show` приказује доступан URL крајње тачке
- ✅ URL се отвара у вашем претраживачу без грешака
- ✅ Основне функције раде (додавање/означавање као завршено/брисање todo ставке)
- ✅ `azd monitor --logs` приказује долазне захтеве без неочекиваних грешака

Ако нека ставка не успе, пређите на [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/README.md).

## Корак 6: Направите измене и поново деплојујте

Хајде да направимо измену и видимо колико је лако ажурирати:

### Измените API
```bash
# Измени API код
code src/api/src/routes/lists.js
```

Додајте прилагођено заглавље одговора:
```javascript
// Пронађите обрађивача руте и додајте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Деплојујте само измене у коду
```bash
# Разместите само код апликације (прескочите инфраструктуру)
azd deploy

# Ово је много брже од 'azd up' јер инфраструктура већ постоји
```

## Корак 7: Управљајте више окружења

Креирајте staging окружење да тестирате измене пре продукције:

```bash
# Направите ново стејџинг окружење
azd env new staging

# Разместите на стејџинг окружење
azd up

# Вратите се на развојно окружење
azd env select dev

# Прикажите сва окружења
azd env list
```

### Поређење окружења
```bash
# Прегледај развојно окружење
azd env select dev
azd show

# Прегледај претпродукционо окружење
azd env select staging
azd show
```

## Корак 8: Очистите ресурсе

Кад завршите са експериментисањем, очистите ресурсе да бисте избегли сталне трошкове:

```bash
# Обриши све Azure ресурсе за тренутно окружење
azd down

# Присилно обриши без потврде и очисти меко избрисане ресурсе
azd down --force --purge

# Обриши одређено окружење
azd env select staging
azd down --force --purge
```

## Класична апликација против AI-покретане апликације: исти радни ток

Управо сте деплојовали традиционалну веб апликацију. Али шта ако бисте желели да деплојујете апликацију покретану AI-јем—на пример, чет апликацију која користи Microsoft Foundry Models?

Добра вест: **радни ток је идентичан.**

| Корак | Класична Todo апликација | AI чат апликација |
|------|-------------------------|-------------------|
| Иницијализација | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Аутентификација | `azd auth login` | `azd auth login` |
| Деплој | `azd up` | `azd up` |
| Надгледање | `azd monitor` | `azd monitor` |
| Чишћење | `azd down --force --purge` | `azd down --force --purge` |

Једина разлика је у **шаблону** са којег почињете. AI шаблон укључује додатну инфраструктуру (на пример Microsoft Foundry Models ресурс или AI Search индекс), али azd се бави свим тим. Не морате да учите нове команде, прихватате други алат или мењате начин размишљања о деплоју.

Ово је основни принцип azd: **један радни ток, било који оптерећење.** Вештине које сте практиковали у овом туторијалу—иницијализација, деплој, надгледање, поновни деплој и чишћење—подједнако се примењују на AI апликације и агенте.

---

## Шта сте научили

Честитамо! Успешно сте:
- ✅ Иницијализовали azd пројекат из шаблона
- ✅ Истражили структуру пројекта и кључне фајлове
- ✅ Деплојовали full-stack апликацију на Azure
- ✅ Направили измене у коду и поново деплојовали
- ✅ Управљали више окружења
- ✅ Очистили ресурсе

## 🎯 Вежбе за проверу вештина

### Вежба 1: Деплојујте други шаблон (15 минута)
**Циљ**: Покажите знање о azd init и радном току деплоја

```bash
# Испробајте стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Потврдите распоређивање
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очистите
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Апликација се деплојује без грешака
- [ ] Можете приступити URL-у апликације у претраживачу
- [ ] Апликација функционише исправно (додавање/уклањање todo ставки)
- [ ] Успешно очишћени сви ресурси

### Вежба 2: Прилагодите конфигурацију (20 минута)
**Циљ**: Вежба конфигурисања променљивих окружења

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
- [ ] Апликација деплојована са прилагођеном конфигурацијом
- [ ] Можете потврдити прилагођена подешавања у деплојованој апликацији

### Вежба 3: Радни ток са више окружења (25 минута)
**Циљ**: Савладајте управљање окружењима и стратегије деплоја

```bash
# Креирајте дев окружење
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Забележите URL адресу дев окружења
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Креирајте стејџинг окружење
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Забележите URL адресу стејџинг окружења
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Упоредите окружења
azd env list

# Тестирајте оба окружења
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Очистите оба окружења
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Креирана су два окружења са различитим конфигурацијама
- [ ] Оба окружења су успешно деплојована
- [ ] Можете пребацивати окружења користећи `azd env select`
- [ ] Променљиве окружења се разликују између окружења
- [ ] Успешно очистили оба окружења

## 📊 Ваш напредак

**Уложено време**: ~60-90 минута  
**Набављене вештине**:
- ✅ Иницијализација пројекта из шаблона
- ✅ Провизионисање Azure ресурса
- ✅ Радни токови деплоја апликација
- ✅ Управљање окружењима
- ✅ Управљање конфигурацијом
- ✅ Чишћење ресурса и контролa трошкова

**Следећи ниво**: Спремни сте за [Водич за конфигурацију](configuration.md) да научите напредне шаблоне конфигурације!

## Решавање уобичајених проблема

### Грешке при аутентификацији
```bash
# Поново се пријавите у Azure
az login

# Проверите приступ претплати
az account show
```

### Неуспеси деплоја
```bash
# Омогући дебаг логовање
export AZD_DEBUG=true
azd up --debug

# Погледај логове апликације у Azure
azd monitor --logs

# За Container Apps, користите Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликти имена ресурса
```bash
# Користите јединствено име за окружење
azd env new dev-$(whoami)-$(date +%s)
```

### Проблеми са портом/мрежом
```bash
# Провери да ли су портови доступни
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следећи кораци

Сада када сте завршили ваш први пројекат, истражите ове напредне теме:

### 1. Прилагодите инфраструктуру
- [Инфраструктура као код](../chapter-04-infrastructure/provisioning.md)
- [Додајте базе података, складиште и друге сервисе](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Подесите CI/CD
- [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md) - Комплетни CI/CD радни токови
- [Документација за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурација pipeline-а

### 3. Најбоље праксе за продукцију
- [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md) - Безбедност, перформансе и надгледање

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

### Наставни материјали
- [Документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure центар за архитектуру](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected оквир](https://learn.microsoft.com/en-us/azure/well-architected/)

### Заједница и подршка
- [Azure Developer CLI на GitHub-у](https://github.com/Azure/azure-dev)
- [Azure Developer заједница](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Званична галерија шаблона](https://azure.github.io/awesome-azd/)
- [Шаблони заједнице](https://github.com/Azure-Samples/azd-templates)
- [Обрасци за предузећа](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Честитамо на завршетку вашег првог azd пројекта!** Сада сте спремни да са самопоуздањем градите и деплојујете невероватне апликације на Azure.

---

**Навигација поглављем:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основе и брзи почетак
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Следеће поглавље**: [Поглавље 2: AI-први развој](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->