# Загальні проблеми та рішення

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Усунення несправностей та відлагодження
- **⬅️ Попередній розділ**: [Розділ 6: Перевірки перед запуском](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Наступний**: [Керівництво з відлагодження](debugging.md)
- **🚀 Наступний розділ**: [Розділ 8: Виробничі та корпоративні шаблони](../chapter-08-production/production-ai-practices.md)

## Вступ

Це комплексне керівництво з усунення несправностей охоплює найпоширеніші проблеми при роботі з Azure Developer CLI. Навчіться діагностувати, усувати неполадки та вирішувати типові проблеми з автентифікацією, розгортанням, створенням інфраструктури та налаштуванням додатків. Для кожної проблеми наведені детальні симптоми, основні причини та покрокові процедури вирішення.

## Цілі навчання

Пройшовши цей посібник, ви:
- Оволодієте техніками діагностики проблем Azure Developer CLI
- Зрозумієте типові проблеми з автентифікацією та дозволами та їхні рішення
- Вирішуватимете помилки розгортання, помилки створення інфраструктури та проблеми конфігурації
- Застосовуватимете проактивний моніторинг та стратегії відлагодження
- Застосовуватимете систематичні методи усунення несправностей для складних проблем
- Налаштовуватимете правильне ведення журналів і моніторинг для запобігання майбутнім проблемам

## Результати навчання

Після завершення ви зможете:
- Діагностувати проблеми Azure Developer CLI за допомогою вбудованих інструментів діагностики
- Вирішувати проблеми з автентифікацією, підписками та дозволами самостійно
- Ефективно усувати неполадки розгортання та помилки створення інфраструктури
- Відлагоджувати проблеми конфігурації додатків і середовища
- Впроваджувати моніторинг і сповіщення для проактивного виявлення потенційних проблем
- Застосовувати найкращі практики ведення журналів, відлагодження та процесів вирішення проблем

## Швидка діагностика

> Замініть приклади імен/ідентифікаторів на значення вашого середовища. Фрагменти Bash, Bicep, JavaScript та файлів з параметрами наведені окремо нижче; це не один виконуваний скрипт. Перевіряйте руйнівні операції і приховуйте секрети перед передачою діагностичних даних. `azd monitor --logs` відкриває браузер; він не веде трансляцію журналів терміналу.

Перед тим як зануритися в конкретні проблеми, виконайте ці команди для збору діагностичної інформації:

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

## Проблеми з автентифікацією

### Проблема: "Не вдалося отримати токен доступу"
**Симптоми:**
- `azd up` залежить з помилками автентифікації
- Команди повертають "unauthorized" або "access denied"

**Рішення:**
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

### Проблема: "Недостатньо привілеїв" під час розгортання
**Симптоми:**
- Розгортання не вдається з помилками дозволів
- Не вдається створити певні ресурси Azure

**Рішення:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблема: Проблеми автентифікації для мульти-орендарів
**Рішення:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Помилки створення інфраструктури

### Проблема: Конфлікти імен ресурсів
**Симптоми:**
- Помилки "Ім'я ресурсу вже існує"
- Розгортання не вдається під час створення ресурсу

**Рішення:**
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

### Проблема: Локація/регіон недоступні
**Симптоми:**
- "Локація 'xyz' недоступна для типу ресурсу"
- Певні SKU недоступні в обраному регіоні

**Рішення:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Зміна змінної локації не переносить існуючі ресурси. Існуюча група ресурсів або ресурс можуть відмовитися від зміни локації; використовуйте окреме середовище для регіонального повторного розгортання.

### Проблема: Перевищення квоти
**Симптоми:**
- "Перевищено квоту для типу ресурсу"
- "Досягнуто максимальну кількість ресурсів"

**Рішення:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Для розробки обирайте підтримуваний менший SKU в `infra/main.parameters.json`:

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

### Проблема: Помилки шаблонів Bicep
**Симптоми:**
- Сертифікаційні помилки шаблонів
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

## 🚀 Помилки розгортання

### Проблема: Помилки збірки
**Симптоми:**
- Додаток не збирається під час розгортання
- Помилки встановлення пакетів

**Рішення:**
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

### Проблема: Помилки розгортання контейнерів
**Симптоми:**
- Контейнерні додатки не запускаються
- Помилки завантаження образів

**Рішення:**
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

## 🔧 Проблеми конфігурації

### Проблема: Змінні середовища не працюють
**Симптоми:**
- Додаток не читає значення конфігурації
- Змінні середовища виглядають пустими

**Рішення:**
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

### Проблема: Проблеми конфігурації CORS
**Симптоми:**
- Фронтенд не може викликати API
- Блокування запитів з інших джерел

**Рішення:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Оновіть ваш існуючий Express-додаток (з імпортованим `cors`):

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

## 🌍 Проблеми керування середовищем

### Проблема: Помилки при перемиканні середовищ
**Симптоми:**
- Використовується неправильне середовище
- Конфігурація не переключається належним чином

**Рішення:**
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

### Проблема: Пошкодження середовища
**Симптоми:**
- Середовище показує недійсний стан
- Ресурси не відповідають конфігурації

**Рішення:**
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

## 🔍 Проблеми продуктивності

### Проблема: Повільне розгортання
**Симптоми:**
- Розгортання тривають занадто довго
- Тайм-аути під час розгортання

**Рішення:**
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

### Проблема: Проблеми продуктивності додатку
**Симптоми:**
- Повільний час відповіді
- Високе використання ресурсів

**Рішення:**
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

## 🛠️ Інструменти та команди для усунення несправностей

### Команди відлагодження
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

### Аналіз журналів
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

### Коли слід передавати ескалацію
- Проблеми з автентифікацією залишаються після використання всіх рішень
- Проблеми з інфраструктурою Azure
- Проблеми з оплатою або підписками
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
Перед тим, як звертатися до служби підтримки, зберіть:
- Вивід `azd version`
- Вивід `azd config show`
- Вивід `azd show` (поточний стан розгортання)
- Повні повідомлення про помилки
- Кроки для відтворення проблеми
- Приховані деталі середовища (ніколи не передавайте сирі `azd env get-values`, вони можуть містити секрети)
- Хронологія початку проблеми

### Скрипт для збору журналів
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

### Регулярне технічне обслуговування
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Пов’язані ресурси

- [Керівництво з відлагодження](debugging.md) - Розширені техніки відлагодження
- [Створення ресурсів](../chapter-04-infrastructure/provisioning.md) - Усунення неполадок інфраструктури
- [Планування ємності](../chapter-06-pre-deployment/capacity-planning.md) - Рекомендації з планування ресурсів
- [Вибір SKU](../chapter-06-pre-deployment/sku-selection.md) - Рекомендації по рівнях сервісів

---

**Порада**: Збережіть це керівництво в закладках і звертайтеся до нього щоразу, коли виникають проблеми. Більшість проблем вже зустрічалися раніше і мають усталені рішення!

---

**Навігація**
- **Попередній урок**: [Створення ресурсів](../chapter-04-infrastructure/provisioning.md)
- **Наступний урок**: [Керівництво з відлагодження](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->