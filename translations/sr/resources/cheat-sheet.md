# Командни подсетник - Основне AZD команде

**Брзи преглед за све поглавља**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Брзи почетак**: [Поглавље 1: Основе & Брзи почетак](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команде**: [Поглавље 2: Развој оријентисан на AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напредно**: [Поглавље 4: Инфраструктура као код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Увод

Овај свеобухватни подсетник пружа брзи преглед најчешће коришћених Azure Developer CLI команда, организованих по категоријама са практичним примерима. Савршено за брзо проналажење током развоја, решавања проблема и свакодневних операција са azd пројектима.

## Циљеви учења

Коришћењем овог подсетника, ви ћете:
- Имати тренутан приступ основним Azure Developer CLI командама и синтакси
- Разумети организацију команда по функционалним категоријама и случајевима употребе
- Погледати практичне примере за уобичајене сценарије развоја и деплоја
- Приступити командама за решавање проблема ради брзог отклањања грешака
- Ефикасно пронаћи напредне опције конфигурације и прилагођавања
- Пронаћи команде за управљање окружењима и радне токове са више окружења

## Резултати учења

Редовним коришћењем овог подсетника, моћи ћете да:
- Извршавате azd команде са поверењем без консултовања целокупне документације
- Брзо решавате уобичајене проблеме користећи одговарајуће дијагностичке команде
- Ефикасно управљате више окружења и сценарија деплоја
- Примењујете напредне azd функције и опције конфигурације по потреби
- Дијагностикујете проблеме при деплоју користећи систематске секвенце команди
- Оптимизујете радне токове кроз ефикасну употребу azd пречица и опција

## Команде за почетак

### Аутентификација
```bash
# Пријавите се у Azure преко AZD
azd auth login

# Пријавите се у Azure CLI (AZD користи ово у позадини)
az login

# Проверите тренутни налог
az account show

# Подесите подразумевану претплату
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Одјавите се из AZD
azd auth logout

# Одјавите се из Azure CLI
az logout
```

### Иницијализација пројекта
```bash
# Прегледајте доступне шаблоне
azd template list

# Иницијализуј из шаблона
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Иницијализуј у текућем директоријуму
azd init .

# Иницијализуј са прилагођеним именом
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основне команде за деплој

### Комплетан ток деплоја
```bash
# Постави све (провизионисање + распоређивање)
azd up

# Постави са онемогућеним упитима за потврду
azd up --confirm-with-no-prompt

# Постави за одређено окружење
azd up --environment production

# Постави са прилагођеним параметрима
azd up --parameter location=westus2
```

### Само инфраструктура
```bash
# Постављање Azure ресурса
azd provision

# 🧪 Преглед промена у инфраструктури
azd provision --preview
# Приказује преглед пробног покретања о томе који би ресурси били креирани/измењени/избрисани
# Слично 'terraform plan' или 'bicep what-if' - безбедно за покретање, не примењују се никакве измене
```

### Само апликација
```bash
# Разместити код апликације
azd deploy

# Разместити одређену услугу
azd deploy --service web
azd deploy --service api

# Разместити све услуге
azd deploy --all
```

### Изградња и паковање
```bash
# Врати (преузми) зависности апликације
azd restore

# Врати одређени сервис
azd restore --service api

# Изгради артефакт погодан за распоређивање без стварног распоређивања
azd package

# Изгради одређени сервис
azd package --service api
```

> **`azd restore`** преузима зависности ваше апликације (npm, pip, NuGet, Maven итд.). Покреће се аутоматски током `azd package` и `azd deploy`, па га ретко позивате директно—покрените га ручно да бисте унапред преузели зависности (на пример, да загрејете CI кеш или касније радите офлајн).

> **`azd package`** гради артефакт за деплој (слику контејнера или zip) **без** његовог слања на Azure. Користите га самостално да проверите да ли изградња успева, прегледате излаз, или произведете артефакт који ће касније други процес распоредити. `azd deploy` аутоматски пакетира, тако да вам је `azd package` потребан само када желите артефакт без деплоја.


## 🌍 Управљање окружењима

### Операције окружења
```bash
# Прикажи сва окружења
azd env list

# Креирај ново окружење
azd env new development
azd env new staging --location westus2

# Изабери окружење
azd env select production

# Прикажи доступна окружења
azd env list

# Освежи стање окружења
azd env refresh
```

### Променљиве окружења
```bash
# Постави променљиву окружења
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Добиј променљиву окружења
azd env get API_KEY

# Прикажи све променљиве окружења
azd env get-values

# Уклони променљиву окружења
azd env unset DEBUG
```

## ⚙️ Команде конфигурације

### Глобална конфигурација
```bash
# Прикажи све конфигурације
azd config show

# Постави глобалне подразумеване вредности
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Уклони конфигурацију
azd config unset defaults.location

# Ресетуј све конфигурације
azd config reset
```

### Конфигурација пројекта
```bash
# Валидирај azure.yaml
azd config validate

# Прикажи информације о пројекту
azd show

# Добиј крајње тачке сервиса
azd show --output json
```

## 📊 Надгледање и дијагностика

### Контролна табла за надгледање
```bash
# Отворите контролну таблу за праћење у Azure порталу
azd monitor

# Отворите метрике уживо у Application Insights
azd monitor --live

# Отворите панел дневника (Logs) у Application Insights
azd monitor --logs

# Отворите преглед у Application Insights
azd monitor --overview
```

### Преглед логова контејнера
```bash
# Прегледајте логове помоћу Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Пратите логове у реалном времену
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Прегледајте логове на Azure порталу
azd monitor --logs
```

### Упити за Log Analytics
```bash
# Приступите Log Analytics преко Azure портала
azd monitor --logs

# Питајте логове помоћу Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команде одржавања

### Чишћење
```bash
# Уклони све Azure ресурсе
azd down

# Принудно обриши без потврде
azd down --force

# Очисти привремено обрисане ресурсе
azd down --purge

# Потпуно чишћење
azd down --force --purge
```

### Ажурирања
```bash
# Провери да ли постоје ажурирања за azd
azd version

# Добиј тренутну верзију
azd version

# Прикажи тренутну конфигурацију
azd config show
```

## 🔧 Напредне команде

### Пипелајн и CI/CD
```bash
# Конфигуришите GitHub Actions
azd pipeline config

# Конфигуришите Azure DevOps
azd pipeline config --provider azdo

# Прикажите конфигурацију пајплајна
azd pipeline show
```

### Управљање инфраструктуром
```bash
# Генериши инфраструктурне шаблоне
azd infra generate

# 🧪 Преглед и планирање инфраструктуре
azd provision --preview
# Симулира провизионисање инфраструктуре без распоређивања
# Анализира Bicep/Terraform шаблоне и приказује:
# - Ресурси који ће бити додати (зелено +)
# - Ресурси који ће бити измењени (жутo ~)
# - Ресурси који ће бити избрисани (црвено -)
# Безбедно за покретање - нису направљене стварне измене у Azure окружењу

# Синтетизуј инфраструктуру из azure.yaml
azd infra synth
```

### Информације о пројекту
```bash
# Прикажи статус пројекта и крајње тачке
azd show

# Прикажи детаљне информације о пројекту као JSON
azd show --output json

# Добиј крајње тачке услуге
azd show --output json | jq '.services'
```

## 🤖 AI и команде проширења

### AZD проширења
```bash
# Прикажи све доступне екстензије (укључујући AI)
azd extension list

# Инсталирај екстензију Foundry Agents
azd extension install azure.ai.agents

# Инсталирај екстензију за вештине агента (превју)
azd extension install azure.ai.skills

# Инсталирај екстензију Foundry Connections (превју)
azd extension install azure.ai.connections

# Инсталирај екстензију за фино подешавање
azd extension install azure.ai.finetune

# Инсталирај екстензију за прилагођене моделе
azd extension install azure.ai.models

# Ажурирај све инсталиране екстензије
azd extension upgrade --all
```

### Команде AI агента
```bash
# Иницијализујте пројекат агента из манифеста
azd ai agent init -m <manifest-path-or-uri>

# Изаберите одређени Foundry пројекат
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Наведите директоријум са изворним кодом агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Одаберите циљ хостовања
azd ai agent init -m agent-manifest.yaml --host containerapp

# Тестирајте распоређеног агента (испише латенцију и време до првог бајта)
azd ai agent invoke

# Прикажите конфигурацију активне крајње тачке
azd ai agent endpoint show

# Генеришите скуп података за евалуацију, затим оптимизујте агента
azd ai agent eval generate
azd ai agent optimize

# Преузмите распоређени изворни код хостованог агента заснованог на коду
azd ai agent code download

# Обришите хостованог агента и све његове верзије (--force завршава активне сесије)
azd ai agent delete --force
```

### MCP сервер (Alpha)
```bash
# Покрените MCP сервер за ваш пројекат
azd mcp start

# Управљајте сагласношћу алата за MCP операције
azd copilot consent list
```

### Генерисање инфраструктуре
```bash
# Генеришите IaC датотеке из дефиниције вашег пројекта
azd infra generate

# Синтетизујте инфраструктуру из azure.yaml
azd infra synth
```

---

## 🎯 Брзи радни токови

### Радни ток за развој
```bash
# Започни нови пројекат
azd init --template todo-nodejs-mongo
cd my-project

# Деплојирај у развојно окружење
azd env new dev
azd up

# Направи измене и поново деплојирај
azd deploy

# Отвори надзорну таблу
azd monitor --live
```

### Радни ток са више окружења
```bash
# Подесити окружења
azd env new dev
azd env new staging  
azd env new production

# Разместити у развојно окружење
azd env select dev
azd up

# Тестирати и промовисати у претпроизводно окружење
azd env select staging
azd up

# Разместити у продукционо окружење
azd env select production
azd up
```

### Радни ток за решавање проблема
```bash
# Омогући режим отклањања грешака
export AZD_DEBUG=true

# Провери статус разме�штања
azd show

# Валидирај конфигурацију
azd config show

# Отвори контролну таблу за праћење логова
azd monitor --logs

# Провери статус ресурса
azd show --output json
```

## 🔍 Команде за дебаговање

### Информације за дебаговање
```bash
# Омогући дебаг излаз
export AZD_DEBUG=true
azd <command> --debug

# Онемогући телеметрију ради чистијег излаза
export AZD_DISABLE_TELEMETRY=true

# Провери тренутну конфигурацију
azd config show

# Провери статус аутентификације
az account show
```

### Дебаговање шаблона
```bash
# Прикажи листу доступних шаблона са детаљима
azd template list --output json

# Прикажи информације о шаблону
azd template show <template-name>

# Провери шаблон пре иницијализације
azd template validate <template-name>
```

## 📁 Команде за фајлове и директоријуме

### Структура пројекта
```bash
# Прикажи тренутну структуру директоријума
tree /f  # Виндоус
find . -type f  # Линукс/macOS

# Навигирај до корена azd пројекта
cd $(azd root)

# Прикажи azd директоријум конфигурације
echo $AZD_CONFIG_DIR  # Обично ~/.azd
```

## 🎨 Форматирање излаза

### JSON излаз
```bash
# Добијте JSON излаз за скриптовање
azd show --output json
azd env list --output json
azd config show --output json

# Парсирајте помоћу jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табеларни излаз
```bash
# Форматирај као табелу
azd env list --output table

# Прикажи распоређене услуге
azd show --output json | jq '.services | keys'
```

## 🔧 Често коришћене комбинације команди

### Скрипта за проверу здравља
```bash
#!/bin/bash
# Брза провера здравља
azd show
azd env get-values
azd monitor --logs
```

### Валидација деплоја
```bash
#!/bin/bash
# Валидација пре распоређивања
azd show
azd provision --preview  # Прегледајте промене пре распоређивања
az account show
```

### Поређење окружења
```bash
#!/bin/bash
# Упореди окружења
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипта за чишћење ресурса
```bash
#!/bin/bash
# Очистити старе окружења
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Променљиве окружења

### Уобичајене променљиве окружења
```bash
# Конфигурација Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Конфигурација AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфигурација апликације
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Хитне команде

### Брзи поправци
```bash
# Ресетуј аутентификацију
az account clear
az login

# Присили освежавање окружења
azd env refresh

# Поново постави све услуге
azd deploy

# Провери статус распоређивања
azd show --output json
```

### Команде за опоравак
```bash
# Опоравак од неуспеле примене - очисти и поново размешти
azd down --force --purge
azd up

# Само поново обезбеди инфраструктуру
azd provision

# Само поново размешти апликацију
azd deploy
```

## 💡 Корисни савети

### Алијаси за бржи радни ток
```bash
# Додајте у ваш .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Пречице за функције
```bash
# Брзо пребацивање окружења
azd-env() {
    azd env select $1 && azd show
}

# Брзо деплојовање са мониторингом
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Статус окружења
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Помоћ и документација

### Како добити помоћ
```bash
# Општа помоћ
azd --help
azd help

# Помоћ специфична за команду
azd up --help
azd env --help
azd config --help

# Прикажи информације о верзији и изградњи
azd version
azd version --output json
```

### Линкови ка документацији
```bash
# Отвори документацију у прегледачу
azd docs

# Прикажи документацију шаблона
azd template show <template-name> --docs
```

---

**Савет**: Означите ову страницу и користите `Ctrl+F` да бисте брзо пронашли команде које вам требају!

---

**Навигација**
- **Претходна лекција**: [Провере пре распоређивања](../docs/pre-deployment/preflight-checks.md)
- **Следећа лекција**: [Појмовник](glossary.md)

---

> **💡 Желите помоћ са Azure командама у вашем уређивачу?** Инсталирајте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) са `npx skills add microsoft/github-copilot-for-azure` — 37 вештина за AI, Foundry, деплој, дијагностику и још много тога.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->