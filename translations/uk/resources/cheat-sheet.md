# Command Cheat Sheet - Основні команди AZD

**Швидкий довідник для всіх розділів**
- **📚 Головна сторінка курсу**: [AZD для початківців](../README.md)
- **📖 Швидкий старт**: [Розділ 1: Основи та швидкий старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команди**: [Розділ 2: AI-орієнтована розробка](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Просунутий рівень**: [Розділ 4: Інфраструктура як код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Вступ

Цей всебічний довідник надає швидкий доступ до найбільш часто використовуваних команд Azure Developer CLI, упорядкованих за категоріями з практичними прикладами. Ідеально підходить для швидких звернень під час розробки, усунення несправностей та щоденних операцій з проектами azd.

## Цілі навчання

Використовуючи цей довідник, ви:
- Миттєво отримаєте доступ до основних команд і синтаксису Azure Developer CLI
- Зрозумієте організацію команд за функціональними категоріями та випадками використання
- Зможете звертатися до практичних прикладів для типових сценаріїв розробки та розгортання
- Отримаєте команди для усунення несправностей для швидкого вирішення проблем
- Легко знайдете налаштування та опції кастомізації
- Пошукаєте команди для керування середовищами та багатосередовищних робочих процесів

## Результати навчання

Регулярно звертаючись до цього довідника, ви зможете:
- Впевнено виконувати команди azd без постійного звернення до повної документації
- Швидко усувати типові проблеми за допомогою відповідних діагностичних команд
- Ефективно керувати кількома середовищами та сценаріями розгортання
- Застосовувати просунуті функції та опції налаштувань azd за потреби
- Усувати несправності розгортання за допомогою систематичних послідовностей команд
- Оптимізувати робочі процеси за допомогою ефективного використання ярликів та опцій azd

## Початкові команди

### Аутентифікація
```bash
# Увійти в Azure через AZD
azd auth login

# Увійти в Azure CLI (AZD використовує це "під капотом")
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

### Ініціалізація проекту
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

# Розгорнути без запитів підтвердження
azd up --confirm-with-no-prompt

# Розгорнути у конкретне середовище
azd up --environment production

# Розгорнути з користувацькими параметрами
azd up --parameter location=westus2
```

### Лише інфраструктура
```bash
# Забезпечення ресурсів Azure
azd provision

# 🧪 Попередній перегляд змін інфраструктури
azd provision --preview
# Показує попередній вигляд того, які ресурси будуть створені/змінені/видалені
# Схоже на 'terraform plan' або 'bicep what-if' - безпечне виконання, без застосування змін
```

### Лише додаток
```bash
# Розгорнути код додатка
azd deploy

# Розгорнути конкретну службу
azd deploy --service web
azd deploy --service api

# Розгорнути всі служби
azd deploy --all
```

### Побудова та пакування
```bash
# Створювати додатки
azd package

# Створювати конкретний сервіс
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
# Перелік усіх налаштувань
azd config list

# Встановити глобальні за замовчуванням
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Видалити налаштування
azd config unset defaults.location

# Скинути всі налаштування
azd config reset
```

### Конфігурація проекту
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
# Відкрити панель моніторингу порталу Azure
azd monitor

# Відкрити живі метрики Application Insights
azd monitor --live

# Відкрити вкладку журналів Application Insights
azd monitor --logs

# Відкрити огляд Application Insights
azd monitor --overview
```

### Перегляд логів контейнера
```bash
# Переглядайте журнали через Azure CLI (для Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Стежте за журналами в режимі реального часу
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Переглядайте журнали з Azure Portal
azd monitor --logs
```

### Запити Log Analytics
```bash
# Аналітика журналу доступу через портал Azure
azd monitor --logs

# Запитуйте журнали за допомогою Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди обслуговування

### Очищення
```bash
# Видалити всі ресурси Azure
azd down

# Примусово видалити без підтвердження
azd down --force

# Очищення ресурсів, які були пом'якшено видалені
azd down --purge

# Повне очищення
azd down --force --purge
```

### Оновлення
```bash
# Перевірити оновлення azd
azd version

# Отримати поточну версію
azd version

# Переглянути поточну конфігурацію
azd config list
```

## 🔧 Просунуті команди

### Pipeline та CI/CD
```bash
# Налаштуйте GitHub Actions
azd pipeline config

# Налаштуйте Azure DevOps
azd pipeline config --provider azdo

# Показати конфігурацію пайплайна
azd pipeline show
```

### Керування інфраструктурою
```bash
# Генерація шаблонів інфраструктури
azd infra generate

# 🧪 Попередній перегляд та планування інфраструктури
azd provision --preview
# Імітація створення інфраструктури без розгортання
# Аналізує шаблони Bicep/Terraform і показує:
# - Ресурси, які будуть додані (зелений +)
# - Ресурси, які будуть змінені (жовтий ~)
# - Ресурси, які будуть видалені (червоний -)
# Безпечно запускати - фактичних змін в Azure середовищі не відбувається

# Синтезує інфраструктуру з azure.yaml
azd infra synth
```

### Інформація про проект
```bash
# Показати статус проекту та кінцеві точки
azd show

# Показати детальну інформацію про проект у форматі JSON
azd show --output json

# Отримати кінцеві точки сервісу
azd show --output json | jq '.services'
```

## 🤖 AI та розширення

### Розширення AZD
```bash
# Показати всі доступні розширення (включно з AI)
azd extension list

# Встановити розширення агентів Foundry
azd extension install azure.ai.agents

# Встановити розширення тонкого налаштування
azd extension install azure.ai.finetune

# Встановити розширення власних моделей
azd extension install azure.ai.models

# Оновити всі встановлені розширення
azd extension upgrade --all
```

### Команди AI агента
```bash
# Ініціалізувати проект агента з маніфесту
azd ai agent init -m <manifest-path-or-uri>

# Орієнтуватися на конкретний проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Вказати каталог джерела агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Вибрати ціль хостингу
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Сервер (альфа)
```bash
# Запустіть MCP сервер для вашого проекту
azd mcp start

# Керуйте згодою на інструменти для операцій MCP
azd mcp consent
```

### Генерація інфраструктури
```bash
# Створіть файли IaC із визначення вашого проекту
azd infra generate

# Сінтезуйте інфраструктуру з azure.yaml
azd infra synth
```

---

## 🎯 Швидкі робочі процеси

### Робочий процес розробки
```bash
# Розпочати новий проект
azd init --template todo-nodejs-mongo
cd my-project

# Розгорнути у середовищі розробки
azd env new dev
azd up

# Внести зміни та переспрямувати
azd deploy

# Відкрити панель моніторингу
azd monitor --live
```

### Багатосередовищний робочий процес
```bash
# Налаштувати середовища
azd env new dev
azd env new staging  
azd env new production

# Розгорнути на дев
azd env select dev
azd up

# Тестувати та перенести на стейджинг
azd env select staging
azd up

# Розгорнути на продакшн
azd env select production
azd up
```

### Робочий процес усунення несправностей
```bash
# Увімкнути режим відлагодження
export AZD_DEBUG=true

# Перевірити стан розгортання
azd show

# Перевірити конфігурацію
azd config list

# Відкрити панель моніторингу для журналів
azd monitor --logs

# Перевірити стан ресурсів
azd show --output json
```

## 🔍 Команди налагодження

### Інформація для налагодження
```bash
# Увімкнути вивід налагодження
export AZD_DEBUG=true
azd <command> --debug

# Вимкнути телеметрію для чистішого виводу
export AZD_DISABLE_TELEMETRY=true

# Перевірити поточну конфігурацію
azd config list

# Перевірити стан автентифікації
az account show
```

### Налагодження шаблонів
```bash
# Показати доступні шаблони з деталями
azd template list --output json

# Показати інформацію про шаблон
azd template show <template-name>

# Перевірити шаблон перед ініціалізацією
azd template validate <template-name>
```

## 📁 Команди файлів і директорій

### Структура проекту
```bash
# Показати поточну структуру директорій
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти до кореневої директорії проекту azd
cd $(azd root)

# Показати директорію конфігурації azd
echo $AZD_CONFIG_DIR  # Зазвичай ~/.azd
```

## 🎨 Форматування виводу

### JSON вивід
```bash
# Отримати вивід у форматі JSON для скриптування
azd show --output json
azd env list --output json
azd config list --output json

# Аналізувати за допомогою jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табличний вивід
```bash
# Форматувати як таблицю
azd env list --output table

# Переглянути розгорнуті сервіси
azd show --output json | jq '.services | keys'
```

## 🔧 Загальні комбінації команд

### Скрипт перевірки стану
```bash
#!/bin/bash
# Швидка перевірка стану системи
azd show
azd env show
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

## 📝 Змінні середовища

### Загальні змінні середовища
```bash
# Конфігурація Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Конфігурація AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфігурація додатку
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

# Повторно розгорнути всі сервіси
azd deploy

# Перевірити стан розгортання
azd show --output json
```

### Команди відновлення
```bash
# Відновлення після невдалого розгортання - очистити і розгорнути заново
azd down --force --purge
azd up

# Лише повторне забезпечення інфраструктури
azd provision

# Лише повторне розгортання додатка
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
# Швидке переключення середовища
azd-env() {
    azd env select $1 && azd show
}

# Швидке розгортання з моніторингом
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Стан середовища
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Допомога та документація

### Отримати допомогу
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

**Підказка**: Додайте цей довідник у закладки та використовуйте `Ctrl+F` для швидкого пошуку необхідних команд!

---

**Навігація**
- **Попередній урок**: [Перевірки перед виконанням](../docs/pre-deployment/preflight-checks.md)
- **Наступний урок**: [Глосарій](glossary.md)

---

> **💡 Хочете допомогу з командами Azure у вашому редакторі?** Встановіть [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) за допомогою `npx skills add microsoft/github-copilot-for-azure` — 37 навичок для AI, Foundry, розгортання, діагностики та іншого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати офіційним джерелом інформації. Для критично важливої інформації рекомендовано звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->