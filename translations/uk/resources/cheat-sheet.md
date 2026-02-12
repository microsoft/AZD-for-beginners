# Командний шорткат - Основні команди AZD

**Швидкий доступ до всіх розділів**
- **📚 Головна курсу**: [AZD Для Початківців](../README.md)
- **📖 Швидкий старт**: [Розділ 1: Основи та Швидкий старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Команди**: [Розділ 2: Розробка з AI на першому плані](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Просунутий рівень**: [Розділ 4: Інфраструктура як Код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Вступ

Цей докладний шорткат надає швидкий доступ до найчастіше використовуваних команд Azure Developer CLI, організованих за категоріями з практичними прикладами. Ідеально підходить для швидких звернень під час розробки, усунення несправностей та щоденної роботи з проєктами azd.

## Цілі навчання

Використовуючи цей шорткат, ви:
- Отримаєте миттєвий доступ до основних команд Azure Developer CLI та синтаксису
- Зрозумієте організацію команд за функціональними категоріями та випадками використання
- Зможете звертатися до практичних прикладів для типових сценаріїв розробки та розгортання
- Отримаєте команди для усунення несправностей для швидкого вирішення проблем
- Легко знайдете розширені налаштування та параметри кастомізації
- Опануєте управління середовищами та роботу з мульти-середовищами

## Результати навчання

Регулярно користуючись цим шорткатом, ви зможете:
- Впевнено виконувати azd команди без постійного звернення до повної документації
- Швидко вирішувати типові проблеми за допомогою відповідних діагностичних команд
- Ефективно керувати кількома середовищами та сценаріями розгортання
- Застосовувати розширені функції azd та параметри конфігурації за потреби
- Усувати проблеми розгортання за допомогою системних послідовностей команд
- Оптимізувати робочі процеси через ефективне використання скорочень та опцій azd

## Початкові команди

### Аутентифікація
```bash
# Вхід до Azure через AZD
azd auth login

# Вхід до Azure CLI (AZD використовує це під капотом)
az login

# Перевірка поточного облікового запису
az account show

# Встановлення підписки за замовчуванням
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Вихід із AZD
azd auth logout

# Вихід з Azure CLI
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

# Ініціалізувати з власною назвою
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основні команди розгортання

### Повний робочий процес розгортання
```bash
# Розгорнути все (підготовка + розгортання)
azd up

# Розгорнути без підказок підтвердження
azd up --confirm-with-no-prompt

# Розгорнути в конкретне середовище
azd up --environment production

# Розгорнути з нестандартними параметрами
azd up --parameter location=westus2
```

### Лише інфраструктура
```bash
# Забезпечення ресурсів Azure
azd provision

# 🧪 Попередній перегляд змін інфраструктури
azd provision --preview
# Показує попередній перегляд того, які ресурси будуть створені/змінені/видалені
# Схоже на 'terraform plan' або 'bicep what-if' - безпечне виконання, без застосування змін
```

### Лише застосунок
```bash
# Розгорнути код застосунку
azd deploy

# Розгорнути конкретну службу
azd deploy --service web
azd deploy --service api

# Розгорнути всі служби
azd deploy --all
```

### Збірка та пакування
```bash
# Створювати додатки
azd package

# Створити конкретний сервіс
azd package --service api
```

## 🌍 Управління середовищами

### Операції зі середовищами
```bash
# Показати всі середовища
azd env list

# Створити нове середовище
azd env new development
azd env new staging --location westus2

# Вибрати середовище
azd env select production

# Показати поточне середовище
azd env show

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

# Перелік усіх змінних середовища
azd env get-values

# Видалити змінну середовища
azd env unset DEBUG
```

## ⚙️ Команди конфігурації

### Глобальна конфігурація
```bash
# Перелік усієї конфігурації
azd config list

# Встановити глобальні налаштування за замовчуванням
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Видалити конфігурацію
azd config unset defaults.location

# Скинути всю конфігурацію
azd config reset
```

### Конфігурація проєкту
```bash
# Перевірте azure.yaml
azd config validate

# Показати інформацію про проект
azd show

# Отримати кінцеві точки сервісу
azd show --output json
```

## 📊 Моніторинг та діагностика

### Панель моніторингу
```bash
# Відкрити панель моніторингу порталу Azure
azd monitor

# Відкрити живі метрики Application Insights
azd monitor --live

# Відкрити панель логів Application Insights
azd monitor --logs

# Відкрити огляд Application Insights
azd monitor --overview
```

### Перегляд логів контейнерів
```bash
# Переглядайте журнали через Azure CLI (для контейнерних додатків)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Слідкуйте за журналами в режимі реального часу
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Переглядайте журнали через портал Azure
azd monitor --logs
```

### Запити Log Analytics
```bash
# Отримати доступ до аналітики журналів через портал Azure
azd monitor --logs

# Запитувати журнали за допомогою Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди обслуговування

### Очищення
```bash
# Видалити всі ресурси Azure
azd down

# Примусове видалення без підтвердження
azd down --force

# Очистити ресурси, видалені м’яко
azd down --purge

# Повне очищення
azd down --force --purge
```

### Оновлення
```bash
# Перевірка оновлень azd
azd version

# Отримати поточну версію
azd version

# Переглянути поточну конфігурацію
azd config list
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

### Управління інфраструктурою
```bash
# Генерує шаблони інфраструктури
azd infra generate

# 🧪 Перегляд і планування інфраструктури
azd provision --preview
# Імітує надання інфраструктури без розгортання
# Аналізує шаблони Bicep/Terraform і показує:
# - Ресурси для додавання (зелений +)
# - Ресурси для зміни (жовтий ~)
# - Ресурси для видалення (червоний -)
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

## 🎯 Швидкі робочі процеси

### Робочий процес розробки
```bash
# Розпочати новий проект
azd init --template todo-nodejs-mongo
cd my-project

# Розгорнути в розробці
azd env new dev
azd up

# Внести зміни та розгорнути знову
azd deploy

# Відкрити панель моніторингу
azd monitor --live
```

### Робочий процес з мульти-середовищем
```bash
# Налаштувати середовища
azd env new dev
azd env new staging  
azd env new production

# Розгорнути у dev
azd env select dev
azd up

# Тестувати та просунути до staging
azd env select staging
azd up

# Розгорнути у production
azd env select production
azd up
```

### Робочий процес усунення несправностей
```bash
# Увімкнути режим налагодження
export AZD_DEBUG=true

# Перевірити статус розгортання
azd show

# Перевірити конфігурацію
azd config list

# Відкрити панель моніторингу для журналів
azd monitor --logs

# Перевірити стан ресурсів
azd show --output json
```

## 🔍 Команди для налагодження

### Інформація для налагодження
```bash
# Увімкнути відлагоджувальний вивід
export AZD_DEBUG=true
azd <command> --debug

# Вимкнути телеметрію для чистішого виводу
export AZD_DISABLE_TELEMETRY=true

# Перевірити поточну конфігурацію
azd config list

# Перевірити стан аутентифікації
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

## 📁 Команди роботи з файлами та директоріями

### Структура проєкту
```bash
# Показати поточну структуру каталогу
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти до кореневого каталогу проєкту azd
cd $(azd root)

# Показати каталог конфігурації azd
echo $AZD_CONFIG_DIR  # Зазвичай ~/.azd
```

## 🎨 Форматування виводу

### Вивід у форматі JSON
```bash
# Отримати JSON вивід для сценаріїв
azd show --output json
azd env list --output json
azd config list --output json

# Аналізувати за допомогою jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вивід у вигляді таблиці
```bash
# Відформатувати як таблицю
azd env list --output table

# Переглянути розгорнуті служби
azd show --output json | jq '.services | keys'
```

## 🔧 Поширені комбінації команд

### Скрипт перевірки стану
```bash
#!/bin/bash
# Швидка перевірка стану здоров'я
azd show
azd env show
azd monitor --logs
```

### Валідація розгортання
```bash
#!/bin/bash
# Перевірка перед розгортанням
azd show
azd provision --preview  # Переглянути зміни перед розгортанням
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

# Повторно розгорнути всі служби
azd deploy

# Перевірити статус розгортання
azd show --output json
```

### Команди відновлення
```bash
# Відновлення після невдалої розгортання - очистити та розгорнути знову
azd down --force --purge
azd up

# Лише повторне забезпечення інфраструктури
azd provision

# Лише повторне розгортання застосунку
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

### Скорочення функцій
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
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Допомога та документація

### Отримання допомоги
```bash
# Загальна допомога
azd --help
azd help

# Допомога по конкретній команді
azd up --help
azd env --help
azd config --help

# Показати інформацію про версію та збірку
azd version
azd version --output json
```

### Посилання на документацію
```bash
# Відкрити документацію в браузері
azd docs

# Показати документацію шаблону
azd template show <template-name> --docs
```

---

**Порада**: Додайте цей шорткат до закладок та використовуйте `Ctrl+F` для швидкого пошуку потрібних команд!

---

**Навігація**
- **Попередній урок**: [Перевірки перед розгортанням](../docs/pre-deployment/preflight-checks.md)
- **Наступний урок**: [Глосарій](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, враховуйте, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->