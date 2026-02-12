# Ваш први пројекат - Практичан водич

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа & Брзи старт
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој оријентисан на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Увод

Добродошли у ваш први проект са Azure Developer CLI! Овај обимни практичан туторијал пружа потпун корак-по-корак водич за креирање, деплој и управљање full-stack апликацијом на Azure помоћу azd. Радићете са правом апликацијом за то-до која укључује React фронтенд, Node.js API бекенд и MongoDB базу података.

## Циљеви учења

Комплетирањем овог туторијала, ви ћете:
- Усавршити workflow иницијализације azd пројекта користећи шаблоне
- Разумети структуру azd пројекта и конфигурационе датотеке
- Извршити потпуни деплој апликације на Azure са провизионисањем инфраструктуре
- Имплементирати стратегије за ажурирање апликације и поновни деплој
- Управљати више окружења за развој и staging
- Применити праксе чишћења ресурса и управљања трошковима

## Исходи учења

Након завршетка, моћи ћете да:
- Самостално иницијализујете и конфигуришете azd пројекте из шаблона
- Ефективно навигате и модификујете структуру azd пројекта
- Деплојујете full-stack апликације на Azure једном командом
- Решавате уобичајене проблеме при деплоју и аутентификацији
- Управљате више Azure окружења за различите фазе деплоирања
- Имплементирате CI/CD токове за ажурирања апликација

## Почетак

### Контрола испуњености предуслова
- ✅ Azure Developer CLI инсталиран ([Водич за инсталацију](installation.md))
- ✅ Azure CLI инсталиран и аутентификован
- ✅ Git инсталиран на вашем систему
- ✅ Node.js 16+ (за овај туторијал)
- ✅ Visual Studio Code (препоручено)

### Потврдите своје подешавање
```bash
# Провери инсталацију azd
azd version
```
### Потврдите Azure аутентификацију

```bash
az account show
```

### Проверите верзију Node.js
```bash
node --version
```

## Корак 1: Изаберите и иницијализујте шаблон

Хајде да почнемо са популарним шаблоном апликације за то-до који укључује React фронтенд и Node.js API бекенд.

```bash
# Прегледајте доступне шаблоне
azd template list

# Иницијализујте шаблон апликације за то-до листу
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Пратите упутства:
# - Унесите име окружења: "dev"
# - Изаберите претплату (ако имате више)
# - Изаберите регион: "East US 2" (или ваш преферирани регион)
```

### Шта се управо догодило?
- Преузет је код шаблона у вашу локалну фасциклу
- Креирана је датотека `azure.yaml` са дефиницијама сервиса
- Подешен је инфраструктурни код у директоријуму `infra/`
- Креирана је конфигурација окружења

## Корак 2: Истражите структуру пројекта

Хајде да погледамо шта је azd креирао за нас:

```bash
# Прикажи структуру пројекта
tree /f   # Windows
# или
find . -type f | head -20   # macOS/Linux
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

### Кључне датотеке које треба разумети

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

## Корак 3: Прилагодите свој пројекат (опционо)

Пре деплоја можете прилагодити апликацију:

### Измените фронтенд
```bash
# Отворите компоненту React апликације
code src/web/src/App.tsx
```

Унесите једну једноставну измену:
```typescript
// Пронађи наслов и промени га
<h1>My Awesome Todo App</h1>
```

### Конфигуришите променљиве окружења
```bash
# Подесите прилагођене променљиве окружења
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Прикажите све променљиве окружења
azd env get-values
```

## Корак 4: Деплој на Azure

Сада долази узбудљиви део – деплојујте све на Azure!

```bash
# Деплојирати инфраструктуру и апликацију
azd up

# Ова команда ће:
# 1. Обезбедити Azure ресурсе (App Service, Cosmos DB итд.)
# 2. Изградити вашу апликацију
# 3. Деплојирати на обезбеђене ресурсе
# 4. Приказати URL апликације
```

### Шта се дешава током деплоја?

Команда `azd up` извршава следеће кораке:
1. **Провизионисање** (`azd provision`) - Креира Azure ресурсе
2. **Паковање** - Гради код ваше апликације
3. **Деплој** (`azd deploy`) - Деплојује код на Azure ресурсе

### Очекујани излаз
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

### Тестирајте то-до апликацију
1. **Додајте ставку** - Кликните на "Додај ставку" и унесите задатак
2. **Означите као завршено** - Означите завршене ставке
3. **Избришите ставке** - Уклоните ставке које вам више не требају

### Праћење ваше апликације
```bash
# Отворите портал Azure за ваше ресурсе
azd monitor

# Погледајте логове апликације
azd monitor --logs

# Погледајте метрике у реалном времену
azd monitor --live
```

## Корак 6: Унесите измене и поново деплојујте

Хајде да направимо измену и видимо колико је лако ажурирати:

### Измените API
```bash
# Измените API код
code src/api/src/routes/lists.js
```

Додајте прилагођено заглавље одговора:
```javascript
// Пронађите обрађивача руте и додајте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Деплој само измене кода
```bash
# Размештите само код апликације (прескочите инфраструктуру)
azd deploy

# Ово је много брже од 'azd up' јер инфраструктура већ постоји
```

