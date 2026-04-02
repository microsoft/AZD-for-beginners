# Чести проблеми и решения

**Навигация в глава:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и отстраняване на грешки
- **⬅️ Предишна глава**: [Глава 6: Предварителни проверки](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следващо**: [Ръководство за отстраняване на грешки](debugging.md)
- **🚀 Следваща глава**: [Глава 8: Производствени и корпоративни модели](../chapter-08-production/production-ai-practices.md)

## Въведение

Това изчерпателно ръководство за отстраняване на проблеми покрива най-често срещаните затруднения при използване на Azure Developer CLI. Научете как да диагностицирате, отстранявате и разрешавате често срещани проблеми с удостоверяване, разгръщане, осигуряване на инфраструктура и конфигурация на приложения. Всеки проблем включва подробни симптоми, основни причини и стъпки за решаване.

## Цели за учене

След завършване на това ръководство ще можете да:
- Овладеете диагностични техники за проблеми с Azure Developer CLI
- Разбирате често срещани проблеми с удостоверяване и разрешения и техните решения
- Разрешавате неуспехи при разгръщане, грешки при осигуряване на инфраструктура и конфигурационни проблеми
- Прилагате стратегии за предварително наблюдение и отстраняване на грешки
- Използвате систематични методологии за отстраняване на сложни проблеми
- Конфигурирате правилно логване и мониторинг за предотвратяване на бъдещи затруднения

## Резултати от ученето

След завършване ще можете да:
- Диагностицирате проблеми с Azure Developer CLI чрез вградени диагностични инструменти
- Самостоятелно разрешавате проблеми, свързани с удостоверяване, абонамент и разрешения
- Ефективно отстранявате грешки при разгръщане и осигуряване на инфраструктура
- Отстранявате транспортни проблеми при конфигуриране на приложения и специфични за среда проблеми
- Прилагате наблюдение и задаване на аларми за проактивно откриване на потенциални проблеми
- Използвате най-добри практики за логване, отстраняване на грешки и работни потоци за решаване на проблеми

## Бърза диагностика

Преди да се потопите в конкретни проблеми, изпълнете тези команди, за да съберете диагностична информация:

```bash
# Проверете версията и състоянието на azd
azd version
azd config show

# Потвърдете удостоверяването в Azure
az account show
az account list

# Проверете текущата среда
azd env list
azd env get-values

# Активирайте отчитането за отстраняване на грешки
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми с удостоверяване

### Проблем: "Неуспешно получаване на достъп токен"
**Симптоми:**
- `azd up` се проваля с грешки за удостоверяване
- Командите връщат "неупълномощен" или "достъп отказан"

**Решения:**
```bash
# 1. Повторно удостоверяване с Azure CLI
az login
az account show

# 2. Изчистване на кешираните идентификационни данни
az account clear
az login

# 3. Използване на устройствен код (за системи без графичен интерфейс)
az login --use-device-code

# 4. Задаване на конкретен абонамент
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблем: "Недостатъчни привилегии" по време на разгръщане
**Симптоми:**
- Разгръщането се проваля с грешки за разрешения
- Не може да се създадат определени Azure ресурси

**Решения:**
```bash
# 1. Проверете вашите Azure роли
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Уверете се, че имате необходимите роли
# - Contributor (за създаване на ресурси)
# - User Access Administrator (за задаване на роли)

# 3. Свържете се с вашия Azure администратор за правилни разрешения
```

### Проблем: Проблеми с удостоверяване за многонаемателна среда
**Решения:**
```bash
# 1. Вход с конкретен наемател
az login --tenant "your-tenant-id"

# 2. Настройте наемателя в конфигурацията
azd config set auth.tenantId "your-tenant-id"

# 3. Изчистете кеша на наемателя при смяна на наематели
az account clear
```

## 🏗️ Грешки при осигуряване на инфраструктура

### Проблем: Конфликти с имена на ресурси
**Симптоми:**
- Грешки "Името на ресурса вече съществува"
- Разгръщането се проваля при създаване на ресурси

**Решения:**
```bash
# 1. Използвайте уникални имена на ресурси с токени
# Във вашия Bicep шаблон:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Променете името на околната среда
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Почистете съществуващите ресурси
azd down --force --purge
```

### Проблем: Местоположение/Регион не е наличен
**Симптоми:**
- "Местоположението 'xyz' не е налично за тип ресурс"
- Някои SKU не са налични в избрания регион

**Решения:**
```bash
# 1. Проверете наличните локации за типовете ресурси
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Използвайте често достъпни региони
azd config set defaults.location eastus2
# или
azd env set AZURE_LOCATION eastus2

# 3. Проверете наличността на услугата по региони
# Посетете: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблем: Превишени квоти
**Симптоми:**
- "Превишена квота за тип ресурс"
- "Достигнат максимален брой ресурси"

**Решения:**
```bash
# 1. Проверете текущото използване на квотата
az vm list-usage --location eastus2 -o table

# 2. Заявете увеличение на квотата чрез портала на Azure
# Отидете на: Абонаменти > Използване + квоти

# 3. Използвайте по-малки SKU за разработка
# В main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Почистете неизползваните ресурси
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблем: Грешки в шаблона Bicep
**Симптоми:**
- Неуспехи при валидиране на шаблон
- Синтактични грешки в Bicep файлове

**Решения:**
```bash
# 1. Валидиране на синтаксиса на Bicep
az bicep build --file infra/main.bicep

# 2. Използване на лентър за Bicep
az bicep lint --file infra/main.bicep

# 3. Проверка на синтаксиса на файла с параметри
cat infra/main.parameters.json | jq '.'

# 4. Преглед на промените при разгръщане
azd provision --preview
```

## 🚀 Неуспехи при разгръщане

### Проблем: Грешки при компилиране
**Симптоми:**
- Приложението не успява да се компилира по време на разгръщане
- Грешки при инсталиране на пакети

**Решения:**
```bash
# 1. Проверете изхода от изграждането с флаг за отстраняване на грешки
azd deploy --service web --debug

# 2. Вижте състоянието на внедрената услуга
azd show

# 3. Тествайте изграждането локално
cd src/web
npm install
npm run build

# 3. Проверете съвместимостта на версиите на Node.js/Python
node --version  # Трябва да съвпада с настройките в azure.yaml
python --version

# 4. Изчистете кеша за изграждане
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
# 1. Тествайте Docker билд локално
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Проверете логове на контейнера с помощта на Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Наблюдавайте приложението чрез azd
azd monitor --logs

# 3. Проверете достъпа до регистъра на контейнера
az acr login --name myregistry

# 4. Проверете конфигурацията на контейнерното приложение
az containerapp show --name my-app --resource-group my-rg
```

### Проблем: Грешки при връзка с база данни
**Симптоми:**
- Приложението не може да се свърже с базата данни
- Грешки при изтичане на време за връзка

**Решения:**
```bash
# 1. Проверете правилата на защитната стена на базата данни
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Тествайте свързването от приложението
# Временно добавете към приложението си:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Потвърдете формата на низ за връзка
azd env get-values | grep DATABASE

# 4. Проверете състоянието на сървъра на базата данни
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Конфигурационни проблеми

### Проблем: Променливите на средата не работят
**Симптоми:**
- Приложението не чете стойности за конфигурация
- Променливите на средата изглеждат празни

**Решения:**
```bash
# 1. Проверете дали са зададени променливи на средата
azd env get-values
azd env get DATABASE_URL

# 2. Проверете имената на променливите в azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Рестартирайте приложението
azd deploy --service web

# 4. Проверете конфигурацията на услугата за приложение
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблем: Проблеми със SSL/TLS сертификат
**Симптоми:**
- HTTPS не работи
- Грешки при валидиране на сертификат

**Решения:**
```bash
# 1. Проверете състоянието на SSL сертификата
az webapp config ssl list --resource-group myrg

# 2. Активирайте HTTPS само
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Добавете персонален домейн (ако е необходимо)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблем: Проблеми с конфигурацията на CORS
**Симптоми:**
- Фронтенд не може да извиква API
- Заявките от различен произход са блокирани

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

## 🌍 Проблеми с управлението на средата

### Проблем: Проблеми при смяна на среда
**Симптоми:**
- Използва се грешна среда
- Конфигурацията не се сменя правилно

**Решения:**
```bash
# 1. Изброяване на всички среди
azd env list

# 2. Явно избиране на среда
azd env select production

# 3. Проверка на текущата среда
azd env list

# 4. Създаване на нова среда при повреда
azd env new production-new
azd env select production-new
```

### Проблем: Повреда на средата
**Симптоми:**
- Средата показва невалидно състояние
- Ресурсите не съответстват на конфигурацията

**Решения:**
```bash
# 1. Освежете състоянието на средата
azd env refresh

# 2. Нулирайте конфигурацията на средата
azd env new production-reset
# Копирайте необходимите променливи на средата
azd env set DATABASE_URL "your-value"

# 3. Импортирайте съществуващите ресурси (ако е възможно)
# Ръчно актуализирайте .azure/production/config.json с идентификаторите на ресурсите
```

## 🔍 Проблеми с производителността

### Проблем: Забавени времена за разгръщане
**Симптоми:**
- Разгръщанията отнемат твърде много време
- Таймаути по време на разгръщане

**Решения:**
```bash
# 1. Разгръщайте специфични услуги за по-бързи итерации
azd deploy --service web
azd deploy --service api

# 2. Използвайте саморазгръщане на код, когато инфраструктурата е непроменена
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
# Актуализирайте SKU в main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Активирайте мониторинг с Application Insights
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

# Проверете версията на azd
azd version

# Вижте текущата конфигурация
azd config show

# Тествайте свързаността
curl -v https://myapp.azurewebsites.net/health
```

### Анализ на логове
```bash
# Журнали на приложението чрез Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Наблюдение на приложението с azd
azd monitor --logs
azd monitor --live

# Журнали на ресурси в Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Журнали на контейнера (за контейнерни приложения)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Разследване на ресурси
```bash
# Изброяване на всички ресурси
az resource list --resource-group myrg -o table

# Проверка на статуса на ресурса
az webapp show --name myapp --resource-group myrg --query state

# Диагностика на мрежата
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Получаване на допълнителна помощ

### Кога да се ескалира
- Удостоверяващите проблеми продължават след изпробване на всички решения
- Проблеми с инфраструктурата на Azure услуги
- Проблеми със сметки или абонаменти
- Проблеми със сигурността или инциденти

### Канали за поддръжка
```bash
# 1. Проверете здравословното състояние на Azure услугата
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Създайте заявка за поддръжка в Azure
# Отидете на: https://portal.azure.com -> Помощ + поддръжка

# 3. Общностни ресурси
# - Stack Overflow: таг azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Информация за събиране
Преди да се свържете с поддръжката, съберете:
- изход на `azd version`
- изход на `azd config show`
- изход на `azd show` (текущ статус на разгръщане)
- Съобщения за грешки (пълен текст)
- Стъпки за възпроизвеждане на проблема
- Детайли за средата (`azd env get-values`)
- Хронология на появата на проблема

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Предотвратяване на проблеми

### Контролен списък преди разгръщане
```bash
# 1. Потвърдете удостоверяването
az account show

# 2. Проверете квотите и лимитите
az vm list-usage --location eastus2

# 3. Потвърдете шаблоните
az bicep build --file infra/main.bicep

# 4. Тествайте първо локално
npm run build
npm run test

# 5. Използвайте симулационни разгръщания
azd provision --preview
```

### Настройка на мониторинг
```bash
# Активирайте Application Insights
# Добавете към main.bicep:
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
# Седмични здравни проверки
./scripts/health-check.sh

# Месечен преглед на разходите
az consumption usage list --billing-period-name 202401

# Тримесечен преглед на сигурността
az security assessment list --resource-group myrg
```

## Свързани ресурси

- [Ръководство за отстраняване на грешки](debugging.md) - Разширени техники за отстраняване на грешки
- [Осигуряване на ресурси](../chapter-04-infrastructure/provisioning.md) - Отстраняване на проблеми с инфраструктурата
- [Планиране на капацитет](../chapter-06-pre-deployment/capacity-planning.md) - Насоки за планиране на ресурси
- [Избор на SKU](../chapter-06-pre-deployment/sku-selection.md) - Препоръки за ниво на услуга

---

**Съвет**: Запазете това ръководство в отметки и го използвайте винаги, когато срещнете проблеми. Повечето проблеми са вече наблюдавани и имат установени решения!

---

**Навигация**
- **Предишен урок**: [Осигуряване на ресурси](../chapter-04-infrastructure/provisioning.md)
- **Следващ урок**: [Ръководство за отстраняване на грешки](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия език се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->