# Командни пречник - Основне AZD команде

**Кратак преглед за сва поглавља**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Брзи почетак**: [Поглавље 1: Основа и брзи почетак](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команде**: [Поглавље 2: Развој са фокусом на AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напредно**: [Поглавље 4: Инфраструктура као код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Увод

Ова свеобухватна листа пречица пружа брзи преглед за најчешће коришћене Azure Developer CLI команде, организоване по категоријама са практичним примерима. Савршено за брзо претраживање током развоја, решавања проблема и свакодневних операција са azd пројектима.

## Циљеви учења

Коришћењем ове листе пречица, ви ћете:
- Имати тренутан приступ основним Azure Developer CLI командама и синтакси
- Разумети организацију команди по функционалним категоријама и случајевима употребе
- Погледати практичне примере за уобичајене сценарије развоја и постављања
- Приступити командама за решавање проблема ради брзог отклањања неисправности
- Ефикасно пронаћи напредне опције конфигурације и прилагођавања
- Пронаћи команде за управљање окружењима и радне токове са више окружења

## Исходи учења

Редовним коришћењем ове листе пречица, моћи ћете да:
- Извршавате azd команде са поверењем без потребе за целокупном документацијом
- Брзо решавате уобичајене проблеме користећи одговарајуће дијагностичке команде
- Ефикасно управљате више окружења и сценарија размештања
- Примењујете напредне azd функције и опције конфигурације по потреби
- Отстраните проблеме при размештању користећи систематске низове команди
- Оптимизујете радне токове кроз ефикасну употребу azd пречица и опција

## Команде за почетак

### Аутентификација
```bash
# Пријавите се у Azure преко AZD
azd auth login

# Пријавите се у Azure CLI (AZD ово користи у позадини)
az login

# Проверите тренутни налог
az account show

# Подесите подразумевану претплату
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Одјавите се из AZD-а
azd auth logout

# Одјавите се из Azure CLI-а
az logout
```

### Иницијализација пројекта
```bash
# Прегледајте доступне шаблоне
azd template list

# Иницијализујте из шаблона
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Иницијализујте у текућем директоријуму
azd init .

# Иницијализујте са прилагођеним именом
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основне команде за размештање

### Комплетни ток размештања
```bash
# Размести све (провизионисање + распоређивање)
azd up

# Размести са онемогућеним упитима за потврду
azd up --confirm-with-no-prompt

# Размести у одређено окружење
azd up --environment production

# Размести са прилагођеним параметрима
azd up --parameter location=westus2
```

### Само инфраструктура
```bash
# Обезбеђивање Azure ресурса
azd provision

# 🧪 Преглед промена инфраструктуре
azd provision --preview
# Приказује пробни (dry-run) увид у то који би ресурси били креирани/измењени/избрисани
# Слично 'terraform plan' или 'bicep what-if' - безбедно за покретање, не примењује промене
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
# Изгради апликације
azd package

# Изгради одређену услугу
azd package --service api
```

## 🌍 Управљање окружењем

### Операције на окружењу
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

## ⚙️ Команде за конфигурацију

### Глобална конфигурација
```bash
# Прикажи сву конфигурацију
azd config show

# Постави глобалне подразумеване вредности
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Уклони конфигурацију
azd config unset defaults.location

# Ресетуј сву конфигурацију
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
# Отворите контролну таблу за надгледање у Azure порталу
azd monitor

# Отворите живе метрике у Application Insights
azd monitor --live

# Отворите панел за логове у Application Insights
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
# Приступите Log Analytics-у преко Azure портала
azd monitor --logs

# Извршите упите у логовима помоћу Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команде за одржавање

### Чишћење
```bash
# Уклони све Azure ресурсе
azd down

# Присилно обриши без потврде
azd down --force

# Трајно уклони меко избрисане ресурсе
azd down --purge

# Потпуно чишћење
azd down --force --purge
```

### Aжурирања
```bash
# Провери да ли има ажурирања за azd
azd version

# Добиј тренутну верзију
azd version

# Погледај тренутну конфигурацију
azd config show
```

## 🔧 Напредне команде

### Пайплајн и CI/CD
```bash
# Конфигуришите GitHub Actions
azd pipeline config

# Конфигуришите Azure DevOps
azd pipeline config --provider azdo

# Прикажите конфигурацију пипелајна
azd pipeline show
```

### Управљање инфраструктуром
```bash
# Генериши шаблоне инфраструктуре
azd infra generate

# 🧪 Преглед и планирање инфраструктуре
azd provision --preview
# Симулира постављање инфраструктуре без распоређивања
# Анализира Bicep/Terraform шаблоне и приказује:
# - Ресурсе који ће бити додати (зелено +)
# - Ресурсе који ће бити измењени (жуто ~)
# - Ресурсе који ће бити обрисани (црвено -)
# Сигурно за покретање - нису извршене стварне промене у Azure окружењу

# Синтетизуј инфраструктуру из azure.yaml
azd infra synth
```

### Информације о пројекту
```bash
# Прикажи статус пројекта и крајње тачке
azd show

# Прикажи детаљне информације о пројекту као JSON
azd show --output json

# Добиј крајње тачке сервиса
azd show --output json | jq '.services'
```

## 🤖 AI и команде екстензија

### AZD екстензије
```bash
# Прикажите све доступне екстензије (укључујући АИ)
azd extension list

# Инсталирајте екстензију Foundry agents
azd extension install azure.ai.agents

# Инсталирајте екстензију за фино подешавање
azd extension install azure.ai.finetune

# Инсталирајте екстензију за прилагођене моделе
azd extension install azure.ai.models

# Ажурирајте све инсталиране екстензије
azd extension upgrade --all
```

### Команде AI агента
```bash
# Иницијализујте агентски пројекат из манифеста
azd ai agent init -m <manifest-path-or-uri>

# Одаберите одређени Foundry пројекат
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Наведите директоријум извора агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Изаберите циљ за хостовање
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP сервер (Alpha)
```bash
# Покрените MCP сервер за ваш пројекат
azd mcp start

# Управљајте пристанком алата за MCP операције
azd copilot consent list
```

### Генерисање инфраструктуре
```bash
# Генеришите IaC датотеке из дефиниције вашег пројекта
azd infra generate

# Синтезирајте инфраструктуру из azure.yaml
azd infra synth
```

---

## 🎯 Брзи радни токови

### Радни ток за развој
```bash
# Започни нови пројекат
azd init --template todo-nodejs-mongo
cd my-project

# Постави у развојно окружење
azd env new dev
azd up

# Направи измене и поново постави
azd deploy

# Отвори таблу за праћење
azd monitor --live
```

### Радни ток за више окружења
```bash
# Подесити окружења
azd env new dev
azd env new staging  
azd env new production

# Разместити на дев
azd env select dev
azd up

# Тестирати и промовисати на стејџинг
azd env select staging
azd up

# Разместити у продукцију
azd env select production
azd up
```

### Радни ток за решавање проблема
```bash
# Омогући режим отклањања грешака
export AZD_DEBUG=true

# Провери статус распоређивања
azd show

# Провери конфигурацију
azd config show

# Отвори контролну таблу за мониторинг логова
azd monitor --logs

# Провери статус ресурса
azd show --output json
```

## 🔍 Команде за дебаговање

### Информације за дебаговање
```bash
# Омогући испис за отклањање грешака
export AZD_DEBUG=true
azd <command> --debug

# Онемогући телеметрију за чистији излаз
export AZD_DISABLE_TELEMETRY=true

# Провери тренутну конфигурацију
azd config show

# Провери статус аутентификације
az account show
```

### Дебаговање шаблона
```bash
# Прикажи доступне шаблоне са детаљима
azd template list --output json

# Прикажи информације о шаблону
azd template show <template-name>

# Провери шаблон пре иницијализације
azd template validate <template-name>
```

## 📁 Команде за датотеке и директоријуме

### Структура пројекта
```bash
# Прикажи структуру тренутног директоријума
tree /f  # Виндоус
find . -type f  # Линукс/macOS

# Идите до корена azd пројекта
cd $(azd root)

# Прикажи azd конфигурациони директоријум
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

### Табеларни приказ
```bash
# Форматирај као табелу
azd env list --output table

# Погледај распоређене сервисе
azd show --output json | jq '.services | keys'
```

## 🔧 Уобичајене комбинације команди

### Скрипта за проверу здравља
```bash
#!/bin/bash
# Брза провера стања
azd show
azd env get-values
azd monitor --logs
```

### Валидација размештања
```bash
#!/bin/bash
# Валидација пре распоређивања
azd show
azd provision --preview  # Прегледајте измене пре распоређивања
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
# Azure конфигурација
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD конфигурација
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфигурација апликације
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Хитне команде

### Брза решења
```bash
# Ресетуј аутентификацију
az account clear
az login

# Принудно освежи окружење
azd env refresh

# Поново распореди све сервисе
azd deploy

# Провери статус распоређивања
azd show --output json
```

### Команде за опоравак
```bash
# Опоравак од неуспелог распоређивања - очисти и поново распореди
azd down --force --purge
azd up

# Само поново постави инфраструктуру
azd provision

# Само поново распореди апликацију
azd deploy
```

## 💡 Професионални савети

### Алијаси за бржи радни ток
```bash
# Додајте у ваш .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Пречице функција
```bash
# Брзо пребацивање окружења
azd-env() {
    azd env select $1 && azd show
}

# Брзо распоређивање са надгледањем
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

### Добијање помоћи
```bash
# Општа помоћ
azd --help
azd help

# Помоћ за појединачне команде
azd up --help
azd env --help
azd config --help

# Прикажи информације о верзији и изградњи
azd version
azd version --output json
```

### Линкови документације
```bash
# Отвори документацију у прегледачу
azd docs

# Прикажи документацију шаблона
azd template show <template-name> --docs
```

---

**Савет**: Обележите ову листу пречица и користите `Ctrl+F` да брзо пронађете команде које вам требају!

---

**Навигација**
- **Претходна лекција**: [Провере пре постављања](../docs/pre-deployment/preflight-checks.md)
- **Следећа лекција**: [Глосар](glossary.md)

---

> **💡 Желите помоћ око Azure команди у вашем уређивачу?** Инсталирајте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) са `npx skills add microsoft/github-copilot-for-azure` — 37 вештина за AI, Foundry, размештање, дијагностику и још много тога.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу преводилачке услуге вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, молимо имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионалан људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->