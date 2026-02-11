# Шпаргалка с команди - Основни команди за AZD

**Бърза справка за всички глави**
- **📚 Начална страница на курса**: [AZD за начинаещи](../README.md)
- **📖 Бърз старт**: [Глава 1: Основи и бърз старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команди**: [Глава 2: Разработка, ориентирана към AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Разширено**: [Глава 4: Инфраструктура като код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Въведение

Тази изчерпателна шпаргалка предоставя бърза справка за най-често използваните команди на Azure Developer CLI, организирани по категории с практични примери. Перфектна за бързи справки по време на разработка, отстраняване на проблеми и ежедневни операции с azd проекти.

## Учебни цели

Като използвате тази шпаргалка, вие ще:
- Ще имате незабавен достъп до основните команди и синтаксис на Azure Developer CLI
- Ще разберете организацията на командите по функционални категории и случаи на употреба
- Ще можете да използвате практически примери за чести сценарии на разработка и разгръщане
- Ще имате достъп до команди за отстраняване на проблеми за бързо разрешаване на проблеми
- Ще намерите разширени опции за конфигурация и персонализация ефективно
- Ще намерите командите за управление на среди и работни потоци с множество среди

## Резултати от обучението

При редовно използване на тази шпаргалка, ще можете да:
- Изпълнявате azd команди уверено, без да се налага да проверявате цялата документация
- Бързо разрешавате чести проблеми, използвайки подходящи диагностични команди
- Ефективно управлявате множество среди и сценарии на разгръщане
- Прилагате разширени функции на azd и опции за конфигурация при необходимост
- Отстранявате проблеми при разгръщане, използвайки систематични последователности от команди
- Оптимизирате работните потоци чрез ефективно използване на алиаси и опции на azd

## Команди за започване

### Удостоверяване
```bash
# Влезте в Azure чрез AZD
azd auth login

# Влезте в Azure CLI (AZD използва това на заден план)
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
# Преглед на наличните шаблони
azd template list

# Инициализиране от шаблон
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Инициализиране в текущата директория
azd init .

# Инициализиране с персонализирано име
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основни команди за разгръщане

### Пълен работен поток за разгръщане
```bash
# Разгръщане на всичко (подготовка на ресурси + внедряване)
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
# Показва предварителен (dry-run) изглед на това кои ресурси биха били създадени/променени/изтрити
# Подобно на 'terraform plan' или 'bicep what-if' - безопасно за изпълнение, без прилагане на промени
```

### Само приложение
```bash
# Разположи кода на приложението
azd deploy

# Разположи конкретна услуга
azd deploy --service web
azd deploy --service api

# Разположи всички услуги
azd deploy --all
```

### Сглобяване и пакетиране
```bash
# Създаване на приложения
azd package

# Създаване на конкретна услуга
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

# Освежи състоянието на средата
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
azd config list

# Задай глобални стойности по подразбиране
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Премахни конфигурацията
azd config unset defaults.location

# Нулирай всички конфигурации
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

# Отворете живите метрики на Application Insights
azd monitor --live

# Отворете панела за логове на Application Insights
azd monitor --logs

# Отворете прегледа на Application Insights
azd monitor --overview
```

### Преглед на логове от контейнерите
```bash
# Преглед на логове чрез Azure CLI (за Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Следете логовете в реално време
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Преглед на логове от Azure Portal
azd monitor --logs
```

### Запитвания в Log Analytics
```bash
# Достъп до Log Analytics през портала на Azure
azd monitor --logs

# Правене на заявки към логовете чрез Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди за поддръжка

### Почистване
```bash
# Премахване на всички ресурси в Azure
azd down

# Принудително изтриване без потвърждение
azd down --force

# Изчистване на ресурси, изтрити чрез soft-delete
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
azd config list
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

### Управление на инфраструктурата
```bash
# Генериране на шаблони за инфраструктура
azd infra generate

# 🧪 Преглед и планиране на инфраструктурата
azd provision --preview
# Симулира предоставяне на инфраструктура без разгръщане
# Анализира шаблони Bicep/Terraform и показва:
# - Ресурси, които ще бъдат добавени (зелен +)
# - Ресурси, които ще бъдат променени (жълт ~)
# - Ресурси, които ще бъдат изтрити (червен -)
# Безопасно за изпълнение - няма реални промени в Azure средата

# Синтезира инфраструктура от azure.yaml
azd infra synth
```

### Информация за проекта
```bash
# Покажи състоянието на проекта и крайните точки
azd show

# Покажи подробна информация за проекта в JSON формат
azd show --output json

# Вземи крайните точки на услугата
azd show --output json | jq '.services'
```

## 🎯 Бързи работни потоци

### Работен поток за разработка
```bash
# Започнете нов проект
azd init --template todo-nodejs-mongo
cd my-project

# Разгърнете в средата за разработка
azd env new dev
azd up

# Направете промени и ги разгърнете отново
azd deploy

# Отворете таблото за наблюдение
azd monitor --live
```

### Работен поток за множество среди
```bash
# Настройване на среди
azd env new dev
azd env new staging  
azd env new production

# Разгръщане в dev
azd env select dev
azd up

# Тестване и прехвърляне в staging
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

# Проверка на конфигурацията
azd config list

# Отваряне на таблото за мониторинг на логовете
azd monitor --logs

# Проверка на състоянието на ресурса
azd show --output json
```

## 🔍 Команди за отстраняване на грешки

### Информация за отстраняване на грешки
```bash
# Включи отладъчен изход
export AZD_DEBUG=true
azd <command> --debug

# Изключи телеметрията за по-чист изход
export AZD_DISABLE_TELEMETRY=true

# Провери текущата конфигурация
azd config list

# Провери състоянието на удостоверяването
az account show
```

### Отстраняване на грешки в шаблоните
```bash
# Избройте наличните шаблони с подробности
azd template list --output json

# Покажете информация за шаблона
azd template show <template-name>

# Валидирайте шаблона преди инициализация
azd template validate <template-name>
```

## 📁 Команди за файлове и директории

### Структура на проекта
```bash
# Покажи текущата структура на директорията
tree /f  # Windows
find . -type f  # Linux/macOS

# Навигирай до кореновата директория на проекта azd
cd $(azd root)

# Покажи конфигурационната директория на azd
echo $AZD_CONFIG_DIR  # Обикновено ~/.azd
```

## 🎨 Форматиране на изхода

### JSON изход
```bash
# Получете JSON изход за скриптове
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

# Преглед на внедрените услуги
azd show --output json | jq '.services | keys'
```

## 🔧 Чести комбинации от команди

### Скрипт за проверка на състоянието
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
# Валидация преди внедряване
azd show
azd provision --preview  # Преглед на промените преди внедряване
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

## 🚨 Аварийни команди

### Бързи поправки
```bash
# Нулиране на удостоверяването
az account clear
az login

# Принудително опресняване на средата
azd env refresh

# Повторно разгръщане на всички услуги
azd deploy

# Проверка на състоянието на разгръщането
azd show --output json
```

### Команди за възстановяване
```bash
# Възстановяване след неуспешно разгръщане - изчистване и повторно разгръщане
azd down --force --purge
azd up

# Само повторно предоставяне на инфраструктурата
azd provision

# Само повторно разгръщане на приложението
azd deploy
```

## 💡 Професионални съвети

### Алиаси за по-бърз работен поток
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

# Бързо разгръщане с мониторинг
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

**Съвет**: Запазете тази шпаргалка в отметки и използвайте `Ctrl+F`, за да намерите бързо командите, от които се нуждаете!

---

**Навигация**
- **Предишен урок**: [Проверки преди разгръщане](../docs/pre-deployment/preflight-checks.md)
- **Следващ урок**: [Глосар](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния си език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->