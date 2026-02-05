# Ръководство за отстраняване на грешки при AZD внедрявания

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на грешки и диагностика
- **⬅️ Предишна**: [Често срещани проблеми](common-issues.md)
- **➡️ Следваща**: [Отстраняване на грешки, свързани с AI](ai-troubleshooting.md)
- **🚀 Следваща глава**: [Глава 8: Модели за продукция и корпоративни практики](../microsoft-foundry/production-ai-practices.md)

## Въведение

Това изчерпателно ръководство предоставя напреднали стратегии, инструменти и техники за диагностициране и разрешаване на сложни проблеми с внедряванията чрез Azure Developer CLI. Научете систематични методологии за отстраняване на грешки, техники за анализ на логове, профилиране на производителността и напреднали диагностични инструменти за ефективно разрешаване на проблеми при внедряване и изпълнение.

## Цели на обучението

След завършване на това ръководство ще можете:
- Да овладеете систематични методологии за отстраняване на грешки при Azure Developer CLI
- Да разберете напреднали конфигурации за логване и техники за анализ на логове
- Да приложите стратегии за профилиране и мониторинг на производителността
- Да използвате Azure диагностични инструменти и услуги за разрешаване на сложни проблеми
- Да приложите техники за отстраняване на грешки в мрежата и сигурността
- Да конфигурирате цялостен мониторинг и известяване за проактивно откриване на проблеми

## Резултати от обучението

След завършване ще можете:
- Да приложите методологията TRIAGE за систематично отстраняване на сложни проблеми при внедряване
- Да конфигурирате и анализирате цялостна информация за логване и проследяване
- Да използвате ефективно Azure Monitor, Application Insights и диагностични инструменти
- Да отстранявате проблеми с мрежова свързаност, автентикация и разрешения самостоятелно
- Да приложите стратегии за мониторинг и оптимизация на производителността
- Да създавате персонализирани скриптове за отстраняване на грешки и автоматизация за повтарящи се проблеми

## Методология за отстраняване на грешки

### Подходът TRIAGE
- **T**ime: Кога е започнал проблемът?
- **R**eproduce: Можете ли да го възпроизведете последователно?
- **I**solate: Кой компонент не работи?
- **A**nalyze: Какво ни казват логовете?
- **G**ather: Съберете цялата релевантна информация
- **E**scalate: Кога да потърсите допълнителна помощ

## Активиране на режим за отстраняване на грешки

### Променливи на средата
```bash
# Активирайте цялостно дебъгване
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Дебъгване на Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Деактивирайте телеметрията за по-чист изход
export AZD_DISABLE_TELEMETRY=true
```

### Конфигурация за отстраняване на грешки
```bash
# Задайте конфигурацията за дебъг глобално
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Активирайте проследяващото логване
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Техники за анализ на логове

### Разбиране на нивата на логовете
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Структуриран анализ на логове
```bash
# Филтриране на логовете по ниво
azd logs --level error --since 1h

# Филтриране по услуга
azd logs --service api --level debug

# Експортиране на логовете за анализ
azd logs --output json > deployment-logs.json

# Парсиране на JSON логове с jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Корелация на логове
```bash
#!/bin/bash
# correlate-logs.sh - Корелиране на логове между услуги

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Търсене във всички услуги
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Търсене в Azure логове
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Напреднали инструменти за отстраняване на грешки

### Запитвания към Azure Resource Graph
```bash
# Търсене на ресурси по етикети
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Намерете неуспешни внедрения
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Проверете здравето на ресурса
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Отстраняване на мрежови проблеми
```bash
# Тествайте свързаността между услугите
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

# Употреба
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Отстраняване на грешки в контейнери
```bash
# Отстраняване на проблеми с контейнерното приложение
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

### Отстраняване на грешки при връзка с база данни
```bash
# Отстраняване на грешки при свързване с базата данни
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

## 🔬 Отстраняване на проблеми с производителността

### Мониторинг на производителността на приложенията
```bash
# Активиране на дебъгинг за Application Insights
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

# Персонализирано наблюдение на производителността
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

### Анализ на използването на ресурси
```bash
# Наблюдавайте използването на ресурси
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

## 🧪 Тестване и валидация

### Отстраняване на грешки при интеграционни тестове
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Задайте среда за отстраняване на грешки
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Получете крайни точки на услугата
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Тествайте крайни точки за здраве
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

# Стартирайте тестовете
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Стартирайте персонализирани интеграционни тестове
npm run test:integration
```

