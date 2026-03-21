# Командна шпаргалка - Основни AZD команди

**Бърза справка за всички глави**
- **📚 Начало на курса**: [AZD For Beginners](../README.md)
- **📖 Бърз старт**: [Глава 1: Основи & Бърз старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команди**: [Глава 2: AI-първи разработки](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Разширено**: [Глава 4: Инфраструктура като код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Въведение

Тази изчерпателна шпаргалка предоставя бърза справка за най-често използваните команди на Azure Developer CLI, организирани по категории с практически примери. Перфектна за бързо търсене по време на разработка, отстраняване на неизправности и ежедневни операции с azd проекти.

## Учебни цели

С помощта на тази шпаргалка, вие ще:
- Имате мигновен достъп до основните команди и синтаксис на Azure Developer CLI
- Разбирате организацията на командите по функционални категории и случаи на употреба
- Можете да се ориентирате в практически примери за чести сценарии на разработка и разгръщане
- Достъпвате команди за отстраняване на неизправности за бързо разрешаване на проблеми
- Откривате разширени опции за конфигурация и персонализиране ефективно
- Намирате команди за управление на среди и работни потоци с множество среди

## Резултати от обучението

С редовно използване на тази шпаргалка, вие ще можете да:
- Изпълнявате azd команди уверено без да се позовавате на пълната документация
- Бързо разрешавате чести проблеми, използвайки подходящите диагностични команди
- Управлявате ефективно множество среди и сценарии на разгръщане
- Прилагате разширени функции и опции за конфигуриране на azd според нуждите
- Отстранявате проблеми при разгръщане, използвайки систематични последователности от команди
- Оптимизирате работни потоци чрез ефективно използване на съкращения и опции на azd

## Команди за започване

### Автентикация
```bash
# Влезте в Azure чрез AZD
azd auth login

# Влезте в Azure CLI (AZD използва това под капака)
az login

# Проверете текущия акаунт
az account show

# Задайте абонамент по подразбиране
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Излезте от AZD
azd auth logout

# Излезте от Azure CLI
az logout
```

### Инициализация на проект
```bash
# Разгледайте наличните шаблони
azd template list

# Инициализирайте от шаблон
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Инициализирайте в текущата директория
azd init .

# Инициализирайте с персонализирано име
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основни команди за разгръщане

### Пълен процес на разгръщане
```bash
# Разгръщане на всичко (осигуряване на ресурси + разгръщане)
azd up

# Разгръщане с изключени подкани за потвърждение
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
# Показва предварителен изглед на това кои ресурси биха били създадени/променени/изтрити
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
# Изграждане на приложения
azd package

# Изграждане на конкретна услуга
azd package --service api
```

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

# Покажи текущата среда
azd env show

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
# Изведи цялата конфигурация
azd config list

# Задай глобалните настройки по подразбиране
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Премахни конфигурацията
azd config unset defaults.location

# Нулирай цялата конфигурация
azd config reset
```

### Конфигурация на проекта
```bash
# Провери azure.yaml
azd config validate

# Покажи информация за проекта
azd show

# Вземи крайните точки на услугите
azd show --output json
```

## 📊 Мониторинг и диагностика

### Мониторинг табло
```bash
# Отворете таблото за мониторинг в портала на Azure
azd monitor

# Отворете метриките в реално време в Application Insights
azd monitor --live

# Отворете панела за логове в Application Insights
azd monitor --logs

# Отворете прегледа на Application Insights
azd monitor --overview
```

### Преглед на логове на контейнери
```bash
# Преглед на логове чрез Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Следете логовете в реално време
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Преглед на логове в портала на Azure
azd monitor --logs
```

### Запитвания в Log Analytics
```bash
# Достъп до Log Analytics чрез портала на Azure
azd monitor --logs

# Извършване на заявки към дневниците чрез Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Поддръжка

### Почистване
```bash
# Премахнете всички ресурси в Azure
azd down

# Принудително изтриване без потвърждение
azd down --force

# Изчистване на временно изтрити ресурси
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
azd config list
```

## 🔧 Разширени команди

### Pipeline и CI/CD
```bash
# Конфигуриране на GitHub Actions
azd pipeline config

# Конфигуриране на Azure DevOps
azd pipeline config --provider azdo

# Показване на конфигурацията на конвейера
azd pipeline show
```

### Управление на инфраструктурата
```bash
# Генериране на шаблони за инфраструктура
azd infra generate

# 🧪 Преглед и планиране на инфраструктурата
azd provision --preview
# Симумира създаването на инфраструктура без реално разгръщане
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
# Покажи статуса на проекта и крайните точки
azd show

# Покажи подробна информация за проекта в JSON формат
azd show --output json

# Покажи крайните точки на услугата
azd show --output json | jq '.services'
```

## 🤖 Команди за AI и разширения

### AZD разширения
```bash
# Избройте всички налични разширения (включително AI)
azd extension list

# Инсталирайте разширението Foundry agents
azd extension install azure.ai.agents

# Инсталирайте разширението за фина настройка
azd extension install azure.ai.finetune

# Инсталирайте разширението за персонализирани модели
azd extension install azure.ai.models

# Актуализирайте всички инсталирани разширения
azd extension upgrade --all
```

### Команди за AI агенти
```bash
# Инициализирайте агентски проект от манифест
azd ai agent init -m <manifest-path-or-uri>

# Насочете към конкретен проект в Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Посочете директорията с изходния код на агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Изберете цел за хостинг
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Алфа)
```bash
# Стартирайте MCP сървъра за вашия проект
azd mcp start

# Управлявайте съгласието за използване на инструмента при MCP операции
azd mcp consent
```

### Генериране на инфраструктура
```bash
# Генерирайте IaC файлове от дефиницията на вашия проект
azd infra generate

# Синтезирайте инфраструктурата от azure.yaml
azd infra synth
```

---

## 🎯 Бързи работни потоци

### Работен поток за разработка
```bash
# Започни нов проект
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

### Работен поток с множество среди
```bash
# Настройване на среди
azd env new dev
azd env new staging  
azd env new production

# Разгръщане в средата за разработка
azd env select dev
azd up

# Тестване и прехвърляне към подготвителната среда
azd env select staging
azd up

# Разгръщане в производствената среда
azd env select production
azd up
```

### Работен поток за отстраняване на проблеми
```bash
# Активирайте режим за отстраняване на грешки
export AZD_DEBUG=true

# Проверете състоянието на разгръщането
azd show

# Проверете конфигурацията
azd config list

# Отворете таблото за наблюдение на логовете
azd monitor --logs

# Проверете състоянието на ресурсите
azd show --output json
```

## 🔍 Команди за отстраняване на грешки

### Информация за дебъг
```bash
# Активирай изход за отстраняване на грешки
export AZD_DEBUG=true
azd <command> --debug

# Деактивирай телеметрията за по-чист изход
export AZD_DISABLE_TELEMETRY=true

# Провери текущата конфигурация
azd config list

# Провери състоянието на удостоверяването
az account show
```

### Дебъгване на шаблони
```bash
# Изброяване на наличните шаблони с подробности
azd template list --output json

# Показване на информация за шаблона
azd template show <template-name>

# Валидиране на шаблона преди инициализация
azd template validate <template-name>
```

## 📁 Команди за файлове и директории

### Структура на проекта
```bash
# Покажете текущата структура на директорията
tree /f  # Windows
find . -type f  # Linux/macOS

# Навигирайте до кореновата директория на проекта azd
cd $(azd root)

# Покажете конфигурационната директория на azd
echo $AZD_CONFIG_DIR  # Обикновено ~/.azd
```

## 🎨 Форматиране на изхода

### JSON изход
```bash
# Вземете JSON изход за скриптове
azd show --output json
azd env list --output json
azd config list --output json

# Парсирайте с jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табличен изход
```bash
# Форматирай като таблица
azd env list --output table

# Преглед на разположените услуги
azd show --output json | jq '.services | keys'
```

## 🔧 Чести комбинации от команди

### Скрипт за здравен статус
```bash
#!/bin/bash
# Бърза проверка на състоянието
azd show
azd env show
azd monitor --logs
```

### Валидация на разгръщане
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
# Почистете стари среди
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

## 🚨 Аварийни команди

### Бързи поправки
```bash
# Нулиране на удостоверяването
az account clear
az login

# Принудително обновяване на средата
azd env refresh

# Повторно разгръщане на всички услуги
azd deploy

# Проверка на статуса на разгръщането
azd show --output json
```

### Команди за възстановяване
```bash
# Възстановяване след неуспешно внедряване - изчисти и внедри отново
azd down --force --purge
azd up

# Повторно предоставяне само на инфраструктурата
azd provision

# Повторно внедряване само на приложението
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

### Преки пътища на функции
```bash
# Бързо превключване между среди
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
    azd env show
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

# Покажи информация за версията и сборката
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

**Съвет**: Добавете тази шпаргалка в отметки и използвайте `Ctrl+F` за бързо намиране на командите, от които се нуждаете!

---

**Навигация**
- **Предишен урок**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Следващ урок**: [Речник](glossary.md)

---

> **💡 Искате помощ с Azure команди в редактора си?** Инсталирайте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с `npx skills add microsoft/github-copilot-for-azure` — 37 умения за AI, Foundry, разгръщане, диагностика и други.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да било недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->