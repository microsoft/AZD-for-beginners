# Преглед команди - Основне AZD команде

**Брзи преглед за сва поглавља**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Брз почетак**: [Поглавље 1: Основе и брзи почетак](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команде**: [Поглавље 2: Развој фокусиран на AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напредно**: [Поглавље 4: Инфраструктура као код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Увод

Ова свеобухватна листа често коришћених команди пружа брзи преглед најчешће коришћених Azure Developer CLI команди, организованих по категоријама са практичним примерима. Идеална за брзе прегледе током развоја, решавања проблема и свакодневних операција са azd пројектима.

## Циљеви учења

Коришћењем ове листе, ви ћете:
- Имати тренутан приступ основним Azure Developer CLI командама и синтакси
- Разумети организовање команди по функционалним категоријама и сценаријима коришћења
- Примати практичне примере за уобичајене сценарије развоја и размећтања
- Приступити командама за решавање проблема за брзо отклањање неисправности
- Пронаћи напредне опције конфигурације и прилагођавања ефикасно
- Локализовати команде за управљање окружењима и радне токове са више окружења

## Резултати учења

Редовним коришћењем ове листе, моћи ћете да:
- Извршавате azd команде са поверењем без сталног позивања пуне документације
- Брзо решавате уобичајене проблеме користећи одговарајуће дијагностичке команде
- Ефикасно управљате више окружења и сценарија размећтања
- Примените напредне azd функције и опције конфигурације по потреби
- Решавате проблеме са размећтањем користећи систематске низове команди
- Оптимизујете радне токове кроз ефективну употребу azd пречица и опција

## Команде за почетак рада

### Аутентификација
```bash
# Пријавите се у Azure преко AZD
azd auth login

# Пријавите се у Azure CLI (AZD ово користи у позадини)
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

### Комплетан ток размештања
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
# Приказује пробни преглед који показује који би ресурси били креирани/измењени/обрисани
# Слично 'terraform plan' или 'bicep what-if' - безбедно за покретање, не примењују се никакве измене
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

### Изградња и паковање
```bash
# Изградити апликације
azd package

# Изградити одређени сервис
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

# Изабери окружење
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

# Прикажи све променљиве окружења
azd env get-values

# Уклони променљиву окружења
azd env unset DEBUG
```

## ⚙️ Команде за конфигурацију

### Глобална конфигурација
```bash
# Прикажи сву конфигурацију
azd config list

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

# Добиј крајње тачке услуге
azd show --output json
```

## 📊 Мониторинг и дијагностика

### Контролна табла за мониторинг
```bash
# Отворите надзорну таблу мониторинга у порталу Azure
azd monitor

# Отворите уживо метрике у Application Insights
azd monitor --live

# Отворите панел логова у Application Insights
azd monitor --logs

# Отворите преглед у Application Insights
azd monitor --overview
```

### Преглед логова контејнера
```bash
# Погледајте логове преко Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Пратите логове у реалном времену
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Погледајте логове из Azure портала
azd monitor --logs
```

### Упити за Log Analytics
```bash
# Приступите Log Analytics преко Azure портала
azd monitor --logs

# Извршите упите над записима користећи Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команде за одржавање

### Чишћење
```bash
# Уклони све Azure ресурсе
azd down

# Принудно обриши без потврде
azd down --force

# Трајно уклони меко избрисане ресурсе
azd down --purge

# Потпуно чишћење
azd down --force --purge
```

### Ажурирања
```bash
# Провери ажурирања azd-а
azd version

# Прикажи тренутну верзију
azd version

# Прикажи тренутну конфигурацију
azd config list
```

## 🔧 Напредне команде

### Пайплајн и CI/CD
```bash
# Конфигуришите GitHub Actions
azd pipeline config

# Конфигуришите Azure DevOps
azd pipeline config --provider azdo

# Прикажи конфигурацију пајплајна
azd pipeline show
```

### Управљање инфраструктуром
```bash
# Генеришите шаблоне инфраструктуре
azd infra generate

# 🧪 Преглед и планирање инфраструктуре
azd provision --preview
# Симулира провизионисање инфраструктуре без распоређивања
# Анализира Bicep/Terraform шаблоне и приказује:
# - Ресурси који ће бити додати (зелено +)
# - Ресурси који ће бити измењени (жуто ~)
# - Ресурси који ће бити избрисани (црвено -)
# Безбедно за покретање - не прави стварне промене у Azure окружењу

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

## 🎯 Брзи токови рада

### Ток рада за развој
```bash
# Започните нови пројекат
azd init --template todo-nodejs-mongo
cd my-project

# Деплојирајте у развојно окружење
azd env new dev
azd up

# Направите измене и поново деплојирајте
azd deploy

# Отворите контролну таблу за праћење
azd monitor --live
```

### Ток рада са више окружења
```bash
# Подеси окружења
azd env new dev
azd env new staging  
azd env new production

# Распоредити на развојно окружење
azd env select dev
azd up

# Тестирај и промовиши на стeјџинг
azd env select staging
azd up

# Распоредити у продукцију
azd env select production
azd up
```

### Ток рада за решавање проблема
```bash
# Омогући режим отклањања грешака
export AZD_DEBUG=true

# Провери статус размештања
azd show

# Потврди конфигурацију
azd config list

# Отвори контролни панел за праћење логова
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
azd config list

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
# Прикажи тренутну структуру директоријума
tree /f  # Виндовс
find . -type f  # Линукс/macOS

# Пређите у корен пројекта azd
cd $(azd root)

# Прикажи конфигурациони директоријум azd
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

### Излаз у табели
```bash
# Форматирај као табелу
azd env list --output table

# Прикажи распоређене услуге
azd show --output json | jq '.services | keys'
```

## 🔧 Честе комбинације команди

### Скрипта за проверу стања
```bash
#!/bin/bash
# Брза провера здравља
azd show
azd env show
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
# Уклони стара окружења
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

### Брзи исправци
```bash
# Ресетуј аутентификацију
az account clear
az login

# Принудно освежи окружење
azd env refresh

# Поново размести све услуге
azd deploy

# Провери статус распоређивања
azd show --output json
```

### Команде за опоравак
```bash
# Опоравак након неуспелог распоређивања - очистити и поново распоредити
azd down --force --purge
azd up

# Само поновно провизионисање инфраструктуре
azd provision

# Само поновно распоређивање апликације
azd deploy
```

## 💡 Корисни савети

### Алијаси за бржи ток рада
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

# Брзо постављање уз надгледање
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

# Прикажи информације о верзији и о изградњи
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

**Савет**: Додај ову листу у обележиваче и користи `Ctrl+F` да брзо пронађеш команде које су ти потребне!

---

**Навигација**
- **Претходна лекција**: [Прелиминарне провере](../docs/pre-deployment/preflight-checks.md)
- **Следећа лекција**: [Глосар](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Изјава о одрицању одговорности:
Овај документ је преведен помоћу услуге за аутоматско превођење на бази вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, имајте у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->