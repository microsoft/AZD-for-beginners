# Командний Шпаргалка - Важливі Команди AZD

**Швидкий Довідник для Всіх Розділів**
- **📚 Домашня Сторінка Курсу**: [AZD Для Початківців](../README.md)
- **📖 Швидкий Старт**: [Розділ 1: Основи та Швидкий Старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Команди AI**: [Розділ 2: AI-Перший Розробка](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Просунутий Рівень**: [Розділ 4: Інфраструктура як Код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Вступ

Ця всебічна шпаргалка надає швидкий доступ до найбільш часто використовуваних команд Azure Developer CLI, організованих за категоріями з практичними прикладами. Ідеально підходить для швидкого доступу під час розробки, усунення несправностей та щоденних операцій з проєктами azd.

## Цілі Навчання

Використовуючи цю шпаргалку, ви:
- Отримаєте миттєвий доступ до основних команд та синтаксису Azure Developer CLI
- Зрозумієте організацію команд за функціональними категоріями та випадками використання
- Можете звертатися до практичних прикладів для поширених сценаріїв розробки та розгортання
- Отримаєте команди для усунення несправностей для швидкого вирішення проблем
- Знайдете ефективні опції для розширеної конфігурації та налаштування
- Зможете керувати середовищами та використовувати команди для роботи з кількома середовищами

## Результати Навчання

Регулярно звертаючись до цієї шпаргалки, ви зможете:
- Виконувати команди azd впевнено без потреби звертатися до повної документації
- Швидко вирішувати поширені проблеми за допомогою відповідних діагностичних команд
- Ефективно керувати кількома середовищами та сценаріями розгортання
- Застосовувати розширені функції та параметри конфігурації azd за потребою
- Усувати проблеми з розгортанням із систематичними послідовностями команд
- Оптимізувати робочі процеси за допомогою ефективного використання скорочень і опцій azd

## Початкові Команди

### Аутентифікація
```bash
# Увійти в Azure через AZD
azd auth login

# Увійти в Azure CLI (AZD використовує це під капотом)
az login

# Перевірити поточний обліковий запис
az account show

# Встановити підписку за замовчуванням
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Вийти з AZD
azd auth logout

# Вийти з Azure CLI
az logout
```

### Ініціалізація Проєкту
```bash
# Огляд доступних шаблонів
azd template list

# Ініціалізація з шаблону
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Ініціалізація в поточній директорії
azd init .

# Ініціалізація з користувацьким ім'ям
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основні Команди Розгортання

### Повний Робочий Процес Розгортання
```bash
# Розгорнути все (планування + розгортання)
azd up

# Розгорнути без запитів підтвердження
azd up --confirm-with-no-prompt

# Розгорнути в конкретне середовище
azd up --environment production

# Розгорнути з користувацькими параметрами
azd up --parameter location=westus2
```

### Лише Інфраструктура
```bash
# Надати ресурси Azure
azd provision

# 🧪 Попередній перегляд змін у інфраструктурі
azd provision --preview
# Показує попередній перегляд того, які ресурси будуть створені/змінені/видалені
# Схоже на 'terraform plan' або 'bicep what-if' - безпечне виконання, жодних змін не застосовується
```

### Лише Додаток
```bash
# Розгорнути код додатку
azd deploy

# Розгорнути конкретний сервіс
azd deploy --service web
azd deploy --service api

# Розгорнути всі сервіси
azd deploy --all
```

### Збірка та Пакування
```bash
# Відновити (завантажити) залежності застосунку
azd restore

# Відновити конкретну службу
azd restore --service api

# Створити артефакт для розгортання без розгортання
azd package

# Створити конкретну службу
azd package --service api
```

> **`azd restore`** завантажує залежності вашого додатку (npm, pip, NuGet, Maven тощо). Ця команда виконується автоматично під час `azd package` і `azd deploy`, тому ви рідко виконуєте її вручну — запускайте її самостійно, щоб заздалегідь завантажити залежності (наприклад, щоб прискорити кеш CI або працювати офлайн після цього).

> **`azd package`** збирає артефакт для розгортання (образ контейнера або zip) **без** публікації його в Azure. Використовуйте цю команду окремо, щоб перевірити успішність збірки, оглянути вихідні файли або отримати артефакт для подальшого розгортання іншим процесом. `azd deploy` автоматично пакує артефакт, тому `azd package` потрібна лише коли ви хочете отримати артефакт без розгортання.


## 🌍 Керування Середовищем

### Операції над Середовищем
```bash
# Перелік усіх середовищ
azd env list

# Створити нове середовище
azd env new development
azd env new staging --location westus2

# Вибрати середовище
azd env select production

# Показати доступні середовища
azd env list

# Оновити стан середовища
azd env refresh
```

### Змінні Середовища
```bash
# Встановити змінну середовища
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Отримати змінну середовища
azd env get API_KEY

# Перелік усіх змінних середовища
azd env get-values

# Видалити змінну середовища
azd env unset DEBUG
```

## ⚙️ Команди Налаштувань

### Глобальні Налаштування
```bash
# Перелік усіх налаштувань
azd config show

# Встановити глобальні значення за замовчуванням
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Видалити налаштування
azd config unset defaults.location

# Скинути всі налаштування
azd config reset
```

### Налаштування Проєкту
```bash
# Перевірити azure.yaml
azd config validate

# Показати інформацію про проект
azd show

# Отримати кінцеві точки сервісу
azd show --output json
```

## 📊 Моніторинг та Діагностика

### Дашборд Моніторингу
```bash
# Відкрити панель моніторингу порталу Azure
azd monitor

# Відкрити метрики в реальному часі Application Insights
azd monitor --live

# Відкрити логи Application Insights
azd monitor --logs

# Відкрити огляд Application Insights
azd monitor --overview
```

### Перегляд Логів Контейнера
```bash
# Переглянути журнали через Azure CLI (для Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Слідкувати за журналами в реальному часі
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Переглянути журнали через портал Azure
azd monitor --logs
```

### Запити Log Analytics
```bash
# Доступ до Log Analytics через портал Azure
azd monitor --logs

# Запит журналів за допомогою Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Обслуговування

### Очищення
```bash
# Видалити всі ресурси Azure
azd down

# Примусове видалення без підтвердження
azd down --force

# Очищення ресурсів, видалених у кошик
azd down --purge

# Повне очищення
azd down --force --purge
```

### Оновлення
```bash
# Перевірка наявності оновлень azd
azd version

# Отримати поточну версію
azd version

# Переглянути поточну конфігурацію
azd config show
```

## 🔧 Розширені Команди

### Pipeline та CI/CD
```bash
# Налаштувати GitHub Actions
azd pipeline config

# Налаштувати Azure DevOps
azd pipeline config --provider azdo

# Показати конфігурацію конвеєра
azd pipeline show
```

### Керування Інфраструктурою
```bash
# Генерація шаблонів інфраструктури
azd infra generate

# 🧪 Попередній перегляд і планування інфраструктури
azd provision --preview
# Імітує розгортання інфраструктури без фактичного впровадження
# Аналізує шаблони Bicep/Terraform і показує:
# - Ресурси, які будуть додані (зелений +)
# - Ресурси, які будуть змінені (жовтий ~)
# - Ресурси, які будуть видалені (червоний -)
# Безпечно для запуску - жодних дій в середовищі Azure не виконується

# Синтез інфраструктури з azure.yaml
azd infra synth
```

### Інформація про Проєкт
```bash
# Показати статус проекту та кінцеві точки
azd show

# Показати детальну інформацію про проект у форматі JSON
azd show --output json

# Отримати кінцеві точки сервісу
azd show --output json | jq '.services'
```

## 🤖 Команди AI та Розширень

### Розширення AZD
```bash
# Перелічіть усі доступні розширення (включно з ШІ)
azd extension list

# Встановіть розширення агентів Foundry
azd extension install azure.ai.agents

# Встановіть розширення навичок агента (попередній перегляд)
azd extension install azure.ai.skills

# Встановіть розширення з'єднань Foundry (попередній перегляд)
azd extension install azure.ai.connections

# Встановіть розширення тонкого налаштування
azd extension install azure.ai.finetune

# Встановіть розширення користувацьких моделей
azd extension install azure.ai.models

# Оновіть усі встановлені розширення
azd extension upgrade --all
```

### Команди AI Агентів
```bash
# Ініціалізувати проект агента з маніфесту
azd ai agent init -m <manifest-path-or-uri>

# Вказати цільовий проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Вказати каталог джерел агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Вибрати ціль хостингу
azd ai agent init -m agent-manifest.yaml --host containerapp

# Протестувати розгорнутий агент (виводить затримку + час до першого байта)
azd ai agent invoke

# Показати конфігурацію активної кінцевої точки
azd ai agent endpoint show

# Згенерувати набір даних для оцінки, потім оптимізувати агента
azd ai agent eval generate
azd ai agent optimize

# Завантажити розгорнутий код агента, розміщеного як код
azd ai agent code download

# Видалити розміщеного агента та всі його версії (--force завершує активні сесії)
azd ai agent delete --force
```

### MCP Сервер (Альфа)
```bash
# Запустіть сервер MCP для вашого проєкту
azd mcp start

# Керуйте згодою на інструменти для операцій MCP
azd copilot consent list
```

### Генерація Інфраструктури
```bash
# Згенеруйте файли IaC з визначення вашого проекту
azd infra generate

# Синтезуйте інфраструктуру з azure.yaml
azd infra synth
```

---

## 🎯 Швидкі Робочі Процеси

### Розробницький Робочий Процес
```bash
# Розпочати новий проект
azd init --template todo-nodejs-mongo
cd my-project

# Розгорнути у середовищі розробки
azd env new dev
azd up

# Внести зміни та повторно розгорнути
azd deploy

# Відкрити панель моніторингу
azd monitor --live
```

### Робочий Процес з Кількома Середовищами
```bash
# Налаштувати середовища
azd env new dev
azd env new staging  
azd env new production

# Розгорнути на dev
azd env select dev
azd up

# Тестувати та просувати на staging
azd env select staging
azd up

# Розгорнути у production
azd env select production
azd up
```

### Робочий Процес Усунення Несправностей
```bash
# Увімкнути режим відлагодження
export AZD_DEBUG=true

# Перевірити статус розгортання
azd show

# Перевірити конфігурацію
azd config show

# Відкрити панель моніторингу для журналів
azd monitor --logs

# Перевірити статус ресурсів
azd show --output json
```

## 🔍 Команди Налагодження

### Інформація для Налагодження
```bash
# Увімкнути вивід відлагодження
export AZD_DEBUG=true
azd <command> --debug

# Вимкнути телеметрію для чистішого виводу
export AZD_DISABLE_TELEMETRY=true

# Перевірити поточну конфігурацію
azd config show

# Перевірити статус автентифікації
az account show
```

### Налагодження Шаблонів
```bash
# Перелічити доступні шаблони з деталями
azd template list --output json

# Показати інформацію про шаблон
azd template show <template-name>

# Перевірити шаблон перед ініціалізацією
azd template validate <template-name>
```

## 📁 Файли та Каталоги

### Структура Проєкту
```bash
# Показати поточну структуру директорії
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти до кореневої папки проекту azd
cd $(azd root)

# Показати директорію конфігурації azd
echo $AZD_CONFIG_DIR  # Зазвичай ~/.azd
```

## 🎨 Форматування Виводу

### Вивід у Форматі JSON
```bash
# Отримати JSON-вивід для скриптів
azd show --output json
azd env list --output json
azd config show --output json

# Аналізувати за допомогою jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вивід у Формі Таблиці
```bash
# Відформатувати як таблицю
azd env list --output table

# Переглянути розгорнуті сервіси
azd show --output json | jq '.services | keys'
```

## 🔧 Типові Комбіновані Команди

### Скрипт Перевірки Здоров’я
```bash
#!/bin/bash
# Швидка перевірка стану здоров'я
azd show
azd env get-values
azd monitor --logs
```

### Валідація Розгортання
```bash
#!/bin/bash
# Перевірка перед розгортанням
azd show
azd provision --preview  # Переглянути зміни перед розгортанням
az account show
```

### Порівняння Середовищ
```bash
#!/bin/bash
# Порівняти середовища
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипт Очищення Ресурсів
```bash
#!/bin/bash
# Очистити старі середовища
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Змінні Середовища

### Поширені Змінні Середовища
```bash
# Конфігурація Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Конфігурація AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфігурація застосунку
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Аварійні Команди

### Швидкі Виправлення
```bash
# Скинути автентифікацію
az account clear
az login

# Примусово оновити середовище
azd env refresh

# Повторно розгорнути всі сервіси
azd deploy

# Перевірити статус розгортання
azd show --output json
```

### Команди Відновлення
```bash
# Відновлення після невдалої розгортання - очистити та повторно розгорнути
azd down --force --purge
azd up

# Провести повторне розгортання інфраструктури лише
azd provision

# Повторно розгорнути тільки застосунок
azd deploy
```

## 💡 Професійні Поради

### Псевдоніми для Швидшої Роботи
```bash
# Додайте до вашого .bashrc або .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Скорочення Функцій
```bash
# Швидке перемикання середовища
azd-env() {
    azd env select $1 && azd show
}

# Швидке розгортання з моніторингом
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Статус середовища
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Допомога та Документація

### Отримання Допомоги
```bash
# Загальна допомога
azd --help
azd help

# Допомога по конкретній команді
azd up --help
azd env --help
azd config --help

# Показати версію та інформацію збірки
azd version
azd version --output json
```

### Посилання на Документацію
```bash
# Відкрити документацію у браузері
azd docs

# Показати документацію шаблону
azd template show <template-name> --docs
```

---

**Порада**: Додайте цю шпаргалку в закладки та використовуйте `Ctrl+F` для швидкого пошуку потрібних команд!

---

**Навігація**
- **Попередній Урок**: [Перевірки Перед Розгортанням](../docs/pre-deployment/preflight-checks.md)
- **Наступний Урок**: [Глосарій](glossary.md)

---

> **💡 Хочете допомогу з командами Azure у вашому редакторі?** Встановіть [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) за допомогою `npx skills add microsoft/github-copilot-for-azure` — 37 навичок для AI, Foundry, розгортання, діагностики тощо.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->