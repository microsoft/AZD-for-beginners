<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T18:08:19+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ru"
}
-->
# Общие проблемы и их решения

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Устранение неполадок и отладка
- **⬅️ Предыдущая глава**: [Глава 6: Предварительные проверки](../pre-deployment/preflight-checks.md)
- **➡️ Далее**: [Руководство по отладке](debugging.md)
- **🚀 Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../ai-foundry/production-ai-practices.md)

## Введение

Этот подробный справочник по устранению неполадок охватывает наиболее часто встречающиеся проблемы при использовании Azure Developer CLI. Узнайте, как диагностировать, устранять и решать распространенные проблемы с аутентификацией, развертыванием, созданием инфраструктуры и конфигурацией приложений. Каждая проблема включает подробное описание симптомов, причин и пошаговые инструкции по их устранению.

## Цели обучения

После изучения этого руководства вы сможете:
- Освоить методы диагностики проблем с Azure Developer CLI
- Понять распространенные проблемы с аутентификацией и разрешениями, а также их решения
- Устранять сбои развертывания, ошибки создания инфраструктуры и проблемы конфигурации
- Реализовать стратегии мониторинга и отладки для предотвращения проблем
- Применять систематические методы устранения сложных проблем
- Настраивать правильное ведение журналов и мониторинг для предотвращения будущих ошибок

## Результаты обучения

После завершения вы сможете:
- Диагностировать проблемы с Azure Developer CLI, используя встроенные инструменты диагностики
- Самостоятельно решать проблемы с аутентификацией, подпиской и разрешениями
- Эффективно устранять сбои развертывания и ошибки создания инфраструктуры
- Отлаживать проблемы конфигурации приложений и проблемы, связанные с конкретной средой
- Реализовать мониторинг и оповещения для проактивного выявления потенциальных проблем
- Применять лучшие практики ведения журналов, отладки и рабочих процессов устранения проблем

## Быстрая диагностика

Перед тем как переходить к конкретным проблемам, выполните эти команды для сбора диагностической информации:

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

## Проблемы с аутентификацией

### Проблема: "Не удалось получить токен доступа"
**Симптомы:**
- `azd up` завершается ошибкой аутентификации
- Команды возвращают "неавторизовано" или "доступ запрещен"

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

### Проблема: "Недостаточно привилегий" при развертывании
**Симптомы:**
- Развертывание завершается ошибкой разрешений
- Невозможно создать определенные ресурсы Azure

**Решения:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблема: Проблемы с аутентификацией в многопользовательской среде
**Решения:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Ошибки создания инфраструктуры

### Проблема: Конфликты имен ресурсов
**Симптомы:**
- Ошибки "Имя ресурса уже существует"
- Развертывание завершается ошибкой при создании ресурсов

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

### Проблема: Недоступность местоположения/региона
**Симптомы:**
- Ошибка "Местоположение 'xyz' недоступно для типа ресурса"
- Определенные SKUs недоступны в выбранном регионе

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

### Проблема: Превышение квоты
**Симптомы:**
- Ошибка "Превышена квота для типа ресурса"
- "Достигнуто максимальное количество ресурсов"

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

### Проблема: Ошибки шаблонов Bicep
**Симптомы:**
- Ошибки проверки шаблонов
- Синтаксические ошибки в файлах Bicep

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

## 🚀 Сбои развертывания

### Проблема: Ошибки сборки
**Симптомы:**
- Приложение не удается собрать при развертывании
- Ошибки установки пакетов

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

### Проблема: Ошибки развертывания контейнеров
**Симптомы:**
- Контейнерные приложения не запускаются
- Ошибки извлечения образа

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

### Проблема: Ошибки подключения к базе данных
**Симптомы:**
- Приложение не может подключиться к базе данных
- Ошибки тайм-аута подключения

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

## 🔧 Проблемы конфигурации

### Проблема: Переменные окружения не работают
**Симптомы:**
- Приложение не может считать значения конфигурации
- Переменные окружения отображаются пустыми

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

### Проблема: Проблемы с сертификатами SSL/TLS
**Симптомы:**
- HTTPS не работает
- Ошибки проверки сертификатов

**Решения:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблема: Проблемы конфигурации CORS
**Симптомы:**
- Фронтенд не может вызвать API
- Запросы между источниками блокируются

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

## 🌍 Проблемы управления средой

### Проблема: Проблемы переключения среды
**Симптомы:**
- Используется неправильная среда
- Конфигурация не переключается должным образом

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

### Проблема: Повреждение среды
**Симптомы:**
- Среда отображается в недействительном состоянии
- Ресурсы не соответствуют конфигурации

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

## 🔍 Проблемы производительности

### Проблема: Длительное время развертывания
**Симптомы:**
- Развертывание занимает слишком много времени
- Тайм-ауты во время развертывания

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

### Проблема: Проблемы производительности приложения
**Симптомы:**
- Медленное время отклика
- Высокое использование ресурсов

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

## 🛠️ Инструменты и команды для устранения неполадок

### Команды отладки
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

### Анализ журналов
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Исследование ресурсов
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Получение дополнительной помощи

### Когда обращаться за помощью
- Проблемы с аутентификацией сохраняются после попытки всех решений
- Проблемы с инфраструктурой в службах Azure
- Вопросы, связанные с оплатой или подпиской
- Проблемы безопасности или инциденты

### Каналы поддержки
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

### Информация для сбора
Перед обращением в поддержку соберите:
- Вывод команды `azd version`
- Вывод команды `azd info`
- Текст ошибок (полный)
- Шаги для воспроизведения проблемы
- Детали среды (`azd env show`)
- Хронологию возникновения проблемы

### Скрипт для сбора журналов
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

## 📊 Предотвращение проблем

### Контрольный список перед развертыванием
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

### Настройка мониторинга
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

### Регулярное обслуживание
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Связанные ресурсы

- [Руководство по отладке](debugging.md) - Расширенные методы отладки
- [Создание ресурсов](../deployment/provisioning.md) - Устранение неполадок инфраструктуры
- [Планирование емкости](../pre-deployment/capacity-planning.md) - Руководство по планированию ресурсов
- [Выбор SKU](../pre-deployment/sku-selection.md) - Рекомендации по выбору уровня обслуживания

---

**Совет**: Сохраните это руководство в закладках и обращайтесь к нему всякий раз, когда сталкиваетесь с проблемами. Большинство проблем уже встречались ранее и имеют проверенные решения!

---

**Навигация**
- **Предыдущий урок**: [Создание ресурсов](../deployment/provisioning.md)
- **Следующий урок**: [Руководство по отладке](debugging.md)

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.