## Корак 7: Управљање више окружења

Креирајте staging окружење да тестирате измене пре продукције:

```bash
# Креирај ново стејџинг окружење
azd env new staging

# Размешти на стејџинг
azd up

# Пребаци назад на развојно окружење
azd env select dev

# Прикажи сва окружења
azd env list
```

### Упоређивање окружења
```bash
# Погледај развојно окружење
azd env select dev
azd show

# Погледај окружење за припрему
azd env select staging
azd show
```

## Корак 8: Чишћење ресурса

Када завршите са експериментисањем, очистите ресурсе да бисте избегли континуиране трошкове:

```bash
# Избриши све Azure ресурсе за текуће окружење
azd down

# Принудно обриши без потврде и трајно уклони привремено избрисане ресурсе
azd down --force --purge

# Избриши одређено окружење
azd env select staging
azd down --force --purge
```

## Шта сте научили

Честитамо! Успешно сте:
- ✅ Иницијализовали azd пројекат из шаблона
- ✅ Истражили структуру пројекта и кључне датотеке
- ✅ Размештили full-stack апликацију на Azure
- ✅ Унели измене у код и поново их деплојовали
- ✅ Управљали више окружења
- ✅ Очистили ресурсе

## 🎯 Вежбе за валидацију вештина

### Вежба 1: Деплој другачијег шаблона (15 минута)
**Циљ**: Покажите савладавање azd init и процеса деплоја

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
- [ ] Апликација се деплојује без грешака
- [ ] Можете приступити URL-у апликације у прегледачу
- [ ] Апликација функционише исправно (додавање/уклањање то-до ставки)
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
- [ ] Променљиве окружења постављене и доступне за читање
- [ ] Апликација се деплојује са прилагођеном конфигурацијом
- [ ] Можете проверити прилагођена подешавања у деплојованој апликацији

### Вежба 3: Воркфлоу са више окружења (25 минута)
**Циљ**: Савладати управљање окружењима и стратегије деплоја

```bash
# Креирај развојно окружење
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Запиши URL развојног окружења
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Креирај пред-продукцијско окружење
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Запиши URL пред-продукцијског окружења
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
- [ ] Креирана два окружења са различитим конфигурацијама
- [ ] Оба окружења су успешно деплојована
- [ ] Можете пребацивати између окружења користећи `azd env select`
- [ ] Променљиве окружења су различите у различитим окружењима
- [ ] Успешно сте очистили оба окружења

## 📊 Ваш напредак

**Уложено време**: ~60-90 минута  
**Стечене вештине**:
- ✅ Иницијализација пројекта на бази шаблона
- ✅ Провизионисање Azure ресурса
- ✅ Токови рада за деплој апликација
- ✅ Управљање окружењем
- ✅ Управљање конфигурацијом
- ✅ Чишћење ресурса и управљање трошковима

**Следећи ниво**: Спремни сте за [Водич за конфигурацију](configuration.md) да научите напредне конфигурационе шаблоне!

## Решавање уобичајених проблема

### Грешке при аутентификацији
```bash
# Поново се пријавите на Azure
az login

# Проверите приступ претплати
az account show
```

### Неуспеси при деплоју
```bash
# Омогући дебаг логовање
export AZD_DEBUG=true
azd up --debug

# Погледај логове апликације у Azure
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

Сада када сте завршили свој први пројекат, истражите ове напредне теме:

### 1. Прилагодите инфраструктуру
- [Инфраструктура као код](../chapter-04-infrastructure/provisioning.md)
- [Додајте базе података, складиште и друге услуге](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Поставите CI/CD
- [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md) - Комплетни CI/CD токови рада
- [Документација Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Конфигурација пипелина

### 3. Најбоље праксе за продукцију
- [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md) - Безбедност, перформансе и праћење

### 4. Истражите више шаблона
```bash
# Прегледајте шаблоне по категоријама
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Пробајте различите технолошке стекове
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Додатни ресурси

### Материјали за учење
- [Документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центар Azure архитектуре](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected оквир](https://learn.microsoft.com/en-us/azure/well-architected/)

### Заједница и подршка
- [GitHub репозиторијум Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Заједница Azure програмера](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблони и примери
- [Званична галерија шаблона](https://azure.github.io/awesome-azd/)
- [Заједнички шаблони](https://github.com/Azure-Samples/azd-templates)
- [Патерни за предузећа](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Честитамо на завршетку вашег првог azd пројекта!** Сада сте спремни да са поверењем правите и деплојујете сјајне апликације на Azure.

---

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 1 - Основа & Брзи старт
- **⬅️ Претходно**: [Инсталација и подешавање](installation.md)
- **➡️ Следеће**: [Конфигурација](configuration.md)
- **🚀 Следеће поглавље**: [Поглавље 2: Развој оријентисан на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следећа лекција**: [Водич за деплој](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ у свом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод који обавља човек. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->