# AZD ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਡੀਬੱਗਿੰਗ ਗਾਈਡ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 Course Home**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - ਟਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡੀਬੱਗਿੰਗ
- **⬅️ ਪਹਿਲਾਂ**: [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md)
- **➡️ ਅਗਲਾ**: [AI-ਵਿਸ਼ੇਸ਼ ਟਰਬਲਸ਼ੂਟਿੰਗ](ai-troubleshooting.md)
- **🚀 Next Chapter**: [ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਨਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ](../chapter-08-production/production-ai-practices.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਡਿਪਲੋਇਮੈਂਟਸ ਨਾਲ ਜੁੜੀਆਂ ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਅਤੇ ਹੱਲ ਕਰਨ ਲਈ ਐਡਵਾਂਸਡ ਡੀਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ, ਟੂਲ ਅਤੇ ਤਕਨੀਕਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਡਿਪਲੋਇਮੈਂਟ ਅਤੇ ਰਨਟਾਈਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਹੱਲ ਕਰਨ ਲਈ ਵਿਵਸਥਿਤ ਟਰਬਲਸ਼ੂਟਿੰਗ ਵਿਧੀਆਂ, ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਰੀਕੇ, ਪ੍ਰਦਰਸ਼ਨ ਪ੍ਰੋਫਾਈਲਿੰਗ ਅਤੇ ਐਡਵਾਂਸਡ ਡਾਇਗਨੋਸਟਿਕ ਟੂਲ ਸਿੱਖੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

By completing this guide, you will:
- Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਲਈ ਵਿਵਸਥਿਤ ਡੀਬੱਗਿੰਗ ਵਿਧੀਆਂ ਵਿੱਚ ਨਿਪੁੰਨ ਹੋਵੋ
- ਐਡਵਾਂਸਡ ਲੌਗਿੰਗ ਸੰਰਚਨਾ ਅਤੇ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ ਨੂੰ ਸਮਝੋ
- ਪ੍ਰਦਰਸ਼ਨ ਪ੍ਰੋਫਾਈਲਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਜਟਿਲ ਸਮੱਸਿਆ ਹੱਲ ਲਈ Azure ਡਾਇਗਨੋਸਟਿਕ ਟੂਲ ਅਤੇ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਨੈਟਵਰਕ ਡੀਬੱਗਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਟਰਬਲਸ਼ੂਟਿੰਗ ਤਕਨੀਕਾਂ ਲਾਗੂ ਕਰੋ
- ਸਮੱਸਿਆ ਦੀ ਪੂਰਵ-ਪਹਿਚਾਣ ਲਈ ਵਿਸਤ੍ਰਿਤ ਨਿਗਰਾਨੀ ਅਤੇ ਅਲਰਟਿੰਗ ਸੰਰਚਨਾ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

Upon completion, you will be able to:
- TRIAGE ਵਿਧੀ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਜਟਿਲ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਤਰੀਕੇ ਨਾਲ ਡੀਬੱਗ ਕਰੋ
- ਵਿਸਤ੍ਰਿਤ ਲੌਗਿੰਗ ਅਤੇ ਟ੍ਰੇਸਿੰਗ ਜਾਣਕਾਰੀ ਨੂੰ ਸੰਰਚਿਤ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਿਤ ਕਰੋ
- Azure Monitor, Application Insights, ਅਤੇ ਡਾਇਗਨੋਸਟਿਕ ਟੂਲਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਕਰੋ
- ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ, ਪ੍ਰਮਾਣਿਕਤਾ, ਅਤੇ ਅਧਿਕਾਰ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰਤ ਤਰੀਕੇ ਨਾਲ ਡੀਬੱਗ ਕਰੋ
- ਪ੍ਰਦਰਸ਼ਨ ਨਿਗਰਾਨੀ ਅਤੇ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ
- ਆਮ ਸਮੱਸਿਆਵਾਂ ਲਈ ਕਸਟਮ ਡੀਬੱਗਿੰਗ ਸਕ੍ਰਿਪਟ ਅਤੇ ਆਟੋਮੇਸ਼ਨ ਬਣਾਓ

## ਡੀਬੱਗਿੰਗ ਵਿਧੀ

### The TRIAGE Approach
- **T**ime: ਸਮੱਸਿਆ ਕਦੋਂ ਸ਼ੁਰੂ ਹੋਈ?
- **R**eproduce: ਕੀ ਤੁਸੀਂ ਇਸਨੂੰ ਲਗਾਤਾਰ ਦੁਹਰਾ ਸਕਦੇ ਹੋ?
- **I**solate: ਕਿਹੜਾ ਕੰਪੋਨੈਂਟ ਨਾਕਾਮ ਹੋ ਰਿਹਾ ਹੈ?
- **A**nalyze: ਲੌਗਸ ਸਾਡੇ ਲਈ ਕੀ ਦੱਸਦੇ ਹਨ?
- **G**ather: ਸਾਰੀਆਂ ਸੰਬੰਧਤ ਜਾਣਕਾਰੀਆਂ ਇਕੱਠੀਆਂ ਕਰੋ
- **E**scalate: ਕਦੋਂ ਵਾਧੂ ਮਦਦ ਲੈਣੀ ਹੈ

## ਡੀਬੱਗ ਮੋਡ ਚਾਲੂ ਕਰਨਾ

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
```bash
# ਵਿਅਪਕ ਡੀਬੱਗਿੰਗ ਨੂੰ ਚਾਲੂ ਕਰੋ
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI ਡੀਬੱਗਿੰਗ
export AZURE_CLI_DIAGNOSTICS=true

# ਸਾਫ਼ ਆਉਟਪੁੱਟ ਲਈ ਟੈਲੀਮੇਟਰੀ ਬੰਦ ਕਰੋ
export AZD_DISABLE_TELEMETRY=true
```

### ਡੀਬੱਗ ਸੰਰਚਨਾ
```bash
# ਡਿਬੱਗ ਸੰਰਚਨਾ ਨੂੰ ਗਲੋਬਲ ਤੌਰ ਤੇ ਸੈੱਟ ਕਰੋ
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ਟ੍ਰੇਸ ਲੌਗਿੰਗ ਨੂੰ ਚਾਲੂ ਕਰੋ
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ

### ਲੌਗ ਲੈਵਲਾਂ ਨੂੰ ਸਮਝਣਾ
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ਸਟਰਕਚਰਡ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# Azure Monitor ਨਾਲ ਲੌਗ ਵੇਖੋ (azd monitor ਰਾਹੀਂ)
azd monitor --logs

# ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਵੇਖੋ
azd monitor --live

# ਵਿਸਥਾਰਤ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ, ਆਪਣੇ App Service ਜਾਂ Container App ਨਾਲ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰੋ:
# App Service ਲੌਗ
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App ਲੌਗ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ Application Insights ਦੇ ਲੌਗ ਨਿਰਯਾਤ ਕਰੋ
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### ਲੌਗ ਕੋਰਲੇਸ਼ਨ
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਵੱਖ-ਵੱਖ ਸੇਵਾਵਾਂ ਦੇ ਲੌਗਾਂ ਨੂੰ ਆਪਸ ਵਿੱਚ ਸਬੰਧਤ ਕਰਨਾ

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights ਵਿੱਚ ਸੰਬੰਧਿਤ ਲੌਗਾਂ ਲਈ ਖੋਜ ਕਰੋ
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure ਦੀਆਂ ਗਤੀਵਿਧੀ ਲੌਗਾਂ ਦੀ ਖੋਜ ਕਰੋ
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ਐਡਵਾਂਸਡ ਡੀਬੱਗਿੰਗ ਟੂਲ

### Azure Resource Graph Queries
```bash
# ਟੈਗਾਂ ਅਨੁਸਾਰ ਰਿਸੋਰਸਾਂ ਦੀ ਖੋਜ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ਅਸਫਲ ਡਿਪਲੋਇਮੈਂਟ ਲੱਭੋ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# ਰਿਸੋਰਸ ਦੀ ਸਿਹਤ ਜਾਂਚੋ
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ਨੈਟਵਰਕ ਡੀਬੱਗਿੰਗ
```bash
# ਸੇਵਾਵਾਂ ਦਰਮਿਆਨ ਸੰਪਰਕ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਵਰਤੋਂ
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### ਕੰਟੇਨਰ ਡੀਬੱਗਿੰਗ
```bash
# ਕੰਟੇਨਰ ਐਪ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
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

### ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਡੀਬੱਗਿੰਗ
```bash
# ਡੇਟਾਬੇਸ ਕਨੈਕਟਿਵਿਟੀ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
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

## 🔬 ਪ੍ਰਦਰਸ਼ਨ ਡੀਬੱਗਿੰਗ

### ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਨਿਗਰਾਨੀ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਦੀ ਡੀਬੱਗਿੰਗ ਚਾਲੂ ਕਰੋ
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

# ਕਸਟਮ ਪ੍ਰਦਰਸ਼ਨ ਨਿਗਰਾਨੀ
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

### ਰਿਸੋਰਸ ਵਰਤੋਂ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# ਸੰਸਾਧਨਾਂ ਦੀ ਵਰਤੋਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
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

## 🧪 ਟੈਸਟਿੰਗ ਅਤੇ ਪ੍ਰਮਾਣੀਕਰਣ

### ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਟੈਸਟ ਡੀਬੱਗਿੰਗ
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# ਡੀਬੱਗ ਵਾਤਾਵਰਨ ਸੈੱਟ ਕਰੋ
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ਸੇਵਾ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ਹੈਲਥ ਐਂਡਪੌਇੰਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਟੈਸਟਾਂ ਚਲਾਓ
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# ਕਸਟਮ ਇੰਟੇਗ੍ਰੇਸ਼ਨ ਟੈਸਟਾਂ ਚਲਾਓ
npm run test:integration
```

### ਡੀਬੱਗਿੰਗ ਲਈ ਲੋਡ ਟੈਸਟਿੰਗ
```bash
# ਪ੍ਰਦਰਸ਼ਨ ਬੋਤਲਨੇਕਸ ਨੂੰ ਪਛਾਣ ਕਰਨ ਲਈ ਸਧਾਰਣ ਲੋਡ ਟੈਸਟ
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ਦੀ ਵਰਤੋਂ (ਇੰਸਟਾਲ ਕਰੋ: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ਮੁੱਖ ਮੈਟ੍ਰਿਕਸ ਨਿਕਾਲੋ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ਫੇਲਿਯਰਾਂ ਲਈ ਜਾਂਚ ਕਰੋ
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ਇੰਫਰਾਸਟਰਕਚਰ ਡੀਬੱਗਿੰਗ

### Bicep ਟੈਮਪਲੇਟ ਡੀਬੱਗਿੰਗ
```bash
# ਵੇਰਵੇ ਵਾਲੀ ਆਉਟਪੁਟ ਨਾਲ Bicep ਟੈਮਪਲੇਟਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # ਸਿੰਟੈਕਸ ਜਾਂਚ
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ਲਿੰਟ ਜਾਂਚ
    az bicep lint --file "$template_file"
    
    # ਕੀ-ਹੁੰਦਾ-ਜੇ ਤੈਨਾਤੀ
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ਟੈਮਪਲੇਟ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
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

### ਰਿਸੋਰਸ ਸਥਿਤੀ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# ਅਸੰਗਤੀਆਂ ਲਈ ਸੰਸਾਧਨਾਂ ਦੀਆਂ ਸਥਿਤੀਆਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # ਸਾਰੇ ਸੰਸਾਧਨਾਂ ਨੂੰ ਉਨ੍ਹਾਂ ਦੀਆਂ ਸਥਿਤੀਆਂ ਸਮੇਤ ਸੂਚੀਬੱਧ ਕਰੋ
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ਅਸਫਲ ਹੋਏ ਸੰਸਾਧਨਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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

## 🔒 ਸੁਰੱਖਿਆ ਡੀਬੱਗਿੰਗ

### ਪ੍ਰਮਾਣਿਕਤਾ ਫਲੋ ਡੀਬੱਗਿੰਗ
```bash
# Azure ਪ੍ਰਮਾਣੀਕਰਨ ਡਿਬੱਗ ਕਰੋ
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT ਟੋਕਨ ਡੀਕੋਡ ਕਰੋ (jq ਅਤੇ base64 ਦੀ ਲੋੜ ਹੈ)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault ਦੀ ਪਹੁੰਚ ਡਿਬੱਗ ਕਰੋ
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

### ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਡੀਬੱਗਿੰਗ
```bash
# ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਗਰੁੱਪਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # ਸੁਰੱਖਿਆ ਨਿਯਮਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ਐਪਲੀਕੇਸ਼ਨ-ਨਿਰਧਾਰਿਤ ਡੀਬੱਗਿੰਗ

### Node.js ਐਪਲੀਕੇਸ਼ਨ ਡੀਬੱਗਿੰਗ
```javascript
// debug-middleware.js - Express ਡੀਬੱਗਿੰਗ ਮਿਡਲਵੇਅਰ
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // ਬੇਨਤੀ ਦੇ ਵੇਰਵੇ ਲੌਗ ਕਰੋ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json ਨੂੰ ਓਵਰਰਾਈਡ ਕਰਕੇ ਜਵਾਬ ਲੌਗ ਕਰੋ
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ਡੇਟਾਬੇਸ ਕਵੈਰੀ ਡੀਬੱਗਿੰਗ
```javascript
// database-debug.js - ਡੇਟਾਬੇਸ ਡੀਬੱਗਿੰਗ ਸਹੂਲਤਾਂ
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

## 🚨 ਐਮਰਜੈਂਸੀ ਡੀਬੱਗਿੰਗ ਕਾਰਜਵਿਧੀਆਂ

### ਪ੍ਰੋਡਕਸ਼ਨ ਸਮੱਸਿਆ ਪ੍ਰਤੀਕ੍ਰਿਆ
```bash
#!/bin/bash
# emergency-debug.sh - ਐਮਰਜੈਂਸੀ ਪ੍ਰੋਡਕਸ਼ਨ ਡੀਬੱਗਿੰਗ

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

# ਸਹੀ ਵਾਤਾਵਰਣ ਵਿੱਚ ਬਦਲੋ
azd env select "$ENVIRONMENT"

# ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰੋ
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# ਗਲਤੀ ਲੌਗਾਂ ਲਈ Azure Monitor ਦੀ ਵਰਤੋਂ ਕਰੋ
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

### ਰੋਲਬੈਕ ਕਾਰਜਵਿਧੀਆਂ
```bash
# ਝਟਪਟ ਰੋਲਬੈਕ ਸਕ੍ਰਿਪਟ
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # ਮਾਹੌਲ ਬਦਲੋ
    azd env select "$environment"
    
    # Git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਰੋਲਬੈਕ (AZD ਵਿੱਚ ਬਿਲਟ-ਇਨ ਰੋਲਬੈਕ ਨਹੀਂ ਹੈ)
    git checkout "$previous_commit"
    azd deploy
    
    # ਰੋਲਬੈਕ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
    echo "Verifying rollback..."
    azd show
    
    # ਮਹੱਤਵਪੂਰਨ ਐਂਡਪੌਇੰਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ਡੀਬੱਗਿੰਗ ਡੈਸ਼ਬੋਰਡ

### ਕਸਟਮ ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ
```bash
# ਡੀਬੱਗਿੰਗ ਲਈ Application Insights ਕੁਏਰੀਆਂ ਬਣਾਓ
create_debug_queries() {
    local app_insights_name=$1
    
    # ਤ੍ਰੁਟੀਆਂ ਲਈ ਕੁਏਰੀ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਲਈ ਕੁਏਰੀ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ਨਿਰਭਰਤਾਵਾਂ ਦੀਆਂ ਨਾਕਾਮੀਆਂ ਲਈ ਕੁਏਰੀ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ਲੌਗ ਐਗ੍ਰਿਗੇਸ਼ਨ
```bash
# ਕਈ Azure ਸਰੋਤਾਂ ਤੋਂ ਲੌਗਾਂ ਨੂੰ ਇਕੱਠਾ ਕਰੋ
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

## 🔗 ਐਡਵਾਂਸਡ ਸਰੋਤ

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - ਵਿਸਤ੍ਰਿਤ ਸਿਹਤ ਜਾਂਚ
- `performance-test.sh` - ਆਟੋਮੈਟਿਡ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ
- `log-analyzer.py` - ਉੱਨਤ ਲੌਗ ਪਾਰਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ
- `resource-validator.sh` - ਰਿਸੋਰਸ ਵੈਧਤਾ

### ਨਿਗਰਾਨੀ ਏਕੀਕਰਨ
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

## ਸਰਵੋਤਮ ਅਭਿਆਸ

1. **ਹਮੇਸ਼ਾ ਡੀਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ** ਗੈਰ-ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ
2. **ਸਮੱਸਿਆਵਾਂ ਲਈ ਦੁਹਰਾਏ ਜਾਂ ਸਕਣ ਵਾਲੇ ਟੈਸਟ ਕੇਸ ਬਣਾਓ**
3. **ਆਪਣੀ ਟੀਮ ਲਈ ਡੀਬੱਗਿੰਗ ਕਾਰਜਵਿਧੀਆਂ ਦਸਤਾਵੇਜ਼ ਕਰੋ**
4. **ਹੈਲਥ ਚੈਕਸ ਅਤੇ ਨਿਗਰਾਨੀ ਨੂੰ ਆਟੋਮੇਟ ਕਰੋ**
5. **ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਬਦਲਾਵਾਂ ਦੇ ਨਾਲ ਡੀਬੱਗ ਟੂਲਾਂ ਨੂੰ ਅਪਡੇਟ ਰੱਖੋ**
6. **ਗੈਰ-ਸਮੱਸਿਆਕਾਲ ਵਿੱਚ ਡੀਬੱਗਿੰਗ ਕਾਰਜਵਿਧੀਆਂ ਦਾ ਅਭਿਆਸ ਕਰੋ**

## ਅਗਲੇ ਕਦਮ

- [ਸਮਰੱਥਾ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਸੰਸਾਧਨਾਂ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - ਉਚਿਤ ਸਰਵਿਸ ਟੀਅਰ ਚੁਣੋ
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਮਾਣੀਕਰਣ
- [ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md) - ਤੁਰੰਤ ਸੰਦਰਭ ਕਮਾਂਡਾਂ

---

**ਯਾਦ ਰੱਖੋ**: ਵਧੀਆ ਡੀਬੱਗਿੰਗ ਵਿਵਸਥਿਤ, ਵਿਸਥਾਰਪੂਰਕ, ਅਤੇ ਧੀਰਜਵਾਨ ਹੋਣ ਬਾਰੇ ਹੈ। ਇਹ ਟੂਲ ਅਤੇ ਤਕਨੀਕਾਂ ਤੁਹਾਨੂੰ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ ਅਤੇ ਹੋਰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਪਛਾਣਣ ਵਿੱਚ ਮਦਦ ਕਰਨਗੇ।

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md)

- **ਅਗਲਾ ਪਾਠ**: [ਸਮਰੱਥਾ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਨ:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ (Co‑op Translator: https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਿਵੇਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਪਸ਼ਟਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਦਸਤਾਵੇਜ਼ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਂ ਨਿੰਰਣਾਇਕ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->