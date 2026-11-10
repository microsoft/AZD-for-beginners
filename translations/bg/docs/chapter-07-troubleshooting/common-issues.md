# Чести проблеми и решения

**Навигация в главата:**
- **📚 Начална страница на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгинг
- **⬅️ Предишна глава**: [Глава 6: Предварителни проверки](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следваща**: [Ръководство за дебъгинг](debugging.md)
- **🚀 Следваща глава**: [Глава 8: Производствени и корпоративни модели](../chapter-08-production/production-ai-practices.md)

## Въведение

Това изчерпателно ръководство за отстраняване на проблеми обхваща най-често срещаните проблеми при използване на Azure Developer CLI. Научете как да диагностицирате, отстранявате и решавате често срещани проблеми с автентикацията, внедряването, предоставянето на инфраструктура и конфигурацията на приложенията. Всеки проблем съдържа подробни симптоми, основни причини и стъпкови процедури за разрешаване.

## Цели на обучението

След завършване на това ръководство ще:
- Овладеете диагностични техники за проблеми с Azure Developer CLI
- Разберете чести проблеми с автентикацията и разрешенията и техните решения
- Решавате грешки при внедряване, proporcionarщите грешки на инфраструктурата и проблемите с конфигурацията
- Прилагате проактивни стратегии за наблюдение и дебъгинг
- Използвате систематични методологии за отстраняване на сложни проблеми
- Конфигурирате правилно регистриране и наблюдение, за да предотвратите бъдещи проблеми

## Резултати от обучението

След завършване ще можете да:
- Диагностицирате проблеми с Azure Developer CLI с помощта на вградени диагностични инструменти
- Самостоятелно решавате проблеми с автентикация, абонамент и разрешения
- Ефективно отстранявате грешки при внедряване и при предоставяне на инфраструктура
- Отстранявате проблеми с конфигурацията на приложения и специфични за средата проблеми
- Прилагате наблюдение и алармиране за проактивно идентифициране на потенциални проблеми
- Следвате най-добрите практики за регистриране, дебъгинг и работни потоци за решаване на проблеми

## Бърза диагностика

> Заменете примерните имена/ИД-та с тези на вашата среда. Фрагменти с Bash, Bicep, JavaScript и параметър файлове са отбелязани отделно по-долу; не са един изпълним скрипт. Прегледайте деструктивните операции и премахнете тайните преди да споделяте диагностиката. `azd monitor --logs` отваря браузър; не предава терминални логове.

Преди да навлезете в конкретни проблеми, изпълнете тези команди, за да съберете диагностична информация:

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

## Проблеми с автентикацията

### Проблем: "Неуспешно получаване на достъп токен"
**Симптоми:**
- `azd up` не успява с грешки при автентикация
- Командите връщат "неоторизиран" или "достъп отказан"

**Решения:**
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

### Проблем: "Недостатъчни привилегии" по време на внедряване
**Симптоми:**
- Внедряването се проваля с грешки за разрешения
- Не може да се създадат определени Azure ресурси

**Решения:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблем: Проблеми с мулти-тенант автентикация
**Решения:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Грешки при предоставяне на инфраструктура

### Проблем: Конфликти с имена на ресурси
**Симптоми:**
- Грешки "Ресурс с това име вече съществува"
- Внедряването се проваля по време на създаване на ресурс

**Решения:**
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

### Проблем: Локация/Регион не е наличен
**Симптоми:**
- "Локацията 'xyz' не е налична за типа ресурс"
- Определени SKU-та не са налични в избрания регион

**Решения:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Смяната на променливата location не мигрира съществуващи ресурси. Съществуваща група ресурси или ресурс може да откаже промяна на локацията; използвайте отделна среда за регионално повторно внедряване.

### Проблем: Превишена квота
**Симптоми:**
- "Превишена квота за типа ресурс"
- "Достигнат максимален брой ресурси"

**Решения:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

За развитие, изберете поддържан по-малък SKU в `infra/main.parameters.json`:

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

### Проблем: Грешки в Bicep шаблони
**Симптоми:**
- Провали при валидиране на шаблона
- Синтактически грешки в Bicep файловете

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

## 🚀 Провали при внедряване

### Проблем: Провали при компилиране
**Симптоми:**
- Приложението не се компилира по време на внедряване
- Грешки при инсталиране на пакети

**Решения:**
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

### Проблем: Провали при внедряване на контейнери
**Симптоми:**
- Контейнерните приложения не стартират
- Грешки при изтегляне на образи

**Решения:**
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

### Проблем: Провали при връзка с база данни
**Симптоми:**
- Приложението не може да се свърже с базата данни
- Грешки на изтичане на време при връзка

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
- Приложението не може да чете стойности за конфигурация
- Променливите на средата изглеждат празни

**Решения:**
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

### Проблем: Проблеми с SSL/TLS сертификати
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

### Проблем: Проблеми с конфигурация на CORS
**Симптоми:**
- Фронтенд не може да извика API
- Блокирана крос-домейн заявка

**Решения:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Актуализирайте съществуващото си Express приложение (с импортиран `cors`):

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

## 🌍 Проблеми с управлението на средата

### Проблем: Проблеми при смяна на среда
**Симптоми:**
- Използва се грешна среда
- Конфигурацията не се сменя правилно

**Решения:**
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

### Проблем: Корупция на средата
**Симптоми:**
- Средата показва невалидно състояние
- Ресурсите не съвпадат с конфигурацията

**Решения:**
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

## 🔍 Проблеми с производителността

### Проблем: Бавни времена за внедряване
**Симптоми:**
- Внедряванията отнемат твърде много време
- Таймаути по време на внедряване

**Решения:**
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

### Проблем: Проблеми с производителността на приложението
**Симптоми:**
- Бавни времена за отговор
- Висока консумация на ресурси

**Решения:**
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

## 🛠️ Инструменти и команди за отстраняване на проблеми

### Команди за дебъгинг
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

### Анализ на логове
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

### Проучване на ресурси
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Получаване на допълнителна помощ

### Кога да се ескалира
- Проблемите с автентикацията продължават след опит за всички решения
- Проблеми с инфраструктурата при Azure услуги
- Проблеми с фактурирането или абонамента
- Притеснения или инциденти със сигурността

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
Преди да се свържете с поддръжката, съберете:
- Изход на `azd version`
- Изход на `azd config show`
- Изход на `azd show` (текущ статус на внедряването)
- Съобщения за грешки (пълен текст)
- Стъпки за възпроизвеждане на проблема
- Редактирани детайли на средата (никога не споделяйте сурови `azd env get-values`, които могат да съдържат тайни)
- Хронология на кога е започнал проблемът

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Предотвратяване на проблеми

### Контролен списък преди внедряване
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

### Настройка на наблюдение
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

### Редовна поддръжка
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Свързани ресурси

- [Ръководство за дебъгинг](debugging.md) - Разширени техники за дебъгинг
- [Предоставяне на ресурси](../chapter-04-infrastructure/provisioning.md) - Отстраняване на проблеми с инфраструктурата
- [Планиране на капацитет](../chapter-06-pre-deployment/capacity-planning.md) - Насоки за планиране на ресурси
- [Избор на SKU](../chapter-06-pre-deployment/sku-selection.md) - Препоръки за ниво на услуга

---

**Съвет**: Запазете това ръководство в отметки и го използвайте при всякакви проблеми. Повечето проблеми са срещани преди и имат установени решения!

---

**Навигация**
- **Предишен урок**: [Предоставяне на ресурси](../chapter-04-infrastructure/provisioning.md)
- **Следващ урок**: [Ръководство за дебъгинг](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->