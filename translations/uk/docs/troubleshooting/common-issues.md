<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T13:47:55+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "uk"
}
-->
# Поширені проблеми та їх вирішення

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Виправлення помилок і налагодження
- **⬅️ Попередній розділ**: [Розділ 6: Передпольотна перевірка](../pre-deployment/preflight-checks.md)
- **➡️ Далі**: [Посібник з налагодження](debugging.md)
- **🚀 Наступний розділ**: [Розділ 8: Практики для виробництва та підприємств](../ai-foundry/production-ai-practices.md)

## Вступ

Цей детальний посібник з усунення несправностей охоплює найчастіше зустрічаючіся проблеми при використанні Azure Developer CLI. Ви дізнаєтеся, як діагностувати, усувати та вирішувати поширені проблеми з автентифікацією, розгортанням, створенням інфраструктури та налаштуванням додатків. Кожна проблема містить детальний опис симптомів, основних причин і покрокові інструкції з вирішення.

## Цілі навчання

Після завершення цього посібника ви зможете:
- Опановувати техніки діагностики проблем Azure Developer CLI
- Розуміти поширені проблеми з автентифікацією та дозволами і їх вирішення
- Вирішувати збої розгортання, помилки створення інфраструктури та проблеми з налаштуванням
- Реалізовувати проактивні стратегії моніторингу та налагодження
- Застосовувати систематичні методології усунення складних проблем
- Налаштовувати правильне логування та моніторинг для запобігання майбутнім проблемам

## Результати навчання

Після завершення ви зможете:
- Діагностувати проблеми Azure Developer CLI за допомогою вбудованих інструментів діагностики
- Самостійно вирішувати проблеми з автентифікацією, підписками та дозволами
- Ефективно усувати збої розгортання та помилки створення інфраструктури
- Налагоджувати проблеми з налаштуванням додатків та специфічні для середовища проблеми
- Реалізовувати моніторинг і оповіщення для проактивного виявлення потенційних проблем
- Застосовувати найкращі практики для логування, налагодження та робочих процесів вирішення проблем

## Швидка діагностика

Перед тим як переходити до конкретних проблем, виконайте ці команди для збору діагностичної інформації:

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

## Проблеми з автентифікацією

### Проблема: "Не вдалося отримати токен доступу"
**Симптоми:**
- `azd up` завершується з помилками автентифікації
- Команди повертають "unauthorized" або "access denied"

**Рішення:**
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

### Проблема: "Недостатньо привілеїв" під час розгортання
**Симптоми:**
- Розгортання завершується помилками дозволів
- Неможливо створити певні ресурси Azure

**Рішення:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблема: Проблеми з автентифікацією в багатотенантному середовищі
**Рішення:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Помилки створення інфраструктури

### Проблема: Конфлікти імен ресурсів
**Симптоми:**
- Помилки "The resource name already exists"
- Розгортання завершується помилкою під час створення ресурсу

**Рішення:**
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

### Проблема: Локація/регіон недоступний
**Симптоми:**
- "The location 'xyz' is not available for resource type"
- Певні SKU недоступні у вибраному регіоні

**Рішення:**
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

### Проблема: Перевищення квоти
**Симптоми:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Рішення:**
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

### Проблема: Помилки шаблону Bicep
**Симптоми:**
- Збої перевірки шаблону
- Синтаксичні помилки у файлах Bicep

**Рішення:**
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

## 🚀 Збої розгортання

### Проблема: Помилки збірки
**Симптоми:**
- Додаток не вдається зібрати під час розгортання
- Помилки встановлення пакетів

**Рішення:**
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

### Проблема: Збої розгортання контейнерів
**Симптоми:**
- Контейнерні додатки не запускаються
- Помилки завантаження образів

**Рішення:**
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

### Проблема: Помилки підключення до бази даних
**Симптоми:**
- Додаток не може підключитися до бази даних
- Помилки тайм-ауту підключення

**Рішення:**
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

## 🔧 Проблеми з налаштуванням

### Проблема: Змінні середовища не працюють
**Симптоми:**
- Додаток не може зчитати значення конфігурації
- Змінні середовища виглядають порожніми

**Рішення:**
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

### Проблема: Проблеми з SSL/TLS сертифікатами
**Симптоми:**
- HTTPS не працює
- Помилки перевірки сертифікатів

**Рішення:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблема: Проблеми з налаштуванням CORS
**Симптоми:**
- Фронтенд не може викликати API
- Блокування запитів через крос-доменні обмеження

**Рішення:**
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

## 🌍 Проблеми з управлінням середовищем

### Проблема: Проблеми з перемиканням середовищ
**Симптоми:**
- Використовується неправильне середовище
- Конфігурація не перемикається належним чином

**Рішення:**
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

### Проблема: Пошкодження середовища
**Симптоми:**
- Середовище показує некоректний стан
- Ресурси не відповідають конфігурації

**Рішення:**
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

## 🔍 Проблеми з продуктивністю

### Проблема: Тривалий час розгортання
**Симптоми:**
- Розгортання займає занадто багато часу
- Тайм-аути під час розгортання

**Рішення:**
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

### Проблема: Проблеми з продуктивністю додатка
**Симптоми:**
- Повільний час відгуку
- Високе використання ресурсів

**Рішення:**
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

## 🛠️ Інструменти та команди для усунення несправностей

### Команди для налагодження
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

### Аналіз логів
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Дослідження ресурсів
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Отримання додаткової допомоги

### Коли ескалювати проблему
- Проблеми з автентифікацією залишаються після спроб усіх рішень
- Проблеми з інфраструктурою Azure
- Питання, пов’язані з оплатою або підпискою
- Проблеми безпеки або інциденти

### Канали підтримки
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

### Інформація для збору
Перед зверненням до підтримки зберіть:
- Вивід `azd version`
- Вивід `azd info`
- Повні тексти помилок
- Кроки для відтворення проблеми
- Деталі середовища (`azd env show`)
- Хронологію, коли проблема почалася

### Скрипт для збору логів
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

## 📊 Запобігання проблемам

### Контрольний список перед розгортанням
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

### Налаштування моніторингу
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

### Регулярне обслуговування
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Супутні ресурси

- [Посібник з налагодження](debugging.md) - Розширені техніки налагодження
- [Створення ресурсів](../deployment/provisioning.md) - Усунення несправностей інфраструктури
- [Планування потужностей](../pre-deployment/capacity-planning.md) - Рекомендації щодо планування ресурсів
- [Вибір SKU](../pre-deployment/sku-selection.md) - Рекомендації щодо вибору рівнів обслуговування

---

**Порада**: Збережіть цей посібник у закладках і звертайтеся до нього щоразу, коли стикаєтеся з проблемами. Більшість проблем уже були вирішені раніше і мають перевірені рішення!

---

**Навігація**
- **Попередній урок**: [Створення ресурсів](../deployment/provisioning.md)
- **Наступний урок**: [Посібник з налагодження](debugging.md)

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.