# Руководство по отладке развертываний AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Устранение неполадок и отладка
- **⬅️ Предыдущая**: [Распространённые проблемы](common-issues.md)
- **➡️ Следующая**: [Устранение неполадок, связанных с ИИ](ai-troubleshooting.md)
- **🚀 Следующая глава**: [Глава 8: Производственные и корпоративные паттерны](../chapter-08-production/production-ai-practices.md)

## Введение

Это всеобъемлющее руководство предлагает продвинутые стратегии отладки, инструменты и методы для диагностики и устранения сложных проблем при развертывании с помощью Azure Developer CLI. Изучите систематические методологии устранения неполадок, методы анализа логов, профилирование производительности и передовые диагностические инструменты, чтобы эффективно решать проблемы при развертывании и во время выполнения.

## Цели обучения

Пройдя это руководство, вы:
- Овладеете систематическими методологиями отладки проблем Azure Developer CLI
- Поймёте продвинутую настройку логирования и методы анализа логов
- Реализуете стратегии профилирования производительности и мониторинга
- Будете использовать диагностические инструменты и сервисы Azure для решения сложных проблем
- Примените методы отладки сетей и устранения проблем с безопасностью
- Настроите комплексный мониторинг и оповещения для проактивного обнаружения проблем

## Результаты обучения

После завершения вы сможете:
- Применять методологию TRIAGE для систематической отладки сложных проблем развертывания
- Настраивать и анализировать полные данные логирования и трассировки
- Эффективно использовать Azure Monitor, Application Insights и диагностические инструменты
- Самостоятельно отлаживать проблемы с сетевой связностью, аутентификацией и правами доступа
- Реализовывать стратегии мониторинга производительности и оптимизации
- Создавать собственные скрипты отладки и автоматизацию для повторяющихся проблем

## Методология отладки

### Подход TRIAGE
- **В**ремя: Когда началась проблема?
- **В**оспроизвести: Можете ли вы последовательно воспроизвести её?
- **И**золировать: Какой компонент выходит из строя?
- **А**нализировать: Что показывают логи?
- **С**обрать: Соберите всю соответствующую информацию
- **Э**скалировать: Когда обращаться за дополнительной помощью

## Включение режима отладки

### Переменные окружения
```bash
# Включить подробную отладку
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Отладка Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Отключить телеметрию для более чистого вывода
export AZD_DISABLE_TELEMETRY=true
```

### Конфигурация отладки
```bash
# Установить конфигурацию отладки глобально
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Включить трассировочное логирование
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Техники анализа логов

### Понимание уровней логов
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Анализ структурированных логов
```bash
# Просматривать логи с помощью Azure Monitor (через azd monitor)
azd monitor --logs

# Просматривать логи приложения в реальном времени
azd monitor --live

# Для детального анализа логов используйте Azure CLI для вашего App Service или Container App:
# Логи App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Логи Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Экспорт логов Application Insights для анализа
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Корреляция логов
```bash
#!/bin/bash
# correlate-logs.sh - Коррелирует логи между сервисами с помощью Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Поиск связанных логов в Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Поиск журналов активности Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Продвинутые инструменты отладки

### Запросы Azure Resource Graph
```bash
# Запросить ресурсы по тегам
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Найти неудачные развертывания
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Проверить состояние ресурса
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Отладка сети
```bash
# Проверка соединения между сервисами
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

# Использование
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Отладка контейнеров
```bash
# Отладка проблем контейнерного приложения
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

### Отладка подключения к базе данных
```bash
# Отладка подключения к базе данных
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

## 🔬 Отладка производительности

### Мониторинг производительности приложений
```bash
# Включить отладку Application Insights
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

# Пользовательский мониторинг производительности
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

### Анализ использования ресурсов
```bash
# Отслеживать использование ресурсов
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

## 🧪 Тестирование и валидация

### Отладка интеграционных тестов
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Настроить окружение отладки
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Получить конечные точки сервисов
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Проверить конечные точки состояния
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

# Запустить тесты
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Запустить пользовательские интеграционные тесты
npm run test:integration
```

