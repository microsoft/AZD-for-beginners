# AZD ನಿಯೋಜನೆಗಳಿಗಾಗಿ ಡಿಬಗ್ ಮಾರ್ಗದರ್ಶನ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಬೆಗಿನರ್ಸ್ ಗೆ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನದು**: [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](common-issues.md)
- **➡️ ಮುಂದಿನದು**: [AI-ವಿಶೇಷ ಸಮಸ್ಯೆ ಪರಿಹಾರ](ai-troubleshooting.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್ಪ್ರೈಸು ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)

## ಪರಿಚಯ

ಈ ವಿಸ್ತೃತ ಮಾರ್ಗದರ್ಶನವು Azure ಡೆವಲಪರ್ CLI ನಿಯೋಜನೆಗಳ ಸೌಲಭ್ಯಗಳಾದ ಕಠಿಣ ಸಮಸ್ಯೆಗಳನ್ನು ಗುರುತಿಸಿ ಪರಿಹರಿಸಲು ಸುಧಾರಿತ ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳು, ಸಾಧನಗಳು ಮತ್ತು ತಾಂತ್ರಿಕಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ. ಸಿಸ್ಟಮ್ಯಾಟಿಕ್ ಸಮಸ್ಯೆ ಪರಿಹಾರ ವಿಧಾನಗಳು, ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ ತಂತ್ರಗಳು, ಕಾರ್ಯಕ್ಷಮತೆ ಪ್ರೊಫೈಲಿಂಗ್ ಮತ್ತು ಸುಧಾರಿತ ನಿದಾನಾತ್ಮಕ ಸಾಧನಗಳನ್ನು ಕಲಿಯಿರಿ ಮತ್ತು ನಿಯೋಜನೆ ಹಾಗೂ ರನ್‌ಟೈಮ್ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಪರಿಹರಿಸಿ.

## ಕಲಿಕೋದ್ದೇಶಗಳು

ಈ ಮಾರ್ಗದರ್ಶನವನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- Azure ಡೆವಲಪರ್ CLI ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಸಿಸ್ಟಮ್ಯಾಟಿಕ್ ಡಿಬಗಿಂಗ್ ವಿಧಾನಗಳನ್ನು ಮಾಸ್ಟರ್ ಮಾಡಬಹುದು
- ಸುಧಾರಿತ ಲಾಗಿಂಗ್ ಸಂರಚನೆ ಮತ್ತು ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ ತಂತ್ರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ಕಾರ್ಯಕ್ಷಮತೆ ಪ್ರೊಫೈಲಿಂಗ್ ಮತ್ತುamonitoring ತಂತ್ರಗಳನ್ನು ನಿರ್ವಹಿಸಿ
- ಕುಂಚಿನ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕಾಗಿ Azure ನಿದಾನಾತ್ಮಕ ಸಾಧನಗಳು ಮತ್ತು ಸೇವೆಗಳನ್ನು ಬಳಸಿ
- ನೆಟ್‌ವರ್ಕ್ ಡಿಬಗಿಂಗ್ ಮತ್ತು ಭದ್ರತಾ ಸಮಸ್ಯೆ ಪರಿಹಾರ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸಿ
- ಪ್ರೋಆಕ್ಟಿವ್ ಸಮಸ್ಯೆ ಗುರುತಿಸುವಿಕೆಗಾಗಿ ಸಮಗ್ರ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟಿಂಗ್ ಸಂರಚನೆ ಮಾಡಿ

