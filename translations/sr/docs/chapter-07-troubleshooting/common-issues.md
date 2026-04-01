# Чести проблеми и решења

**Навигација поглављем:**
- **📚 Почетна страница курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 7 - Решавање проблема и отклањање грешака
- **⬅️ Претходно поглавље**: [Поглавље 6: Прелиминарне провере](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следеће**: [Водич за отклањање грешака](debugging.md)
- **🚀 Следеће поглавље**: [Поглавље 8: Обрасци за продукцију и предузећа](../chapter-08-production/production-ai-practices.md)

## Увод

Овај опсежни водич за решавање проблема покрива најчешће проблеме који се јављају приликом коришћења Azure Developer CLI. Научите како да дијагностикујете, решите и отклоните уобичајене проблеме са аутентикацијом, деплоя, провизионисањем инфраструктуре и конфигурацијом апликације. За сваки проблем дати су детаљни симптоми, коренски узроци и кораци за решавање.

## Циљеви учења

Завршетком овог водича, бићете у стању да:
- Савладате технике дијагностике за проблеме у Azure Developer CLI
- Разумете уобичајене проблеме са аутентикацијом и дозволама и њихова решења
- Решавате неуспехе деплоя, грешке у провизионисању инфраструктуре и проблеме конфигурације
- Имплементирате проактивни мониторинг и стратегије за дебаговање
- Примeните систематске методологије за решавање сложених проблема
- Конфигуришете правилно логовање и мониторинг како бисте спречили будуће проблеме

## Резултати учења

По завршетку, моћи ћете да:
- Дијагностикујете проблеме Azure Developer CLI користећи уграђене дијагностичке алате
- Самостално решавате проблеме везане за аутентикацију, претплате и дозволе
- Ефективно решавате неуспехе деплоя и грешке у провизионисању инфраструктуре
- Дебагујете проблеме са конфигурацијом апликације и проблеме специфичне за окружење
- Имплементирате мониторинг и аларме да бисте проактивно идентификовали потенцијалне проблеме
- Примените најбоље праксе за логовање, дебаговање и ток рада за решавање проблема

## Брза дијагностика

Пре него што пређете на специфичне проблеме, покрените ове команде да бисте прикупили дијагностичке информације:

```bash
# Провери верзију и здравље azd
azd version
azd config show

# Провери Azure аутентификацију
az account show
az account list

# Провери тренутно окружење
azd env list
azd env get-values

# Омогући логовање за отклањање грешака
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми са аутентикацијом

### Проблем: "Failed to get access token"
**Симптоми:**
- `azd up` не успева због грешака у аутентикацији
- Команде враћају "неовлашћено" или "приступ одбијен"

**Решења:**
```bash
# 1. Поново се аутентификујте помоћу Azure CLI
az login
az account show

# 2. Обришите кеширане акредитиве
az account clear
az login

# 3. Користите ток аутентификације помоћу кода уређаја (за системе без графичког интерфејса)
az login --use-device-code

# 4. Поставите експлицитну претплату
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблем: "Insufficient privileges" током деплоя
**Симптоми:**
- Деплој не успева због грешака у дозволама
- Није могуће креирати одређене Azure ресурсе

**Решења:**
```bash
# 1. Проверите доделе улога у Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Уверите се да имате потребне улоге
# - Contributor (за креирање ресурса)
# - User Access Administrator (за додељивање улога)

# 3. Контактирајте свог Azure администратора за одговарајуће дозволе
```

### Проблем: Проблеми са мулти-тенант аутентикацијом
**Решења:**
```bash
# 1. Пријавити се са одређеним тенантом
az login --tenant "your-tenant-id"

# 2. Подесити тенант у конфигурацији
azd config set auth.tenantId "your-tenant-id"

# 3. Избрисати кеш повезан са тенантом ако се мењају тенанти
az account clear
```

## 🏗️ Грешке у провизионисању инфраструктуре

### Проблем: Сукоб имена ресурса
**Симптоми:**
- Грешке "The resource name already exists"
- Деплој не успева током креирања ресурса

**Решења:**
```bash
# 1. Користите јединствена имена ресурса са токенима
# У вашем Bicep шаблону:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Промените име окружења
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Очистите постојеће ресурсе
azd down --force --purge
```

### Проблем: Локација/регион није доступан
**Симптоми:**
- "The location 'xyz' is not available for resource type"
- Поједине SKU-ове нису доступне у изабраном региону

**Решења:**
```bash
# 1. Проверите доступне локације за типове ресурса
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Користите уобичајено доступне регионе
azd config set defaults.location eastus2
# или
azd env set AZURE_LOCATION eastus2

# 3. Проверите доступност услуге по региону
# Посетите: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблем: Прекорачење квоте
**Симптоми:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Решења:**
```bash
# 1. Проверите тренутну употребу квоте
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
- Неуспех валидaције шаблона
- Синтаксне грешке у Bicep фајловима

**Решења:**
```bash
# 1. Проверити синтаксу Bicep-а
az bicep build --file infra/main.bicep

# 2. Користити Bicep линтер
az bicep lint --file infra/main.bicep

# 3. Проверити синтаксу датотеке параметара
cat infra/main.parameters.json | jq '.'

# 4. Прегледати промене при размештању
azd provision --preview
```

## 🚀 Неуспеси деплоя

### Проблем: Грешке при изградњи
**Симптоми:**
- Апликација не успева да се изгради током деплоя
- Грешке приликом инсталације пакета

**Решења:**
```bash
# 1. Проверите излаз изградње са заставицом за отклањање грешака
azd deploy --service web --debug

# 2. Погледајте статус распоређене услуге
azd show

# 3. Тестирајте изградњу локално
cd src/web
npm install
npm run build

# 3. Проверите компатибилност верзија Node.js и Python-а
node --version  # Треба да се поклапа са подешавањима у azure.yaml
python --version

# 4. Обришите кеш изградње
rm -rf node_modules package-lock.json
npm install

# 5. Проверите Dockerfile ако користите контејнере
docker build -t test-image .
docker run --rm test-image
```

### Проблем: Грешке при деплоирању контејнера
**Симптоми:**
- Контејнер апликације не успевају да се покрену
- Грешке при повлачењу имиџа

**Решења:**
```bash
# 1. Тестирај Docker изградњу локално
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Провери логове контејнера помоћу Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Надгледај апликацију помоћу azd
azd monitor --logs

# 3. Провери приступ регистру контејнера
az acr login --name myregistry

# 4. Провери конфигурацију апликације у контејнеру
az containerapp show --name my-app --resource-group my-rg
```

### Проблем: Грешке при повезивању са базом података
**Симптоми:**
- Апликација не може да се повеже са базом података
- Грешке временског ограничења везе

**Решења:**
```bash
# 1. Проверите правила заштитног зида базе података
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Тестирајте повезаност из апликације
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
- Апликација не може да прочита вредности конфигурације
- Променљиве окружења изгледају празне

**Решења:**
```bash
# 1. Проверите да ли су променљиве окружења постављене
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
- Захтев из друге домене блокиран

**Решења:**
```bash
# 1. Конфигуришите CORS за App Service
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

## 🌍 Проблеми у управљању окружењима

### Проблем: Проблеми при мењању окружења
**Симптоми:**
- Погрешно окружење се користи
- Конфигурација се не мења како треба

**Решења:**
```bash
# 1. Прикажи сва окружења
azd env list

# 2. Експлицитно одабери окружење
azd env select production

# 3. Провери тренутно окружење
azd env list

# 4. Креирај ново окружење ако је корумпирано
azd env new production-new
azd env select production-new
```

### Проблем: Корупција окружења
**Симптоми:**
- Окружење приказује невалидно стање
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

## 🔍 Проблеми са перформансама

### Проблем: Споро трајање деплoја
**Симптоми:**
- Деплоања трају предуго
- Тайм-аути током деплоя

**Решења:**
```bash
# 1. Деплојујте специфичне сервисе за бржу итерацију
azd deploy --service web
azd deploy --service api

# 2. Користите само деплој кода када инфраструктура није промењена
azd deploy  # Брже од azd up

# 3. Оптимизујте процес изградње
# У package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Проверите локације ресурса (користите исту регију)
azd config set defaults.location eastus2
```

### Проблем: Проблеми са перформансом апликације
**Симптоми:**
- Спори одговори
- Висока потрошња ресурса

**Решења:**
```bash
# 1. Повећајте ресурсе
# Ажурирајте SKU у main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Омогућите надгледање у Application Insights
azd monitor --overview

# 3. Проверите логове апликације у Azure
az webapp log tail --name myapp --resource-group myrg
# или за Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Успоставите кеширање
# Додајте Redis кеш у вашу инфраструктуру
```

## 🛠️ Алати и команде за решавање проблема

### Команде за дебаговање
```bash
# Свеобухватно отклањање грешака
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Провери azd верзију
azd version

# Прикажи тренутну конфигурацију
azd config show

# Тестирај повезаност
curl -v https://myapp.azurewebsites.net/health
```

### Анализа логова
```bash
# Логови апликације преко Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Надгледајте апликацију помоћу azd
azd monitor --logs
azd monitor --live

# Логови Azure ресурса
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Логови контејнера (за Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Истраживање ресурса
```bash
# Прикажи све ресурсе
az resource list --resource-group myrg -o table

# Провери статус ресурса
az webapp show --name myapp --resource-group myrg --query state

# Мрежна дијагностика
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Добијање додатне помоћи

### Када ескалирати
- Проблеми са аутентикацијом који и даље остају након примене свих решења
- Проблеми са инфраструктуром у Azure сервисима
- Питања везана за наплатe или претплате
- Безбедносне бриге или инциденти

### Канали подршке
```bash
# 1. Проверите Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Креирајте захтев за подршку у Azure-у
# Идите на: https://portal.azure.com -> Помоћ и подршка

# 3. Ресурси за заједницу
# - Stack Overflow: ознака azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Информације које треба прикупити
Пре контактирања подршке, прикупите:
- `azd version` output
- `azd config show` output
- `azd show` output (тренутни статус деплоя)
- Поруке о грешци (пуни текст)
- Кораци за репродукцију проблема
- Детаљи о окружењу (`azd env get-values`)
- Временски ток када је проблем почео

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Превенција проблема

### Контролна листа пре деплoја
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

# 5. Користити dry-run распоређивања
azd provision --preview
```

### Подешавање мониторинга
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

# Тримесечни безбедносни преглед
az security assessment list --resource-group myrg
```

## Повезани ресурси

- [Водич за отклањање грешака](debugging.md) - Напредне технике дебаговања
- [Провизионисање ресурса](../chapter-04-infrastructure/provisioning.md) - Решавање проблема инфраструктуре
- [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md) - Упутства за планирање ресурса
- [Избор SKU-а](../chapter-06-pre-deployment/sku-selection.md) - Препоруке за нивое услуга

---

**Савет**: Сачувајте овај водич у обележивачима и консултујте га кад год наиђете на проблеме. Већина проблема је већ виђена раније и има утврђена решења!

---

**Навигација**
- **Претходна лекција**: [Провизионисање ресурса](../chapter-04-infrastructure/provisioning.md)
- **Следећа лекција**: [Водич за отклањање грешака](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен уз помоћ услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, молимо вас имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->