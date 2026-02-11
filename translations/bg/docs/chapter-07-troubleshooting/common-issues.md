# Чести проблеми и решения

**Навигация в глава:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и отладка
- **⬅️ Предишна глава**: [Глава 6: Предварителни проверки](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следващо**: [Ръководство за отстраняване на грешки](debugging.md)
- **🚀 Следваща глава**: [Глава 8: Патерни за продукция и предприятия](../chapter-08-production/production-ai-practices.md)

## Въведение

Това изчерпателно ръководство за отстраняване на проблеми покрива най-често срещаните проблеми при използване на Azure Developer CLI. Научете как да диагностицирате, отстранявате и разрешавате чести проблеми с удостоверяване, внедряване, предоставяне на инфраструктура и конфигуриране на приложения. Всеки проблем включва подробни симптоми, основни причини и стъпка по стъпка процедури за решаване.

## Цели на обучението

След завършване на това ръководство вие ще:
- Усвоите диагностични техники за проблеми с Azure Developer CLI
- Разберете често срещани проблеми с удостоверяването и разрешенията и техните решения
- Разрешавате неуспехи при внедряване, грешки при предоставяне на инфраструктура и проблеми с конфигурацията
- Внедрите проактивни стратегии за наблюдение и отстраняване на грешки
- Приложите систематични методологии за отстраняване на сложни проблеми
- Конфигурирате правилно логване и мониторинг за предотвратяване на бъдещи проблеми

## Очаквани резултати

След завършване ще можете да:
- Диагностицирате проблеми с Azure Developer CLI с вградените диагностични инструменти
- Разрешавате проблеми, свързани с удостоверяване, абонамент и разрешения самостоятелно
- Отстранявате неуспехи при внедряване и грешки при предоставяне на инфраструктура ефективно
- Отстранявате проблеми с конфигурацията на приложения и проблеми, специфични за средата
- Внедрите мониторинг и алармиране за проактивно идентифициране на потенциални проблеми
- Прилагате добри практики за логване, отстраняване на грешки и работни процеси за решаване на проблеми

## Бърза диагностика

Преди да се потопите в конкретни проблеми, изпълнете тези команди, за да съберете диагностична информация:

```bash
# Проверете версията и състоянието на azd
azd version
azd config list

# Проверете удостоверяването в Azure
az account show
az account list

# Проверете текущата среда
azd env show
azd env get-values

# Включете регистрирането за отстраняване на грешки
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми с удостоверяването

### Проблем: "Failed to get access token"
**Симптоми:**
- `azd up` не успява с грешки за удостоверяване
- Командите връщат "unauthorized" или "access denied"

**Решения:**
```bash
# 1. Повторно се удостоверете чрез Azure CLI
az login
az account show

# 2. Изчистете кешираните идентификационни данни
az account clear
az login

# 3. Използвайте поток с код на устройството (за системи без графичен интерфейс)
az login --use-device-code

# 4. Задайте конкретен абонамент
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблем: "Insufficient privileges" по време на внедряване
**Симптоми:**
- Внедряването се проваля с грешки за разрешения
- Не може да се създадат определени ресурси в Azure

**Решения:**
```bash
# 1. Проверете назначените ви роли в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Уверете се, че имате необходимите роли
# - Contributor (за създаване на ресурси)
# - User Access Administrator (за назначаване на роли)

# 3. Свържете се с администратора на Azure за необходимите разрешения
```

### Проблем: Проблеми с многонаTenant удостоверяване
**Решения:**
```bash
# 1. Вход с конкретен наемател
az login --tenant "your-tenant-id"

# 2. Задаване на наемател в конфигурацията
azd config set auth.tenantId "your-tenant-id"

# 3. Изчистване на кеша при смяна на наематели
az account clear
```

## 🏗️ Грешки при предоставяне на инфраструктура

### Проблем: Конфликти на имена на ресурси
**Симптоми:**
- Грешки "The resource name already exists"
- Внедряването се проваля по време на създаване на ресурси

**Решения:**
```bash
# 1. Използвайте уникални имена на ресурси с токени
# Във вашия Bicep шаблон:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Променете името на средата
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Почистете съществуващите ресурси
azd down --force --purge
```

### Проблем: Локация/регион не е наличен
**Симптоми:**
- "The location 'xyz' is not available for resource type"
- Някои SKU не са налични в избрания регион

**Решения:**
```bash
# 1. Проверете наличните местоположения за типовете ресурси
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Използвайте обичайно налични региони
azd config set defaults.location eastus2
# или
azd env set AZURE_LOCATION eastus2

# 3. Проверете наличността на услугите по региони
# Посетете: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблем: Превишен лимит (quota exceeded)
**Симптоми:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Решения:**
```bash
# 1. Проверете текущото използване на квотата
az vm list-usage --location eastus2 -o table

# 2. Заявете увеличаване на квотата чрез портала на Azure
# Отидете на: Абонаменти > Използване и квоти

# 3. Използвайте по-малки SKU-та за разработка
# В main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Премахнете неизползваните ресурси
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблем: Грешки в Bicep шаблони
**Симптоми:**
- Неуспехи при валидация на шаблони
- Синтактични грешки в Bicep файлове

**Решения:**
```bash
# 1. Провери синтаксиса на Bicep
az bicep build --file infra/main.bicep

# 2. Използвай линтер за Bicep
az bicep lint --file infra/main.bicep

# 3. Провери синтаксиса на файла с параметри
cat infra/main.parameters.json | jq '.'

# 4. Прегледай промените при разгръщане
azd provision --preview
```

## 🚀 Неуспехи при внедряване

### Проблем: Грешки при билд
**Симптоми:**
- Приложението не се компилира по време на внедряване
- Грешки при инсталиране на пакети

**Решения:**
```bash
# 1. Проверете изхода от изграждането с флаг за отстраняване на грешки
azd deploy --service web --debug

# 2. Прегледайте състоянието на разположената услуга
azd show

# 3. Тествайте изграждането локално
cd src/web
npm install
npm run build

# 3. Проверете съвместимостта на версиите на Node.js/Python
node --version  # Трябва да съответства на настройките в azure.yaml
python --version

# 4. Изчистете кеша на изграждането
rm -rf node_modules package-lock.json
npm install

# 5. Проверете Dockerfile, ако използвате контейнери
docker build -t test-image .
docker run --rm test-image
```

### Проблем: Грешки при разгръщане на контейнери
**Симптоми:**
- Контейнерните приложения не стартират
- Грешки при изтегляне на образи

**Решения:**
```bash
# 1. Тествайте локално изграждането на Docker
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Проверете логовете на контейнера с Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Наблюдавайте приложението чрез azd
azd monitor --logs

# 3. Проверете достъпа до регистъра на контейнерите
az acr login --name myregistry

# 4. Проверете конфигурацията на контейнерното приложение
az containerapp show --name my-app --resource-group my-rg
```

### Проблем: Грешки при свързване с база данни
**Симптоми:**
- Приложението не може да се свърже с базата данни
- Грешки за таймаут при връзка

**Решения:**
```bash
# 1. Проверете правилата на защитната стена на базата данни
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Тествайте свързаността от приложението
# Добавете временно във вашето приложение:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Проверете формата на низа за връзка
azd env get-values | grep DATABASE

# 4. Проверете състоянието на сървъра на базата данни
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Проблеми с конфигурацията

### Проблем: Променливи на средата не работят
**Симптоми:**
- Приложението не може да прочете стойности за конфигурация
- Променливите на средата изглеждат празни

**Решения:**
```bash
# 1. Проверете дали променливите на средата са зададени
azd env get-values
azd env get DATABASE_URL

# 2. Проверете имената на променливите в azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Рестартирайте приложението
azd deploy --service web

# 4. Проверете конфигурацията на App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблем: SSL/TLS проблеми с сертификати
**Симптоми:**
- HTTPS не работи
- Грешки при валидация на сертификати

**Решения:**
```bash
# 1. Проверете състоянието на SSL сертификата
az webapp config ssl list --resource-group myrg

# 2. Разрешете само HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Добавете персонализиран домейн (ако е необходимо)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблем: Проблеми с CORS конфигурацията
**Симптоми:**
- Фронтендът не може да извика API
- Заявката от различен произход е блокирана

**Решения:**
```bash
# 1. Конфигурирайте CORS за App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Актуализирайте API, за да обработва CORS
# В Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Проверете дали работи на правилните URL адреси
azd show
```

## 🌍 Проблеми при управление на среди

### Проблем: Проблеми със смяна на среда
**Симптоми:**
- Използва се грешна среда
- Конфигурацията не се сменя правилно

**Решения:**
```bash
# 1. Изброяване на всички среди
azd env list

# 2. Изрично избиране на среда
azd env select production

# 3. Проверка на текущата среда
azd env show

# 4. Създаване на нова среда, ако е повредена
azd env new production-new
azd env select production-new
```

### Проблем: Корупция на средата
**Симптоми:**
- Средата показва невалидно състояние
- Ресурсите не съвпадат с конфигурацията

**Решения:**
```bash
# 1. Обнови състоянието на средата
azd env refresh

# 2. Нулирай конфигурацията на средата
azd env new production-reset
# Копирай необходимите променливи на средата
azd env set DATABASE_URL "your-value"

# 3. Импортирай съществуващите ресурси (ако е възможно)
# Ръчно актуализирай .azure/production/config.json с идентификаторите на ресурсите
```

## 🔍 Проблеми с производителността

### Проблем: Бавно време за внедряване
**Симптоми:**
- Внедряванията отнемат твърде дълго
- Таймаути по време на внедряване

**Решения:**
```bash
# 1. Разгръщайте конкретни услуги за по-бързи итерации
azd deploy --service web
azd deploy --service api

# 2. Използвайте разгръщане само на кода, когато инфраструктурата не се променя
azd deploy  # По-бързо от azd up

# 3. Оптимизирайте процеса на изграждане
# В package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Проверете местоположенията на ресурсите (използвайте същия регион)
azd config set defaults.location eastus2
```

### Проблем: Проблеми с производителността на приложението
**Симптоми:**
- Бавни отговори
- Висока употреба на ресурси

**Решения:**
```bash
# 1. Увеличете ресурсите
# Актуализирайте SKU във main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Активирайте мониторинга на Application Insights
azd monitor --overview

# 3. Проверете логовете на приложението в Azure
az webapp log tail --name myapp --resource-group myrg
# или за Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Внедрете кеширане
# Добавете Redis кеш към вашата инфраструктура
```

## 🛠️ Инструменти и команди за отстраняване на проблеми

### Команди за отстраняване на грешки
```bash
# Изчерпателно отстраняване на грешки
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Провери версията на azd
azd version

# Виж текущата конфигурация
azd config list

# Тествай свързаността
curl -v https://myapp.azurewebsites.net/health
```

### Анализ на логове
```bash
# Дневници на приложението чрез Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Наблюдавайте приложението с azd
azd monitor --logs
azd monitor --live

# Дневници на ресурсите в Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Дневници на контейнерите (за Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Проучване на ресурси
```bash
# Изброи всички ресурси
az resource list --resource-group myrg -o table

# Провери състоянието на ресурса
az webapp show --name myapp --resource-group myrg --query state

# Диагностика на мрежата
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Получаване на допълнителна помощ

### Кога да ескалирате
- Проблемите с удостоверяването продължават след изпробване на всички решения
- Проблеми с инфраструктурата и услуги на Azure
- Въпроси, свързани с фактуриране или абонаменти
- Проблеми със сигурността или инциденти

### Канали за поддръжка
```bash
# 1. Проверете здравето на услугите на Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Създайте заявка за поддръжка в Azure
# Отидете на: https://portal.azure.com -> Помощ и поддръжка

# 3. Ресурси на общността
# - Stack Overflow: таг azure-developer-cli
# - Issues в GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Информация за събиране
Преди да се свържете с поддръжката, съберете:
- `azd version` output
- `azd config list` output
- `azd show` output (текущ статус на внедряване)
- Съобщения за грешки (пълен текст)
- Стъпки за възпроизвеждане на проблема
- Подробности за средата (`azd env show`)
- Хронология кога е започнал проблемът

### Скрипт за събиране на логове
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

## 📊 Предотвратяване на проблеми

### Контролен списък преди внедряване
```bash
# 1. Проверете удостоверяването
az account show

# 2. Проверете квотите и ограниченията
az vm list-usage --location eastus2

# 3. Проверете шаблоните
az bicep build --file infra/main.bicep

# 4. Тествайте първо локално
npm run build
npm run test

# 5. Използвайте симулирани разгръщания
azd provision --preview
```

### Настройка на мониторинг
```bash
# Активирайте Application Insights
# Добавете в main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Настройте предупреждения
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Редовна поддръжка
```bash
# Седмични проверки на състоянието
./scripts/health-check.sh

# Месечен преглед на разходите
az consumption usage list --billing-period-name 202401

# Тримесечен преглед на сигурността
az security assessment list --resource-group myrg
```

## Свързани ресурси

- [Ръководство за отстраняване на грешки](debugging.md) - Разширени техники за отстраняване на грешки
- [Предоставяне на ресурси](../chapter-04-infrastructure/provisioning.md) - Отстраняване на проблеми с инфраструктурата
- [Планиране на капацитет](../chapter-06-pre-deployment/capacity-planning.md) - Насоки за планиране на ресурси
- [Избор на SKU](../chapter-06-pre-deployment/sku-selection.md) - Препоръки за нива на услуга

---

**Съвет**: Запазете това ръководство в отметки и го консултирайте винаги, когато срещнете проблеми. Повечето проблеми вече са били наблюдавани и имат установени решения!

---

**Навигация**
- **Предишен урок**: [Предоставяне на ресурси](../chapter-04-infrastructure/provisioning.md)
- **Следващ урок**: [Ръководство за отстраняване на грешки](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен чрез AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод от квалифициран преводач. Ние не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->