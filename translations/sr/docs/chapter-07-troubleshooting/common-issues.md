# Уобичајени проблеми и њихова решења

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 7 - Решавање проблема и дебаговање
- **⬅️ Претходно поглавље**: [Поглавље 6: Прелиминарне провере](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следеће**: [Водич за дебаговање](debugging.md)
- **🚀 Следеће поглавље**: [Поглавље 8: Практике за производњу и предузећа](../chapter-08-production/production-ai-practices.md)

## Увод

Ова свеобухватна упутства за решавање проблема покривају најчешће проблеме који се јављају приликом коришћења Azure Developer CLI. Научите како да дијагностикујете, решавате и отклоните уобичајене проблеме са аутентификацијом, деплојем, провизијом инфраструктуре и конфигурацијом апликација. Сваки проблем садржи детаљне симптоме, узроке и кораке за решење.

## Циљеви учења

Завршетком овог водича, моћи ћете да:
- Савладајте технике дијагностике за проблеме са Azure Developer CLI
- Разумете уобичајене проблеме са аутентификацијом и дозволама и њихова решења
- Решавате неуспехе у деплоју, грешке при провизији инфраструктуре и проблеме са конфигурацијом
- Успоставите проактивне стратегије праћења и дебаговања
- Примените систематске методологије решавања проблема за сложене случајеве
- Конфигуришете правилно логовање и праћење да бисте спречили будуће проблеме

## Исходи учења

Након завршетка, моћи ћете да:
- Дијагностикујете проблеме Azure Developer CLI користећи уграђене алате за дијагностику
- Самостално решавате проблеме везане за аутентификацију, претплату и дозволе
- Ефикасно решавате неуспехе у деплоју и грешке приликом провизије инфраструктуре
- Дебагујете проблеме са конфигурацијом апликације и проблеме специфичне за окружење
- Успоставите праћење и алармирање да бисте проактивно откривали потенцијалне проблеме
- Примените добре праксе за логовање, дебаговање и токове рада за решавање проблема

## Брза дијагностика

Пре него што пређете на конкретне проблеме, покрените ове команде да бисте прикупили дијагностичке информације:

```bash
# Провери верзију и здравље azd-а
azd version
azd config list

# Провери Azure аутентификацију
az account show
az account list

# Провери тренутно окружење
azd env show
azd env get-values

# Омогући логовање за отклањање грешака
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми са аутентификацијом

### Проблем: "Failed to get access token"
**Симптоми:**
- `azd up` не успева због грешака у аутентификацији
- Команде враћају "unauthorized" или "access denied"

**Решења:**
```bash
# 1. Поново се аутентификујте помоћу Azure CLI
az login
az account show

# 2. Очистите кеширане акредитиве
az account clear
az login

# 3. Користите device code flow (за системе без корисничког интерфејса)
az login --use-device-code

# 4. Поставите изричиту претплату
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблем: "Insufficient privileges" током деплоја
**Симптоми:**
- Деплој не успева због грешака у дозволама
- Не може да креира одређене Azure ресурсе

**Решења:**
```bash
# 1. Проверите своја додељења улога у Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Осигурајте да имате потребне улоге
# - Contributor (за креирање ресурса)
# - User Access Administrator (за додељивање улога)

# 3. Контактирајте свог Azure администратора за одговарајуће дозволе
```

### Проблем: Проблеми са мулти-тенант аутентификацијом
**Решења:**
```bash
# 1. Пријавите се са одређеним тенантом
az login --tenant "your-tenant-id"

# 2. Подесите тенант у конфигурацији
azd config set auth.tenantId "your-tenant-id"

# 3. Очистите кеш тенанта ако мењате тенанте
az account clear
```

## 🏗️ Грешке при провизији инфраструктуре

### Проблем: Суко́б имена ресурса
**Симптоми:**
- "The resource name already exists" errors
- Деплој не успева током креирања ресурса

**Решења:**
```bash
# 1. Користите јединствена имена ресурса са токенима
# У вашем Bicep шаблону:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Промените име окружења
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Уклоните постојеће ресурсе
azd down --force --purge
```

### Проблем: Локација/регион није доступан
**Симптоми:**
- "The location 'xyz' is not available for resource type"
- Одређени SKU-ови нису доступни у изабраном региону

**Решења:**
```bash
# 1. Проверите доступне локације за типове ресурса
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Користите уобичајено доступне регије
azd config set defaults.location eastus2
# или
azd env set AZURE_LOCATION eastus2

# 3. Проверите доступност услуга по регионима
# Посетите: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблем: Прекорачење квоте
**Симптоми:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Решења:**
```bash
# 1. Проверите тренутну потрошњу квоте
az vm list-usage --location eastus2 -o table

# 2. Затражите повећање квоте преко Azure портала
# Идите на: Претплате > Употреба и квоте

# 3. Користите мање SKU-ове за развој
# У main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Уклоните неискоришћене ресурсе
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблем: Грешке у Bicep шаблонима
**Симптоми:**
- Неуспеси валидације шаблона
- Синтаксне грешке у Bicep фајловима

**Решења:**
```bash
# 1. Проверити синтаксу Bicep-а
az bicep build --file infra/main.bicep

# 2. Користити Bicep линтер
az bicep lint --file infra/main.bicep

# 3. Проверити синтаксу датотеке параметара
cat infra/main.parameters.json | jq '.'

# 4. Прегледати измене при распоређивању
azd provision --preview
```

## 🚀 Неуспеси при деплоју

### Проблем: Неуспеси при билдовању
**Симптоми:**
- Апликација не успева да се изгради током деплоја
- Грешке приликом инсталације пакета

**Решења:**
```bash
# 1. Проверите излаз изградње са опцијом за отклањање грешака
azd deploy --service web --debug

# 2. Прикажите статус распоређене услуге
azd show

# 3. Тестирајте изградњу локално
cd src/web
npm install
npm run build

# 3. Проверите компатибилност верзија Node.js и Python-а
node --version  # Треба да се поклапа са подешавањима у azure.yaml
python --version

# 4. Очистите кеш изградње
rm -rf node_modules package-lock.json
npm install

# 5. Проверите Dockerfile ако користите контејнере
docker build -t test-image .
docker run --rm test-image
```

### Проблем: Неуспеси при деплоју контејнера
**Симптоми:**
- Контејнерске апликације не успевају да се покрену
- Грешке при преузимању слика

**Решења:**
```bash
# 1. Тестирај Docker build локално
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Проверите логове контејнера помоћу Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Надгледајте апликацију помоћу azd
azd monitor --logs

# 3. Проверите приступ регистру контејнера
az acr login --name myregistry

# 4. Проверите конфигурацију апликације у контејнеру
az containerapp show --name my-app --resource-group my-rg
```

### Проблем: Неуспеси приликом повезивања са базом података
**Симптоми:**
- Апликација не може да се повеже са базом података
- Грешке због истека временског рока везе

**Решења:**
```bash
# 1. Проверите правила заштитног зида базе података
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Тестирајте повезивост из апликације
# Привремено додајте у вашу апликацију:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Проверите формат низа за повезивање
azd env get-values | grep DATABASE

# 4. Проверите статус сервера базе података
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Проблеми са конфигурацијом

### Проблем: Променљиве окружења не функционишу
**Симптоми:**
- Апликација не може да прочита конфигурационе вредности
- Променљиве окружења изгледају празне

**Решења:**
```bash
# 1. Проверите да ли су постављене променљиве окружења
azd env get-values
azd env get DATABASE_URL

# 2. Проверите имена променљивих у azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Поново покрените апликацију
azd deploy --service web

# 4. Проверите конфигурацију App Service-а
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблем: Проблеми са SSL/TLS сертификатима
**Симптоми:**
- HTTPS не ради
- Грешке при валидацији сертификата

**Решења:**
```bash
# 1. Проверите статус SSL сертификата
az webapp config ssl list --resource-group myrg

# 2. Омогућите само HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Додајте прилагођени домен (ако је потребно)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблем: Проблеми са CORS конфигурацијом
**Симптоми:**
- Фронтенд не може да позове API
- Захтев са другог порекла блокиран

**Решења:**
```bash
# 1. Подесите CORS за App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Ажурирајте API да обрађује CORS
# У Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Проверите да ли ради на исправним URL адресама
azd show
```

## 🌍 Проблеми управљања окружењем

### Проблем: Проблеми при пребацивању окружења
**Симптоми:**
- Користи се погрешно окружење
- Конфигурација се не мења правилно

**Решења:**
```bash
# 1. Приказати сва окружења
azd env list

# 2. Изричито изабрати окружење
azd env select production

# 3. Проверити тренутно окружење
azd env show

# 4. Креирати ново окружење ако је корумпирано
azd env new production-new
azd env select production-new
```

### Проблем: Корумпирано окружење
**Симптоми:**
- Окружење показује неважеће стање
- Ресурси се не поклапају са конфигурацијом

**Решења:**
```bash
# 1. Освежите стање окружења
azd env refresh

# 2. Ресетујте конфигурацију окружења
azd env new production-reset
# Копирајте потребне променљиве окружења
azd env set DATABASE_URL "your-value"

# 3. Увезите постојеће ресурсе (ако је могуће)
# Ручно ажурирајте .azure/production/config.json са идентификаторима ресурса
```

## 🔍 Проблеми перформанси

### Проблем: Споро трајање деплоя
**Симптоми:**
- Деплои трају предуго
- Истек времена током деплоја

**Решења:**
```bash
# 1. Распореди одређене сервисе за бржу итерацију
azd deploy --service web
azd deploy --service api

# 2. Користи само деплој кода када инфраструктура није промењена
azd deploy  # Брже од azd up

# 3. Оптимизуј процес изградње
# У package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Провери локације ресурса (користи исту регију)
azd config set defaults.location eastus2
```

### Проблем: Проблеми са перформансама апликације
**Симптоми:**
- Споро време одговора
- Висока употреба ресурса

**Решења:**
```bash
# 1. Повећајте ресурсе
# Ажурирајте SKU у main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Омогућите надгледање Application Insights
azd monitor --overview

# 3. Проверите логове апликације у Azure
az webapp log tail --name myapp --resource-group myrg
# или за Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Имплементирајте кеширање
# Додајте Redis кеш у вашу инфраструктуру
```

## 🛠️ Алати и команде за решавање проблема

### Команде за дебаговање
```bash
# Свеобухватно отклањање грешака
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Провери верзију azd
azd version

# Прикажи тренутну конфигурацију
azd config list

# Тестирај повезивост
curl -v https://myapp.azurewebsites.net/health
```

### Анализа логова
```bash
# Дневници апликације преко Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Надгледање апликације помоћу azd
azd monitor --logs
azd monitor --live

# Дневници Azure ресурса
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Дневници контејнера (за Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Истраживање ресурса
```bash
# Прикажи све ресурсе
az resource list --resource-group myrg -o table

# Провери статус ресурса
az webapp show --name myapp --resource-group myrg --query state

# Дијагностика мреже
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Добијање додатне помоћи

### Када ескалирати
- Проблеми са аутентификацијом настављају и након испробавања свих решења
- Проблеми са инфраструктуром у Azure сервисима
- Проблеми везани за наплату или претплату
- Безбедносна питања или инциденти

### Канали за подршку
```bash
# 1. Проверите Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Отворите Azure тикет за подршку
# Идите на: https://portal.azure.com -> Помоћ и подршка

# 3. Ресурси за заједницу
# - Stack Overflow: ознака azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Информације које треба прикупити
Пре контакта са подршком, прикупите:
- Излаз `azd version`
- Излаз `azd config list`
- Излаз `azd show` (тренутни статус деплоя)
- Поруке о грешкама (пун текст)
- Кораци за репродукцију проблема
- Детаљи окружења (`azd env show`)
- Временска линија када је проблем почео

### Скрипта за прикупљање логова
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

## 📊 Превенција проблема

### Контролна листа пре деплоја
```bash
# 1. Проверити аутентификацију
az account show

# 2. Проверити квоте и ограничења
az vm list-usage --location eastus2

# 3. Проверити шаблоне
az bicep build --file infra/main.bicep

# 4. Прво тестирати локално
npm run build
npm run test

# 5. Користити пробна (dry-run) распоређивања
azd provision --preview
```

### Постављање праћења
```bash
# Омогући Application Insights
# Додај у main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Подеси упозорења
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Редовно одржавање
```bash
# Недељне провере здравља
./scripts/health-check.sh

# Месечни преглед трошкова
az consumption usage list --billing-period-name 202401

# Тромесечни преглед безбедности
az security assessment list --resource-group myrg
```

## Повезани ресурси

- [Водич за дебаговање](debugging.md) - Напредне технике дебаговања
- [Провизионисање ресурса](../chapter-04-infrastructure/provisioning.md) - Решавање проблема инфраструктуре
- [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md) - Смернице за планирање ресурса
- [Избор SKU-а](../chapter-06-pre-deployment/sku-selection.md) - Препоруке за ниво услуге

---

**Савет**: Зачувајте овај водич у обележивачима и консултујте га кад год наиђете на проблеме. Већина проблема је већ била уочена и има утврђена решења!

---

**Навигација**
- **Претходна лекција**: [Провизионисање ресурса](../chapter-04-infrastructure/provisioning.md)
- **Следећа лекција**: [Водич за дебаговање](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Изјава о одрицању одговорности:
Овај документ је преведен помоћу сервиса за превођење вештачком интелигенцијом [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод који ће извршити човек. Нисмо одговорни за било какве неспоразууме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->