# Посібник з налагодження для розгортань AZD

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Вирішення проблем і налагодження
- **⬅️ Попередній**: [Поширені проблеми](common-issues.md)
- **➡️ Наступний**: [Вирішення проблем, пов'язаних з AI](ai-troubleshooting.md)
- **🚀 Наступний розділ**: [Розділ 8: Шаблони для виробництва та підприємств](../microsoft-foundry/production-ai-practices.md)

## Вступ

Цей детальний посібник пропонує розширені стратегії налагодження, інструменти та методи для діагностики та вирішення складних проблем із розгортаннями Azure Developer CLI. Дізнайтеся про систематичні методології вирішення проблем, техніки аналізу журналів, профілювання продуктивності та розширені діагностичні інструменти для ефективного вирішення проблем із розгортанням і виконанням.

## Цілі навчання

Після завершення цього посібника ви:
- Опануєте систематичні методології налагодження для проблем Azure Developer CLI
- Зрозумієте розширені конфігурації журналів та техніки їх аналізу
- Реалізуєте стратегії профілювання продуктивності та моніторингу
- Використовуватимете діагностичні інструменти та сервіси Azure для вирішення складних проблем
- Застосовуватимете методи налагодження мережі та безпеки
- Налаштуєте комплексний моніторинг і сповіщення для проактивного виявлення проблем

## Результати навчання

Після завершення ви зможете:
- Застосовувати методологію TRIAGE для систематичного налагодження складних проблем із розгортанням
- Налаштовувати та аналізувати детальну інформацію про журнали та трасування
- Ефективно використовувати Azure Monitor, Application Insights та діагностичні інструменти
- Самостійно налагоджувати проблеми з мережевою підключеністю, автентифікацією та дозволами
- Реалізовувати стратегії моніторингу та оптимізації продуктивності
- Створювати власні скрипти для налагодження та автоматизації повторюваних проблем

## Методологія налагодження

### Підхід TRIAGE
- **T**ime: Коли проблема почалася?
- **R**eproduce: Чи можете ви постійно її відтворювати?
- **I**solate: Який компонент не працює?
- **A**nalyze: Що кажуть журнали?
- **G**ather: Зберіть всю відповідну інформацію
- **E**scalate: Коли слід звернутися за додатковою допомогою

## Увімкнення режиму налагодження

### Змінні середовища
```bash
# Увімкнути всебічне налагодження
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Налагодження Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Вимкнути телеметрію для чистішого виводу
export AZD_DISABLE_TELEMETRY=true
```

### Конфігурація налагодження
```bash
# Встановити конфігурацію налагодження глобально
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Увімкнути трасувальне логування
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Техніки аналізу журналів

### Розуміння рівнів журналів
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Структурний аналіз журналів
```bash
# Фільтрувати журнали за рівнем
azd logs --level error --since 1h

# Фільтрувати за сервісом
azd logs --service api --level debug

# Експортувати журнали для аналізу
azd logs --output json > deployment-logs.json

# Розбирати журнали JSON за допомогою jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Кореляція журналів
```bash
#!/bin/bash
# correlate-logs.sh - Корелювати журнали між сервісами

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Шукати серед усіх сервісів
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Шукати журнали Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Розширені інструменти налагодження

### Запити Azure Resource Graph
```bash
# Запит ресурсів за тегами
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Знайти невдалі розгортання
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Перевірити стан ресурсу
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Налагодження мережі
```bash
# Перевірка з'єднання між сервісами
test_connectivity() {
    local source=$1
    local dest=$2
    local port=$3
    
    echo "Testing connectivity from $source to $dest:$port"
    
    az network watcher test-connectivity \
        --source-resource "$source" \
        --dest-address "$dest" \
        --dest-port "$port" \
        --output table
}

# Використання
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Налагодження контейнерів
```bash
# Виправлення проблем з додатком-контейнером
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningState:runningState}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### Налагодження підключення до бази даних
```bash
# Налагодження підключення до бази даних
debug_database() {
    local db_server=$1
    local db_name=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 Налагодження продуктивності

### Моніторинг продуктивності додатків
```bash
# Увімкнути налагодження Application Insights
export APPLICATIONINSIGHTS_CONFIGURATION_CONTENT='{
  "role": {
    "name": "myapp-debug"
  },
  "sampling": {
    "percentage": 100
  },
  "instrumentation": {
    "logging": {
      "level": "DEBUG"
    }
  }
}'

