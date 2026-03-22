# Командни подсетник — основне AZD наредбе

**Брзи преглед за све поглавља**
- **📚 Почетна страна курса**: [AZD за почетнике](../README.md)
- **📖 Брзи почетак**: [Поглавље 1: Основа & Брзи почетак](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI наредбе**: [Поглавље 2: Развој са фокусом на AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напредно**: [Поглавље 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Увод

Овај опсежни подсетник пружа брзи преглед најчешће коришћених Azure Developer CLI наредби, организованих по категоријама са практичним примерима. Идеалан за брзо претраживање током развоја, решавања проблема и свакодневних операција са azd пројектима.

## Циљеви учења

Коришћењем овог подсетника, ви ћете:
- Имати тренутан приступ основним Azure Developer CLI наредбама и синтакси
- Разумети организацију наредби по функционалним категоријама и случајевима употребе
- Проверити практичне примере за уобичајене сценарије развоја и распоређивања
- Приступити наредбама за решавање проблема ради брзог отклањања неисправности
- Пронаћи опције за напредну конфигурацију и прилагођавање ефикасно
- Пронаћи наредбе за управљање окружењима и радне токове са више окружења

## Резултати учења

Редовним консултовањем овог подсетника, моћи ћете да:
- Извршавате azd наредбе самоуверено без позивања комплетне документације
- Брзо решавате уобичајене проблеме користећи одговарајуће дијагностичке наредбе
- Ефикасно управљате више окружења и сценарија распоређивања
- Примењујете напредне azd функције и опције конфигурације по потреби
- Решавате проблеме са распоређивањем користећи систематске секвенце наредби
- Оптимизујете радне токове кроз ефикасну употребу azd пречица и опција

## Команде за почетак

### Аутентикација
```bash
# Пријавите се у Azure преко AZD
azd auth login

# Пријавите се у Azure CLI (AZD то користи иза сцене)
az login

# Проверите тренутни налог
az account show

# Поставите подразумевану претплату
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Одјавите се из AZD
azd auth logout

# Одјавите се из Azure CLI
az logout
```

### Иницијализација пројекта
```bash
# Прегледај доступне шаблоне
azd template list

# Иницијализуј из шаблона
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Иницијализуј у тренутном директоријуму
azd init .

# Иницијализуј са прилагођеним именом
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основне наредбе за распоређивање

### Потпуни радни ток распоређивања
```bash
# Разместити све (провизионисање + распоређивање)
azd up

# Разместити са онемогућеним упитима за потврду
azd up --confirm-with-no-prompt

# Разместити у одређено окружење
azd up --environment production

# Разместити са прилагођеним параметрима
azd up --parameter location=westus2
```

### Само инфраструктура
```bash
# Обезбеђивање Azure ресурса
azd provision

# 🧪 Преглед промена инфраструктуре
azd provision --preview
# Приказује пробни преглед који показује шта би било креирано/измењено/избрисано
# Слично 'terraform plan' или 'bicep what-if' - безбедно за покретање, промене се не примењују
```

### Само апликација
```bash
# Деплојирати код апликације
azd deploy

# Деплојирати одређену услугу
azd deploy --service web
azd deploy --service api

# Деплојирати све услуге
azd deploy --all
```

### Састављање и паковање
```bash
# Изгради апликације
azd package

# Изгради специфичну услугу
azd package --service api
```

## 🌍 Управљање окружењем

### Операције окружења
```bash
# Прикажи сва окружења
azd env list

# Креирај ново окружење
azd env new development
azd env new staging --location westus2

# Одабери окружење
azd env select production

# Прикажи тренутно окружење
azd env show

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

# Наброји све променљиве окружења
azd env get-values

# Уклони променљиву окружења
azd env unset DEBUG
```

## ⚙️ Команде за конфигурацију

### Глобална конфигурација
```bash
# Прикажи све конфигурације
azd config list

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
# Отвори контролну таблу за праћење у Azure порталу
azd monitor

# Отвори метрике уживо у Application Insights
azd monitor --live

# Отвори панел за логове у Application Insights
azd monitor --logs

# Отвори преглед у Application Insights
azd monitor --overview
```

### Преглед логова контејнера
```bash
# Погледајте записе преко Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Пратите записе у реалном времену
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Погледајте записе из Azure портала
azd monitor --logs
```

### Упити за Log Analytics
```bash
# Приступите Log Analytics преко Azure портала
azd monitor --logs

# Извршите упите логова помоћу Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Наредбе за одржавање

### Чишћење
```bash
# Уклони све Azure ресурсе
azd down

# Принудно обриши без потврде
azd down --force

# Трајно уклони меко обрисане ресурсе
azd down --purge

# Потпуно чишћење
azd down --force --purge
```

### Ажурирања
```bash
# Провери ажурирања за azd
azd version

# Добиј тренутну верзију
azd version

# Прикажи тренутну конфигурацију
azd config list
```

## 🔧 Напредне наредбе

### Пайплајн и CI/CD
```bash
# Конфигуришите GitHub Actions
azd pipeline config

# Конфигуришите Azure DevOps
azd pipeline config --provider azdo

# Прикажите конфигурацију pipeline-а
azd pipeline show
```

### Управљање инфраструктуром
```bash
# Генерише шаблоне инфраструктуре
azd infra generate

# 🧪 Преглед и планирање инфраструктуре
azd provision --preview
# Симумира обезбеђивање инфраструктуре без распоређивања
# Анализира Bicep/Terraform шаблоне и приказује:
# - Ресурси који ће бити додати (зелено +)
# - Ресурси који ће бити измењени (жутo ~)
# - Ресурси који ће бити избрисани (црвено -)
# Безбедно за покретање - нема стварних промена у Azure окружењу

# Синтезира инфраструктуру из azure.yaml
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

## 🤖 Наредбе за AI и екстензије

### AZD екстензије
```bash
# Прикажи све доступне екстензије (укључујући вештачку интелигенцију)
azd extension list

# Инсталирај екстензију Foundry agents
azd extension install azure.ai.agents

# Инсталирај екстензију за фино подешавање
azd extension install azure.ai.finetune

# Инсталирај екстензију за прилагођене моделе
azd extension install azure.ai.models

# Ажурирај све инсталиране екстензије
azd extension upgrade --all
```

### Наредбе AI агента
```bash
# Иницијализујте агентски пројекат из манифеста
azd ai agent init -m <manifest-path-or-uri>

# Циљајте на одређени Foundry пројекат
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Наведите директоријум извора агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Одаберите циљ за хостинг
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP сервер (алфа)
```bash
# Покрените MCP сервер за ваш пројекат
azd mcp start

# Управљајте пристанком алата за операције MCP
azd mcp consent
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

### Развојни радни ток
```bash
# Започни нови пројекат
azd init --template todo-nodejs-mongo
cd my-project

# Деплојирај у развојно окружење
azd env new dev
azd up

# Унеси измене и поново деплојирај
azd deploy

# Отвори контролни панел за праћење
azd monitor --live
```

### Радни ток са више окружења
```bash
# Подесити окружења
azd env new dev
azd env new staging  
azd env new production

# Разместити на развојно окружење
azd env select dev
azd up

# Тестирати и промовисати у предпроизводно окружење
azd env select staging
azd up

# Разместити у производно окружење
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
azd config list

# Отвори мониторинг контролну таблу за логове
azd monitor --logs

# Провери статус ресурса
azd show --output json
```

## 🔍 Наредбе за дебаговање

### Информације за дебаг
```bash
# Укључи излаз за отклањање грешака
export AZD_DEBUG=true
azd <command> --debug

# Онемогући телеметрију за чистији излаз
export AZD_DISABLE_TELEMETRY=true

# Провери тренутну конфигурацију
azd config list

# Провери статус аутентификације
az account show
```

### Дебаговање шаблона
```bash
# Приказати доступне шаблоне са детаљима
azd template list --output json

# Приказати информације о шаблону
azd template show <template-name>

# Проверити шаблон пре иницијализације
azd template validate <template-name>
```

## 📁 Наредбе за датотеке и директоријуме

### Структура пројекта
```bash
# Прикажи структуру тренутног директоријума
tree /f  # Виндоус
find . -type f  # Линукс/macOS

# Навигирај до корена azd пројекта
cd $(azd root)

# Прикажи директоријум конфигурације azd
echo $AZD_CONFIG_DIR  # Обично ~/.azd
```

## 🎨 Форматирање излаза

### JSON излаз
```bash
# Добијте JSON излаз за скриптовање
azd show --output json
azd env list --output json
azd config list --output json

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

## 🔧 Уобичајене комбинације наредби

### Скрипта за проверу здравља
```bash
#!/bin/bash
# Брза провера здравља
azd show
azd env show
azd monitor --logs
```

### Валидација распоређивања
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
# Азуре конфигурација
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# АЗД конфигурација
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфигурација апликације
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Хитне наредбе

### Брзи исправци
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

### Наредбе за опоравак
```bash
# Опоравак од неуспешног распоређивања - очисти и поново распореди
azd down --force --purge
azd up

# Само поновно провизионисање инфраструктуре
azd provision

# Само поновно распоређивање апликације
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
    azd env show
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

**Савет**: Обележите овај подсетник и користите `Ctrl+F` да брзо пронађете наредбе које су вам потребне!

---

**Навигација**
- **Претходна лекција**: [Провере пре распоређивања](../docs/pre-deployment/preflight-checks.md)
- **Следећа лекција**: [Речник](glossary.md)

---

> **💡 Желите помоћ са Azure наредбама у вашем уређивачу?** Инсталирајте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) помоћу `npx skills add microsoft/github-copilot-for-azure` — 37 вештина за AI, Foundry, распоређивање, дијагностику и још много тога.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ограничење одговорности**:
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да будемо прецизни, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати обавезујућим извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->