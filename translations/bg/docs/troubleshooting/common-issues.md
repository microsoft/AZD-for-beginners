<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T11:22:20+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "bg"
}
-->
# Често срещани проблеми и решения

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгинг
- **⬅️ Предишна глава**: [Глава 6: Предварителни проверки](../pre-deployment/preflight-checks.md)
- **➡️ Следваща**: [Ръководство за дебъгинг](debugging.md)
- **🚀 Следваща глава**: [Глава 8: Производствени и корпоративни модели](../ai-foundry/production-ai-practices.md)

## Въведение

Това изчерпателно ръководство за отстраняване на проблеми обхваща най-често срещаните проблеми при използване на Azure Developer CLI. Научете как да диагностицирате, отстранявате и решавате често срещани проблеми, свързани с автентикация, разгръщане, създаване на инфраструктура и конфигурация на приложения. Всеки проблем включва подробни симптоми, основни причини и стъпка по стъпка процедури за разрешаване.

## Цели на обучението

След завършване на това ръководство ще:
- Усвоите техники за диагностика на проблеми с Azure Developer CLI
- Разберете често срещаните проблеми с автентикация и разрешения и техните решения
- Решавате проблеми с разгръщане, грешки при създаване на инфраструктура и конфигурационни проблеми
- Прилагате проактивни стратегии за мониторинг и дебъгинг
- Използвате систематични методологии за отстраняване на сложни проблеми
- Конфигурирате правилно логването и мониторинга, за да предотвратите бъдещи проблеми

## Резултати от обучението

След завършване ще можете:
- Диагностицирате проблеми с Azure Developer CLI, използвайки вградени инструменти за диагностика
- Самостоятелно решавате проблеми, свързани с автентикация, абонаменти и разрешения
- Ефективно отстранявате проблеми с разгръщане и грешки при създаване на инфраструктура
- Дебъгвате конфигурационни проблеми на приложения и проблеми, специфични за средата
- Прилагате мониторинг и известяване, за да идентифицирате потенциални проблеми проактивно
- Използвате най-добрите практики за логване, дебъгинг и работни процеси за разрешаване на проблеми

## Бърза диагностика

Преди да се задълбочите в конкретни проблеми, изпълнете тези команди, за да съберете диагностична информация:

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

## Проблеми с автентикация

### Проблем: "Неуспешно получаване на токен за достъп"
**Симптоми:**
- `azd up` се проваля с грешки при автентикация
- Командите връщат "неоторизиран" или "достъп отказан"

**Решения:**
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

### Проблем: "Недостатъчни привилегии" по време на разгръщане
**Симптоми:**
- Разгръщането се проваля с грешки при разрешенията
- Не можете да създадете определени ресурси в Azure

**Решения:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблем: Проблеми с автентикация в мултитенант среда
**Решения:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Грешки при създаване на инфраструктура

### Проблем: Конфликти с имена на ресурси
**Симптоми:**
- Грешки "Името на ресурса вече съществува"
- Разгръщането се проваля по време на създаване на ресурси

**Решения:**
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

### Проблем: Локацията/регионът не е наличен
**Симптоми:**
- "Локацията 'xyz' не е налична за типа ресурс"
- Определени SKUs не са налични в избрания регион

**Решения:**
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

### Проблем: Превишени квоти
**Симптоми:**
- "Превишена квота за типа ресурс"
- "Достигнат максимален брой ресурси"

**Решения:**
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

### Проблем: Грешки в шаблони на Bicep
**Симптоми:**
- Провали при валидиране на шаблони
- Синтактични грешки в Bicep файлове

**Решения:**
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

## 🚀 Провали при разгръщане

### Проблем: Провали при изграждане
**Симптоми:**
- Приложението не успява да се изгради по време на разгръщане
- Грешки при инсталиране на пакети

**Решения:**
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

### Проблем: Провали при разгръщане на контейнери
**Симптоми:**
- Контейнерните приложения не успяват да стартират
- Грешки при изтегляне на изображения

**Решения:**
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

### Проблем: Грешки при връзка с база данни
**Симптоми:**
- Приложението не може да се свърже с база данни
- Грешки при изтичане на времето за връзка

**Решения:**
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

## 🔧 Проблеми с конфигурацията

### Проблем: Променливите на средата не работят
**Симптоми:**
- Приложението не може да чете конфигурационни стойности
- Променливите на средата изглеждат празни

**Решения:**
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

### Проблем: Проблеми със SSL/TLS сертификати
**Симптоми:**
- HTTPS не работи
- Грешки при валидиране на сертификати

**Решения:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблем: Проблеми с конфигурацията на CORS
**Симптоми:**
- Фронтендът не може да извика API
- Блокирани заявки между различни източници

**Решения:**
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

## 🌍 Проблеми с управление на средата

### Проблем: Проблеми при превключване на среда
**Симптоми:**
- Използва се грешна среда
- Конфигурацията не се превключва правилно

**Решения:**
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

### Проблем: Корупция на средата
**Симптоми:**
- Средата показва невалидно състояние
- Ресурсите не съответстват на конфигурацията

**Решения:**
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

## 🔍 Проблеми с производителността

### Проблем: Бавни времена за разгръщане
**Симптоми:**
- Разгръщанията отнемат твърде много време
- Таймаути по време на разгръщане

**Решения:**
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

### Проблем: Проблеми с производителността на приложението
**Симптоми:**
- Бавни времена за отговор
- Висока употреба на ресурси

**Решения:**
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

## 🛠️ Инструменти и команди за отстраняване на проблеми

### Команди за дебъгинг
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

### Анализ на логове
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Разследване на ресурси
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Получаване на допълнителна помощ

### Кога да ескалирате
- Проблемите с автентикация продължават след опит за всички решения
- Проблеми с инфраструктурата на Azure услуги
- Проблеми, свързани с фактуриране или абонамент
- Проблеми със сигурността или инциденти

### Канали за поддръжка
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

### Информация за събиране
Преди да се свържете с поддръжка, съберете:
- Резултат от `azd version`
- Резултат от `azd info`
- Съобщения за грешки (пълен текст)
- Стъпки за възпроизвеждане на проблема
- Детайли за средата (`azd env show`)
- Хронология на началото на проблема

### Скрипт за събиране на логове
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

## 📊 Предотвратяване на проблеми

### Контролен списък преди разгръщане
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

### Настройка на мониторинг
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

### Редовна поддръжка
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Свързани ресурси

- [Ръководство за дебъгинг](debugging.md) - Разширени техники за дебъгинг
- [Създаване на ресурси](../deployment/provisioning.md) - Отстраняване на проблеми с инфраструктурата
- [Планиране на капацитет](../pre-deployment/capacity-planning.md) - Насоки за планиране на ресурси
- [Избор на SKU](../pre-deployment/sku-selection.md) - Препоръки за избор на ниво на услуги

---

**Съвет**: Запазете това ръководство и го използвайте винаги, когато срещнете проблеми. Повечето проблеми са вече познати и имат установени решения!

---

**Навигация**
- **Предишен урок**: [Създаване на ресурси](../deployment/provisioning.md)
- **Следващ урок**: [Ръководство за дебъгинг](debugging.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.