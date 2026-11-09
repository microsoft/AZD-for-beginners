# Уобичајени проблеми и решења

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 7 - Решавање проблема и отклањање грешака
- **⬅️ Претходно поглавље**: [Поглавље 6: Провере пре полетања](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следеће**: [Водич за отклањање грешака](debugging.md)
- **🚀 Следеће поглавље**: [Поглавље 8: Обрасци за производњу и предузећа](../chapter-08-production/production-ai-practices.md)

## Увод

Овај свеобухватни водич за решавање проблема покрива најчешће сусретнуте проблеме приликом коришћења Azure Developer CLI. Научите како да дијагностикујете, решавате и отклоните уобичајене проблеме са аутентикацијом, објављивањем, обезбеђивањем инфраструктуре и конфигурацијом апликација. За сваки проблем су дати детаљни симптоми, основни узроци и кораци за решавање.

## Циљеви учења

Након завршетка овог водича, моћи ћете да:
- Савладате технике дијагностиковања проблема са Azure Developer CLI
- Разумете уобичајене проблеме са аутентикацијом и дозволама и њихова решења
- Решавате неуспехе у објављивању, грешке у обезбеђивању инфраструктуре и проблеме са конфигурацијом
- Спроведете проактивно праћење и стратегије отклањања грешака
- Примјењујете систематске методологије решавања сложених проблема
- Конфигуришете правилно евидентирање и праћење како бисте спречили будуће проблеме

## Резултати учења

По завршетку, бићете у стању да:
- Дијагностикујете проблеме са Azure Developer CLI коришћењем уграђених алата за дијагностику
- Самостално решавате проблеме везане за аутентикацију, претплату и дозволе
- Ефикасно решавате неуспехе у објављивању и грешке у обезбеђивању инфраструктуре
- Отклањате проблеме са конфигурацијом апликација и проблеме специфичне за окружење
- Имплементирате праћење и алармирање како бисте проактивно идентификовали потенцијалне проблеме
- Примјењујете најбоље праксе за евидентирање, отклањање грешака и протоколе за решавање проблема

## Брза дијагностика

> Замените примерне називе/ИД-ове вредностима из вашег окружења. Bash, Bicep, JavaScript и делови параметарских фајлова су посебно обележени испод; они нису један извршни скрипт. Прегледајте уништавајуће операције и цензуришите тајне пре дељења дијагностицираних података. `azd monitor --logs` отвара прегледач; не преноси логове терминала.

Пре него што пређете на конкретне проблеме, покрените ове команде да бисте сакупили дијагностичке информације:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Проблеми са аутентикацијом

### Проблем: "Неуспех у добијању приступног токена"
**Симптоми:**
- `azd up` не успева са грешкама аутентикације
- Команде враћају "неовлашћено" или "приступ одбијен"

**Решења:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Проблем: "Недовољна привилегија" током објављивања
**Симптоми:**
- Објављивање не успева због грешака у дозволама
- Није могуће креирати одређене Azure ресурсе

**Решења:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблем: Проблеми са мулти-тенант аутентикацијом
**Решења:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Грешке у обезбеђивању инфраструктуре

### Проблем: Конфликти имена ресурса
**Симптоми:**
- Грешке "Име ресурса већ постоји"
- Објављивање не успева током креирања ресурса

**Решења:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Проблем: Локација/регија није доступна
**Симптоми:**
- "Локација 'xyz' није доступна за тип ресурса"
- Одређени SKU-ови нису доступни у одабраној регији

**Решења:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Промена променљиве локације не мигрира постојеће ресурсе. Постојећа група ресурса или ресурс могу одбити промену локације; користите засебно окружење за регионалну реобјаву.

### Проблем: Грешке прекорачења квоте
**Симптоми:**
- "Квота прекорачена за тип ресурса"
- "Достигнут максималан број ресурса"

**Решења:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

За развој одаберите мањи SKU који је подржан у `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблем: Грешке у Bicep шаблонима
**Симптоми:**
- Неуспех валидације шаблона
- Синтаксне грешке у Bicep фајловима

**Решења:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Неуспеси објављивања

### Проблем: Неуспеси током израде
**Симптоми:**
- Апликација не успева да се изгради током објављивања
- Грешке приликом инсталације пакета

**Решења:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Проблем: Неуспеси током објављивања контејнера
**Симптоми:**
- Контејнер апликације не успевају да стартују
- Грешке приликом претварања слика

**Решења:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Проблем: Неуспех повезивања са базом података
**Симптоми:**
- Апликација се не може повезати са базом података
- Грешке за време истека везе (timeout)

**Решења:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Проблеми са конфигурацијом

### Проблем: Променљиве окружења не раде
**Симптоми:**
- Апликација не може да учита вредности конфигурације
- Променљиве окружења изгледају празно

**Решења:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблем: Проблеми са SSL/TLS сертификатима
**Симптоми:**
- HTTPS не ради
- Грешке приликом валидације сертификата

**Решења:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблем: Проблеми са CORS конфигурацијом
**Симптоми:**
- Фронтенд не може да позове API
- Захтеви са различитих порекла блокирани

**Решења:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Ажурирајте постојећу Express апликацију (са увезеним `cors`):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Проблеми у управљању окружењем

### Проблем: Проблеми са пребацивањем окружења
**Симптоми:**
- Корисник користи погрешно окружење
- Конфигурација се не мења исправно

**Решења:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Проблем: Корупција окружења
**Симптоми:**
- Окружење приказује неважеће стање
- Ресурси не одговарају конфигурацији

**Решења:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Проблеми са перформансама

### Проблем: Споро време објављивања
**Симптоми:**
- Објављивања трају предуго
- Истеци времена (timeout) током објављивања

**Решења:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Проблем: Проблеми са перформансама апликације
**Симптоми:**
- Спори одзиви
- Висока потрошња ресурса

**Решења:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Алати и команде за решавање проблема

### Команде за отклањање грешака
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Анализа логова
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Испитивање ресурса
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Како добити додатну помоћ

### Када надоградити захтев
- Проблеми са аутентикацијом настављају након свих покушаја решења
- Проблеми са инфраструктуром Azure сервиса
- Проблеми у вези са наплатом или претплатом
- Безбедносне забринутости или инциденти

### Канали подршке
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Подаци које треба сакупити
Пре контактирања подршке, сакупите:
- Излаз `azd version`
- Излаз `azd config show`
- Излаз `azd show` (тренутни статус објављивања)
- Поруке о грешкама (пун текст)
- Кораци за репродукцију проблема
- Цензурисани детаљи окружења (никад не делите сирови `azd env get-values`, јер може садржати тајне)
- Хронологија почетка проблема

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Превенција проблема

### Контролна листа пре објављивања
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Подешавање мониториња
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Редовно одржавање
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Повезани ресурси

- [Водич за отклањање грешака](debugging.md) - Напредне технике отклањања грешака
- [Обезбеђивање ресурса](../chapter-04-infrastructure/provisioning.md) - Решавање проблема инфраструктуре
- [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md) - Водич за планирање ресурса
- [Избор SKU](../chapter-06-pre-deployment/sku-selection.md) - Препоруке за ниво услуге

---

**Савет**: Задржите овај водич у обележивачима и консултујте га кад год наиђете на проблеме. Већина проблема је већ виђена и има утврђена решења!

---

**Навигација**
- **Претходна лекција**: [Обезбеђивање ресурса](../chapter-04-infrastructure/provisioning.md)
- **Следећа лекција**: [Водич за отклањање грешака](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->