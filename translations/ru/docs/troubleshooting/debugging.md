<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-20T06:27:18+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "ru"
}
-->
# Руководство по отладке для развертываний AZD

**Навигация по главам:**
- **📚 Главная страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Устранение неполадок и отладка
- **⬅️ Предыдущая**: [Распространенные проблемы](common-issues.md)
- **➡️ Следующая**: [Устранение неполадок, связанных с ИИ](ai-troubleshooting.md)
- **🚀 Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../microsoft-foundry/production-ai-practices.md)

## Введение

Это подробное руководство предлагает продвинутые стратегии отладки, инструменты и методы для диагностики и решения сложных проблем с развертываниями Azure Developer CLI. Вы узнаете систематические методы устранения неполадок, техники анализа логов, профилирования производительности и использования продвинутых диагностических инструментов для эффективного решения проблем развертывания и выполнения.

## Цели обучения

Пройдя это руководство, вы:
- Овладеете систематическими методами отладки проблем Azure Developer CLI
- Поймете, как настраивать и анализировать логи
- Реализуете стратегии профилирования и мониторинга производительности
- Научитесь использовать диагностические инструменты и сервисы Azure для решения сложных проблем
- Примените методы отладки сети и устранения проблем с безопасностью
- Настроите мониторинг и оповещения для проактивного обнаружения проблем

## Результаты обучения

После завершения вы сможете:
- Применять методологию TRIAGE для систематической отладки сложных проблем развертывания
- Настраивать и анализировать полную информацию о логах и трассировке
- Эффективно использовать Azure Monitor, Application Insights и диагностические инструменты
- Самостоятельно устранять проблемы с подключением к сети, аутентификацией и разрешениями
- Реализовывать стратегии мониторинга и оптимизации производительности
- Создавать пользовательские скрипты и автоматизацию для повторяющихся проблем

## Методология отладки

### Подход TRIAGE
- **T**ime (Время): Когда началась проблема?
- **R**eproduce (Воспроизведение): Можно ли ее воспроизвести?
- **I**solate (Изоляция): Какой компонент выходит из строя?
- **A**nalyze (Анализ): Что говорят логи?
- **G**ather (Сбор): Соберите всю релевантную информацию
- **E**scalate (Эскалация): Когда нужно обратиться за дополнительной помощью

## Включение режима отладки

### Переменные окружения
```bash
# Включить всестороннюю отладку
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

# Включить трассировку логов
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

### Структурированный анализ логов
```bash
# Фильтровать журналы по уровню
azd logs --level error --since 1h

# Фильтровать по сервису
azd logs --service api --level debug

# Экспортировать журналы для анализа
azd logs --output json > deployment-logs.json

# Разбирать журналы JSON с помощью jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Корреляция логов
```bash
#!/bin/bash
# correlate-logs.sh - Коррелировать журналы между сервисами

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Искать по всем сервисам
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Искать журналы Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Продвинутые инструменты отладки

### Запросы Azure Resource Graph
```bash
# Запрос ресурсов по тегам
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Найти неудачные развертывания
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Проверить состояние ресурсов
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
# Отладка проблем приложения-контейнера
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

## 🧪 Тестирование и проверка

### Отладка интеграционных тестов
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Установить среду отладки
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Получить конечные точки сервиса
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
# Простой тест нагрузки для выявления узких мест производительности
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Использование Apache Bench (установка: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Извлечение ключевых метрик
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Проверка на сбои
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Отладка инфраструктуры

### Отладка шаблонов Bicep
```bash
# Проверка шаблонов Bicep с подробным выводом
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Проверка синтаксиса
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Проверка стиля
    az bicep lint --file "$template_file"
    
    # Предварительная проверка развертывания
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
# Анализировать состояния ресурсов на наличие несоответствий
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Перечислить все ресурсы с их состояниями
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Проверить наличие неудачных ресурсов
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

### Отладка потоков аутентификации
```bash
# Отладка аутентификации Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Декодировать JWT токен (требуется jq и base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Отладка доступа к Key Vault
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
# Отладка групп безопасности сети
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

## 📱 Отладка приложений

### Отладка приложений Node.js
```javascript
// debug-middleware.js - Express отладочный промежуточный слой
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Записать детали запроса
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Переопределить res.json для записи ответов
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
// database-debug.js - Утилиты для отладки базы данных
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

### Реакция на проблемы в продакшене
```bash
#!/bin/bash
# emergency-debug.sh - Экстренная отладка в продакшене

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

# Переключиться на правильное окружение
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

### Процедуры отката
```bash
# Скрипт быстрого отката
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Переключить окружение
    azd env select "$environment"
    
    # Откатить приложение
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Проверить откат
    echo "Verifying rollback..."
    azd show
    
    # Тестировать критические точки доступа
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Панели мониторинга для отладки

### Пользовательская панель мониторинга
```bash
# Создайте запросы Application Insights для отладки
create_debug_queries() {
    local app_insights_name=$1
    
    # Запрос ошибок
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Запрос проблем с производительностью
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Запрос сбоев зависимостей
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Агрегация логов
```bash
# Собирать журналы из нескольких источников
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

## 🔗 Продвинутые ресурсы

### Пользовательские скрипты для отладки
Создайте директорию `scripts/debug/` с файлами:
- `health-check.sh` - Комплексная проверка состояния
- `performance-test.sh` - Автоматическое тестирование производительности
- `log-analyzer.py` - Продвинутый парсинг и анализ логов
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

1. **Всегда включайте логирование отладки** в непроизводственных средах
2. **Создавайте воспроизводимые тестовые случаи** для проблем
3. **Документируйте процедуры отладки** для вашей команды
4. **Автоматизируйте проверки состояния** и мониторинг
5. **Обновляйте инструменты отладки** вместе с изменениями приложения
6. **Практикуйте процедуры отладки** в неаварийное время

## Следующие шаги

- [Планирование емкости](../pre-deployment/capacity-planning.md) - Планирование требований к ресурсам
- [Выбор SKU](../pre-deployment/sku-selection.md) - Выбор подходящих уровней обслуживания
- [Предварительные проверки](../pre-deployment/preflight-checks.md) - Проверка перед развертыванием
- [Шпаргалка](../../resources/cheat-sheet.md) - Быстрые команды для справки

---

**Помните**: Хорошая отладка — это систематичность, тщательность и терпение. Эти инструменты и методы помогут вам быстрее и эффективнее диагностировать проблемы.

---

**Навигация**
- **Предыдущий урок**: [Распространенные проблемы](common-issues.md)

- **Следующий урок**: [Планирование емкости](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникающие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->