# Користувацький моніторинг продуктивності
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        response_time=$(curl -o /dev/null -s -w "%{time_total}" "$endpoint")
        status_code=$(curl -o /dev/null -s -w "%{http_code}" "$endpoint")
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### Аналіз використання ресурсів
```bash
# Моніторинг використання ресурсів
monitor_resources() {
    local resource_group=$1
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 Тестування та перевірка

### Налагодження інтеграційних тестів
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Встановити середовище налагодження
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Отримати кінцеві точки сервісу
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Тестувати кінцеві точки здоров'я
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# Запустити тести
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Запустити власні інтеграційні тести
npm run test:integration
```

### Налагодження під час навантажувального тестування
```bash
# Простий тест навантаження для визначення вузьких місць продуктивності
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Використання Apache Bench (встановлення: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Витяг ключових метрик
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Перевірка на помилки
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Налагодження інфраструктури

### Налагодження шаблонів Bicep
```bash
# Перевірка шаблонів Bicep з детальним виводом
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Перевірка синтаксису
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Перевірка стилю
    az bicep lint --file "$template_file"
    
    # Що-як розгортання
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Налагодження розгортання шаблону
debug_deployment() {
    local deployment_name=$1
    local resource_group=$2
    
    echo "=== Deployment Status ==="
    az deployment group show \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,timestamp:timestamp}"
    
    echo "=== Deployment Operations ==="
    az deployment operation group list \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "[].{operationId:operationId,provisioningState:properties.provisioningState,resourceType:properties.targetResource.resourceType,error:properties.statusMessage.error}"
}
```

### Аналіз стану ресурсів
```bash
# Аналізуйте стан ресурсів на наявність невідповідностей
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Перелічіть всі ресурси з їх станами
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Перевірте наявність невдалих ресурсів
    failed_resources=$(az resource list --resource-group "$resource_group" \
        --query "[?properties.provisioningState != 'Succeeded'].{name:name,state:properties.provisioningState}" \
        --output tsv)
    
    if [ -n "$failed_resources" ]; then
        echo "❌ Failed resources found:"
        echo "$failed_resources"
    else
        echo "✅ All resources provisioned successfully"
    fi
}
```

## 🔒 Налагодження безпеки

### Налагодження потоків автентифікації
```bash
# Налагодження автентифікації Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Декодування токена JWT (потрібні jq та base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Налагодження доступу до Key Vault
debug_keyvault() {
    local vault_name=$1
    
    echo "=== Key Vault Access Policies ==="
    az keyvault show --name "$vault_name" --query "properties.accessPolicies[].{objectId:objectId,permissions:permissions}"
    
    echo "=== RBAC Assignments ==="
    vault_id=$(az keyvault show --name "$vault_name" --query id -o tsv)
    az role assignment list --scope "$vault_id"
    
    echo "=== Test Secret Access ==="
    az keyvault secret list --vault-name "$vault_name" --query "[].name" || echo "❌ Cannot access secrets"
}
```

### Налагодження мережевої безпеки
```bash
# Налагодження груп безпеки мережі
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Перевірка правил безпеки
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Налагодження специфічних додатків

### Налагодження додатків Node.js
```javascript
// debug-middleware.js - Проміжне програмне забезпечення для налагодження Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Записати деталі запиту
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Перевизначити res.json для запису відповідей
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Налагодження запитів до бази даних
```javascript
// database-debug.js - Утиліти для налагодження бази даних
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        debug('Executing query:', { text, params });
        
        try {
            const result = await super.query(text, params);
            const duration = Date.now() - start;
            debug(`Query completed in ${duration}ms`, {
                rowCount: result.rowCount,
                command: result.command
            });
            return result;
        } catch (error) {
            const duration = Date.now() - start;
            debug(`Query failed after ${duration}ms:`, error.message);
            throw error;
        }
    }
}

