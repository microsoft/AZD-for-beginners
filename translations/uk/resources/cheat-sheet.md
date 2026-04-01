# Командна шпаргалка - Основні команди AZD

**Швидкий довідник для всіх розділів**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../README.md)
- **📖 Швидкий старт**: [Розділ 1: Основи та швидкий старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Команди**: [Розділ 2: Розробка з акцентом на AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Розширені можливості**: [Розділ 4: Інфраструктура як код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Вступ

Ця вичерпна шпаргалка надає швидкий доступ до найчастіше використовуваних команд Azure Developer CLI, організованих за категоріями з практичними прикладами. Ідеально підходить для швидких звернень під час розробки, усунення несправностей і щоденних операцій з проєктами azd.

## Цілі навчання

Використовуючи цю шпаргалку, ви зможете:
- Мати миттєвий доступ до основних команд та синтаксису Azure Developer CLI
- Розуміти організацію команд за функціональними категоріями та випадками використання
- Посилатися на практичні приклади для поширених сценаріїв розробки та розгортання
- Отримувати команди для усунення несправностей для швидкого вирішення проблем
- Знаходити передові налаштування та опції кастомізації ефективно
- Знаходити команди для керування середовищем та багатосередовищних робочих процесів

## Результати навчання

Регулярно звертаючись до цієї шпаргалки, ви зможете:
- Виконувати команди azd впевнено без звернення до повної документації
- Швидко вирішувати поширені проблеми за допомогою відповідних діагностичних команд
- Ефективно керувати кількома середовищами та сценаріями розгортання
- Використовувати розширені функції azd та опції налаштувань за потреби
- Усувати проблеми з розгортанням використовуючи систематичні послідовності команд
- Оптимізувати робочі процеси за допомогою ефективного використання ярликів та опцій azd

## Початкові команди

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

### Ініціалізація проєкту
```bash
# Переглянути доступні шаблони
azd template list

# Ініціалізувати з шаблону
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Ініціалізувати в поточній директорії
azd init .

# Ініціалізувати з власним ім'ям
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основні команди розгортання

### Повний робочий процес розгортання
```bash
# Розгорнути все (налаштування + розгортання)
azd up

# Розгорнути без запитів підтвердження
azd up --confirm-with-no-prompt

# Розгорнути на конкретне середовище
azd up --environment production

# Розгорнути з користувацькими параметрами
azd up --parameter location=westus2
```

### Тільки інфраструктура
```bash
# Надання ресурсів Azure
azd provision

# 🧪 Попередній перегляд змін інфраструктури
azd provision --preview
# Показує попередній перегляд того, які ресурси будуть створені/змінені/видалені
# Аналогічно до 'terraform plan' або 'bicep what-if' - безпечний запуск, зміни не застосовуються
```

### Тільки додаток
```bash
# Розгорнути код додатку
azd deploy

# Розгорнути конкретну службу
azd deploy --service web
azd deploy --service api

# Розгорнути всі служби
azd deploy --all
```

### Збірка та упаковка
```bash
# Створюйте додатки
azd package

# Створення конкретного сервісу
azd package --service api
```

## 🌍 Керування середовищем

### Операції з середовищем
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

### Змінні середовища
```bash
# Встановити змінну середовища
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Отримати змінну середовища
azd env get API_KEY

# Перелічити всі змінні середовища
azd env get-values

# Видалити змінну середовища
azd env unset DEBUG
```

## ⚙️ Команди налаштувань

### Глобальні налаштування
```bash
# Переглянути всі налаштування
azd config show

# Встановити глобальні налаштування за замовчуванням
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Видалити налаштування
azd config unset defaults.location

# Скинути всі налаштування
azd config reset
```

### Налаштування проєкту
```bash
# Перевірити azure.yaml
azd config validate

# Показати інформацію про проект
azd show

# Отримати кінцеві точки сервісу
azd show --output json
```

## 📊 Моніторинг та діагностика

### Панель моніторингу
```bash
# Відкрити інформаційну панель моніторингу порталу Azure
azd monitor

# Відкрити живі метрики Application Insights
azd monitor --live

# Відкрити вкладку журналів Application Insights
azd monitor --logs

# Відкрити огляд Application Insights
azd monitor --overview
```

### Перегляд логів контейнерів
```bash
# Перегляд журналів через Azure CLI (для Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Перегляд логів у режимі реального часу
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Перегляд журналів через Azure Portal
azd monitor --logs
```

### Запити Log Analytics
```bash
# Отримайте доступ до аналітики журналів через портал Azure
azd monitor --logs

# Запитуйте журнали за допомогою Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди обслуговування

### Прибирання
```bash
# Видалити всі ресурси Azure
azd down

# Примусове видалення без підтвердження
azd down --force

# Очищення м’яко видалених ресурсів
azd down --purge

# Повне очищення
azd down --force --purge
```

### Оновлення
```bash
# Перевірте наявність оновлень azd
azd version

# Отримати поточну версію
azd version

# Переглянути поточну конфігурацію
azd config show
```

## 🔧 Розширені команди

### Pipeline та CI/CD
```bash
# Налаштувати GitHub Actions
azd pipeline config

# Налаштувати Azure DevOps
azd pipeline config --provider azdo

# Показати конфігурацію конвеєра
azd pipeline show
```

### Керування інфраструктурою
```bash
# Генерує шаблони інфраструктури
azd infra generate

# 🧪 Попередній перегляд та планування інфраструктури
azd provision --preview
# Імітує розгортання інфраструктури без фактичного розгортання
# Аналізує шаблони Bicep/Terraform та показує:
# - Ресурси, які будуть додані (зелений +)
# - Ресурси, які будуть змінені (жовтий ~)
# - Ресурси, які будуть видалені (червоний -)
# Безпечно запускати - фактичні зміни в середовищі Azure не вносяться

# Синтезує інфраструктуру з azure.yaml
azd infra synth
```

### Інформація про проєкт
```bash
# Показати статус проєкту та кінцеві точки
azd show

# Показати детальну інформацію про проєкт у форматі JSON
azd show --output json

# Отримати кінцеві точки сервісу
azd show --output json | jq '.services'
```

## 🤖 Команди AI та розширень

### Розширення AZD
```bash
# Перелічити всі доступні розширення (включно з AI)
azd extension list

# Встановити розширення агентів Foundry
azd extension install azure.ai.agents

# Встановити розширення для тонкого налаштування
azd extension install azure.ai.finetune

# Встановити розширення для користувацьких моделей
azd extension install azure.ai.models

# Оновити всі встановлені розширення
azd extension upgrade --all
```

### Команди AI-агента
```bash
# Ініціалізувати проект агента з маніфесту
azd ai agent init -m <manifest-path-or-uri>

# Вказати конкретний проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Визначити каталог джерел агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Вибрати хостинг-ціль
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Запустіть сервер MCP для вашого проекту
azd mcp start

# Керуйте дозволами інструментів для операцій MCP
azd copilot consent list
```

### Генерація інфраструктури
```bash
# Генерувати файли IaC з визначення вашого проекту
azd infra generate

# Синтезувати інфраструктуру з azure.yaml
azd infra synth
```

---

## 🎯 Швидкі робочі потоки

### Робочий процес розробки
```bash
# Розпочати новий проєкт
azd init --template todo-nodejs-mongo
cd my-project

# Розгорнути в середовищі розробки
azd env new dev
azd up

# Внести зміни та повторно розгорнути
azd deploy

# Відкрити панель моніторингу
azd monitor --live
```

### Робочий процес для багатьох середовищ
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

### Робочий процес усунення несправностей
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

## 🔍 Команди налагодження

### Інформація для налагодження
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

### Налагодження шаблонів
```bash
# Перелік доступних шаблонів із деталями
azd template list --output json

# Показати інформацію про шаблон
azd template show <template-name>

# Перевірити шаблон перед ініціалізацією
azd template validate <template-name>
```

## 📁 Команди для файлів і каталогів

### Структура проєкту
```bash
# Показати поточну структуру директорії
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти до кореневої директорії проекту azd
cd $(azd root)

# Показати директорію конфігурації azd
echo $AZD_CONFIG_DIR  # Зазвичай ~/.azd
```

## 🎨 Форматування виводу

### Вивід у форматі JSON
```bash
# Отримати JSON-вивід для скриптування
azd show --output json
azd env list --output json
azd config show --output json

# Розпарсити за допомогою jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вивід у таблиці
```bash
# Форматувати як таблицю
azd env list --output table

# Переглянути розгорнуті служби
azd show --output json | jq '.services | keys'
```

## 🔧 Поширені комбінації команд

### Скрипт перевірки стану
```bash
#!/bin/bash
# Швидка перевірка стану системи
azd show
azd env get-values
azd monitor --logs
```

### Валідація розгортання
```bash
#!/bin/bash
# Перевірка перед розгортанням
azd show
azd provision --preview  # Перегляд змін перед розгортанням
az account show
```

### Порівняння середовищ
```bash
#!/bin/bash
# Порівняти середовища
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипт очищення ресурсів
```bash
#!/bin/bash
# Очистити старі середовища
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Змінні середовищ

### Поширені змінні середовищ
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

## 🚨 Аварійні команди

### Швидкі виправлення
```bash
# Скинути автентифікацію
az account clear
az login

# Примусово оновити середовище
azd env refresh

# Переозначити всі сервіси
azd deploy

# Перевірити статус розгортання
azd show --output json
```

### Команди відновлення
```bash
# Відновлення після невдалої розгортки - очистити та розгорнути знову
azd down --force --purge
azd up

# Повторне налаштування лише інфраструктури
azd provision

# Повторне розгортання лише додатку
azd deploy
```

## 💡 Професійні поради

### Псевдоніми для швидшої роботи
```bash
# Додайте до вашого .bashrc або .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Ярлики функцій
```bash
# Швидке перемикання середовищ
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

## 📖 Допомога і документація

### Отримання допомоги
```bash
# Загальна допомога
azd --help
azd help

# Допомога по конкретних командах
azd up --help
azd env --help
azd config --help

# Показати інформацію про версію та збірку
azd version
azd version --output json
```

### Посилання на документацію
```bash
# Відкрити документацію у браузері
azd docs

# Показати документацію шаблону
azd template show <template-name> --docs
```

---

**Порада**: Додайте цю шпаргалку до закладок та використовуйте `Ctrl+F` для швидкого пошуку потрібних команд!

---

**Навігація**
- **Попередній урок**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Наступний урок**: [Глосарій](glossary.md)

---

> **💡 Бажаєте допомогу з командами Azure у вашому редакторі?** Встановіть [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) за допомогою `npx skills add microsoft/github-copilot-for-azure` — 37 навичок для AI, Foundry, розгортання, діагностики та іншого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Незважаючи на наші зусилля досягти точності, будьте уважні, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->