## ಕಲಿಕಾ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಂಡ ಮೇಲೆ, ನೀವು ಈ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಹೊಂದಿರುತ್ತೀರಿ:
- ಸಂಕೀರ್ಣ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಸಿಸ್ಟಮ್ಯಾಟಿಕ್ ಆಗಿ ಡಿಬಗ್ ಮಾಡಲು TRIAGE ವಿಧಾನವನ್ನು ಅನ್ವಯಿಸಿ
- ಸಮಗ್ರ ಲಾಗಿಂಗ್ ಮತ್ತು ಟ್ರೇಸಿಂಗ್ ಮಾಹಿತಿಯನ್ನು ಸಂರಚಿಸಿ ಮತ್ತು ವಿಶ್ಲೇಷಿಸಿ
- Azure Monitor, Application Insights ಮತ್ತು ನಿದಾನಾತ್ಮಕ ಸಾಧನಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಬಳಸಿ
- ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ, ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಪರವಾನಗಿ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಡಿಬಗ್ ಮಾಡಿ
- ಕಾರ್ಯಕ್ಷಮತೆ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಸುಧಾರಣಾ ತಂತ್ರಗಳನ್ನು ಜಾರಿಗೊಳಿಸಿ
- ಮರುನಿವೃತ್ತಿಯಾಗುವ ಸಮಸ್ಯೆಗಳಿಗೆ ಕಸ್ಟಮ್ ಡಿಬಗಿಂಗ್ სკ್ರಿಪ್ಟ್‌ಗಳು ಮತ್ತು ಸ್ವಯಂಚಾಲಿತೀಕರಣ ರಚಿಸಿ

## ಡಿಬಗಿಂಗ್ ವಿಧಾನಶಾಸ್ತ್ರ

### TRIAGE ವಿಧಾನ
- **T**ೈಮ್: ಸಮಸ್ಯೆ ಯಾವಾಗ ಪ್ರಾರಂಭವಾಯಿತು?
- **R**ೀಪ್ರೊಡ್ಯೂಸ್: ನೀವು ಅದನ್ನು ನಿರಂತರವಾಗಿ ಪುನರಾವರ್ತಿಸಬಹುದೆ?
- **I**ಸೋಲೇಟು: ಯಾವ ઘટಕ ವಿಫಲವಾಗಿದೆ?
- **A**ನಾಲಿಸಿಸ್: ಲಾಗ್‌ಗಳು ನಮಗೆ ಏನು ಹೇಳುತ್ತವೆ?
- **G**ದಾಯರಿ: ಎಲ್ಲಾ ಸಂಬಂಧಿತ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸಿ
- **E**ಸ್ಕಾಲೇಟ್: ಹೆಚ್ಚುವರಿ ಸಹಾಯ ಬೇಕಾಗುವ ಸಮಯ

## ಡಿಬಗ್ ಮೋಡ್ ಸಕ್ರಿಯಗೊಳಿಸುವಿಕೆ

> **ವ್ಯಾಪ್ತಿ:** ಇವು ನಿದಾನಾತ್ಮಕ ಉದಾಹರಣೆಗಳು ಮಾರ್ಪಡಿಸಲು; ಪೂರೈಕೆ ಮಾಡಿದ ಸ್ಕ್ರಿಪ್ಟ್ ಸಂಗ್ರಹವಲ್ಲ. ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳು/ಐಡಿಗಳಲ್ಲಿ ಬದಲಾವಣೆ ಮಾಡಿ; ಶೆಲ್ ಬ್ಲಾಕ್‌ಗಳಿಗೆ Bash ಬಳಸಿ. `--debug` ಔಟ್‌ಪುಟ್ ಮತ್ತು ಪರಿಸರ ಮೌಲ್ಯಗಳಲ್ಲಿ ಸಂವೇದನಾಶೀಲ ಮಾಹಿತಿ ಇರಬಹುದು—ಹಂಚುವ ಮುನ್ನ ಅವಲೋಕಿಸಿ/ಸಂಪಾದಿಸಿ. ನಿಯೋಜನೆ, ಹಿಂದೂಪಡಿಸುವಿಕೆ ಅಥವಾ ಸಂರಚನೆ ಬದಲಾಯಿಸುವ ಉದಾಹರಣೆಗಳಿಗೆ ಸ್ಪಷ್ಟ ಕಾರ್ಯಾಚರಣೆ ಅನುಮೋದನೆ ಅಗತ್ಯ.

### ಪರಿಸರ چلಕಗಳು
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### ಡಿಬಗ್ ಸಂರಚನೆ
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` ಅಥವ ಸ್ವಂತ ಕೀಗಳನ್ನು ಸಂಗ್ರಹಿಸಬಹುದು; ಅದರಿಂದ `debug.enabled`, `debug.logLevel` ಅಥವಾ `trace.outputPath` ಬೆಂಬಲಿತ ಸೆಟ್ಟಿಂಗ್‌ಗಳಾಗುವುದಿಲ್ಲ. ಬಿಡುಗಡೆಯಾದ ಆಜ್ಞೆಯ `--debug` ಧ್ವಜವನ್ನು ಬಳಸಿ.

## 📊 ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ ತಂತ್ರಗಳು

### ಲಾಗ್ ಮಟ್ಟಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ಸಂರಚಿತ ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ
```bash
# View logs with Azure Monitor (via azd monitor)
azd monitor --logs

