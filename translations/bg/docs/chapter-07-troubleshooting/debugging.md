# Debugging Guide for AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD за начинаещи](../../README.md)
- **📖 Current Chapter**: Глава 7 - Отстраняване на проблеми и дебъгване
- **⬅️ Previous**: [Често срещани проблеми](common-issues.md)
- **➡️ Next**: [Отстраняване на проблеми, специфични за AI](ai-troubleshooting.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Introduction

Този обширен наръчник предоставя напреднали стратегии, инструменти и техники за дебъгване за диагностика и разрешаване на сложни проблеми при разгръщания с Azure Developer CLI. Научете систематични методологии за отстраняване на проблеми, техники за анализ на логове, профилиране на производителността и разширени диагностични инструменти за ефективно разрешаване на проблеми при разгръщане и време на изпълнение.

## Learning Goals

След завършване на този наръчник ще:
- Овладеете систематични методологии за дебъгване при проблеми с Azure Developer CLI
- Разберете конфигурация за разширено логване и техники за анализ на логове
- Внедрите стратегии за профилиране и мониторинг на производителността
- Използвате диагностични инструменти и услуги на Azure за разрешаване на сложни проблеми
- Прилагате техники за мрежово дебъгване и отстраняване на проблеми със сигурността
- Конфигурирате комплексен мониторинг и алармиране за проактивно откриване на проблеми

## Learning Outcomes

При завършване ще можете да:
- Прилагате методологията TRIAGE за систематично дебъгване на сложни проблеми при разгръщане
- Конфигурирате и анализирате комплексна информация за логване и трасировка
- Използвате ефективно Azure Monitor, Application Insights и диагностични инструменти
- Отстранявате проблеми с мрежовата свързаност, удостоверяването и правата самостоятелно
- Внедрявате мониторинг и стратегии за оптимизация на производителността
- Създавате персонализирани скриптове за дебъг и автоматизация за повтарящи се проблеми

## Debugging Methodology

### The TRIAGE Approach
- **T**време: Кога започна проблемът?
- **R**възпроизвеждане: Можете ли да го възпроизведете последователно?
- **I**золиране: Кой компонент се проваля?
- **A**нализ: Какво ни казват логовете?
- **G**ъбиране: Съберете цялата релевантна информация
- **E**скалиране: Кога да потърсите допълнителна помощ

## Enabling Debug Mode

### Environment Variables
```bash
# Активиране на изчерпателно отстраняване на грешки
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Отстраняване на грешки на Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Изключване на телеметрията за по-чист изход
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Задайте глобално конфигурацията за отстраняване на грешки
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Активирайте проследяващо регистриране
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Log Analysis Techniques

### Understanding Log Levels
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Structured Log Analysis
```bash
# Преглед на логове с Azure Monitor (чрез azd monitor)
azd monitor --logs

# Преглед на логовете на приложението в реално време
azd monitor --live

# За подробен анализ на логовете използвайте Azure CLI с вашия App Service или Container App:
# Логове на App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Логове на Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Експортирайте логовете от Application Insights за анализ
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Корелиране на логове между услуги чрез Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Търсене в Application Insights за корелирани логове
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Търсене в логовете за активност на Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Advanced Debugging Tools

### Azure Resource Graph Queries
```bash
# Запитване на ресурси по етикети
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Намиране на неуспешни разгръщания
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Проверка на здравето на ресурсите
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# Проверка на свързаността между услугите
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

# Използване
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# Отстраняване на проблеми с контейнерно приложение
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

### Database Connection Debugging
```bash
# Отстраняване на грешки при свързване към базата данни
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

## 🔬 Performance Debugging

### Application Performance Monitoring
```bash
# Активиране на отстраняване на грешки за Application Insights
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

### Resource Utilization Analysis
```bash
# Следете използването на ресурсите
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

## 🧪 Testing and Validation

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Настрой среда за отстраняване на грешки
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Вземи крайните точки на услугите
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Тествай здравните крайни точки
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

# Изпълни тестовете
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Изпълни персонализирани интеграционни тестове
npm run test:integration
```

### Load Testing for Debugging
```bash
# Прост тест за натоварване за идентифициране на тесните места в производителността
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Използване на Apache Bench (инсталиране: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Извличане на ключови показатели
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Проверка за неуспехи
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastructure Debugging

### Bicep Template Debugging
```bash
# Валидиране на Bicep шаблони с подробен изход
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Проверка на синтаксиса
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Проверка с lint
    az bicep lint --file "$template_file"
    
    # Симулирано разгръщане (What-if)
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Отстраняване на грешки при разгръщане на шаблони
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

### Resource State Analysis
```bash
# Анализирайте състоянията на ресурсите за несъответствия
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Избройте всички ресурси със съответните им състояния
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

## 🔒 Security Debugging

### Authentication Flow Debugging
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

### Network Security Debugging
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

## 📱 Application-Specific Debugging

### Node.js Application Debugging
```javascript
// debug-middleware.js - мидълуер за отстраняване на грешки в Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Записва подробности за заявката
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Презаписва res.json, за да записва отговорите
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Database Query Debugging
```javascript
// database-debug.js - Инструменти за отстраняване на грешки в базата данни
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

## 🚨 Emergency Debugging Procedures

### Production Issue Response
```bash
#!/bin/bash
# emergency-debug.sh - Аварийно отстраняване на грешки в продукция

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
# Използвайте Azure Monitor за логове на грешки
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

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

### Rollback Procedures
```bash
# Бърз скрипт за връщане назад
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Смяна на средата
    azd env select "$environment"
    
    # Връщане назад с помощта на Git (AZD няма вграден механизъм за връщане назад)
    git checkout "$previous_commit"
    azd deploy
    
    # Проверка на връщането назад
    echo "Verifying rollback..."
    azd show
    
    # Тестване на критичните крайни точки
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboards

### Custom Monitoring Dashboard
```bash
# Създайте заявки за Application Insights за отстраняване на грешки
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
    
    # Заявка за откази на зависимости
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# Агрегиране на журнали от множество източници в Azure
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Advanced Resources

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - Изчерпателна проверка на състоянието
- `performance-test.sh` - Автоматизирано тестване на производителността
- `log-analyzer.py` - Разширено парсване и анализ на логове
- `resource-validator.sh` - Валидация на инфраструктурата

### Monitoring Integration
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

## Best Practices

1. **Винаги включвайте debug логване** в непроизводствени среди
2. **Създавайте възпроизводими тестови случаи** за проблемите
3. **Документирайте процедурите за дебъгване** за вашия екип
4. **Автоматизирайте проверките на здравето** и мониторинга
5. **Поддържайте инструментите за дебъг актуални** с промените в приложението
6. **Практикувайте процедурите за дебъгване** в моменти без инциденти

## Next Steps

- [Планиране на капацитета](../chapter-06-pre-deployment/capacity-planning.md) - Планирайте ресурсните изисквания
- [Избор на SKU](../chapter-06-pre-deployment/sku-selection.md) - Изберете подходящи нива на услуги
- [Предварителни проверки](../chapter-06-pre-deployment/preflight-checks.md) - Предвариателна валидация преди разгръщане
- [Бърз справочник](../../resources/cheat-sheet.md) - Команди за бърз достъп

---

**Запомнете**: Доброто дебъгване означава да бъдете систематични, методични и търпеливи. Тези инструменти и техники ще ви помогнат да диагностицирате проблемите по-бързо и по-ефективно.

---

**Navigation**
- **Previous Lesson**: [Често срещани проблеми](common-issues.md)

- **Next Lesson**: [Планиране на капацитета](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия изходен език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->