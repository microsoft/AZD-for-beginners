# Команден бърз справочник - Основни AZD команди

**Бърза справка за всички глави**
- **📚 Начало на курса**: [AZD за начинаещи](../README.md)
- **📖 Бърз старт**: [Глава 1: Основи и бърз старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команди**: [Глава 2: AI-първо разработване](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Разширено**: [Глава 4: Инфраструктура като код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Въведение

Този изчерпателен бърз справочник предоставя бърза справка за най-често използваните команди на Azure Developer CLI, организирани по категории с практични примери. Перфектен за бързи справки по време на разработка, отстраняване на проблеми и ежедневни операции с azd проекти.

## Цели на обучението

By using this cheat sheet, you will:
- Да имате незабавен достъп до основните команди и синтаксис на Azure Developer CLI
- Да разбирате организацията на командите по функционални категории и случаи на употреба
- Да имате справка с практически примери за чести сценарии на разработка и деплой
- Да имате достъп до команди за отстраняване на проблеми за бързо разрешаване на инциденти
- Да откривате ефективно разширени опции за конфигурация и персонализиране
- Да намирате команди за управление на среди и работни потоци с множество среди

## Резултати от обучението

With regular reference to this cheat sheet, you will be able to:
- Да изпълнявате azd команди уверено без да се позовавате на пълната документация
- Бързо да разрешавате чести проблеми, използвайки подходящи диагностични команди
- Ефективно да управлявате множество среди и сценарии на деплой
- Да прилагате усъвършенствани функции и опции на azd при необходимост
- Да отстранявате проблеми при деплой с използване на систематични последователности от команди
- Да оптимизирате работните потоци чрез ефективна употреба на azd преки пътища и опции

## Команди за започване

### Удостоверяване
```bash
# Влезте в Azure чрез AZD
azd auth login

# Влезте в Azure CLI (AZD използва това под капака)
az login

# Проверете текущия акаунт
az account show

# Задайте абонамента по подразбиране
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Излезте от AZD
azd auth logout

# Излезте от Azure CLI
az logout
```

### Инициализация на проекта
```bash
# Разгледайте наличните шаблони
azd template list

# Инициализиране от шаблон
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Инициализиране в текущата директория
azd init .

# Инициализиране с персонализирано име
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основни команди за деплой

### Пълен работен процес за деплой
```bash
# Разгръщане на всичко (провизиране + разгръщане)
azd up

# Разгръщане с деактивирани подкани за потвърждение
azd up --confirm-with-no-prompt

# Разгръщане в конкретна среда
azd up --environment production

# Разгръщане с персонализирани параметри
azd up --parameter location=westus2
```

### Само инфраструктура
```bash
# Осигуряване на ресурси в Azure
azd provision

# 🧪 Преглед на промените в инфраструктурата
azd provision --preview
# Показва 'dry-run' изглед на това кои ресурси биха били създадени/променени/изтрити
# Подобно на 'terraform plan' или 'bicep what-if' - безопасно за изпълнение, без да се прилагат промени
```

### Само приложение
```bash
# Разгръщане на кода на приложението
azd deploy

# Разгръщане на конкретна услуга
azd deploy --service web
azd deploy --service api

# Разгръщане на всички услуги
azd deploy --all
```

### Сглобяване и пакетиране
```bash
# Възстановяване (изтегляне) на зависимостите на приложението
azd restore

# Възстановяване на конкретна услуга
azd restore --service api

# Изграждане на разгръщаем артефакт без разгръщане
azd package

# Изграждане на конкретна услуга
azd package --service api
```

> **`azd restore`** изтегля зависимостите на приложението ви (npm, pip, NuGet, Maven и др.). Той се изпълнява автоматично по време на `azd package` и `azd deploy`, така че рядко го извиквате директно — изпълнете го ръчно, за да предварително изтеглите зависимостите (например, за да затоплите кеша на CI или да работите офлайн след това).

> **`azd package`** изгражда артефакта за деплой (контейнерно изображение или zip) **без** да го изпраща в Azure. Използвайте го самостоятелно, за да проверите дали сборката е успешна, да инспектирате изхода или да произведете артефакт, който по-късно ще бъде разположен от отделен процес. `azd deploy` пакетира автоматично, така че ще се нуждаете от `azd package` само когато искате артефакта без да го деплойвате.


## 🌍 Управление на среди

### Операции със среди
```bash
# Изброи всички среди
azd env list

# Създай нова среда
azd env new development
azd env new staging --location westus2

# Избери среда
azd env select production

# Покажи наличните среди
azd env list

# Обнови състоянието на средата
azd env refresh
```

### Променливи на средата
```bash
# Задаване на променлива на средата
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Получаване на променлива на средата
azd env get API_KEY

# Изброяване на всички променливи на средата
azd env get-values

# Премахване на променлива на средата
azd env unset DEBUG
```

## ⚙️ Команди за конфигурация

### Глобална конфигурация
```bash
# Изведи всички конфигурации
azd config show

# Задай глобални настройки по подразбиране
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Премахни конфигурацията
azd config unset defaults.location

# Нулирай цялата конфигурация
azd config reset
```

### Конфигурация на проекта
```bash
# Валидирай azure.yaml
azd config validate

# Покажи информация за проекта
azd show

# Вземи крайни точки на услугите
azd show --output json
```

## 📊 Мониторинг и диагностика

### Табло за мониторинг
```bash
# Отворете таблото за мониторинг в портала на Azure
azd monitor

# Отворете метриките в реално време на Application Insights
azd monitor --live

# Отворете панела за логовете на Application Insights
azd monitor --logs

# Отворете прегледа на Application Insights
azd monitor --overview
```

### Преглед на логове на контейнери
```bash
# Преглед на логове чрез Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Проследяване на логовете в реално време
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Преглед на логове чрез Azure Portal
azd monitor --logs
```

### Запитвания в Log Analytics
```bash
# Достъп до Log Analytics през портала на Azure
azd monitor --logs

# Изпълняване на заявки към логовете чрез Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди за поддръжка

### Почистване
```bash
# Премахнете всички ресурси в Azure
azd down

# Принудително изтриване без потвърждение
azd down --force

# Премахнете временно изтритите ресурси
azd down --purge

# Пълно почистване
azd down --force --purge
```

### Актуализации
```bash
# Провери за актуализации на azd
azd version

# Вземи текущата версия
azd version

# Прегледай текущата конфигурация
azd config show
```

## 🔧 Разширени команди

### Pipeline и CI/CD
```bash
# Конфигуриране на GitHub Actions
azd pipeline config

# Конфигуриране на Azure DevOps
azd pipeline config --provider azdo

# Показване на конфигурацията на пайплайна
azd pipeline show
```

### Управление на инфраструктура
```bash
# Генериране на инфраструктурни шаблони
azd infra generate

# 🧪 Преглед и планиране на инфраструктурата
azd provision --preview
# Симулира предоставянето на инфраструктура без разгръщане
# Анализира Bicep/Terraform шаблони и показва:
# - Ресурси, които ще бъдат добавени (зелено +)
# - Ресурси, които ще бъдат променени (жълто ~)
# - Ресурси, които ще бъдат изтрити (червено -)
# Безопасно за изпълнение - няма реални промени в Azure средата

# Синтезира инфраструктура от azure.yaml
azd infra synth
```

### Информация за проекта
```bash
# Покажи състоянието на проекта и крайните точки
azd show

# Покажи подробна информация за проекта като JSON
azd show --output json

# Вземи крайните точки на услугата
azd show --output json | jq '.services'
```

## 🤖 AI и команди за разширения

### Разширения на AZD
```bash
# Избройте всички налични разширения (включително ИИ)
azd extension list

# Инсталирайте разширението Foundry agents
azd extension install azure.ai.agents

# Инсталирайте разширението agent skills (предварителна версия)
azd extension install azure.ai.skills

# Инсталирайте разширението Foundry connections (предварителна версия)
azd extension install azure.ai.connections

# Инсталирайте разширението за фина настройка
azd extension install azure.ai.finetune

# Инсталирайте разширението за потребителски модели
azd extension install azure.ai.models

# Актуализирайте всички инсталирани разширения
azd extension upgrade --all
```

### Команди за AI агент
```bash
# Инициализирайте проект на агент от манифест
azd ai agent init -m <manifest-path-or-uri>

# Посочете конкретен проект на Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Посочете директорията с изходния код на агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Изберете цел за хостинг
azd ai agent init -m agent-manifest.yaml --host containerapp

# Тествайте разположен агент (показва латентност и време до първи байт)
azd ai agent invoke

# Покажете конфигурацията на активната крайна точка
azd ai agent endpoint show

# Генерирайте набор от данни за оценка, след което оптимизирайте агента
azd ai agent eval generate
azd ai agent optimize

# Изтеглете разположения изходен код на хостван агент, базиран на код
azd ai agent code download

# Изтрийте хостван агент и всичките му версии (--force прекратява активните сесии)
azd ai agent delete --force
```

### MCP сървър (Alpha)
```bash
# Стартирайте MCP сървъра за вашия проект
azd mcp start

# Управлявайте съгласието на инструмента за операции с MCP
azd copilot consent list
```

### Генериране на инфраструктура
```bash
# Генерирайте IaC файлове от дефиницията на проекта си
azd infra generate

# Синтезирайте инфраструктура от azure.yaml
azd infra synth
```

---

## 🎯 Бързи работни потоци

### Работен процес за разработка
```bash
# Стартирай нов проект
azd init --template todo-nodejs-mongo
cd my-project

# Разгърни в среда за разработка
azd env new dev
azd up

# Направи промени и разгърни отново
azd deploy

# Отвори таблото за мониторинг
azd monitor --live
```

### Работен процес с множество среди
```bash
# Настройване на среди
azd env new dev
azd env new staging  
azd env new production

# Разгръщане в dev среда
azd env select dev
azd up

# Тестване и прехвърляне към staging
azd env select staging
azd up

# Разгръщане в продукционна среда
azd env select production
azd up
```

### Работен процес за отстраняване на проблеми
```bash
# Активирайте режима за отстраняване на грешки
export AZD_DEBUG=true

# Проверете състоянието на разгръщането
azd show

# Проверете конфигурацията
azd config show

# Отворете таблото за мониторинг за логове
azd monitor --logs

# Проверете състоянието на ресурса
azd show --output json
```

## 🔍 Команди за отстраняване на грешки

### Информация за отстраняване на грешки
```bash
# Активирайте отладъчен изход
export AZD_DEBUG=true
azd <command> --debug

# Деактивирайте телеметрията за по-чист изход
export AZD_DISABLE_TELEMETRY=true

# Проверете текущата конфигурация
azd config show

# Проверете състоянието на удостоверяването
az account show
```

### Отстраняване на грешки в шаблони
```bash
# Покажи наличните шаблони с подробности
azd template list --output json

# Покажи информация за шаблона
azd template show <template-name>

# Провери шаблона преди инициализация
azd template validate <template-name>
```

## 📁 Команди за файлове и директории

### Структура на проекта
```bash
# Покажи текущата структура на директорията
tree /f  # Windows
find . -type f  # Linux/macOS

# Навигирай до корена на проекта azd
cd $(azd root)

# Покажи конфигурационната директория на azd
echo $AZD_CONFIG_DIR  # Обикновено ~/.azd
```

## 🎨 Форматиране на изхода

### JSON изход
```bash
# Получете JSON изход за скриптиране
azd show --output json
azd env list --output json
azd config show --output json

# Парсирайте с jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табличен изход
```bash
# Форматирай като таблица
azd env list --output table

# Покажи внедрените услуги
azd show --output json | jq '.services | keys'
```

## 🔧 Чести комбинации от команди

### Скрипт за проверка на здравето
```bash
#!/bin/bash
# Бърза проверка на състоянието
azd show
azd env get-values
azd monitor --logs
```

### Валидация на деплой
```bash
#!/bin/bash
# Проверка преди внедряване
azd show
azd provision --preview  # Прегледайте промените преди внедряване
az account show
```

### Сравнение на среди
```bash
#!/bin/bash
# Сравняване на среди
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипт за почистване на ресурси
```bash
#!/bin/bash
# Почистване на стари среди
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Променливи на средата

### Чести променливи на средата
```bash
# Конфигурация на Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Конфигурация на AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфигурация на приложението
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Спешни команди

### Бързи поправки
```bash
# Нулиране на удостоверяването
az account clear
az login

# Принудително опресняване на средата
azd env refresh

# Повторно разгръщане на всички услуги
azd deploy

# Проверка на статуса на разгръщането
azd show --output json
```

### Команди за възстановяване
```bash
# Възстановяване след неуспешно разгръщане - почистване и повторно разгръщане
azd down --force --purge
azd up

# Само повторно провизиране на инфраструктурата
azd provision

# Само повторно разгръщане на приложението
azd deploy
```

## 💡 Професионални съвети

### Псевдоними за по-бърз работен процес
```bash
# Добавете във вашия .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Преки пътища за функции
```bash
# Бързо превключване между среди
azd-env() {
    azd env select $1 && azd show
}

# Бързо разгръщане с наблюдение
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Състояние на средата
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Помощ и документация

### Получаване на помощ
```bash
# Обща помощ
azd --help
azd help

# Помощ за конкретна команда
azd up --help
azd env --help
azd config --help

# Показване на информация за версията и сборката
azd version
azd version --output json
```

### Връзки към документация
```bash
# Отвори документацията в браузъра
azd docs

# Покажи документацията за шаблона
azd template show <template-name> --docs
```

---

**Съвет**: Запазете този бърз справочник в отметки и използвайте `Ctrl+F`, за да намерите бързо командите, които ви трябват!

---

**Навигация**
- **Предишен урок**: [Проверки преди разполагане](../docs/pre-deployment/preflight-checks.md)
- **Следващ урок**: [Речник](glossary.md)

---

> **💡 Искате помощ с Azure команди в своя редактор?** Инсталирайте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с `npx skills add microsoft/github-copilot-for-azure` — 37 умения за AI, Foundry, разполагане, диагностика и много други.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->