### Тестване на натоварване за отстраняване на грешки
```bash
# Прост тест за натоварване за идентифициране на проблеми с производителността
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Използване на Apache Bench (инсталиране: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Извличане на ключови метрики
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Проверка за неуспехи
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Отстраняване на грешки в инфраструктурата

### Отстраняване на грешки в шаблони на Bicep
```bash
# Валидиране на Bicep шаблони с подробен изход
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Проверка на синтаксиса
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Проверка за стил
    az bicep lint --file "$template_file"
    
    # Какво-ако разгръщане
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Отстраняване на грешки при разгръщане на шаблон
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

### Анализ на състоянието на ресурсите
```bash
# Анализирайте състоянията на ресурсите за несъответствия
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Избройте всички ресурси с техните състояния
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Проверете за неуспешни ресурси
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

## 🔒 Отстраняване на грешки в сигурността

### Отстраняване на грешки в процеса на автентикация
```bash
# Отстраняване на грешки при удостоверяване в Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Декодиране на JWT токен (изисква jq и base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Отстраняване на грешки при достъп до Key Vault
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

### Отстраняване на грешки в мрежовата сигурност
```bash
# Отстраняване на грешки в групите за мрежова сигурност
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Проверка на правилата за сигурност
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Отстраняване на грешки, специфични за приложения

### Отстраняване на грешки в Node.js приложения
```javascript
// debug-middleware.js - Express отладъчен middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Запиши подробности за заявката
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Замени res.json, за да записва отговорите
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Отстраняване на грешки в заявки към база данни
```javascript
// database-debug.js - Инструменти за дебъгване на база данни
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

## 🚨 Процедури за спешно отстраняване на грешки

### Реакция при проблеми в продукция
```bash
#!/bin/bash
# emergency-debug.sh - Спешно отстраняване на грешки в продукция

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

# Превключете към правилната среда
azd env select "$ENVIRONMENT"

# Съберете критична информация
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

### Процедури за връщане назад
```bash
# Бърз скрипт за връщане назад
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Превключване на среда
    azd env select "$environment"
    
    # Връщане назад на приложението
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Проверка на връщането назад
    echo "Verifying rollback..."
    azd show
    
    # Тестване на критични крайни точки
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Табла за отстраняване на грешки

### Персонализирано табло за мониторинг
```bash
# Създайте заявки за Application Insights за дебъгване
create_debug_queries() {
    local app_insights_name=$1
    
    # Заявка за грешки
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Заявка за проблеми с производителността
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Заявка за неуспехи на зависимости
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Агрегация на логове
```bash
# Събиране на дневници от множество източници
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

## 🔗 Напреднали ресурси

### Персонализирани скриптове за отстраняване на грешки
Създайте директория `scripts/debug/` с:
- `health-check.sh` - Цялостна проверка на състоянието
- `performance-test.sh` - Автоматизирано тестване на производителността
- `log-analyzer.py` - Напреднал анализ и обработка на логове
- `resource-validator.sh` - Валидация на инфраструктурата

### Интеграция на мониторинг
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

## Най-добри практики

1. **Винаги активирайте логване за отстраняване на грешки** в непроизводствени среди
2. **Създавайте възпроизводими тестови случаи** за проблеми
3. **Документирайте процедурите за отстраняване на грешки** за вашия екип
4. **Автоматизирайте проверките на състоянието** и мониторинга
5. **Поддържайте инструментите за отстраняване на грешки актуални** с промените в приложението
6. **Практикувайте процедурите за отстраняване на грешки** извън инцидентни ситуации

## Следващи стъпки

- [Планиране на капацитет](../pre-deployment/capacity-planning.md) - Планирайте изискванията за ресурси
- [Избор на SKU](../pre-deployment/sku-selection.md) - Изберете подходящи нива на услуги
- [Проверки преди внедряване](../pre-deployment/preflight-checks.md) - Валидация преди внедряване
- [Справочник](../../resources/cheat-sheet.md) - Бързи референтни команди

---

**Запомнете**: Доброто отстраняване на грешки изисква систематичност, задълбоченост и търпение. Тези инструменти и техники ще ви помогнат да диагностицирате проблемите по-бързо и по-ефективно.

---

**Навигация**
- **Предишен урок**: [Често срещани проблеми](common-issues.md)

- **Следващ урок**: [Планиране на капацитет](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или погрешни интерпретации, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->