# Open Application Insights Live Metrics (not a terminal log stream)
azd monitor --live

# For detailed log analysis, use Azure CLI with your App Service or Container App:
# App Service logs
az webapp log tail --name "$APP_NAME" --resource-group "$RG_NAME"

# Container App logs
az containerapp logs show --name "$APP_NAME" --resource-group "$RG_NAME" --follow

# Export Application Insights logs for analysis
az monitor app-insights query \
    --app "$APPI_NAME" \
    --resource-group "$RG_NAME" \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### ಲಾಗ್ ಸಂಪರ್ಕ
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services using Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_ID=$2 # Application ID (GUID), not an ambiguous component name

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_ID" ]; then
    echo "Usage: $0 <trace-id> <application-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search Application Insights for correlated logs
az monitor app-insights query \
    --app "$APP_INSIGHTS_ID" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Activity Log correlation IDs describe management operations and are not the
# same as application trace IDs. Obtain them from the failed ARM operation.
```

## 🛠️ ಸುಧಾರಿತ ಡಿಬಗಿಂಗ್ ಸಾಧನಗಳು

### Azure ಸಂಪನ್ಮೂಲ ಗ್ರಾಫ್ ಪ್ರಶ್ನೆಗಳು
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ನೆಟ್‌ವರ್ಕ್ ಡಿಬಗಿಂಗ್
```bash
# Test connectivity between services
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

# Usage
# Source must be a supported Network Watcher source, e.g. a configured VM ID.
test_connectivity "/subscriptions/.../providers/Microsoft.Compute/virtualMachines/myvm" "myapp-api.azurewebsites.net" 443
```

### ಕಂಟೈನರ್ ಡಿಬಗಿಂಗ್
```bash
# Debug container app issues
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningStatus:runningStatus}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ಡಿಬಗಿಂಗ್
```bash
# Debug database connectivity
debug_database() {
    local db_server=$1
    local resource_group=$2
    
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

### ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆಯ ಮಾನಿಟರಿಂಗ್
```bash
# SDK settings are language-specific. For Python OpenTelemetry role naming,
# set before configuring the Azure Monitor distro:
export OTEL_SERVICE_NAME=myapp-debug

