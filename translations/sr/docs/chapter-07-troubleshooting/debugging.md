# Vodič za отклањање грешака при AZD имплементацијама

**Навигација кроз поглавља:**
- **📚 Почетна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 7 - Решавање проблема и отклањање грешака
- **⬅️ Претходно**: [Уобичајени проблеми](common-issues.md)
- **➡️ Следеће**: [AI-специфично решавање проблема](ai-troubleshooting.md)
- **🚀 Следеће поглавље**: [Поглавље 8: Примене у производњи и за предузећа](../chapter-08-production/production-ai-practices.md)

## Увод

Овај свеобухватни водич пружа напредне стратегије за отклањање грешака, алате и технике за дијагностиковање и решавање сложених проблема са Azure Developer CLI имплементацијама. Научите систематске методологије решавања проблема, технике анализе логова, профилисање перформанси и напредне дијагностичке алате како бисте ефикасно решили проблеме приликом имплементације и у време извођења.

## Циљеви учења

Завршетком овог водича, ви ћете:
- Усвојити систематске методологије отклањања грешака за Azure Developer CLI
- Разумети напредну конфигурацију логова и технике анализе логова
- Имплементирати профилисање перформанси и стратегије праћења
- Користити Azure дијагностичке алате и сервисе за решавање сложених проблема
- Примeњивати технике отклањања проблема у мрежи и безбедносне дијагностике
- Конфигурисати свеобухватно праћење и алармирање за проактивно откривање проблема

## Исходи учења

По завршетку, бићете у стању да:
- Примените TRIAGE методологију за систематско отклањање сложених проблема при имплементацији
- Конфигуришете и анализирате свеобухватне информације о логовању и праћењу
- Ефикасно користите Azure Monitor, Application Insights и дијагностичке алате
- Самостално отклањате проблеме са мрежном повезаношћу, аутентификацијом и дозволама
- Имплементирате стратегије праћења перформанси и оптимизације
- Креирате прилагођене скрипте за отклањање грешака и аутоматизацију за понављајуће проблеме

## Методологија отклањања грешака

### TRIAGE приступ
- **T**ime: Када је проблем почео?
- **R**eproduce: Можете ли га доследно репродуковати?
- **I**solate: Који компонент не ради?
- **A**nalyze: Шта нам логови говоре?
- **G**ather: Прикупите све релевантне информације
- **E**scalate: Када тражити додатну помоћ

## Омогућавање debug режима

### Environment Variables
```bash
# Омогући свеобухватно отклањање грешака
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Отклањање грешака у Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Онемогући телеметрију ради чистијег излаза
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Постави конфигурацију дебаговања глобално
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Омогући детаљно логовање
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Технике анализе логова

### Разумевање нивоа логова
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Структурисана анализа логова
```bash
# Погледајте логове у Azure Monitor-у (преко azd monitor)
azd monitor --logs

# Погледајте логове апликације у реалном времену
azd monitor --live

# За детаљну анализу логова, користите Azure CLI са вашим App Service-ом или Container App-ом:
# Логови App Service-а
az webapp log tail --name <app-name> --resource-group <rg-name>

# Логови Container App-а
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Извезите логове Application Insights-а за анализу
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Корелација логова
```bash
#!/bin/bash
# correlate-logs.sh - Корелација логова међу сервисима помоћу Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Претражите Application Insights за корелираним логовима
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Претражите Azure дневнике активности
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Напредни алати за отклањање грешака

### Azure Resource Graph упити
```bash
# Претражи ресурсе по ознакама
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Пронађи неуспела размештања
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Провери здравље ресурса
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Мрежно отклањање грешака
```bash
# Тестирајте повезаност између сервиса
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

# Коришћење
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Отклањање грешака у контејнерима
```bash
# Отклањање проблема апликације у контејнеру
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

### Отклањање проблема са везом ка бази података
```bash
# Отстрани проблеме у повезивању са базом података
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

## 🔬 Дебаг перформанси

### Мониторинг перформанси апликације
```bash
# Омогући отклањање грешака за Application Insights
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

# Прилагођено праћење перформанси
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

### Анализа искоришћености ресурса
```bash
# Праћење коришћења ресурса
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

## 🧪 Тестирање и валидација

### Отклањање грешака интеграционих тестова
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Подеси окружење за дебаговање
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Добиј крајње тачке услуге
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Тестирај крајње тачке за проверу здравља
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

# Покрени тестове
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Покрени прилагођене интеграционе тестове
npm run test:integration
```

