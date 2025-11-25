<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-24T23:53:18+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "kn"
}
-->
# AZD ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಳ ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ತೊಂದರೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](common-issues.md)
- **➡️ ಮುಂದಿನದು**: [AI-ನಿರ್ದಿಷ್ಟ ತೊಂದರೆ ಪರಿಹಾರ](ai-troubleshooting.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../microsoft-foundry/production-ai-practices.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಳ ಸಂಕೀರ್ಣ ಸಮಸ್ಯೆಗಳನ್ನು ಪತ್ತೆಹಚ್ಚಲು ಮತ್ತು ಪರಿಹರಿಸಲು ಉನ್ನತ ಮಟ್ಟದ ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳು, ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. ವ್ಯವಸ್ಥಿತ ತೊಂದರೆ ಪರಿಹಾರ ವಿಧಾನಶಾಸ್ತ್ರಗಳು, ಲಾಗ್ ವಿಶ್ಲೇಷಣಾ ತಂತ್ರಗಳು, ಕಾರ್ಯಕ್ಷಮತೆಯ ಪ್ರೊಫೈಲಿಂಗ್, ಮತ್ತು ಉನ್ನತ ಮಟ್ಟದ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಸಾಧನಗಳನ್ನು ಕಲಿಯಿರಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- Azure Developer CLI ಸಮಸ್ಯೆಗಳಿಗೆ ವ್ಯವಸ್ಥಿತ ಡಿಬಗಿಂಗ್ ವಿಧಾನಶಾಸ್ತ್ರಗಳಲ್ಲಿ ಪರಿಣತಿ ಹೊಂದುತ್ತೀರಿ
- ಉನ್ನತ ಮಟ್ಟದ ಲಾಗಿಂಗ್ ಸಂರಚನೆ ಮತ್ತು ಲಾಗ್ ವಿಶ್ಲೇಷಣಾ ತಂತ್ರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ಕಾರ್ಯಕ್ಷಮತೆಯ ಪ್ರೊಫೈಲಿಂಗ್ ಮತ್ತು ನಿಗಾವಹಿಸುವ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- ಸಂಕೀರ್ಣ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕಾಗಿ Azure ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಸಾಧನಗಳು ಮತ್ತು ಸೇವೆಗಳನ್ನು ಬಳಸುತ್ತೀರಿ
- ನೆಟ್‌ವರ್ಕ್ ಡಿಬಗಿಂಗ್ ಮತ್ತು ಭದ್ರತಾ ತೊಂದರೆ ಪರಿಹಾರ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸುತ್ತೀರಿ
- ಪ್ರೊಆಕ್ಟಿವ್ ಸಮಸ್ಯೆ ಪತ್ತೆಗಾಗಿ ಸಮಗ್ರ ನಿಗಾವಹಿಸುವಿಕೆ ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸಂರಚಿಸುತ್ತೀರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- ಸಂಕೀರ್ಣ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಸಮಸ್ಯೆಗಳನ್ನು ವ್ಯವಸ್ಥಿತವಾಗಿ ಡಿಬಗ್ ಮಾಡಲು TRIAGE ವಿಧಾನವನ್ನು ಅನ್ವಯಿಸಬಹುದು
- ಸಮಗ್ರ ಲಾಗಿಂಗ್ ಮತ್ತು ಟ್ರೇಸಿಂಗ್ ಮಾಹಿತಿಯನ್ನು ಸಂರಚಿಸಿ ವಿಶ್ಲೇಷಿಸಬಹುದು
- Azure Monitor, Application Insights, ಮತ್ತು ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಸಾಧನಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಬಳಸಬಹುದು
- ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ, ಪ್ರಾಮಾಣೀಕರಣ, ಮತ್ತು ಅನುಮತಿ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಡಿಬಗ್ ಮಾಡಬಹುದು
- ಕಾರ್ಯಕ್ಷಮತೆಯ ನಿಗಾವಹಿಸುವಿಕೆ ಮತ್ತು ಆಪ್ಟಿಮೈಸೇಶನ್ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು
- ಪುನರಾವೃತ್ತ ಸಮಸ್ಯೆಗಳಿಗೆ ಕಸ್ಟಮ್ ಡಿಬಗಿಂಗ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು ಮತ್ತು ಸ್ವಯಂಚಾಲಿತ ಕ್ರಮಗಳನ್ನು ರಚಿಸಬಹುದು

## ಡಿಬಗಿಂಗ್ ವಿಧಾನಶಾಸ್ತ್ರ

### TRIAGE ವಿಧಾನ
- **T**ime: ಸಮಸ್ಯೆ ಯಾವಾಗ ಪ್ರಾರಂಭವಾಯಿತು?
- **R**eproduce: ನೀವು ಅದನ್ನು ನಿರಂತರವಾಗಿ ಪುನರಾವರ್ತಿಸಬಹುದೇ?
- **I**solate: ಯಾವ ಘಟಕ ವಿಫಲವಾಗುತ್ತಿದೆ?
- **A**nalyze: ಲಾಗ್‌ಗಳು ನಮಗೆ ಏನು ಹೇಳುತ್ತವೆ?
- **G**ather: ಎಲ್ಲಾ ಸಂಬಂಧಿತ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸಿ
- **E**scalate: ಹೆಚ್ಚುವರಿ ಸಹಾಯವನ್ನು ಯಾವಾಗ ಕೇಳಬೇಕು

## ಡಿಬಗ್ ಮೋಡ್ ಸಕ್ರಿಯಗೊಳಿಸುವುದು

### ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು
```bash
# ಸಮಗ್ರ ಡಿಬಗ್ಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# ಆಜೂರ್ CLI ಡಿಬಗ್ಗಿಂಗ್
export AZURE_CLI_DIAGNOSTICS=true

# ಸ್ವಚ್ಛವಾದ ಔಟ್‌ಪುಟ್‌ಗಾಗಿ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DISABLE_TELEMETRY=true
```

### ಡಿಬಗ್ ಸಂರಚನೆ
```bash
# ಡಿಬಗ್ ಸಂರಚನೆಯನ್ನು ಜಾಗತಿಕವಾಗಿ ಹೊಂದಿಸಿ
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ಟ್ರೇಸ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ಲಾಗ್ ವಿಶ್ಲೇಷಣಾ ತಂತ್ರಗಳು

### ಲಾಗ್ ಮಟ್ಟಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ರಚನಾತ್ಮಕ ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ
```bash
# ಲಾಗ್‌ಗಳನ್ನು ಮಟ್ಟದ ಮೂಲಕ ಫಿಲ್ಟರ್ ಮಾಡಿ
azd logs --level error --since 1h

# ಸೇವೆಯ ಮೂಲಕ ಫಿಲ್ಟರ್ ಮಾಡಿ
azd logs --service api --level debug

# ವಿಶ್ಲೇಷಣೆಗೆ ಲಾಗ್‌ಗಳನ್ನು ರಫ್ತು ಮಾಡಿ
azd logs --output json > deployment-logs.json

# jq ಬಳಸಿ JSON ಲಾಗ್‌ಗಳನ್ನು ಪಾರ್ಸ್ ಮಾಡಿ
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### ಲಾಗ್ ಸಂಬಂಧ
```bash
#!/bin/bash
# correlate-logs.sh - ಸೇವೆಗಳಾದ್ಯಂತ ಲಾಗ್‌ಗಳನ್ನು ಸಂಬಂಧಿಸಿ

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# ಎಲ್ಲಾ ಸೇವೆಗಳಾದ್ಯಂತ ಹುಡುಕಿ
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure ಲಾಗ್‌ಗಳನ್ನು ಹುಡುಕಿ
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ಉನ್ನತ ಮಟ್ಟದ ಡಿಬಗಿಂಗ್ ಸಾಧನಗಳು

### Azure Resource Graph Queries
```bash
# ಟ್ಯಾಗ್‌ಗಳ ಮೂಲಕ ಸಂಪತ್ತನ್ನು ಹುಡುಕಿ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ವಿಫಲವಾದ ನಿಯೋಜನೆಗಳನ್ನು ಹುಡುಕಿ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# ಸಂಪತ್ತಿನ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ನೆಟ್‌ವರ್ಕ್ ಡಿಬಗಿಂಗ್
```bash
# ಸೇವೆಗಳ ನಡುವೆ ಸಂಪರ್ಕವನ್ನು ಪರೀಕ್ಷಿಸಿ
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

# ಬಳಕೆ
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### ಕಂಟೈನರ್ ಡಿಬಗಿಂಗ್
```bash
# ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಸಮಸ್ಯೆಗಳನ್ನು ಡೀಬಗ್ ಮಾಡಿ
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

### ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ಡಿಬಗಿಂಗ್
```bash
# ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕವನ್ನು ಡಿಬಗ್ ಮಾಡಿ
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

## 🔬 ಕಾರ್ಯಕ್ಷಮತೆಯ ಡಿಬಗಿಂಗ್

### ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆಯ ನಿಗಾವಹಿಸುವಿಕೆ
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್ಸ್ ಡಿಬಗ್ಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
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

# ಕಸ್ಟಮ್ ಕಾರ್ಯಕ್ಷಮತೆಯ ನಿಗಾವಹಿಸುವಿಕೆ
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

### ಸಂಪತ್ತಿನ ಬಳಕೆ ವಿಶ್ಲೇಷಣೆ
```bash
# ಸಂಪತ್ತಿನ ಬಳಕೆಯನ್ನು ನಿಗಾ ವಹಿಸಿ
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

## 🧪 ಪರೀಕ್ಷೆ ಮತ್ತು ಮಾನ್ಯತೆ

### ಇಂಟಿಗ್ರೇಶನ್ ಟೆಸ್ಟ್ ಡಿಬಗಿಂಗ್
```bash
#!/bin/bash
# ಡಿಬಗ್-ಇಂಟಿಗ್ರೇಶನ್-ಟೆಸ್ಟ್‌ಗಳು.sh

set -e

echo "Running integration tests with debugging..."

# ಡಿಬಗ್ ಪರಿಸರವನ್ನು ಹೊಂದಿಸಿ
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ಸೇವಾ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ಆರೋಗ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
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

# ಪರೀಕ್ಷೆಗಳನ್ನು ನಡೆಸಿ
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# ಕಸ್ಟಮ್ ಇಂಟಿಗ್ರೇಶನ್ ಟೆಸ್ಟ್‌ಗಳನ್ನು ನಡೆಸಿ
npm run test:integration
```

### ಲೋಡ್ ಟೆಸ್ಟಿಂಗ್ ಡಿಬಗಿಂಗ್
```bash
# ಕಾರ್ಯಕ್ಷಮತೆಯ ಬಾಟಲ್‌ನೆಕ್‌ಗಳನ್ನು ಗುರುತಿಸಲು ಸರಳ ಲೋಡ್ ಪರೀಕ್ಷೆ
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # ಅಪಾಚೆ ಬೆಂಚ್ ಬಳಸಿ (ಸ್ಥಾಪನೆ: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ಪ್ರಮುಖ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ವಿಫಲತೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ಮೂಲಸೌಕರ್ಯ ಡಿಬಗಿಂಗ್

### Bicep ಟೆಂಪ್ಲೇಟ್ ಡಿಬಗಿಂಗ್
```bash
# ಬೈಸೆಪ್ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿವರವಾದ ಔಟ್‌ಪುಟ್‌ನೊಂದಿಗೆ ಮಾನ್ಯತೆಗೊಳಿಸಿ
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # ಶಬ್ದಸಾಮ್ಯ ಮಾನ್ಯತೆ
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ಲಿಂಟ್ ಮಾನ್ಯತೆ
    az bicep lint --file "$template_file"
    
    # ಏನಾಗುತ್ತದೆ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ಟೆಂಪ್ಲೇಟ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಡೀಬಗ್
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

### ಸಂಪತ್ತಿನ ಸ್ಥಿತಿ ವಿಶ್ಲೇಷಣೆ
```bash
# ಸಂಪತ್ತಿನ ಸ್ಥಿತಿಗಳನ್ನು ಅಸಂಗತತೆಗಳಿಗೆ ವಿಶ್ಲೇಷಿಸಿ
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # ಎಲ್ಲಾ ಸಂಪತ್ತನ್ನು ಅವುಗಳ ಸ್ಥಿತಿಗಳೊಂದಿಗೆ ಪಟ್ಟಿ ಮಾಡಿ
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ವಿಫಲವಾದ ಸಂಪತ್ತನ್ನು ಪರಿಶೀಲಿಸಿ
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

## 🔒 ಭದ್ರತಾ ಡಿಬಗಿಂಗ್

### ಪ್ರಾಮಾಣೀಕರಣ ಪ್ರಕ್ರಿಯೆ ಡಿಬಗಿಂಗ್
```bash
# ಆಜೂರ್ ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಡಿಬಗ್ ಮಾಡಿ
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT ಟೋಕನ್ ಡಿಕೋಡ್ ಮಾಡಿ (jq ಮತ್ತು base64 ಅಗತ್ಯವಿದೆ)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶವನ್ನು ಡಿಬಗ್ ಮಾಡಿ
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

### ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತಾ ಡಿಬಗಿಂಗ್
```bash
# ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಿ
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # ಭದ್ರತಾ ನಿಯಮಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ಅಪ್ಲಿಕೇಶನ್-ನಿರ್ದಿಷ್ಟ ಡಿಬಗಿಂಗ್

### Node.js ಅಪ್ಲಿಕೇಶನ್ ಡಿಬಗಿಂಗ್
```javascript
// ಡಿಬಗ್-ಮಿಡಲ್‌ವೇರ್.js - ಎಕ್ಸ್‌ಪ್ರೆಸ್ ಡಿಬಗಿಂಗ್ ಮಿಡಲ್‌ವೇರ್
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // ವಿನಂತಿ ವಿವರಗಳನ್ನು ಲಾಗ್ ಮಾಡಿ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // ಪ್ರತಿಸ್ಪಂದನೆಗಳನ್ನು ಲಾಗ್ ಮಾಡಲು res.json ಅನ್ನು ಓವರ್‌ರೈಡ್ ಮಾಡಿ
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ಡೇಟಾಬೇಸ್ ಕ್ವೇರಿ ಡಿಬಗಿಂಗ್
```javascript
// ಡೇಟಾಬೇಸ್-ಡಿಬಗ್.js - ಡೇಟಾಬೇಸ್ ಡಿಬಗಿಂಗ್ ಉಪಕರಣಗಳು
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

## 🚨 ತುರ್ತು ಡಿಬಗಿಂಗ್ ಕ್ರಮಗಳು

### ಉತ್ಪಾದನಾ ಸಮಸ್ಯೆ ಪ್ರತಿಕ್ರಿಯೆ
```bash
#!/bin/bash
# emergency-debug.sh - ತುರ್ತು ಉತ್ಪಾದನಾ ಡಿಬಗ್ಗಿಂಗ್

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

# ಸರಿಯಾದ ಪರಿಸರಕ್ಕೆ ಬದಲಾಯಿಸಿ
azd env select "$ENVIRONMENT"

# ಪ್ರಮುಖ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸಿ
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

### ರೋಲ್‌ಬ್ಯಾಕ್ ಕ್ರಮಗಳು
```bash
# ವೇಗದ ರೋಲ್‌ಬ್ಯಾಕ್ ಸ್ಕ್ರಿಪ್ಟ್
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # ಪರಿಸರವನ್ನು ಬದಲಾಯಿಸಿ
    azd env select "$environment"
    
    # ಅಪ್ಲಿಕೇಶನ್ ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # ರೋಲ್‌ಬ್ಯಾಕ್ ಪರಿಶೀಲಿಸಿ
    echo "Verifying rollback..."
    azd show
    
    # ಪ್ರಮುಖ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ಡಿಬಗಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳು

### ಕಸ್ಟಮ್ ನಿಗಾವಹಿಸುವ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
```bash
# ಡಿಬಗ್ಗಿಂಗ್‌ಗಾಗಿ ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್ಸ್ ಕ್ವೆರಿಗಳನ್ನು ರಚಿಸಿ
create_debug_queries() {
    local app_insights_name=$1
    
    # ದೋಷಗಳಿಗಾಗಿ ಕ್ವೆರಿ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # ಕಾರ್ಯಕ್ಷಮತೆಯ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಕ್ವೆರಿ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ಅವಲಂಬನೆ ವೈಫಲ್ಯಗಳಿಗಾಗಿ ಕ್ವೆರಿ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ಲಾಗ್ ಸಂಗ್ರಹಣೆ
```bash
# ಹಲವಾರು ಮೂಲಗಳಿಂದ ಲಾಗ್‌ಗಳನ್ನು ಒಗ್ಗೂಡಿಸಿ
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

## 🔗 ಉನ್ನತ ಮಟ್ಟದ ಸಂಪತ್ತುಗಳು

### ಕಸ್ಟಮ್ ಡಿಬಗ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
`scripts/debug/` ಡೈರೆಕ್ಟರಿಯನ್ನು ರಚಿಸಿ:
- `health-check.sh` - ಸಮಗ್ರ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ
- `performance-test.sh` - ಸ್ವಯಂಚಾಲಿತ ಕಾರ್ಯಕ್ಷಮತೆ ಪರೀಕ್ಷೆ
- `log-analyzer.py` - ಉನ್ನತ ಮಟ್ಟದ ಲಾಗ್ ಪಾರ್ಸಿಂಗ್ ಮತ್ತು ವಿಶ್ಲೇಷಣೆ
- `resource-validator.sh` - ಮೂಲಸೌಕರ್ಯ ಮಾನ್ಯತೆ

### ನಿಗಾವಹಿಸುವಿಕೆ ಏಕೀಕರಣ
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

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

1. **ನಿರ್ಮಾಣೇತರ ಪರಿಸರಗಳಲ್ಲಿ ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸದಾ ಸಕ್ರಿಯಗೊಳಿಸಿ**
2. **ಸಮಸ್ಯೆಗಳಿಗೆ ಪುನರಾವರ್ತನೀಯ ಪರೀಕ್ಷಾ ಪ್ರಕರಣಗಳನ್ನು ರಚಿಸಿ**
3. **ನಿಮ್ಮ ತಂಡಕ್ಕಾಗಿ ಡಿಬಗಿಂಗ್ ಕ್ರಮಗಳನ್ನು ದಾಖಲೆಗೊಳಿಸಿ**
4. **ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಮತ್ತು ನಿಗಾವಹಿಸುವಿಕೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ**
5. **ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಬದಲಾವಣೆಗಳಿಗೆ ಡಿಬಗ್ ಸಾಧನಗಳನ್ನು ನವೀಕರಿಸಿ**
6. **ಸಮಸ್ಯೆಗಿಂತ ಮುಂಚೆ ಡಿಬಗಿಂಗ್ ಕ್ರಮಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ**

## ಮುಂದಿನ ಹಂತಗಳು

- [ಕ್ಷಮತೆ ಯೋಜನೆ](../pre-deployment/capacity-planning.md) - ಸಂಪತ್ತಿನ ಅಗತ್ಯಗಳನ್ನು ಯೋಜಿಸಿ
- [SKU ಆಯ್ಕೆ](../pre-deployment/sku-selection.md) - ಸೂಕ್ತ ಸೇವಾ ಹಂತಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ
- [ಪ್ರೀಫ್ಲೈಟ್ ಪರಿಶೀಲನೆಗಳು](../pre-deployment/preflight-checks.md) - ಪೂರ್ವ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಮಾನ್ಯತೆ
- [ಚೀಟ್ ಶೀಟ್](../../resources/cheat-sheet.md) - ತ್ವರಿತ ಉಲ್ಲೇಖ ಆಜ್ಞೆಗಳು

---

**ಜ್ಞಾಪನೆ**: ಉತ್ತಮ ಡಿಬಗಿಂಗ್ ವ್ಯವಸ್ಥಿತ, ಸಮಗ್ರ, ಮತ್ತು ಶಾಂತವಾಗಿರುವುದರ ಬಗ್ಗೆ. ಈ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು ನಿಮಗೆ ಸಮಸ್ಯೆಗಳನ್ನು ವೇಗವಾಗಿ ಮತ್ತು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಪತ್ತೆಹಚ್ಚಲು ಸಹಾಯ ಮಾಡುತ್ತವೆ.

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](common-issues.md)

- **ಮುಂದಿನ ಪಾಠ**: [ಕ್ಷಮತೆ ಯೋಜನೆ](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸಮಾಕ್ಷ್ಯತೆ**:  
ಈ ದಸ್ತಾವೇಜು [Co-op Translator](https://github.com/Azure/co-op-translator) ಎಂಬ AI ಅನುವಾದ ಸೇವೆಯನ್ನು ಬಳಸಿಕೊಂಡು ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸಮಾಕ್ಷ್ಯತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->