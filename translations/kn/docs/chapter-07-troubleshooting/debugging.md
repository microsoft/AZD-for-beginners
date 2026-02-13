# AZD ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶನ

**Chapter Navigation:**
- **📚 Course Home**: [ಆರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 Current Chapter**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ Previous**: [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](common-issues.md)
- **➡️ Next**: [AI-ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆ ಪರಿಹಾರ](ai-troubleshooting.md)
- **🚀 Next Chapter**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ನಿಯೋಜನೆಗಳ ಸವಾಲುಗಳನ್ನು ನಿದಾನ ಮಾಡಲು ಮತ್ತು ಪರಿಹರಿಸಲು ಉನ್ನತ ಮಟ್ಟದ ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳು, ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. ನಿಯತಕಾಲಿಕ ಸಮಸ್ಯೆ ಪರಿಹಾರ ವಿಧಾನಶಾಸ್ತ್ರಗಳು, ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ ತಂತ್ರಗಳು, ಕಾರ್ಯಕ್ಷಮತೆ ಪ್ರೊಫೈಲಿಂಗ್ ಮತ್ತು ಉನ್ನತ ದ್ದಯೋಗೋಪಾಯ ಸಾಧನಗಳನ್ನು ಕಲಿಯಿರಿ ಮತ್ತು ನಿಯೋಜನೆ ಮತ್ತು ರನ್‍ಟೈಮ್ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಪರಿಹರಿಸಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- Azure Developer CLI ಸಮಸ್ಯೆಗಳಿಗೆ ವ್ಯವಸ್ಥಿತ ಡಿಬಗಿಂಗ್ ವಿಧಾನಗಳನ್ನು ಪರಿಣತಿಗೊಳಿಸಬಹುದು
- ಉನ್ನತ ಲಾಗಿಂಗ್ ಸಂರಚನೆ ಮತ್ತು ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ ತಂತ್ರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ಕಾರ್ಯಕ್ಷಮತೆ ಪ್ರೊಫೈಲಿಂಗ್ ಮತ್ತು ನಿಗಾ ಯುಕ್ತತೆಯ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಟಾನಗೊಳಿಸುತ್ತೀರಿ
- ಸಂಕೀರ್ಣ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕಾಗಿ Azure ನಿರ್ಣಾಯಕ ಸಾಧನಗಳು ಮತ್ತು ಸೇವೆಗಳನ್ನು ಬಳಸುತ್ತೀರಿ
- ನೆಟ್‌ವರ್ಕ್ ಡಿಬಗಿಂಗ್ ಮತ್ತು ಭದ್ರತಾ ಸಮಸ್ಯೆ ಪರಿಹಾರ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸುತ್ತೀರಿ
- ಪ್ರೊಆಕ್ಟಿವ್ ಸಮಸ್ಯೆ ಪತ್ತೆಗೊಳ್ಳುವಿಕೆಗೆ ಸಂಪೂರ್ಣ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟ್ ಸಂರಚನೆ ಮಾಡುತ್ತೀರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಶಕ್ತಿರಾಗಿರುತ್ತೀರಿ:
- ಸಂಕೀರ್ಣ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ವ್ಯವಸ್ಥಿತವಾಗಿ ಡಿಬಗ್ ಮಾಡಲು TRIAGE ವಿಧಾನವನ್ನು ಅನ್ವಯಿಸುವುದು
- ಸುದೀರ್ಘ ಲಾಗಿಂಗ್ ಮತ್ತು ಟ್ರೇಸಿಂಗ್ ಮಾಹಿತಿಯನ್ನು ಸಂರಚಿಸಲು ಮತ್ತು ವಿಶ್ಲೇಷಿಸಲು
- Azure Monitor, Application Insights ಮತ್ತು ನಿರ್ಣಾಯಕ ಸಾಧನಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಬಳಸಲು
- ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ, ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಡಿಬಗ್ ಮಾಡಲು
- ಕಾರ್ಯಕ್ಷಮತೆ ನಿಗಾ ಮತ್ತು ಆಪ್ಟಿಮೈಜೇಶನ್ ತಂತ್ರಗಳನ್ನು ಜಾರಿಗೆ ತರಲು
- ಪುನರಾವರ್ತಿಯಾಗುವ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಡಿಬಗಿಂಗ್ ಸ್ಕ್ರಿಪ್ಟುಗಳು ಮತ್ತು ಸ್ವಯಂಚಾಲನವನ್ನು ರಚಿಸಲು

## ಡಿಬಗಿಂಗ್ ವಿಧಾನಶಾಸ್ತ್ರ

### TRIAGE ಕ್ರಮ
- **ಸ**ಮಯ: ಸಮಸ್ಯೆ ಯಾವಾಗ ಆರಂಭವಾಯಿತು?
- **ಪ**ುನರಾವರ್ತಿಸು: ನೀವು ಇದನ್ನು ನಿರಂತರವಾಗಿ ಪುನರಾವರ್ತಿಸಬಹುದಿದ್ದೀರಾ?
- **ವ**ಿಭಜಿಸು: ಯಾವ ಘಟಕ ವಿಫಲವಾಗುತ್ತಿದೆ?
- **ವ**ಿಶ್ಲೇಷಣೆ: ಲಾಗ್‌ಗಳು ನಮಗೆ 무엇 ಹೇಳಿಸುತ್ತವೆ?
- **ಸ**ಂಗ್ರಹಿಸಿ: ಸಂಬಂಧಪಟ್ಟ ಎಲ್ಲಾ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸಿ
- **ಮ**ೇಲಕ್ಕೆತ್ತಿ: ಹೆಚ್ಚುವರಿ ಸಹಾಯವನ್ನು ಯಾವಾಗ ಕೇಳಬೇಕು?

## ಡೀಬಗ್ ಮೋಡ್ ಸಕ್ರಿಯಗೊಳಿಸುವುದು

### ಪರಿಸರ ಚರಗಳು
```bash
# ವಿಸ್ತೃತ ಡಿಬಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI ಡಿಬಗಿಂಗ್
export AZURE_CLI_DIAGNOSTICS=true

# ಸ್ವಚ್ಛ ಫಲಿತಾಂಶಕ್ಕಾಗಿ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DISABLE_TELEMETRY=true
```

### ಡೀಬಗ್ ಸಂರಚನೆ
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

### ರಚಿತ ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ
```bash
# azd monitor ಮೂಲಕ Azure Monitor ನಲ್ಲಿ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ನೇರ ಸಮಯದಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live

# ವಿವರಣಾತ್ಮಕ ಲಾಗ್ ವಿಶ್ಲೇಷಣೆಯಿಗಾಗಿ, ನಿಮ್ಮ App Service ಅಥವಾ Container App ಜೊತೆ Azure CLI ಅನ್ನು ಬಳಸಿ:
# App Service ಲಾಗ್‌ಗಳು
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App ಲಾಗ್‌ಗಳು
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ವಿಶ್ಲೇಷಣೆಯಿಗಾಗಿ Application Insights ಲಾಗ್‌ಗಳನ್ನು ರಫ್ತು ಮಾಡಿ
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### ಲಾಗ್ ಸಂಬಂಧ
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ಅನ್ನು ಉಪಯೋಗಿಸಿ ಸೇವೆಗಳಾದ್ಯಂತ ಲಾಗ್‌ಗಳನ್ನು ಪರಸ್ಪರ ಸಂಬಂಧಗೊಳಿಸಿ

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights ನಲ್ಲಿ ಸಂಬಂಧಿತ ಲಾಗ್‌ಗಳನ್ನು ಹುಡುಕಿ
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure ಚಟುವಟಿಕೆ ಲಾಗ್‌ಗಳನ್ನು ಹುಡುಕಿ
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ಉನ್ನತ ಡೀಬಗಿಂಗ್ ಉಪಕರಣಗಳು

### Azure ಸಂಪನ್ಮೂಲ ಗ್ರಾಫ್ ಪ್ರಶ್ನೆಗಳು
```bash
# ಟ್ಯಾಗ್‌ಗಳ ಮೂಲಕ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶೋಧಿಸಿ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ವಿಫಲವಾದ ನಿಯೋಜನೆಗಳನ್ನು ಹುಡುಕಿ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# ಸಂಪನ್ಮೂಲದ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
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
# ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಿ
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
# ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕವನ್ನು ಡೀಬಗ್ ಮಾಡಿ
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

## 🔬 ಕಾರ್ಯಕ್ಷಮತೆ ಡಿಬಗಿಂಗ್

### ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆ ಮೇಲ್ವಿಚಾರಣೆ
```bash
# Application Insights ಡಿಬಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
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

# ಕಸ್ಟಮ್ ಕಾರ್ಯಕ್ಷಮತೆ ಮೇಲ್ವಿಚಾರಣೆ
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

### ಸಂಪನ್ಮೂಲ ಬಳಕೆಯ ವಿಶ್ಲೇಷಣೆ
```bash
# ಸಂಪನ್ಮೂಲ ಬಳಕೆಯನ್ನು ನಿಗಾ ಮಾಡಿ
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
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# ಡೀಬಗ್ ಪರಿಸರವನ್ನು ಸೆಟ್ ಮಾಡಿ
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ಸೇವೆಯ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ಆರೋಗ್ಯ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
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

# ಟೆಸ್ಟ್‌ಗಳನ್ನು ಓಡಿಸಿ
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# ಕಸ್ಟಮ್ ಇಂಟಿಗ್ರೇಶನ್ ಟೆಸ್ಟ್‌ಗಳನ್ನು ಓಡಿಸಿ
npm run test:integration
```

### ಡಿಬಗಿಂಗ್ ಗಾಗಿ ಲೋಡ್ ಟೆಸ್ಟಿಂಗ್
```bash
# ಕಾರ್ಯಕ್ಷಮತೆಯ ಅಡೆತಡೆಗಳನ್ನು ಗುರುತಿಸಲು ಸರಳ ಲೋಡ್ ಪರೀಕ್ಷೆ
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ಬಳಸಿ (ಸ್ಥಾಪಿಸಲು: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ಪ್ರಮುಖ ಗಣಕಾಂಶಗಳನ್ನು ಹೊರತೆಗೆಯಿರಿ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ವಿಫಲತೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ಮೂಲಸೌಕರ್ಯ ಡಿಬಗಿಂಗ್

### Bicep ಟೆಂಪ್ಲೇಟು ಡಿಬಗಿಂಗ್
```bash
# ವಿವರವಾದ ಔಟ್‌ಪುಟ್‌ೊಂದಿಗೆ Bicep ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # ವ್ಯಾಕರಣ ಪರಿಶೀಲನೆ
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ಲಿಂಟ್ ಪರಿಶೀಲನೆ
    az bicep lint --file "$template_file"
    
    # What-if ನಿಯೋಜನೆ
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ಟೆಂಪ್ಲೇಟು ನಿಯೋಜನೆಯನ್ನು ಡಿಬಗ್ ಮಾಡಿ
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

### ಸಂಪನ್ಮೂಲ ಸ್ಥಿತಿ ವಿಶ್ಲೇಷಣೆ
```bash
# ಅಸಂಗತತೆಗಳಿಗಾಗಿ ಸಂಪನ್ಮೂಲಗಳ ಸ್ಥಿತಿಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅವುಗಳ ಸ್ಥಿತಿಗಳೊಡನೆ ಪಟ್ಟಿ ಮಾಡಿ
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ವಿಫಲಗೊಂಡಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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

### ಪ್ರಾಮಾಣೀಕರಣ ಹರಿವು ಡಿಬಗಿಂಗ್
```bash
# Azure ಪ್ರಮಾಣೀಕರಣದ ಡಿಬಗ್
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

# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶದ ಡಿಬಗ್
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
# ನೆಟ್‌ವರ್ಕ್ ಸುರಕ್ಷತಾ ಗುಂಪುಗಳನ್ನು ಡೀಬಗ್ ಮಾಡಿ
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # ಸುರಕ್ಷತಾ ನಿಯಮಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
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
// debug-middleware.js - Express ಡಿಬಗಿಂಗ್ ಮಿಡ್‌ಲ್ವೇರ್
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // ಅನುರೋಧದ ವಿವರಗಳನ್ನು ಲಾಗ್ ಮಾಡಿ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಲಾಗ್ ಮಾಡಲು res.json ಅನ್ನು ಓವರ್‌ರೈಡ್ ಮಾಡಿ
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ಡೇಟಾಬೇಸ್ ಪ್ರಶ್ನೆ ಡಿಬಗಿಂಗ್
```javascript
// database-debug.js - ಡೇಟಾಬೇಸ್ ಡೀಬಗಿಂಗ್ ಉಪಕರಣಗಳು
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

## 🚨 ತುರ್ತು ಡಿಬಗಿಂಗ್ ಪ್ರಕ್ರಿಯೆಗಳು

### ಉತ್ಪಾದನಾ ಸಮಸ್ಯೆಗಳ ಪ್ರತಿಕ್ರೀಯೆ
```bash
#!/bin/bash
# emergency-debug.sh - ತುರ್ತು ಉತ್ಪಾದನಾ ಡಿಬಗಿಂಗ್

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

# ಅತ್ಯವಶ್ಯಕ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸಿ
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# ದೋಷ ಲಾಗ್ಗಳಿಗಾಗಿ Azure Monitor ಅನ್ನು ಬಳಸಿ
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

### ರೋಲ್‌ಬ್ಯಾಕ್ ಪ್ರಕ್ರಿಯೆಗಳು
```bash
# ವೇಗದ ರೋಲ್ಬ್ಯಾಕ್ ಸ್ಕ್ರಿಪ್ಟ್
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # ಪರಿಸರ ಬದಲಾವಣೆ
    azd env select "$environment"
    
    # Git ಬಳಸಿ ರೋಲ್ಬ್ಯಾಕ್ (AZDನಲ್ಲಿ ಒಳಗೊಂಡಿರುವ ರೋಲ್ಬ್ಯಾಕ್ ಇಲ್ಲ)
    git checkout "$previous_commit"
    azd deploy
    
    # ರೋಲ್ಬ್ಯಾಕ್ ಪರಿಶೀಲಿಸಿ
    echo "Verifying rollback..."
    azd show
    
    # ಪ್ರಮುಖ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ಡಿಬಗಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ಗಳು

### ಕಸ್ಟಮ್ ಮೇಲ್ವಿಚಾರಣೆ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
```bash
# ಡಿಬಗಿಂಗ್‌ಗಾಗಿ Application Insights ಪ್ರಶ್ನೆಗಳನ್ನು ರಚಿಸಿ
create_debug_queries() {
    local app_insights_name=$1
    
    # ದೋಷಗಳಿಗಾಗಿ ಪ್ರಶ್ನೆ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಪ್ರಶ್ನೆ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ನಿರ್ಭರತೆ ವಿಫಲತೆಗಳಿಗಾಗಿ ಪ್ರಶ್ನೆ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ಲಾಗ್ ಸಂಗ್ರಹಣೆ
```bash
# ಬಹು ಅಜೂರ್ ಮೂಲಗಳಿಂದ ಲಾಗ್‌ಗಳನ್ನು ಏಕೀಕರಿಸಿ
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

## 🔗 ಉನ್ನತ ಸಂಪನ್ಮೂಲಗಳು

### ಕಸ್ಟಮ್ ಡಿಬಗ್ ಸ್ಕ್ರಿಪ್ಟುಗಳು
ನಿಮ್ಮ ಯೋಜನೆಯಲ್ಲಿ `scripts/debug/` ಡೈರೆಕ್ಟರಿ ರಚಿಸಿ ಮತ್ತು ಒಳಗೊಂಡಿರಲಿ:
- `health-check.sh` - ವ್ಯಾಪಕ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ
- `performance-test.sh` - ಸ್ವಯಂಚಾಲಿತ ಕಾರ್ಯಕ್ಷಮತೆ ಪರೀಕ್ಷೆ
- `log-analyzer.py` - ಉನ್ನತ ಲಾಗ್ ಪಾರ್ಸಿಂಗ್ ಮತ್ತು ವಿಶ್ಲೇಷಣೆ
- `resource-validator.sh` - ಮೂಲಸೌಕರ್ಯ ಮಾನ್ಯತೆ

### ಮೇಲ್ವಿಚಾರಣೆ ಸಂಯೋಜನೆ
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

1. **ಉತ್ಪಾದನಾ ಹೊರಗಿನ ಪರಿಸರಗಳಲ್ಲಿ ಎಂದಿಗೂ ಡೀಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ**
2. **ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಪುನರಾವರ್ತಿಸಬಹುದಾದ ಪರೀಕ್ಷಾ ಪ್ರಕರಣಗಳನ್ನು ರಚಿಸಿ**
3. **ನಿಮ್ಮ ತಂಡದಿಗಾಗಿ ಡಿಬಗಿಂಗ್ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ದಾಖಲೆಗೊಳಿಸಿ**
4. **ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳನ್ನು ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸ್ವಯಂಕ್ರಿಯಗೊಳಿಸಿ**
5. **ಡಿಬಗ್ ಉಪಕರಣಗಳನ್ನು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಬದಲಾವಣೆಗಳೊಂದಿಗೆ ನವೀಕರಿಸಿ**
6. **ಘಟನೆಯಿಲ್ಲದ ಸಂದರ್ಭಗಳಲ್ಲಿ ಡಿಬಗಿಂಗ್ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ**

## ಮುಂದಿನ ಹಂತಗಳು

- [ಕ್ಷಮತಾ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಅಗತ್ಯಗಳನ್ನು ಯೋಜಿಸಿ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - ಸೂಕ್ತ ಸೇವಾ ಮಟ್ಟಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - ನಿಯೋಜನೆಯ ಮುನ್ನ ಮಾನ್ಯತೆ
- [Cheat Sheet](../../resources/cheat-sheet.md) - ತ್ವರಿತ ಉಲ್ಲೇಖ ಆದೇಶಗಳು

---

**ಗಮನಿಸಿ**: ಉತ್ತಮ ಡಿಬಗಿಂಗ್ ಎಂದರೆ ವ್ಯವಸ್ಥಿತವಾಗಿರುವುದು, ಸಮಗ್ರವಾಗಿರುವುದು ಮತ್ತು ಸಹನೆಯಿರಬೇಕಾಗಿದೆ. These tools and techniques will help you diagnose issues faster and more effectively.

---

**ನ್ಯಾವಿಗೇಶನ್**
- **Previous Lesson**: [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](common-issues.md)

- **Next Lesson**: [ಕ್ಷಮತಾ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:

ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ Co-op Translator (https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳಿರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಸ್ತಾವೇಜಿನುದ್ಭವ ಭಾಷೆಯಲ್ಲಿರುವ ಪ್ರತಿಯನ್ನು ಅಧಿಕೃತ ಮೂಲವನ್ನಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೆ ಅಥವಾ ತಪ್ಪಾಗಿ ವ್ಯಾಖ್ಯಾನಗೊಳ್ಳುವುವುದಕ್ಕಾಗಿ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->