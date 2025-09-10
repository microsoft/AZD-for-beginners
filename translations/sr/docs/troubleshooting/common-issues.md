<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-10T06:28:33+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "sr"
}
-->
# Уобичајени Проблеми и Решења

## Увод

Овај свеобухватни водич за решавање проблема покрива најчешће изазове са којима се сусрећете приликом коришћења Azure Developer CLI. Научите како да дијагностикујете, решавате и отклањате уобичајене проблеме са аутентикацијом, имплементацијом, обезбеђивањем инфраструктуре и конфигурацијом апликација. Сваки проблем укључује детаљне симптоме, основне узроке и корак-по-корак процедуре за решавање.

## Циљеви учења

Завршетком овог водича, научићете:
- Да савладате технике дијагностиковања проблема са Azure Developer CLI
- Да разумете уобичајене проблеме са аутентикацијом и дозволама и њихова решења
- Да решавате неуспехе у имплементацији, грешке у обезбеђивању инфраструктуре и проблеме са конфигурацијом
- Да примените проактивне стратегије за праћење и отклањање грешака
- Да користите систематске методологије за решавање сложених проблема
- Да конфигуришете правилно логовање и праћење како бисте спречили будуће проблеме

## Исходи учења

По завршетку, бићете у могућности да:
- Дијагностикујете проблеме са Azure Developer CLI користећи уграђене алате за дијагностику
- Самостално решавате проблеме са аутентикацијом, претплатама и дозволама
- Ефикасно решавате неуспехе у имплементацији и грешке у обезбеђивању инфраструктуре
- Отклањате проблеме са конфигурацијом апликација и проблеме специфичне за окружење
- Примените праћење и упозорења како бисте проактивно идентификовали потенцијалне проблеме
- Примените најбоље праксе за логовање, отклањање грешака и радне токове за решавање проблема

## Брза дијагностика

Пре него што се упустите у специфичне проблеме, покрените ове команде како бисте прикупили дијагностичке информације:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Проблеми са аутентикацијом

### Проблем: "Није успело добијање приступног токена"
**Симптоми:**
- `azd up` не успева са грешкама аутентикације
- Команде враћају "неовлашћено" или "приступ одбијен"

**Решења:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблем: "Недовољне привилегије" током имплементације
**Симптоми:**
- Имплементација не успева са грешкама дозвола
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

### Проблем: Проблеми са аутентикацијом у мултитенант окружењу
**Решења:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Грешке у обезбеђивању инфраструктуре

### Проблем: Конфликти у именима ресурса
**Симптоми:**
- Грешке "Име ресурса већ постоји"
- Имплементација не успева током креирања ресурса

**Решења:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Проблем: Локација/регион није доступан
**Симптоми:**
- "Локација 'xyz' није доступна за тип ресурса"
- Одређени SKUs нису доступни у изабраном региону

**Решења:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблем: Прекорачене квоте
**Симптоми:**
- "Прекорачена квота за тип ресурса"
- "Достигнут максималан број ресурса"

**Решења:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблем: Грешке у Bicep шаблонима
**Симптоми:**
- Неуспех у валидацији шаблона
- Синтаксичке грешке у Bicep датотекама

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

## 🚀 Неуспеси у имплементацији

### Проблем: Грешке у изградњи
**Симптоми:**
- Апликација не успева да се изгради током имплементације
- Грешке у инсталацији пакета

**Решења:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Проблем: Неуспеси у имплементацији контејнера
**Симптоми:**
- Контејнерске апликације не успевају да се покрену
- Грешке при преузимању слике

**Решења:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Проблем: Проблеми са повезивањем базе података
**Симптоми:**
- Апликација не може да се повеже са базом података
- Грешке временског истека везе

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
- Апликација не може да прочита вредности конфигурације
- Променљиве окружења изгледају празно

**Решења:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблем: Проблеми са SSL/TLS сертификатима
**Симптоми:**
- HTTPS не ради
- Грешке у валидацији сертификата

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
- Блокирани захтеви из других домена

**Решења:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Проблеми са управљањем окружењем

### Проблем: Проблеми са променом окружења
**Симптоми:**
- Користи се погрешно окружење
- Конфигурација се не мења правилно

**Решења:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Проблем: Оштећење окружења
**Симптоми:**
- Окружење показује неважеће стање
- Ресурси не одговарају конфигурацији

**Решења:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Проблеми са перформансама

### Проблем: Споро време имплементације
**Симптоми:**
- Имплементације трају предуго
- Временски истеци током имплементације

**Решења:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Проблем: Проблеми са перформансама апликације
**Симптоми:**
- Споро време одзива
- Висока употреба ресурса

**Решења:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Алати и команде за решавање проблема

### Команде за отклањање грешака
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Анализа логова
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Истраживање ресурса
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Добијање додатне помоћи

### Када ескалирати
- Проблеми са аутентикацијом трају након испробавања свих решења
- Проблеми са инфраструктуром Azure услуга
- Проблеми са наплатом или претплатом
- Безбедносни проблеми или инциденти

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

### Информације које треба прикупити
Пре контактирања подршке, прикупите:
- Излаз `azd version`
- Излаз `azd info`
- Поруке о грешкама (пун текст)
- Кораке за репродукцију проблема
- Детаље о окружењу (`azd env show`)
- Временски оквир када је проблем почео

### Скрипта за прикупљање логова
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Превенција проблема

### Контролна листа пре имплементације
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

### Подешавање праћења
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Редовно одржавање
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Повезани ресурси

- [Водич за отклањање грешака](debugging.md) - Напредне технике за отклањање грешака
- [Обезбеђивање ресурса](../deployment/provisioning.md) - Решавање проблема са инфраструктуром
- [Планирање капацитета](../pre-deployment/capacity-planning.md) - Водич за планирање ресурса
- [Избор SKU](../pre-deployment/sku-selection.md) - Препоруке за избор нивоа услуга

---

**Савет**: Сачувајте овај водич и консултујте га кад год наиђете на проблеме. Већина проблема је већ виђена и има утврђена решења!

---

**Навигација**
- **Претходна лекција**: [Обезбеђивање ресурса](../deployment/provisioning.md)
- **Следећа лекција**: [Водич за отклањање грешака](debugging.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.