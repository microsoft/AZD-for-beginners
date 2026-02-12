# Загальні проблеми та рішення

**Навігація по главах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточна глава**: Глава 7 - Виправлення неполадок та налагодження
- **⬅️ Попередня глава**: [Глава 6: Перевірки перед розгортанням](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Далі**: [Посібник з налагодження](debugging.md)
- **🚀 Наступна глава**: [Глава 8: Патерни для продакшну та підприємств](../chapter-08-production/production-ai-practices.md)

## Вступ

Цей вичерпний посібник з виправлення неполадок охоплює найпоширеніші проблеми під час використання Azure Developer CLI. Навчіться діагностувати, усувати несправності та вирішувати типові проблеми з автентифікацією, розгортанням, провізіюванням інфраструктури та конфігурацією додатків. Кожна проблема містить детальні симптоми, корені причин і покрокові процедури вирішення.

## Цілі навчання

Після проходження цього посібника ви зможете:
- Опановувати методи діагностики проблем Azure Developer CLI
- Розуміти поширені проблеми з автентифікацією та правами доступу і шукати їх рішення
- Вирішувати збої розгортання, помилки провізіювання інфраструктури та проблеми з конфігурацією
- Запроваджувати проактивний моніторинг та стратегії налагодження
- Застосовувати системні методи усунення неполадок для складних проблем
- Налаштовувати коректний логінг і моніторинг, щоб запобігти майбутнім проблемам

## Результати навчання

Після завершення ви зможете:
- Діагностувати проблеми Azure Developer CLI за допомогою вбудованих інструментів діагностики
- Самостійно вирішувати проблеми, пов'язані з автентифікацією, підписками та правами доступу
- Ефективно усувати несправності розгортання та помилки провізіювання інфраструктури
- Налагоджувати проблеми конфігурації додатків та специфічні для середовища проблеми
- Запроваджувати моніторинг і оповіщення для проактивного виявлення потенційних проблем
- Застосовувати найкращі практики для логування, налагодження та робочих процесів вирішення проблем

## Швидка діагностика

Перш ніж заглиблюватися в конкретні проблеми, запустіть ці команди для збору діагностичної інформації:

```bash
# Перевірити версію та стан azd
azd version
azd config list

# Перевірити автентифікацію в Azure
az account show
az account list

# Перевірити поточне середовище
azd env show
azd env get-values

# Увімкнути налагоджувальне журналювання
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми автентифікації

### Проблема: "Failed to get access token"
**Симптоми:**
- `azd up` завершується з помилками автентифікації
- Команди повертають "unauthorized" або "access denied"

**Рішення:**
```bash
# 1. Повторно автентифікуватися за допомогою Azure CLI
az login
az account show

# 2. Очистити кешовані облікові дані
az account clear
az login

# 3. Використати потік коду пристрою (для безголових систем)
az login --use-device-code

# 4. Вказати конкретну підписку
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблема: "Insufficient privileges" під час розгортання
**Симптоми:**
- Розгортання не вдається через помилки прав
- Не вдається створити певні ресурси Azure

**Рішення:**
```bash
# 1. Перевірте призначення ролей у Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Переконайтеся, що у вас є необхідні ролі
# - Contributor (для створення ресурсів)
# - User Access Administrator (для призначення ролей)

# 3. Зверніться до адміністратора Azure, щоб отримати відповідні дозволи
```

### Проблема: Проблеми автентифікації в мультиорендному середовищі
**Рішення:**
```bash
# 1. Увійти з конкретним орендарем
az login --tenant "your-tenant-id"

# 2. Встановити орендаря в конфігурації
azd config set auth.tenantId "your-tenant-id"

# 3. Очистити кеш орендаря при перемиканні між орендарями
az account clear
```

## 🏗️ Помилки при створенні інфраструктури

### Проблема: Конфлікти імен ресурсів
**Симптоми:**
- Помилки "The resource name already exists"
- Розгортання не вдається під час створення ресурсу

**Рішення:**
```bash
# 1. Використовуйте унікальні імена ресурсів з токенами
# У вашому шаблоні Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Змініть назву середовища
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Очистіть існуючі ресурси
azd down --force --purge
```

### Проблема: Обрана локація/регіон недоступна
**Симптоми:**
- "The location 'xyz' is not available for resource type"
- Деякі SKU недоступні у вибраному регіоні

**Рішення:**
```bash
# 1. Перевірте доступні розташування для типів ресурсів
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Використовуйте загальнодоступні регіони
azd config set defaults.location eastus2
# або
azd env set AZURE_LOCATION eastus2

# 3. Перевірте доступність служби за регіонами
# Відвідайте: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблема: Перевищено квоти
**Симптоми:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

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

# 4. Видаліть невикористані ресурси
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблема: Помилки шаблонів Bicep
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

# 4. Переглянути зміни розгортання
azd provision --preview
```

## 🚀 Помилки розгортання

### Проблема: Збої збірки
**Симптоми:**
- Додаток не збирається під час розгортання
- Помилки встановлення пакетів

**Рішення:**
```bash
# 1. Перевірити вивід збірки з прапорцем налагодження
azd deploy --service web --debug

# 2. Переглянути стан розгорнутої служби
azd show

# 3. Протестувати збірку локально
cd src/web
npm install
npm run build

# 3. Перевірити сумісність версій Node.js та Python
node --version  # Повинно відповідати налаштуванням azure.yaml
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
- Помилки завантаження образу

**Рішення:**
```bash
# 1. Перевірте збірку Docker локально
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Перевірте журнали контейнера за допомогою Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Слідкуйте за додатком через azd
azd monitor --logs

# 3. Перевірте доступ до реєстру контейнерів
az acr login --name myregistry

# 4. Перевірте конфігурацію контейнерного додатка
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

# 2. Перевірте підключення з додатка
# Тимчасово додайте у ваш додаток:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Перевірте формат рядка підключення
azd env get-values | grep DATABASE

# 4. Перевірте стан сервера бази даних
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Проблеми конфігурації

### Проблема: Змінні середовища не працюють
**Симптоми:**
- Додаток не може прочитати значення конфігурації
- Змінні середовища здаються порожніми

**Рішення:**
```bash
# 1. Переконайтеся, що змінні середовища встановлені
azd env get-values
azd env get DATABASE_URL

# 2. Перевірте імена змінних у azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Перезапустіть додаток
azd deploy --service web

# 4. Перевірте конфігурацію служби додатка
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблема: Проблеми з SSL/TLS сертифікатами
**Симптоми:**
- HTTPS не працює
- Помилки валідації сертифіката

**Рішення:**
```bash
# 1. Перевірити стан SSL-сертифіката
az webapp config ssl list --resource-group myrg

# 2. Увімкнути лише HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Додати власний домен (за потреби)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблема: Налаштування CORS
**Симптоми:**
- Фронтенд не може викликати API
- Запит з іншого походження заблоковано

**Рішення:**
```bash
# 1. Налаштуйте CORS для App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Оновіть API для обробки CORS
# У Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Перевірте, чи запущено на правильних URL-адресах
azd show
```

## 🌍 Проблеми управління середовищем

### Проблема: Проблеми з перемиканням середовищ
**Симптоми:**
- Використовується неправильне середовище
- Конфігурація не переключається належним чином

**Рішення:**
```bash
# 1. Перелічити всі середовища
azd env list

# 2. Явно вибрати середовище
azd env select production

# 3. Перевірити поточне середовище
azd env show

# 4. Створити нове середовище, якщо воно пошкоджене
azd env new production-new
azd env select production-new
```

### Проблема: Корумповане середовище
**Симптоми:**
- Середовище показує некоректний стан
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
# Вручну оновіть .azure/production/config.json, вказавши ідентифікатори ресурсів
```

## 🔍 Проблеми продуктивності

### Проблема: Повільне розгортання
**Симптоми:**
- Розгортання займає занадто багато часу
- Таймаути під час розгортання

**Рішення:**
```bash
# 1. Розгортайте конкретні служби для швидшої ітерації
azd deploy --service web
azd deploy --service api

# 2. Використовуйте розгортання тільки коду, коли інфраструктура незмінна
azd deploy  # Швидше, ніж azd up

# 3. Оптимізуйте процес збірки
# У файлі package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Перевірте розташування ресурсів (використовуйте той самий регіон)
azd config set defaults.location eastus2
```

### Проблема: Проблеми продуктивності додатка
**Симптоми:**
- Повільні відповіді
- Високе використання ресурсів

**Рішення:**
```bash
# 1. Збільште ресурси
# Оновіть SKU у main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Увімкніть моніторинг Application Insights
azd monitor --overview

# 3. Перевірте журнали додатку в Azure
az webapp log tail --name myapp --resource-group myrg
# або для Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Впровадьте кешування
# Додайте кеш Redis до вашої інфраструктури
```

## 🛠️ Інструменти та команди для виправлення неполадок

### Команди для налагодження
```bash
# Комплексне налагодження
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Перевірити версію azd
azd version

# Переглянути поточну конфігурацію
azd config list

# Перевірити підключення
curl -v https://myapp.azurewebsites.net/health
```

### Аналіз логів
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
# Перелічити всі ресурси
az resource list --resource-group myrg -o table

# Перевірити стан ресурсу
az webapp show --name myapp --resource-group myrg --query state

# Діагностика мережі
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Отримання додаткової допомоги

### Коли ескалювати
- Проблеми автентифікації тривають після спроб усіх рішень
- Проблеми з інфраструктурою на боці сервісів Azure
- Питання, пов'язані з білінгом або підпискою
- Проблеми безпеки або інциденти

### Канали підтримки
```bash
# 1. Перевірте Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Створіть звернення до служби підтримки Azure
# Перейдіть на: https://portal.azure.com -> Довідка та підтримка

# 3. Ресурси спільноти
# - Stack Overflow: тег azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Інформація, яку потрібно зібрати
Перед зверненням до підтримки зберіть:
- `azd version` output
- `azd config list` output
- `azd show` output (поточний статус розгортання)
- Повні тексти повідомлень про помилки
- Кроки для відтворення проблеми
- Деталі середовища (`azd env show`)
- Хронологію появи проблеми

### Скрипт збору логів
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Запобігання проблемам

### Контрольний список перед розгортанням
```bash
# 1. Перевірте автентифікацію
az account show

# 2. Перевірте квоти та обмеження
az vm list-usage --location eastus2

# 3. Перевірте шаблони
az bicep build --file infra/main.bicep

# 4. Спочатку протестуйте локально
npm run build
npm run test

# 5. Використовуйте розгортання в режимі пробного запуску
azd provision --preview
```

### Налаштування моніторингу
```bash
# Увімкнути Application Insights
# Додати до main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Налаштувати сповіщення
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Регулярне обслуговування
```bash
# Щотижневі перевірки стану
./scripts/health-check.sh

# Щомісячний перегляд витрат
az consumption usage list --billing-period-name 202401

# Квартальний перегляд безпеки
az security assessment list --resource-group myrg
```

## Пов’язані ресурси

- [Посібник з налагодження](debugging.md) - Розширені методи налагодження
- [Надання ресурсів](../chapter-04-infrastructure/provisioning.md) - Виправлення неполадок інфраструктури
- [Планування потужностей](../chapter-06-pre-deployment/capacity-planning.md) - Рекомендації щодо планування ресурсів
- [Вибір SKU](../chapter-06-pre-deployment/sku-selection.md) - Рекомендації щодо рівня сервісу

---

**Порада**: Збережіть цей посібник у закладках і звертайтеся до нього щоразу, коли виникають проблеми. Більшість проблем вже траплялися раніше і мають відпрацьовані рішення!

---

**Навігація**
- **Попередній урок**: [Надання ресурсів](../chapter-04-infrastructure/provisioning.md)
- **Наступний урок**: [Посібник з налагодження](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Відмова від відповідальності:
Цей документ було перекладено за допомогою сервісу перекладу на основі ШІ [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматизовані переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звернутися до професійного перекладача. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->