module.exports = DebuggingPool;
```

## 🚨 Процедури екстреного налагодження

### Реакція на проблеми у виробництві
```bash
#!/bin/bash
# emergency-debug.sh - Екстрене налагодження у виробничому середовищі

set -e

RESOURCE_GROUP=$1
ENVIRONMENT=$2

if [ -z "$RESOURCE_GROUP" ] || [ -z "$ENVIRONMENT" ]; then
    echo "Usage: $0 <resource-group> <environment>"
    exit 1
fi

echo "🚨 EMERGENCY DEBUGGING STARTED: $(date)"
echo "Resource Group: $RESOURCE_GROUP"
echo "Environment: $ENVIRONMENT"

# Переключитися на правильне середовище
azd env select "$ENVIRONMENT"

# Зібрати критичну інформацію
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
azd logs --level error --since 30m > emergency-errors.log
echo "Error count: $(wc -l < emergency-errors.log)"

echo "=== 4. Resource Status ==="
az resource list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState != 'Succeeded']" > failed-resources.json

if [ -s failed-resources.json ]; then
    echo "❌ Failed resources found!"
    cat failed-resources.json
else
    echo "✅ All resources are healthy"
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - emergency-errors.log"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### Процедури відкату
```bash
# Швидкий скрипт відкату
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Перемикання середовища
    azd env select "$environment"
    
    # Відкат застосунку
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Перевірка відкату
    echo "Verifying rollback..."
    azd show
    
    # Тестування критичних точок доступу
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Панелі налагодження

### Кастомна панель моніторингу
```bash
# Створіть запити Application Insights для налагодження
create_debug_queries() {
    local app_insights_name=$1
    
    # Запит на помилки
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Запит на проблеми з продуктивністю
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Запит на збої залежностей
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Агрегація журналів
```bash
# Агрегуйте журнали з кількох джерел
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azd", "logs": ['
        azd logs --output json --since 1h | sed '$ ! s/$/,/'
        echo ']}'
        
        echo ',{"source": "azure", "logs": ['
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json | sed '$ ! s/$/,/'
        echo ']}'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Розширені ресурси

### Кастомні скрипти для налагодження
Створіть каталог `scripts/debug/` із:
- `health-check.sh` - Комплексна перевірка стану
- `performance-test.sh` - Автоматизоване тестування продуктивності
- `log-analyzer.py` - Розширений аналіз журналів
- `resource-validator.sh` - Перевірка інфраструктури

### Інтеграція моніторингу
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## Найкращі практики

1. **Завжди увімкніть журнал налагодження** у непроизводчих середовищах
2. **Створюйте відтворювані тестові випадки** для проблем
3. **Документуйте процедури налагодження** для вашої команди
4. **Автоматизуйте перевірки стану** та моніторинг
5. **Оновлюйте інструменти налагодження** відповідно до змін вашого додатка
6. **Практикуйте процедури налагодження** у періоди без інцидентів

## Наступні кроки

- [Планування потужностей](../pre-deployment/capacity-planning.md) - Планування вимог до ресурсів
- [Вибір SKU](../pre-deployment/sku-selection.md) - Вибір відповідних рівнів сервісу
- [Перевірки перед розгортанням](../pre-deployment/preflight-checks.md) - Валідація перед розгортанням
- [Шпаргалка](../../resources/cheat-sheet.md) - Швидкі команди для довідки

---

**Пам'ятайте**: Хороше налагодження — це систематичність, ретельність і терпіння. Ці інструменти та методи допоможуть вам швидше та ефективніше діагностувати проблеми.

---

**Навігація**
- **Попередній урок**: [Поширені проблеми](common-issues.md)

- **Наступний урок**: [Планування потужностей](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->