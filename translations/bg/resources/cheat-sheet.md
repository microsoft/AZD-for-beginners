# Команден лист - Основни команди на AZD

**Бърз достъп за всички глави**
- **📚 Начало на курса**: [AZD за начинаещи](../README.md)
- **📖 Бърз старт**: [Глава 1: Основи и бърз старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команди**: [Глава 2: AI-първо разработване](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Разширено**: [Глава 4: Инфраструктура като код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Въведение

Този изчерпателен команден лист предоставя бърз достъп до най-често използваните команди на Azure Developer CLI, организирани по категории с практически примери. Перфектен за бързо търсене по време на разработка, отстраняване на проблеми и ежедневни операции с azd проекти.

## Цели за учене

Като използвате този команден лист, вие ще:
- Имате мигновен достъп до основните команди и синтаксис на Azure Developer CLI
- Разберете организацията на командите по функционални категории и случаи на използване
- Можете да се обръщате към практически примери за често срещани сценарии на разработка и внедряване
- Имате достъп до команди за отстраняване на проблеми за бързо разрешаване на грешки
- Намерите ефективно опции за разширена конфигурация и персонализация
- Откриете команди за управление на среди и работни потоци с множество среди

## Резултати от обучението

С редовно обръщане към този команден лист, вие ще можете:
- Да изпълнявате командите azd уверено без да се налага да търсите в пълната документация
- Бързо да решавате често срещани проблеми с подходящите диагностични команди
- Ефективно да управлявате множество среди и сценарии за внедряване
- Да използвате разширени функции и опции за конфигурация на azd според нуждите
- Да отстранявате проблеми с внедряване чрез систематични поредици от команди
- Да оптимизирате работните потоци чрез ефективно използване на бързи команди и опции на azd

## Стартиращи команди

### Автентикация
```bash
# Вход в Azure чрез AZD
azd auth login

# Вход в Azure CLI (AZD използва това под капака)
az login

# Проверка на текущия акаунт
az account show

# Задаване на подразбираща се абонамент
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Изход от AZD
azd auth logout

# Изход от Azure CLI
az logout
```

### Инициализация на проект
```bash
# Преглед на наличните шаблони
azd template list

# Стартиране от шаблон
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Стартиране в текущата директория
azd init .

# Стартиране с персонализирано име
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основни команди за внедряване

### Пълен работен процес за внедряване
```bash
# Деплой на всичко (подготовка + деплой)
azd up

# Деплой с изключени подкани за потвърждение
azd up --confirm-with-no-prompt

# Деплой в специфична среда
azd up --environment production

# Деплой с потребителски параметри
azd up --parameter location=westus2
```

### Само инфраструктура
```bash
# Осигуряване на ресурси в Azure
azd provision

# 🧪 Преглед на инфраструктурни промени
azd provision --preview
# Показва симулация на това кои ресурси ще бъдат създадени/променени/изтрити
# Подобно на 'terraform plan' или 'bicep what-if' - безопасно за изпълнение, без прилагане на промени
```

### Само приложение
```bash
# Разгръщане на код на приложението
azd deploy

# Разгръщане на конкретна услуга
azd deploy --service web
azd deploy --service api

# Разгръщане на всички услуги
azd deploy --all
```

### Създаване и пакетиране
```bash
# Създаване на приложения
azd package

# Създаване на конкретна услуга
azd package --service api
```

## 🌍 Управление на среди

### Операции със среди
```bash
# Изброяване на всички среди
azd env list

# Създаване на нова среда
azd env new development
azd env new staging --location westus2

# Избор на среда
azd env select production

# Показване на налични среди
azd env list

# Опресняване на състоянието на средата
azd env refresh
```

### Променливи на средата
```bash
# Задаване на променлива на средата
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Вземане на променлива на средата
azd env get API_KEY

# Изброяване на всички променливи на средата
azd env get-values

# Премахване на променлива на средата
azd env unset DEBUG
```

## ⚙️ Команди за конфигурация

### Глобална конфигурация
```bash
# Изброяване на всички конфигурации
azd config show

# Настройка на глобални по подразбиране
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Премахване на конфигурация
azd config unset defaults.location

# Нулиране на всички конфигурации
azd config reset
```

### Конфигурация на проект
```bash
# Валидация на azure.yaml
azd config validate

# Покажи информация за проекта
azd show

# Вземи крайни точки на услугата
azd show --output json
```

## 📊 Мониторинг и диагностика

### Табло за мониторинг
```bash
# Отворете таблото за наблюдение на портала на Azure
azd monitor

# Отворете живите метрики на Application Insights
azd monitor --live

# Отворете панела с журнали на Application Insights
azd monitor --logs

# Отворете прегледа на Application Insights
azd monitor --overview
```

### Преглед на логове от контейнери
```bash
# Прегледайте логове чрез Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Преглеждайте логове в реално време
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Прегледайте логове от Azure Portal
azd monitor --logs
```

### Запитвания към Log Analytics
```bash
# Достъп до Анализи на Журнали чрез Azure Портал
azd monitor --logs

# Запитване на журнали чрез Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Поддръжка

### Почистване
```bash
# Премахнете всички ресурси на Azure
azd down

# Принудително изтриване без потвърждение
azd down --force

# Премахване на меко изтрити ресурси
azd down --purge

# Пълно почистване
azd down --force --purge
```

### Актуализации
```bash
# Проверете за актуализации на azd
azd version

# Вземете текущата версия
azd version

# Прегледайте текущата конфигурация
azd config show
```

## 🔧 Разширени команди

### Pipeline и CI/CD
```bash
# Конфигуриране на GitHub Actions
azd pipeline config

# Конфигуриране на Azure DevOps
azd pipeline config --provider azdo

# Покажи конфигурацията на pipeline
azd pipeline show
```

### Управление на инфраструктурата
```bash
# Генериране на шаблони за инфраструктура
azd infra generate

# 🧪 Преглед и планиране на инфраструктура
azd provision --preview
# Симулира осигуряването на инфраструктура без реално внедряване
# Анализира Bicep/Terraform шаблони и показва:
# - Ресурси, които ще бъдат добавени (зелено +)
# - Ресурси, които ще бъдат модифицирани (жълто ~)
# - Ресурси, които ще бъдат изтрити (червено -)
# Безопасно за изпълнение - няма реални промени в Azure средата

# Синтезира инфраструктура от azure.yaml
azd infra synth
```

### Информация за проект
```bash
# Показване на състоянието на проекта и крайните точки
azd show

# Показване на подробна информация за проекта като JSON
azd show --output json

# Вземете крайните точки на услугата
azd show --output json | jq '.services'
```

## 🤖 AI & Разширения

### Разширения на AZD
```bash
# Избройте всички налични разширения (включително AI)
azd extension list

# Инсталирайте разширението за агентите на Foundry
azd extension install azure.ai.agents

# Инсталирайте разширението за фино настройване
azd extension install azure.ai.finetune

# Инсталирайте разширението за потребителски модели
azd extension install azure.ai.models

# Актуализирайте всички инсталирани разширения
azd extension upgrade --all
```

### AI агент команди
```bash
# Инициализиране на агентски проект от манифест
azd ai agent init -m <manifest-path-or-uri>

# Насочване към конкретен проект на Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Посочване на директорията с изходния код на агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Избор на хостинг таргет
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP сървър (Алфа)
```bash
# Стартирайте MCP сървъра за вашия проект
azd mcp start

# Управлявайте съгласието за инструменти за MCP операции
azd copilot consent list
```

### Генериране на инфраструктура
```bash
# Генерирайте IaC файлове от дефиницията на вашия проект
azd infra generate

# Синтезиране на инфраструктурата от azure.yaml
azd infra synth
```

---

## 🎯 Бързи работни процеси

### Работен процес на разработка
```bash
# Стартирайте нов проект
azd init --template todo-nodejs-mongo
cd my-project

# Разгръщане към развитие
azd env new dev
azd up

# Направете промени и повторно разгърнете
azd deploy

# Отворете таблото за наблюдение
azd monitor --live
```

### Работен поток с множество среди
```bash
# Настройване на среди
azd env new dev
azd env new staging  
azd env new production

# Разгръщане в развойна среда
azd env select dev
azd up

# Тествайте и преместете към промеждутъчна среда
azd env select staging
azd up

# Разгръщане в продукция
azd env select production
azd up
```

### Работен поток за отстраняване на проблеми
```bash
# Активиране на режим за отстраняване на грешки
export AZD_DEBUG=true

# Проверка на състоянието на разгръщане
azd show

# Валидиране на конфигурацията
azd config show

# Отваряне на таблото за мониторинг за дневници
azd monitor --logs

# Проверка на състоянието на ресурсите
azd show --output json
```

## 🔍 Команди за отстраняване на грешки

### Информация за отстраняване на грешки
```bash
# Активиране на отстраняване на грешки
export AZD_DEBUG=true
azd <command> --debug

# Деактивиране на телеметрия за по-чист изход
export AZD_DISABLE_TELEMETRY=true

# Проверка на текущата конфигурация
azd config show

# Проверка на състоянието на удостоверяване
az account show
```

### Отстраняване на грешки в шаблони
```bash
# Изброяване на наличните шаблони с подробности
azd template list --output json

# Показване на информация за шаблона
azd template show <template-name>

# Проверка на шаблона преди инициализация
azd template validate <template-name>
```

## 📁 Команди за файлове и директории

### Структура на проект
```bash
# Покажи структурата на текущата директория
tree /f  # Windows
find . -type f  # Linux/macOS

# Навигирай до корена на azd проекта
cd $(azd root)

# Покажи директорията за конфигурация на azd
echo $AZD_CONFIG_DIR  # Обикновено ~/.azd
```

## 🎨 Форматиране на изход

### JSON изход
```bash
# Вземете JSON изход за скриптове
azd show --output json
azd env list --output json
azd config show --output json

# Парсирайте с jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табличен изход
```bash
# Форматиране като таблица
azd env list --output table

# Преглед на разположените услуги
azd show --output json | jq '.services | keys'
```

## 🔧 Често срещани комбинации от команди

### Скрипт за здравословна проверка
```bash
#!/bin/bash
# Бърза проверка на здравето
azd show
azd env get-values
azd monitor --logs
```

### Валидация на внедряване
```bash
#!/bin/bash
# Предварителна проверка преди внедряване
azd show
azd provision --preview  # Преглед на промените преди внедряване
az account show
```

### Сравнение на среди
```bash
#!/bin/bash
# Сравнете средища
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипт за почистване на ресурси
```bash
#!/bin/bash
# Изчистване на стари среди
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Променливи на средата

### Общи променливи на средата
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

## 🚨 Аварийни команди

### Бързи поправки
```bash
# Нулиране на удостоверяването
az account clear
az login

# Принудително обновяване на околната среда
azd env refresh

# Преинсталиране на всички услуги
azd deploy

# Проверка на статуса на разгръщането
azd show --output json
```

### Команди за възстановяване
```bash
# Възстановяване от неуспешно внедряване - изчистете и внедрете отново
azd down --force --purge
azd up

# Само повторно осигуряване на инфраструктурата
azd provision

# Само повторно внедряване на приложението
azd deploy
```

## 💡 Професионални съвети

### Псевдоними за по-бърз работен процес
```bash
# Добавете към вашия .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Кратки пътища за функции
```bash
# Бързо превключване на среди
azd-env() {
    azd env select $1 && azd show
}

# Бързо внедряване с наблюдение
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Статус на средата
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

# Показване на информация за версията и компилацията
azd version
azd version --output json
```

### Връзки към документация
```bash
# Отворете документацията в браузъра
azd docs

# Покажи документацията на шаблона
azd template show <template-name> --docs
```

---

**Съвет**: Добавете този команден лист в отметки и използвайте `Ctrl+F`, за да намерите бързо необходимите команди!

---

**Навигация**
- **Предишен урок**: [Предварителни проверки](../docs/pre-deployment/preflight-checks.md)
- **Следващ урок**: [Речник](glossary.md)

---

> **💡 Искате помощ с Azure команди във вашия редактор?** Инсталирайте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с `npx skills add microsoft/github-copilot-for-azure` — 37 умения за AI, Foundry, внедряване, диагностика и още.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за официален източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->