# Custom performance monitoring
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        # Capture status and duration from the SAME bounded request.
        measurement=$(curl --max-time 10 -o /dev/null -s -w "%{http_code},%{time_total}" "$endpoint") || return 1
        status_code=${measurement%,*}
        response_time=${measurement#*,}
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### ಸಂಪನ್ಮೂಲ ಉಪಯೋಗ ವಿಶ್ಲೇಷಣೆ
```bash
# Monitor resource usage
monitor_resources() {
    local plan_id=$1 # Full Microsoft.Web/serverfarms resource ID
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource "$plan_id" \
        --metrics "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource "$plan_id" \
        --metrics "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 ಪರೀಕ್ಷೆ ಮತ್ತು ಪರಿಶೀಲನೆ

### ಏಕೀಕರಣ ಪರೀಕ್ಷೆ ಡಿಬಗಿಂಗ್
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG='app:*'
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl // .services.web.ingresUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl // .services.api.ingresUrl')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl --max-time 10 -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# Run tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run custom integration tests
npm run test:integration
```

### ಲೋಡ್ ಪರೀಕ್ಷೆ ಡಿಬಗಿಂಗ್
```bash
# Simple load test to identify performance bottlenecks
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Using Apache Bench (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extract key metrics
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Check for failures
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ಮೂಲಸೌಕರ್ಯ ಡಿಬಗಿಂಗ್

### Bicep ಟೆಂಪ್ಲೇಟ್ ಡಿಬಗಿಂಗ್
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # From the initialized project: azd resolves its parameter substitutions
    # and deployment scope. Review hooks before provisioning preview.
    azd provision --preview
}

# Debug template deployment
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
# Analyze resource states for inconsistencies
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources with their states
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Generic list responses often omit properties/provisioningState.
    # Null is unknown, not failure; inspect the service-specific show command
    # and deployment operations for the affected resource.
    az deployment group list --resource-group "$resource_group" \
        --query "[].{name:name,state:properties.provisioningState}" -o table
}
```

## 🔒 ಭದ್ರತಾ ಡಿಬಗಿಂಗ್

### ಪ್ರಾಮಾಣೀಕರಣ ವಹಿವಾಟು ಡಿಬಗಿಂಗ್
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    # Do not print/decode bearer tokens into logs.
    az account get-access-token --query "{expiresOn:expiresOn,tenant:tenant,subscription:subscription}" -o json
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug Key Vault access
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
# Debug network security groups
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Check security rules
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ಅಪ್ಲಿಕೇಶನ್-ವಿಶೇಷ ಡಿಬಗಿಂಗ್

### ನೋಡ್.js ಅಪ್ಲಿಕೇಶನ್ ಡಿಬಗಿಂಗ್
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        // Do not log authorization headers, bodies, query strings, or client IPs.
        route: req.route?.path || '(unmatched)'
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ಡೇಟಾಬೇಸ್ ಕ್ವೇರಿ ಡಿಬಗಿಂಗ್
```javascript
// database-debug.js - Database debugging utilities
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        // Promise-based query(text, params) demo only; not a drop-in replacement
        // for node-postgres callback/streaming overloads. Avoid query parameters.
        debug('Executing query');
        
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

## 🚨 ತುರ್ತು ಪರಿಸ್ಥಿತಿಗಳಲ್ಲಿ ಡಿಬಗಿಂಗ್ ವಿಧಾನಗಳು

### ಉತ್ಪಾದನಾ ಸಮಸ್ಯೆ ಪ್ರತಿಕ್ರಿಯೆ
```bash
#!/bin/bash
# emergency-debug.sh - Emergency production debugging

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

# Switch to correct environment
azd env select "$ENVIRONMENT"

# Collect critical information
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[] | .ingressUrl // .ingresUrl'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[] | (.ingressUrl // .ingresUrl // empty)'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Use Azure Monitor for error logs
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

echo "=== 4. Resource Status ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState == 'Failed']" > failed-resources.json

if jq -e 'length > 0' failed-resources.json >/dev/null; then
    echo "❌ Failed group deployments found (inspect subscription deployments too)!"
    cat failed-resources.json
else
    echo "No failed group deployment records found; resource health is not established."
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### ಹಿನ್ನಡೆಯ ನಿರ್ವಹಣೆ ವಿಧಾನಗಳು
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback using Git (AZD doesn't have built-in rollback)
    git checkout "$previous_commit"
    azd deploy || return 1
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl // .services.web.ingresUrl') || return 1
    curl --max-time 10 -f "$WEB_URL/health" || { echo "❌ Rollback verification failed"; return 1; }
    
    echo "✅ Rollback completed"
}
```

ಈ ಕೋಡ್-ಮಾತ್ರ ಹಿನ್ನಡೆಯ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ, ಡೇಟಾಬೇಸ್ ಮಿಗ್ರೇಶನ್ಗಳು ಅಥವಾ ರಹಸ್ಯಗಳನ್ನು ಹಿಂಪಡೆಯುವುದಿಲ್ಲ. ಸ್ವಚ್ಛವಾದ ವರ್ಕ್‌ಟ್ರೀ ಬಳಸಿ, ಪ್ರಾರಂಭಿಕ ಕಮಿಟ್ ದಾಖಲಿಸಿ, ನಂತರ ಅದನ್ನು ಮರುಸ್ಥಾಪಿಸಿ; ಆಜ್ಞೆಯು ಈಗಿನ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಆಯ್ದ ಕಮಿಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸುತ್ತದೆ.

## 📊 ಡಿಬಗಿಂಗ್ ಡ್ಯಾಷ್‌ಬೋರ್ಡ್‌ಗಳು

### ಕಸ್ಟಮ್ ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಷ್‌ಬೋರ್ಡ್
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1 # Use the Application ID GUID to avoid name ambiguity
    
    # Query for errors
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query for performance issues
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query for dependency failures
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ಲಾಗ್ ಸಮಗ್ರತೆ
```bash
# Aggregate logs from multiple Azure sources
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1 # Application ID GUID
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '[{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
        echo ']'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 ಸುಧಾರಿತ ಸಂಪನ್ಮೂಲಗಳು

### ಕಸ್ಟಮ್ ಡಿಬಗ್ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
`scripts/debug/` ಡೈರೆಕ್ಟರಿಯನ್ನು ರಚಿಸಿ:
- `health-check.sh` - ಸಮಗ್ರ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ
- `performance-test.sh` - ಸ್ವಯಂಚಾಲಿತ ಕಾರ್ಯಕ್ಷಮತೆ ಪರೀಕ್ಷೆ
- `log-analyzer.py` - ಸುಧಾರಿತ ಲಾಗ್ ಪಾರ್ಸಿಂಗ್ ಮತ್ತು ವಿಶ್ಲೇಷಣೆ
- `resource-validator.sh` - ಮೂಲಸೌಕರ್ಯ ಪರಿಶೀಲನೆ

### ಮಾನಿಟರಿಂಗ್ ಏಕೀಕರಣ
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      set -e
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## ಉತ್ತಮ ಕಾರ್ಯಪ್ರವೃತ್ತಿಗಳು

1. **ಎಲ್ಲಾ ಸಮಯವೂ ಡಿಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ** ಖಾಸಗಿ ಪರಿಸರಗಳಲ್ಲಿ
2. **ಸಮಸ್ಯೆಗಳಿಗೆ ಪುನರಾವೃತ ಪರೀಕ್ಷಾ ಪ್ರಕರಣಗಳನ್ನು ರಚಿಸಿ**
3. **ನಿಮ್ಮ ತಂಡಕ್ಕೆ ಡಿಬಗಿಂಗ್ ಪ್ರಕ್ರಿಯೆಗಳ ದಾಖಲೆ ಮಾಡಿರಿ**
4. **ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿರಲಿ**
5. **ಡಿಬಗ್ ಸಾಧನಗಳನ್ನು ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಬದಲಾವಣೆಗಳಿಗೆ ತಕ್ಕಂತೆ ನವೀಕರಿಸಿಕೊಳ್ಳಿ**
6. **ದಿನಸಿ ಸಂದರ್ಭಗಳಲ್ಲಿ ಡಿಬಗಿಂಗ್ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ**

## ಮುಂದಿನ ಹಂತಗಳು

- [ಸಮರ್ಥನೆ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಅಗತ್ಯಗಳನ್ನು ಯೋಜಿಸಿ
- [SKU ಆಯ್ಕೆ](../chapter-06-pre-deployment/sku-selection.md) - ಯುಕ್ತ ಸೇವಾ ಶ್ರೇಣಿಗಳನ್ನು ಆರಿಸಿಕೊಳ್ಳಿ
- [ಪ್ರಿಫ್ಲೆಟ್ ಪರಿಶೀಲನೆಗಳು](../chapter-06-pre-deployment/preflight-checks.md) - ನಿಯೋಜನೆ ಮುಂಚಿತ ಪರಿಶೀಲನೆ
- [ಚೀಟ್ ಶೀಟ್](../../resources/cheat-sheet.md) - ತ್ವರಿತ ಸಂಗ್ರಹ ಆಜ್ಞೆಗಳು

---

**ಒಂದು ನೆನಪಿಕೆ**: ಉತ್ತಮ ಡಿಬಗಿಂಗ್ ಎಂದರೆ ಸಿಸ್ಟಮ್ಯಾಟಿಕ್, ಸಂಪೂರ್ಣ ಮತ್ತು ಸಹನಶೀಲವಾಗಿರುವುದು. ಇವುಗಳ ಸಾಧನಗಳು ಮತ್ತು ತಂತ್ರಗಳು ನಿಮಗೆ ಸಮಸ್ಯೆಗಳನ್ನು ವೇಗವಾಗಿ ಮತ್ತು ಹೆಚ್ಚು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ವಿಶ್ಲೇಷಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತವೆ.

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](common-issues.md)

- **ಮುಂದಿನ ಪಾಠ**: [ಸಮರ್ಥನೆ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->