### Оптерећење за отклањање грешака
```bash
# Једноставан тест оптерећења за идентификацију уских грла у перформансама
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Користећи Apache Bench (инсталирајте: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Извући кључне метрике
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Проверити неуспехе
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Инфраструктурно отклањање грешака

### Отклањање грешака у Bicep шаблонима
```bash
# Проверите Bicep шаблоне са детаљним излазом
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Провера синтаксе
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Провера lint-а
    az bicep lint --file "$template_file"
    
    # Шта-ако распоређивање
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Отстрањивање грешака при распоређивању шаблона
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

### Анализа стања ресурса
```bash
# Анализирајте стања ресурса ради недоследности
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Наведите све ресурсе са њиховим стањима
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Проверите да ли има неуспелих ресурса
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

## 🔒 Безбедносно отклањање грешака

### Отклањање проблема у току аутентификације
```bash
# Отстрањивање грешака у Azure аутентификацији
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Декодирање JWT токена (захтева jq и base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Отстрањивање грешака у приступу Key Vault-у
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

### Отклањање мрежне безбедности
```bash
# Дијагностика група мрежне безбедности
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Провери правила безбедности
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Отклањање грешака специфичних за апликацију

### Отклањање Node.js апликација
```javascript
// debug-middleware.js - Express мидлвер за дебаговање
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Бележи детаље захтева
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Замени res.json да би бележио одговоре
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Отклањање упита ка бази података
```javascript
// database-debug.js - Помоћни алати за отклањање грешака у бази података
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

## 🚨 Хитне процедуре за отклањање грешака

### Одговор на проблеме у производњи
```bash
#!/bin/bash
# emergency-debug.sh - Хитно отклањање грешака у продукцији

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

# Пређите на исправно окружење
azd env select "$ENVIRONMENT"

# Прикупите критичне информације
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Користите Azure Monitor за логове грешака
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

### Процедуре повлачења (rollback)
```bash
# Брз скрипт за враћање
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Промени окружење
    azd env select "$environment"
    
    # Враћање помоћу Git-а (AZD нема уграђену опцију за враћање)
    git checkout "$previous_commit"
    azd deploy
    
    # Провери враћање
    echo "Verifying rollback..."
    azd show
    
    # Тестирај критичне крајње тачке
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Табле за отклањање грешака

### Прилагођена табла за мониторинг
```bash
# Креирајте Application Insights упите за отклањање грешака
create_debug_queries() {
    local app_insights_name=$1
    
    # Упит за грешке
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Упит за проблеме са перформансама
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Упит за неуспехе зависности
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Агрегација логова
```bash
# Агрегирање логова из више Azure извора
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

## 🔗 Напредни ресурси

### Прилагођене скрипте за отклањање грешака
Create a `scripts/debug/` directory with:
- `health-check.sh` - Свеобухватна провера стања
- `performance-test.sh` - Аутоматизовано тестирање перформанси
- `log-analyzer.py` - Напредно парсирање и анализа логова
- `resource-validator.sh` - Валидација инфраструктуре

### Интеграција мониторинга
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

## Најбоља пракса

1. **Увек омогућите debug логовање** у непроизводним окружењима
2. **Креирајте репродуктивне тест скенарије** за проблеме
3. **Документујте процедуре отклањања грешака** за ваш тим
4. **Аутоматизујте health check-ове** и праћење
5. **Држите алате за отклањање грешака ажурним** са променама апликације
6. **Вежбајте процедуре отклањања грешака** када нема инцидената

## Следећи кораци

- [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md) - Планирање захтева за ресурсима
- [Избор SKU-а](../chapter-06-pre-deployment/sku-selection.md) - Избор одговарајућих нивоа услуга
- [Preflight провере](../chapter-06-pre-deployment/preflight-checks.md) - Валидација пре имплементације
- [Cheat Sheet](../../resources/cheat-sheet.md) - Брзи референтни команди

---

**Запамтите**: Добро отклањање грешака је систематично, темељно и стрпљиво. Ови алати и технике ће вам помоћи да дијагностикujete проблеме брже и ефикасније.

---

**Навигација**
- **Претходна лекција**: [Уобичајени проблеми](common-issues.md)

- **Следећа лекција**: [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Изјава о одрицању одговорности:
Овај документ је преведен помоћу AI сервиса за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод који обавља стручни преводилац. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->