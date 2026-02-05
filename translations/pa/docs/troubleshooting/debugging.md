# AZD ਡਿਪਲੌਇਮੈਂਟਸ ਲਈ ਡਿਬੱਗਿੰਗ ਗਾਈਡ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਫਾਰ ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 7 - ਟਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡਿਬੱਗਿੰਗ
- **⬅️ ਪਿਛਲਾ**: [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md)
- **➡️ ਅਗਲਾ**: [AI-ਸਪੈਸਿਫਿਕ ਟਰਬਲਸ਼ੂਟਿੰਗ](ai-troubleshooting.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ](../microsoft-foundry/production-ai-practices.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ AZD ਡਿਪਲੌਇਮੈਂਟਸ ਨਾਲ ਜੁੜੀਆਂ ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰਨ ਲਈ ਉੱਚ-ਸਤਹ ਦੀਆਂ ਡਿਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ, ਟੂਲਾਂ ਅਤੇ ਤਕਨੀਕਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਸਿਸਟਮੈਟਿਕ ਟਰਬਲਸ਼ੂਟਿੰਗ ਵਿਧੀਆਂ, ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ, ਪ੍ਰਦਰਸ਼ਨ ਪ੍ਰੋਫਾਈਲਿੰਗ, ਅਤੇ ਉੱਚ-ਸਤਹ ਡਾਇਗਨੋਸਟਿਕ ਟੂਲਾਂ ਬਾਰੇ ਸਿੱਖੋ ਤਾਂ ਜੋ ਡਿਪਲੌਇਮੈਂਟ ਅਤੇ ਰਨਟਾਈਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਕੁਸ਼ਲਤਾਪੂਰਵਕ ਹੱਲ ਕੀਤਾ ਜਾ ਸਕੇ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- AZD ਸਮੱਸਿਆਵਾਂ ਲਈ ਸਿਸਟਮੈਟਿਕ ਡਿਬੱਗਿੰਗ ਵਿਧੀਆਂ ਵਿੱਚ ਮਾਹਰ ਹੋ ਜਾਵੋਗੇ
- ਉੱਚ-ਸਤਹ ਲੌਗਿੰਗ ਸੰਰਚਨਾ ਅਤੇ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਪ੍ਰਦਰਸ਼ਨ ਪ੍ਰੋਫਾਈਲਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਦੇ ਹੱਲ ਲਈ AZD ਡਾਇਗਨੋਸਟਿਕ ਟੂਲਾਂ ਅਤੇ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋਗੇ
- ਨੈਟਵਰਕ ਡਿਬੱਗਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਟਰਬਲਸ਼ੂਟਿੰਗ ਤਕਨੀਕਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਪ੍ਰੋ-ਐਕਟਿਵ ਸਮੱਸਿਆ ਪਛਾਣ ਲਈ ਵਿਸਤ੍ਰਿਤ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੰਰਚਨਾ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉਪਰੰਤ, ਤੁਸੀਂ:
- ਜਟਿਲ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸਿਸਟਮੈਟਿਕ ਤਰੀਕੇ ਨਾਲ ਡਿਬੱਗ ਕਰਨ ਲਈ TRIAGE ਵਿਧੀ ਨੂੰ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਵਿਸਤ੍ਰਿਤ ਲੌਗਿੰਗ ਅਤੇ ਟ੍ਰੇਸਿੰਗ ਜਾਣਕਾਰੀ ਨੂੰ ਸੰਰਚਿਤ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰ ਸਕੋਗੇ
- AZD ਮਾਨੀਟਰ, ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ, ਅਤੇ ਡਾਇਗਨੋਸਟਿਕ ਟੂਲਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਕਰ ਸਕੋਗੇ
- ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ, ਪ੍ਰਮਾਣਿਕਤਾ, ਅਤੇ ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਖੁਦ ਹੱਲ ਕਰ ਸਕੋਗੇ
- ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- ਮੁੜ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਲਈ ਕਸਟਮ ਡਿਬੱਗਿੰਗ ਸਕ੍ਰਿਪਟ ਅਤੇ ਆਟੋਮੇਸ਼ਨ ਬਣਾਉਣਗੇ

## ਡਿਬੱਗਿੰਗ ਵਿਧੀ

### TRIAGE ਵਿਧੀ
- **T**ime: ਸਮੱਸਿਆ ਕਦੋਂ ਸ਼ੁਰੂ ਹੋਈ?
- **R**eproduce: ਕੀ ਤੁਸੀਂ ਇਸਨੂੰ ਲਗਾਤਾਰ ਦੁਹਰਾ ਸਕਦੇ ਹੋ?
- **I**solate: ਕਿਹੜਾ ਕੰਪੋਨੈਂਟ ਫੇਲ ਹੋ ਰਿਹਾ ਹੈ?
- **A**nalyze: ਲੌਗਸ ਵਿੱਚ ਕੀ ਦਿਖਾਈ ਦੇ ਰਿਹਾ ਹੈ?
- **G**ather: ਸਾਰੀਆਂ ਸੰਬੰਧਿਤ ਜਾਣਕਾਰੀਆਂ ਇਕੱਠੀਆਂ ਕਰੋ
- **E**scalate: ਕਦੋਂ ਵਾਧੂ ਮਦਦ ਲੈਣੀ ਹੈ

## ਡਿਬੱਗ ਮੋਡ ਚਾਲੂ ਕਰਨਾ

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
```bash
# ਵਿਸਤ੍ਰਿਤ ਡੀਬੱਗਿੰਗ ਨੂੰ ਯੋਗ ਕਰੋ
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# ਐਜ਼ਰ CLI ਡੀਬੱਗਿੰਗ
export AZURE_CLI_DIAGNOSTICS=true

# ਸਾਫ਼ ਆਉਟਪੁੱਟ ਲਈ ਟੈਲੀਮੇਟਰੀ ਨੂੰ ਅਯੋਗ ਕਰੋ
export AZD_DISABLE_TELEMETRY=true
```

### ਡਿਬੱਗ ਸੰਰਚਨਾ
```bash
# ਡਿਬੱਗ ਕਾਨਫਿਗਰੇਸ਼ਨ ਨੂੰ ਗਲੋਬਲੀ ਸੈੱਟ ਕਰੋ
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ਟ੍ਰੇਸ ਲੌਗਿੰਗ ਨੂੰ ਯੋਗ ਕਰੋ
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ

### ਲੌਗ ਲੈਵਲ ਨੂੰ ਸਮਝਣਾ
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ਸੰਰਚਿਤ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# ਲਾਗਾਂ ਨੂੰ ਪੱਧਰ ਦੇ ਅਧਾਰ 'ਤੇ ਫਿਲਟਰ ਕਰੋ
azd logs --level error --since 1h

# ਸੇਵਾ ਦੇ ਅਧਾਰ 'ਤੇ ਫਿਲਟਰ ਕਰੋ
azd logs --service api --level debug

# ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ ਲਾਗਾਂ ਨਿਰਯਾਤ ਕਰੋ
azd logs --output json > deployment-logs.json

# jq ਨਾਲ JSON ਲਾਗਾਂ ਨੂੰ ਪਾਰਸ ਕਰੋ
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### ਲੌਗ ਕੋਰਲੇਸ਼ਨ
```bash
#!/bin/bash
# correlate-logs.sh - ਸੇਵਾਵਾਂ ਵਿੱਚ ਲੌਗਸ ਨੂੰ ਸਬੰਧਿਤ ਕਰੋ

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਵਿੱਚ ਖੋਜ ਕਰੋ
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# ਐਜ਼ਰ ਲੌਗਸ ਵਿੱਚ ਖੋਜ ਕਰੋ
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ਉੱਚ-ਸਤਹ ਡਿਬੱਗਿੰਗ ਟੂਲ

### AZD ਰਿਸੋਰਸ ਗ੍ਰਾਫ ਕਵੈਰੀਜ਼
```bash
# ਟੈਗਾਂ ਦੁਆਰਾ ਸਰੋਤਾਂ ਦੀ ਪੁੱਛਗਿੱਛ ਕਰੋ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ਅਸਫਲ ਡਿਪਲੌਇਮੈਂਟਸ ਨੂੰ ਲੱਭੋ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# ਸਰੋਤ ਦੀ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ਨੈਟਵਰਕ ਡਿਬੱਗਿੰਗ
```bash
# ਸੇਵਾਵਾਂ ਦੇ ਵਿਚਕਾਰ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਜਾਂਚ ਕਰੋ
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

### ਕੰਟੇਨਰ ਡਿਬੱਗਿੰਗ
```bash
# ਕੰਟੇਨਰ ਐਪ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
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

### ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਡਿਬੱਗਿੰਗ
```bash
# ਡੇਟਾਬੇਸ ਕਨੈਕਟਿਵਿਟੀ ਦੀ ਡਿਬੱਗਿੰਗ ਕਰੋ
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

## 🔬 ਪ੍ਰਦਰਸ਼ਨ ਡਿਬੱਗਿੰਗ

### ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਡੀਬੱਗਿੰਗ ਚਾਲੂ ਕਰੋ
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

# ਕਸਟਮ ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ
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

### ਰਿਸੋਰਸ ਯੂਟਿਲਾਈਜ਼ੇਸ਼ਨ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# ਸਰੋਤ ਦੀ ਵਰਤੋਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
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

## 🧪 ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਲੀਡੇਸ਼ਨ

### ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਟੈਸਟ ਡਿਬੱਗਿੰਗ
```bash
#!/bin/bash
# ਡਿਬੱਗ-ਇੰਟੀਗ੍ਰੇਸ਼ਨ-ਟੈਸਟ.sh

set -e

echo "Running integration tests with debugging..."

# ਡਿਬੱਗ ਵਾਤਾਵਰਣ ਸੈੱਟ ਕਰੋ
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ਸੇਵਾ ਦੇ ਐਂਡਪੌਇੰਟ ਪ੍ਰਾਪਤ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ਹੈਲਥ ਐਂਡਪੌਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ
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

# ਟੈਸਟ ਚਲਾਓ
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# ਕਸਟਮ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਟੈਸਟ ਚਲਾਓ
npm run test:integration
```

### ਲੋਡ ਟੈਸਟਿੰਗ ਲਈ ਡਿਬੱਗਿੰਗ
```bash
# ਸਧਾਰਣ ਲੋਡ ਟੈਸਟ ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਕਮਜ਼ੋਰੀਆਂ ਦੀ ਪਛਾਣ ਕਰਨ ਲਈ
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # ਐਪਾਚ ਬੈਂਚ ਦੀ ਵਰਤੋਂ ਕਰਨਾ (ਇੰਸਟਾਲ ਕਰੋ: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ਮੁੱਖ ਮਾਪਦੰਡ ਕੱਢੋ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ਅਸਫਲਤਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ਇੰਫਰਾਸਟਰਕਚਰ ਡਿਬੱਗਿੰਗ

### Bicep ਟੈਂਪਲੇਟ ਡਿਬੱਗਿੰਗ
```bash
# ਬਾਈਸੈਪ ਟੈਂਪਲੇਟਾਂ ਨੂੰ ਵਿਸਥਾਰਪੂਰਵਕ ਨਤੀਜੇ ਨਾਲ ਪ੍ਰਮਾਣਿਤ ਕਰੋ
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # ਸਿੰਟੈਕਸ ਪ੍ਰਮਾਣਿਕਤਾ
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ਲਿੰਟ ਪ੍ਰਮਾਣਿਕਤਾ
    az bicep lint --file "$template_file"
    
    # ਕੀ-ਹੋਵੇਗਾ ਡਿਪਲੋਇਮੈਂਟ
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ਟੈਂਪਲੇਟ ਡਿਪਲੋਇਮੈਂਟ ਡੀਬੱਗ ਕਰੋ
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

### ਰਿਸੋਰਸ ਸਟੇਟ ਵਿਸ਼ਲੇਸ਼ਣ
```bash
# ਸਰੋਤਾਂ ਦੀਆਂ ਸਥਿਤੀਆਂ ਵਿੱਚ ਅਸੰਗਤੀਆਂ ਦੀ ਵਿਸ਼ਲੇਸ਼ਣਾ ਕਰੋ
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # ਸਾਰੇ ਸਰੋਤਾਂ ਨੂੰ ਉਨ੍ਹਾਂ ਦੀਆਂ ਸਥਿਤੀਆਂ ਨਾਲ ਸੂਚੀਬੱਧ ਕਰੋ
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ਅਸਫਲ ਸਰੋਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
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

## 🔒 ਸੁਰੱਖਿਆ ਡਿਬੱਗਿੰਗ

### ਪ੍ਰਮਾਣਿਕਤਾ ਫਲੋ ਡਿਬੱਗਿੰਗ
```bash
# ਐਜ਼ਿਊਰ ਪ੍ਰਮਾਣਿਕਤਾ ਡੀਬੱਗ ਕਰੋ
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

# ਕੀ ਵਾਲਟ ਐਕਸੈੱਸ ਡੀਬੱਗ ਕਰੋ
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

### ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ ਡਿਬੱਗਿੰਗ
```bash
# ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸਮੂਹਾਂ ਦੀ ਡਿਬੱਗਿੰਗ ਕਰੋ
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

## 📱 ਐਪਲੀਕੇਸ਼ਨ-ਸਪੈਸਿਫਿਕ ਡਿਬੱਗਿੰਗ

### Node.js ਐਪਲੀਕੇਸ਼ਨ ਡਿਬੱਗਿੰਗ
```javascript
// ਡੀਬੱਗ-ਮਿਡਲਵੇਅਰ.js - ਐਕਸਪ੍ਰੈਸ ਡੀਬੱਗਿੰਗ ਮਿਡਲਵੇਅਰ
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
    
    // ਜਵਾਬਾਂ ਨੂੰ ਲੌਗ ਕਰਨ ਲਈ res.json ਨੂੰ ਓਵਰਰਾਈਡ ਕਰੋ
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ਡਾਟਾਬੇਸ ਕਵੈਰੀ ਡਿਬੱਗਿੰਗ
```javascript
// ਡੇਟਾਬੇਸ-ਡਿਬੱਗ.js - ਡੇਟਾਬੇਸ ਡਿਬੱਗਿੰਗ ਯੂਟਿਲਿਟੀਜ਼
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

## 🚨 ਐਮਰਜੈਂਸੀ ਡਿਬੱਗਿੰਗ ਪ੍ਰੋਸੀਜਰ

### ਪ੍ਰੋਡਕਸ਼ਨ ਸਮੱਸਿਆ ਜਵਾਬ
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

# ਸਹੀ ਮਾਹੌਲ ਵਿੱਚ ਸਵਿੱਚ ਕਰੋ
azd env select "$ENVIRONMENT"

# ਜ਼ਰੂਰੀ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰੋ
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

### ਰੋਲਬੈਕ ਪ੍ਰੋਸੀਜਰ
```bash
# ਤੇਜ਼ ਰੋਲਬੈਕ ਸਕ੍ਰਿਪਟ
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # ਵਾਤਾਵਰਣ ਬਦਲੋ
    azd env select "$environment"
    
    # ਐਪਲੀਕੇਸ਼ਨ ਰੋਲਬੈਕ ਕਰੋ
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # ਰੋਲਬੈਕ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
    echo "Verifying rollback..."
    azd show
    
    # ਮਹੱਤਵਪੂਰਨ ਐਂਡਪੌਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ਡਿਬੱਗਿੰਗ ਡੈਸ਼ਬੋਰਡ

### ਕਸਟਮ ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ
```bash
# ਡਿਬੱਗਿੰਗ ਲਈ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਕਵੈਰੀਜ਼ ਬਣਾਓ
create_debug_queries() {
    local app_insights_name=$1
    
    # ਗਲਤੀਆਂ ਲਈ ਕਵੈਰੀ ਕਰੋ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # ਪ੍ਰਦਰਸ਼ਨ ਸਮੱਸਿਆਵਾਂ ਲਈ ਕਵੈਰੀ ਕਰੋ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ਨਿਰਭਰਤਾ ਅਸਫਲਤਾਵਾਂ ਲਈ ਕਵੈਰੀ ਕਰੋ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ਲੌਗ ਐਗਰੀਗੇਸ਼ਨ
```bash
# ਕਈ ਸਰੋਤਾਂ ਤੋਂ ਲੌਗ ਇਕੱਠੇ ਕਰੋ
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

## 🔗 ਉੱਚ-ਸਤਹ ਸਰੋਤ

### ਕਸਟਮ ਡਿਬੱਗ ਸਕ੍ਰਿਪਟ
`scripts/debug/` ਡਾਇਰੈਕਟਰੀ ਬਣਾਓ:
- `health-check.sh` - ਵਿਸਤ੍ਰਿਤ ਹੈਲਥ ਚੈੱਕਿੰਗ
- `performance-test.sh` - ਆਟੋਮੈਟਿਕ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ
- `log-analyzer.py` - ਉੱਚ-ਸਤਹ ਲੌਗ ਪਾਰਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ
- `resource-validator.sh` - ਇੰਫਰਾਸਟਰਕਚਰ ਵੈਲੀਡੇਸ਼ਨ

### ਮਾਨੀਟਰਿੰਗ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

## ਬਿਹਤਰ ਅਭਿਆਸ

1. **ਹਮੇਸ਼ਾ ਡਿਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ** ਗੈਰ-ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ
2. **ਸਮੱਸਿਆਵਾਂ ਲਈ ਦੁਹਰਾਏ ਜਾਣ ਵਾਲੇ ਟੈਸਟ ਕੇਸ ਬਣਾਓ**
3. **ਆਪਣੀ ਟੀਮ ਲਈ ਡਿਬੱਗਿੰਗ ਪ੍ਰੋਸੀਜਰ ਦਸਤਾਵੇਜ਼ ਕਰੋ**
4. **ਹੈਲਥ ਚੈੱਕ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਆਟੋਮੇਟ ਕਰੋ**
5. **ਡਿਬੱਗ ਟੂਲਾਂ ਨੂੰ ਐਪਲੀਕੇਸ਼ਨ ਬਦਲਾਵਾਂ ਨਾਲ ਅਪਡੇਟ ਰੱਖੋ**
6. **ਗੈਰ-ਇੰਸੀਡੈਂਟ ਸਮੇਂ ਦੌਰਾਨ ਡਿਬੱਗਿੰਗ ਪ੍ਰੋਸੀਜਰ ਦਾ ਅਭਿਆਸ ਕਰੋ**

## ਅਗਲੇ ਕਦਮ

- [ਕੈਪੈਸਿਟੀ ਪਲੈਨਿੰਗ](../pre-deployment/capacity-planning.md) - ਰਿਸੋਰਸ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [SKU ਚੋਣ](../pre-deployment/sku-selection.md) - ਉਚਿਤ ਸੇਵਾ ਟੀਅਰ ਚੁਣੋ
- [ਪ੍ਰੀਫਲਾਈਟ ਚੈੱਕ](../pre-deployment/preflight-checks.md) - ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਲੀਡੇਸ਼ਨ
- [ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md) - ਤੇਜ਼ ਰਿਫਰੈਂਸ ਕਮਾਂਡ

---

**ਯਾਦ ਰੱਖੋ**: ਚੰਗੀ ਡਿਬੱਗਿੰਗ ਸਿਸਟਮੈਟਿਕ, ਵਿਸਤ੍ਰਿਤ ਅਤੇ ਧੀਰਜਵਾਨ ਹੋਣ ਬਾਰੇ ਹੈ। ਇਹ ਟੂਲ ਅਤੇ ਤਕਨੀਕਾਂ ਤੁਹਾਨੂੰ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਅਤੇ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਪਛਾਣਨ ਵਿੱਚ ਮਦਦ ਕਰਨਗੀਆਂ।

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md)

- **ਅਗਲਾ ਪਾਠ**: [ਕੈਪੈਸਿਟੀ ਪਲੈਨਿੰਗ](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਰਤੀਕਰਨ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੱਜੇਪਣ ਹੋ ਸਕਦੇ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->