### Нагрузочное тестирование для отладки
```bash
# Простой нагрузочный тест для выявления узких мест производительности
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Используется Apache Bench (установка: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Извлечь ключевые метрики
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Проверить наличие сбоев
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Отладка инфраструктуры

### Отладка шаблонов Bicep
```bash
# Проверить шаблоны Bicep с подробным выводом
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Проверка синтаксиса
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Проверка линтинга
    az bicep lint --file "$template_file"
    
    # Развертывание What-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Отладка развертывания шаблона
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

### Анализ состояния ресурсов
```bash
# Проанализировать состояния ресурсов на предмет несоответствий
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Перечислить все ресурсы и их состояния
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Проверить наличие сбойных ресурсов
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

## 🔒 Отладка безопасности

### Отладка процесса аутентификации
```bash
# Отладка аутентификации Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Декодировать JWT-токен (требуются jq и base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Отладка доступа к Azure Key Vault
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

### Отладка сетевой безопасности
```bash
# Отладка групп сетевой безопасности
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Проверка правил безопасности
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Отладка, специфичная для приложения

### Отладка приложений Node.js
```javascript
// debug-middleware.js - отладочный middleware для Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Записывать детали запроса
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Переопределить res.json для логирования ответов
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Отладка запросов к базе данных
```javascript
// database-debug.js - Утилиты отладки базы данных
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

## 🚨 Процедуры экстренной отладки

### Реагирование на проблемы в продакшне
```bash
#!/bin/bash
# emergency-debug.sh - Экстренная отладка в производственной среде

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

# Переключиться в правильное окружение
azd env select "$ENVIRONMENT"

# Собрать критическую информацию
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Использовать Azure Monitor для журналов ошибок
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

### Процедуры отката
```bash
# Скрипт быстрого отката
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Переключить окружение
    azd env select "$environment"
    
    # Откат с помощью Git (в AZD нет встроенного отката)
    git checkout "$previous_commit"
    azd deploy
    
    # Проверить откат
    echo "Verifying rollback..."
    azd show
    
    # Протестировать критические конечные точки
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Панели мониторинга для отладки

### Пользовательская панель мониторинга
```bash
# Создать запросы Application Insights для отладки
create_debug_queries() {
    local app_insights_name=$1
    
    # Запрос на ошибки
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Запрос на проблемы с производительностью
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Запрос на сбои зависимостей
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Агрегация логов
```bash
# Агрегировать журналы из нескольких источников Azure
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

## 🔗 Продвинутые ресурсы

### Пользовательские скрипты отладки
Создайте директорию `scripts/debug/` со следующими файлами:
- `health-check.sh` - Комплексная проверка работоспособности
- `performance-test.sh` - Автоматизированное тестирование производительности
- `log-analyzer.py` - Продвинутый разбор и анализ логов
- `resource-validator.sh` - Проверка инфраструктуры

### Интеграция мониторинга
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

## Лучшие практики

1. **Всегда включайте отладочное логирование** в непроизводственных средах
2. **Создавайте воспроизводимые тестовые сценарии** для проблем
3. **Документируйте процедуры отладки** для вашей команды
4. **Автоматизируйте проверки состояния** и мониторинг
5. **Поддерживайте инструменты отладки в актуальном состоянии** при изменениях приложения
6. **Практикуйте процедуры отладки** в периоды без инцидентов

## Следующие шаги

- [Планирование ёмкости](../chapter-06-pre-deployment/capacity-planning.md) - Планирование требований к ресурсам
- [Выбор SKU](../chapter-06-pre-deployment/sku-selection.md) - Выбор подходящих уровней обслуживания
- [Проверки перед развертыванием](../chapter-06-pre-deployment/preflight-checks.md) - Валидация перед развертыванием
- [Шпаргалка](../../resources/cheat-sheet.md) - Быстрый справочный набор команд

---

**Помните**: Хорошая отладка — это системный, тщательный и терпеливый подход. Эти инструменты и техники помогут вам диагностировать проблемы быстрее и эффективнее.

---

**Навигация**
- **Предыдущий урок**: [Распространённые проблемы](common-issues.md)

- **Следующий урок**: [Планирование ёмкости](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от ответственности:
Этот документ был переведён с помощью сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Хотя мы стремимся к точности, пожалуйста, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется обратиться к профессиональному переводу, выполненному человеком. Мы не несем ответственности за любые недоразумения или неверные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->