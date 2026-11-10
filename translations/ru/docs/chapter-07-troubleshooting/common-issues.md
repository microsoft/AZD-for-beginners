# Распространённые проблемы и их решения

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Поиск и устранение неисправностей
- **⬅️ Предыдущая глава**: [Глава 6: Предварительные проверки](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следующая**: [Руководство по отладке](debugging.md)
- **🚀 Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../chapter-08-production/production-ai-practices.md)

## Введение

Это исчерпывающее руководство по устранению неисправностей охватывает наиболее часто встречающиеся проблемы при использовании Azure Developer CLI. Научитесь диагностировать, устранять и решать типичные проблемы с аутентификацией, развертыванием, предоставлением инфраструктуры и конфигурацией приложений. Для каждой проблемы приведены подробные симптомы, основные причины и пошаговые инструкции по решению.

## Цели обучения

Пройдя это руководство, вы сможете:
- Овладеть методами диагностики проблем Azure Developer CLI
- Понимать распространённые проблемы с аутентификацией и разрешениями и их решения
- Решать ошибки развертывания, предоставления инфраструктуры и настройки
- Внедрять проактивный мониторинг и стратегии отладки
- Применять систематические методологии устранения сложных проблем
- Правильно настраивать логирование и мониторинг для предотвращения будущих проблем

## Результаты обучения

По окончании вы сможете:
- Диагностировать проблемы Azure Developer CLI с помощью встроенных диагностических инструментов
- Самостоятельно решать проблемы с аутентификацией, подписками и разрешениями
- Эффективно устранять сбои развертывания и ошибки предоставления инфраструктуры
- Отлаживать проблемы с конфигурацией приложений и специфические для среды проблемы
- Внедрять мониторинг и оповещения для проактивного выявления потенциальных проблем
- Применять лучшие практики логирования, отладки и рабочих процессов решения проблем

## Быстрая диагностика

> Замените примерные имена/ID на значения вашей среды. Фрагменты Bash, Bicep, JavaScript и файлов параметров обозначены отдельно ниже; это не один исполняемый скрипт. Проверяйте разрушительные операции и удаляйте секреты перед отправкой диагностики. `azd monitor --logs` открывает браузер; он не транслирует логи терминала.

Прежде чем переходить к конкретным проблемам, выполните эти команды для сбора диагностической информации:

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

## Проблемы с аутентификацией

### Проблема: «Не удалось получить токен доступа»
**Симптомы:**
- `azd up` завершается ошибками аутентификации
- Команды возвращают «неавторизован» или «доступ запрещён»

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

### Проблема: «Недостаточно прав» при развертывании
**Симптомы:**
- Развертывание завершается ошибками разрешений
- Невозможно создать определённые ресурсы Azure

**Решения:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Проблема: Проблемы многоарендной аутентификации
**Решения:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Ошибки предоставления инфраструктуры

### Проблема: Конфликты имён ресурсов
**Симптомы:**
- Ошибки «Имя ресурса уже существует»
- Сбой развертывания во время создания ресурсов

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

### Проблема: Наличие локации/региона недоступно
**Симптомы:**
- Ошибка «Локация 'xyz' недоступна для типа ресурса»
- Некоторые SKU недоступны в выбранном регионе

**Решения:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Изменение переменной локации не мигрирует существующие ресурсы. Существующая группа ресурсов или ресурс могут отклонить изменение локации; используйте отдельную среду для регионального повторного развертывания.

### Проблема: Ошибки превышения квот
**Симптомы:**
- Ошибка «Превышена квота для типа ресурса»
- «Достигнуто максимальное количество ресурсов»

**Решения:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Для разработки выберите меньший поддерживаемый SKU в `infra/main.parameters.json`:

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

### Проблема: Ошибки шаблонов Bicep
**Симптомы:**
- Сбой проверки шаблона
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

### Проблема: Сбой сборки
**Симптомы:**
- Приложение не собирается при развертывании
- Ошибки установки пакетов

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

### Проблема: Сбои развертывания контейнеров
**Симптомы:**
- Контейнерные приложения не запускаются
- Ошибки загрузки образа

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

### Проблема: Сбои подключения к базе данных
**Симптомы:**
- Приложение не может подключиться к базе данных
- Ошибки таймаута подключения

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
- Приложение не читает значения конфигурации
- Переменные окружения кажутся пустыми

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

### Проблема: Проблемы с сертификатами SSL/TLS
**Симптомы:**
- HTTPS не работает
- Ошибки проверки сертификата

**Решения:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблема: Проблемы с настройкой CORS
**Симптомы:**
- Фронтенд не может вызвать API
- Запросы с другого происхождения блокируются

**Решения:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Обновите ваше существующее приложение Express (с импортированным `cors`):

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

## 🌍 Проблемы управления средой

### Проблема: Проблемы переключения среды
**Симптомы:**
- Используется неправильная среда
- Конфигурация не переключается корректно

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

### Проблема: Повреждение среды
**Симптомы:**
- Среда отображает недопустимое состояние
- Ресурсы не соответствуют конфигурации

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

## 🔍 Проблемы с производительностью

### Проблема: Медленное время развертывания
**Симптомы:**
- Развертывания занимают слишком много времени
- Таймауты при развертывании

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

### Проблема: Проблемы с производительностью приложения
**Симптомы:**
- Медленное время отклика
- Высокое использование ресурсов

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

## 🛠️ Инструменты и команды для устранения неполадок

### Команды для отладки
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

### Анализ журналов
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

### Когда обращаться к эскалации
- Проблемы с аутентификацией сохраняются после всех попыток решения
- Проблемы с инфраструктурой Azure-услуг
- Вопросы, связанные с выставлением счетов или подпиской
- Вопросы безопасности или инциденты

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
Прежде чем обращаться в поддержку, соберите:
- вывод `azd version`
- вывод `azd config show`
- вывод `azd show` (текущее состояние развертывания)
- Сообщения об ошибках (полный текст)
- Шаги для воспроизведения проблемы
- Отредактированные данные среды (никогда не передавайте необработанный `azd env get-values`, который может содержать секреты)
- Хронология возникновения проблемы

### Скрипт сбора журналов
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

### Регулярное обслуживание
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Связанные ресурсы

- [Руководство по отладке](debugging.md) - Расширенные методы отладки
- [Предоставление ресурсов](../chapter-04-infrastructure/provisioning.md) - Устранение проблем с инфраструктурой
- [Планирование ёмкости](../chapter-06-pre-deployment/capacity-planning.md) - Руководство по планированию ресурсов
- [Выбор SKU](../chapter-06-pre-deployment/sku-selection.md) - Рекомендации по уровням сервиса

---

**Совет**: Держите это руководство в закладках и обращайтесь к нему при возникновении проблем. Большинство проблем уже встречались и имеют проверенные решения!

---

**Навигация**
- **Предыдущий урок**: [Предоставление ресурсов](../chapter-04-infrastructure/provisioning.md)
- **Следующий урок**: [Руководство по отладке](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->