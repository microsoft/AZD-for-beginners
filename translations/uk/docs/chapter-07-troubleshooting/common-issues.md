# Загальні проблеми та рішення

**Навігація розділом:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Вирішення проблем і налагодження
- **⬅️ Попередній розділ**: [Розділ 6: Перевірки перед запуском](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Наступний**: [Посібник з налагодження](debugging.md)
- **🚀 Наступний розділ**: [Розділ 8: Виробничі та корпоративні патерни](../chapter-08-production/production-ai-practices.md)

## Вступ

Цей всебічний посібник з усунення несправностей охоплює найчастіші проблеми, які виникають при використанні Azure Developer CLI. Навчіться діагностувати, усувати несправності та вирішувати поширені проблеми з автентифікацією, розгортанням, наданням інфраструктури та конфігурацією додатків. Кожна проблема включає докладні симптоми, кореневі причини та покрокові процедури вирішення.

## Цілі навчання

Виконавши цей посібник, ви:
- Освоїте методи діагностики проблем Azure Developer CLI
- Зрозумієте поширені проблеми з автентифікацією та дозволами і їхні рішення
- Навчитеся вирішувати помилки розгортання, помилки надання інфраструктури та проблеми конфігурації
- Впровадите проактивний моніторинг і стратегії налагодження
- Застосуєте систематичні методи усунення несправностей для складних проблем
- Налаштуєте правильний журнал подій і моніторинг для запобігання майбутнім проблемам

## Результати навчання

Після завершення ви зможете:
- Діагностувати проблеми Azure Developer CLI за допомогою вбудованих інструментів діагностики
- Самостійно вирішувати проблеми з автентифікацією, підписками та дозволами
- Ефективно усувати помилки розгортання та проблеми надання інфраструктури
- Налагоджувати проблеми конфігурації додатків і проблеми, специфічні для середовища
- Впроваджувати моніторинг та сповіщення для проактивного виявлення потенційних проблем
- Застосовувати найкращі практики ведення журналів, налагодження та робочих процесів вирішення проблем

## Швидка діагностика

Перш ніж переходити до конкретних проблем, виконайте ці команди для збору діагностичної інформації:

```bash
# Перевірте версію та стан azd
azd version
azd config show

# Перевірте автентифікацію в Azure
az account show
az account list

# Перевірте поточне середовище
azd env list
azd env get-values

# Увімкніть налагоджувальне логування
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми автентифікації

### Проблема: "Не вдалося отримати токен доступу"
**Симптоми:**
- `azd up` не вдається через помилки автентифікації
- Команди повертають "неавторизовано" або "доступ заборонено"

**Рішення:**
```bash
# 1. Повторно аутентифікуйтесь за допомогою Azure CLI
az login
az account show

# 2. Очистіть кешовані облікові дані
az account clear
az login

# 3. Використовуйте потік коду пристрою (для безголових систем)
az login --use-device-code

# 4. Встановіть явну підписку
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблема: "Недостатньо привілеїв" під час розгортання
**Симптоми:**
- Розгортання завершується з помилками дозволів
- Неможливо створити певні ресурси Azure

**Рішення:**
```bash
# 1. Перевірте ваші призначення ролей в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Переконайтеся, що у вас є необхідні ролі
# - Співавтор (для створення ресурсів)
# - Адміністратор доступу користувачів (для призначення ролей)

# 3. Зверніться до свого адміністратора Azure для отримання відповідних дозволів
```

### Проблема: Проблеми багатокористувацької автентифікації
**Рішення:**
```bash
# 1. Увійти з певним орендарем
az login --tenant "your-tenant-id"

# 2. Встановити орендаря в конфігурації
azd config set auth.tenantId "your-tenant-id"

# 3. Очистити кеш орендаря при зміні орендаря
az account clear
```

## 🏗️ Помилки надання інфраструктури

### Проблема: Конфлікти імен ресурсів
**Симптоми:**
- Помилки "Ім’я ресурсу вже існує"
- Розгортання не вдається під час створення ресурсу

**Рішення:**
```bash
# 1. Використовуйте унікальні імена ресурсів з токенами
# У вашому шаблоні Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Змініть ім’я середовища
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Очистіть існуючі ресурси
azd down --force --purge
```

### Проблема: Локація/Регіон недоступний
**Симптоми:**
- "Локація 'xyz' недоступна для типу ресурсу"
- Деякі SKU недоступні у вибраному регіоні

**Рішення:**
```bash
# 1. Перевірте доступні розташування для типів ресурсів
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Використовуйте загальнодоступні регіони
azd config set defaults.location eastus2
# або
azd env set AZURE_LOCATION eastus2

# 3. Перевірте доступність служби за регіоном
# Відвідайте: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблема: Перевищено квоту
**Симптоми:**
- "Перевищено квоту для типу ресурсу"
- "Досягнуто максимальну кількість ресурсів"

**Рішення:**
```bash
# 1. Перевірте поточне використання квоти
az vm list-usage --location eastus2 -o table

# 2. Запросіть збільшення квоти через портал Azure
# Перейдіть до: Підписки > Використання + квоти

# 3. Використовуйте менші SKU для розробки
# У main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Очистіть невикористані ресурси
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблема: Помилки шаблону Bicep
**Симптоми:**
- Помилки валідації шаблону
- Синтаксичні помилки у файлах Bicep

**Рішення:**
```bash
# 1. Перевірити синтаксис Bicep
az bicep build --file infra/main.bicep

# 2. Використати лінтер Bicep
az bicep lint --file infra/main.bicep

# 3. Перевірити синтаксис файлу параметрів
cat infra/main.parameters.json | jq '.'

# 4. Попередньо переглянути зміни розгортання
azd provision --preview
```

## 🚀 Збої розгортання

### Проблема: Збої під час збірки
**Симптоми:**
- Додаток не збирається під час розгортання
- Помилки встановлення пакетів

**Рішення:**
```bash
# 1. Перевірте вивід збірки з прапорцем налагодження
azd deploy --service web --debug

# 2. Переглянути статус розгорнутого сервісу
azd show

# 3. Тестувати збірку локально
cd src/web
npm install
npm run build

# 3. Перевірити сумісність версій Node.js/Python
node --version  # Має відповідати налаштуванням azure.yaml
python --version

# 4. Очистити кеш збірки
rm -rf node_modules package-lock.json
npm install

# 5. Перевірити Dockerfile, якщо використовуються контейнери
docker build -t test-image .
docker run --rm test-image
```

### Проблема: Збої розгортання контейнерів
**Симптоми:**
- Контейнерні додатки не запускаються
- Помилки завантаження образів

**Рішення:**
```bash
# 1. Тестування збірки Docker локально
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Перевірте журнали контейнерів за допомогою Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Моніторинг застосунку через azd
azd monitor --logs

# 3. Перевірте доступ до реєстру контейнерів
az acr login --name myregistry

# 4. Перевірте конфігурацію контейнерного застосунку
az containerapp show --name my-app --resource-group my-rg
```

### Проблема: Збої підключення до бази даних
**Симптоми:**
- Додаток не може підключитися до бази даних
- Помилки таймауту підключення

**Рішення:**
```bash
# 1. Перевірте правила брандмауера бази даних
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Перевірте з'єднання з додатком
# Тимчасово додайте до вашого додатка:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Перевірте формат рядка підключення
azd env get-values | grep DATABASE

# 4. Перевірте статус сервера бази даних
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Проблеми конфігурації

### Проблема: Змінні оточення не працюють
**Симптоми:**
- Додаток не читає значення конфігурації
- Змінні оточення здаються порожніми

**Рішення:**
```bash
# 1. Перевірте, чи встановлені змінні середовища
azd env get-values
azd env get DATABASE_URL

# 2. Перевірте імена змінних у файлі azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Перезапустіть застосунок
azd deploy --service web

# 4. Перевірте конфігурацію служби застосунку
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблема: Проблеми з SSL/TLS сертифікатами
**Симптоми:**
- HTTPS не працює
- Помилки валідації сертифікатів

**Рішення:**
```bash
# 1. Перевірте стан SSL-сертифіката
az webapp config ssl list --resource-group myrg

# 2. Увімкніть лише HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Додайте власний домен (за потребою)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблема: Проблеми конфігурації CORS
**Симптоми:**
- Фронтенд не може викликати API
- Заблоковано крос-доменний запит

**Рішення:**
```bash
# 1. Налаштуйте CORS для App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Оновіть API для обробки CORS
# В Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Перевірте, чи запущено на правильних URL-адресах
azd show
```

## 🌍 Проблеми управління середовищем

### Проблема: Проблеми при переключенні середовищ
**Симптоми:**
- Використовується неправильне середовище
- Конфігурація не переключається належним чином

**Рішення:**
```bash
# 1. Перелік усіх середовищ
azd env list

# 2. Явно вибрати середовище
azd env select production

# 3. Перевірити поточне середовище
azd env list

# 4. Створити нове середовище, якщо пошкоджене
azd env new production-new
azd env select production-new
```

### Проблема: Корупція середовища
**Симптоми:**
- Середовище показує недійсний стан
- Ресурси не відповідають конфігурації

**Рішення:**
```bash
# 1. Оновити стан середовища
azd env refresh

# 2. Скинути конфігурацію середовища
azd env new production-reset
# Скопіювати необхідні змінні середовища
azd env set DATABASE_URL "your-value"

# 3. Імпортувати існуючі ресурси (якщо можливо)
# Ручне оновлення .azure/production/config.json із ідентифікаторами ресурсів
```

## 🔍 Проблеми продуктивності

### Проблема: Повільний час розгортання
**Симптоми:**
- Розгортання займають надто багато часу
- Таймаути під час розгортання

**Рішення:**
```bash
# 1. Розгорнути конкретні сервіси для швидшої ітерації
azd deploy --service web
azd deploy --service api

# 2. Використовувати розгортання тільки коду, коли інфраструктура не змінена
azd deploy  # Швидше за azd up

# 3. Оптимізувати процес збірки
# У package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Перевірити розташування ресурсів (використовувати той самий регіон)
azd config set defaults.location eastus2
```

### Проблема: Проблеми продуктивності додатка
**Симптоми:**
- Повільне реагування
- Високе використання ресурсів

**Рішення:**
```bash
# 1. Масштабувати ресурси
# Оновіть SKU у main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Увімкнути моніторинг Application Insights
azd monitor --overview

# 3. Перевірте журнали додатків в Azure
az webapp log tail --name myapp --resource-group myrg
# або для додатків контейнерів:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Реалізуйте кешування
# Додайте Redis кеш до вашої інфраструктури
```

## 🛠️ Інструменти та команди для усунення несправностей

### Команди для налагодження
```bash
# Комплексне налагодження
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Перевірте версію azd
azd version

# Переглянути поточну конфігурацію
azd config show

# Перевірка з'єднання
curl -v https://myapp.azurewebsites.net/health
```

### Аналіз журналів
```bash
# Журнали застосунку через Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Моніторинг застосунку за допомогою azd
azd monitor --logs
azd monitor --live

# Журнали ресурсів Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Журнали контейнерів (для Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Дослідження ресурсів
```bash
# Перелік усіх ресурсів
az resource list --resource-group myrg -o table

# Перевірка стану ресурсу
az webapp show --name myapp --resource-group myrg --query state

# Мережеві діагностики
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Отримання додаткової допомоги

### Коли звертатися вище
- Проблеми автентифікації залишаються після застосування всіх рішень
- Проблеми інфраструктури з сервісами Azure
- Проблеми з оплатою або підписками
- Питання безпеки або інциденти

### Канали підтримки
```bash
# 1. Перевірте стан служби Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Створіть запит до служби підтримки Azure
# Перейдіть за адресою: https://portal.azure.com -> Допомога + підтримка

# 3. Ресурси спільноти
# - Stack Overflow: тег azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Інформація для збору
Перед зверненням до підтримки зберіть:
- Вивід `azd version`
- Вивід `azd config show`
- Вивід `azd show` (статус поточного розгортання)
- Повні текстові повідомлення про помилки
- Кроки для відтворення проблеми
- Деталі середовища (`azd env get-values`)
- Хронологію початку проблеми

### Скрипт для збору журналів
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Запобігання проблемам

### Перевірочний список перед розгортанням
```bash
# 1. Перевірити автентифікацію
az account show

# 2. Перевірити квоти та ліміти
az vm list-usage --location eastus2

# 3. Перевірити шаблони
az bicep build --file infra/main.bicep

# 4. Спочатку протестувати локально
npm run build
npm run test

# 5. Використовувати розгортання в режимі тестування
azd provision --preview
```

### Налаштування моніторингу
```bash
# Увімкніть Application Insights
# Додайте до main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Налаштуйте сповіщення
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Регулярне обслуговування
```bash
# Щотижневі перевірки стану здоров'я
./scripts/health-check.sh

# Щомісячний огляд витрат
az consumption usage list --billing-period-name 202401

# Щоквартальний огляд безпеки
az security assessment list --resource-group myrg
```

## Пов’язані ресурси

- [Посібник з налагодження](debugging.md) - Розширені техніки налагодження
- [Надання ресурсів](../chapter-04-infrastructure/provisioning.md) - Усунення несправностей інфраструктури
- [Планування ємності](../chapter-06-pre-deployment/capacity-planning.md) - Рекомендації з планування ресурсів
- [Вибір SKU](../chapter-06-pre-deployment/sku-selection.md) - Рекомендації щодо рівнів послуг

---

**Підказка**: Збережіть цей посібник у закладках і звертайтеся до нього щоразу, коли стикаєтеся з проблемами. Більшість проблем уже зустрічалися раніше і мають перевірені рішення!

---

**Навігація**
- **Попередній урок**: [Надання ресурсів](../chapter-04-infrastructure/provisioning.md)
- **Наступний урок**: [Посібник з налагодження](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний переклад людиною. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->