# AZD വിന്യാസങ്ങൾക്കായി ഡീബഗ് ഗൈഡ്

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [പുതുങ്ങുന്നവർക്ക് AZD](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - പ്രശ്നപരിഹാരവും ഡീബഗ്ഗിംഗും
- **⬅️ മുൻ**: [സാധാരണ പ്രശ്നങ്ങൾ](common-issues.md)
- **➡️ അടുത്തത്**: [എഐ സ്പെസിഫിക് പ്രശ്നപരിഹാരം](ai-troubleshooting.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 8: പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് പാറ്റേൺസ്](../chapter-08-production/production-ai-practices.md)

## പരിചയം

ഈ സമഗ്ര ഗൈഡ് Azure Developer CLI വിന്യാസങ്ങളുമായി ബന്ധപ്പെട്ട സങ്കീർണ്ണ പ്രശ്നങ്ങൾ നിരീക്ഷിക്കുകയും പരിഹരിക്കുകയും ചെയ്യുന്നതിനുള്ള ഉയർന്ന നിലവാരത്തിലുള്ള ഡീബഗ്ഗിംഗ് തന്ത്രങ്ങൾ, ഉപകരണങ്ങൾ, സാങ്കേതിക വിദ്യകൾ എന്നിവ നൽകുന്നു. സിസ്റ്റമാറ്റിക് പ്രശ്നപരിഹാരം, ലോഗ് വിശകലന തന്ത്രങ്ങൾ, പ്രകടന പ്രതിരൂപീകരണം, ആധികാരിക ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങൾ എന്നിവ ഉപയോഗിച്ച് വിന്യാസവും റൺടൈം പ്രശ്നങ്ങളും ഫലപ്രദമായി പരിഹരിക്കാൻ പഠിക്കൂ.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ, നിങ്ങൾ:
- Azure Developer CLI പ്രശ്നങ്ങൾക്കായി സിസ്റ്റമാറ്റിക് ഡീബഗ്ഗിംഗ് തന്ത്രങ്ങൾ കൈവശമാക്കും
- ഗവേഷണ ലോഗ്ഗിംഗ് കോൺഫിഗറേഷൻയും ലോഗ് വിശകലന തന്ത്രങ്ങളും മനസ്സിലാക്കും
- പ്രകടന പ്രതിരൂപീകരണവും മേലധികൃത നിരീക്ഷണ തന്ത്രങ്ങളും നടപ്പിലാക്കും
- സങ്കീർണ്ണ പ്രശ്ന പരിഹാരത്തിനായി Azure ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങളും സേവനങ്ങളും ഉപയോഗിക്കും
- നെറ്റ്‌വർക്ക് ഡീബഗ്ഗിംഗും സുരക്ഷാ പ്രശ്നപരിഹാരവും പ്രയോഗിക്കും
- പ്രോആക്ടീവ് പ്രശ്ന കണ്ടെത്തലിന് സമഗ്ര നിരീക്ഷണവും അലർട്ടിംഗും കോൺഫിഗർ ചെയ്യും

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയാൽ, നിങ്ങൾ കഴിയും:
- സിസ്റ്റമാറ്റിക് ആയി സങ്കീർണ്ണ വിന്യാസ പ്രശ്നങ്ങൾ TRIAGE രീതി ഉപയോഗിച്ച് ഡീബഗ് ചെയ്യുക
- സമഗ്രമായ ലോഗിംഗ്, ട്രേസിംഗ് വിവരങ്ങൾ കോൺഫിഗർ ചെയ്ത് വിശകലനം ചെയ്യുക
- Azure Monitor, Application Insights, ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങൾ ഫലപ്രദമായി ഉപയോഗിക്കുക
- നെറ്റ്‌വർക്ക് കണക്റ്റിവിറ്റി, ഓഥന്റിക്കേഷൻ, അനുമതി പ്രശ്നങ്ങൾ സ്വയം ഡീബഗ് ചെയ്യുക
- പ്രകടന നിരീക്ഷണവും മെച്ചപ്പെടുത്തലും നടപ്പിലാക്കുക
- പുനരാവർത്തിത പ്രശ്നങ്ങൾക്ക് കസ്റ്റം ഡീബഗ് സ്ക്രിപ്റ്റുകളും ഓട്ടോമേഷൻ സജ്ജമാക്കുക

## ഡീബഗ്ഗിംഗ് രീതി

### TRIAGE സമീപനം
- **T**ime: പ്രശ്നം എപ്പോഴാണ് ആരംഭിച്ചത്?
- **R**eproduce: നിങ്ങൾക്കു അത് സ്ഥിരമായി പുനരാവർത്തിക്കാമോ?
- **I**solate: ഏതു ഘടകം പരാജയപ്പെടുന്നു?
- **A**nalyze: ലോഗുകൾ നമ്മെ എന്ത് പറയും?
- **G**ather: എല്ലാ ബന്ധപ്പെട്ട വിവരങ്ങളും ശേഖരിക്കുക
- **E**scalate: സഹായം തേടേണ്ട സമയം

## ഡീബഗ് മോഡ് സജ്ജമാക്കൽ

> **പരിധി:** ഇതെല്ലാം അനുയോജ്യമായ ഡയഗ്നോസ്റ്റിക് ഉദാഹരണങ്ങളാണ്, മുൻകൂട്ടി നൽകപ്പെട്ട സ്ക്രിപ്റ്റുകളുടെ പാക്കേജ് അല്ല. റിസോഴ്‌സ് നാമങ്ങൾ/ഐഡികൾ മാറ്റണം; ഷെൽ ബ്ലോക്കുകൾക്ക് Bash ഉപയോഗിക്കുക. `--debug` ഔട്ട്‌പുട്ടും പരിതസ്ഥിതിയുടെ മൂല്യങ്ങളും ലഹരിപ്പെടാതെ പരിശോധിക്കുകയും ഷെയർ ചെയ്യുന്നതിന് മുമ്പ് രഹസ്യ വിവരങ്ങൾ മറയ്ക്കുകയും ചെയ്യുക. വിന്യാസം, റോള്ബാക്ക് അല്ലെങ്കിൽ കോൺഫിഗറേഷൻ മാറ്റം നടത്തുന്ന ഉദാഹരണങ്ങൾക്ക് സ്പഷ്ടമായ ഓപ്പറേറ്റർ അംഗീകാരം ആവശ്യമുണ്ട്.

### പരിതസ്ഥിതി മാറ്റികൾ
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### ഡീബഗ് കോൺഫിഗറേഷൻ
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` കളിൽ മനിഷിപാടമുള്ള കീകൾ സംഭരിക്കാം; എന്നാൽ അത് `debug.enabled`, `debug.logLevel`, അല്ലെങ്കിൽ `trace.outputPath` പിന്തുണയ്ക്കുന്ന സജ്ജീകരണങ്ങൾ ആകില്ല. പുറത്തിറക്കുന്ന കമാൻഡിലെ `--debug` ഫ്ലാഗ് ഉപയോഗിക്കുക.

## 📊 ലോഗ് വിശകലന തന്ത്രങ്ങൾ

### ലോഗ് ലെവലുകൾ മനസ്സിലാക്കൽ
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ഘടനയോട് അനുബന്ധിച്ച ലോഗ് വിശകലനം
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

### ലോഗ് ബന്ധിപ്പിക്കൽ
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

## 🛠️ ആധികാരിക ഡീബഗ്ഗിംഗ് ഉപകരണങ്ങൾ

### Azure Resource Graph ചോദികൾ
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### നെറ്റ്‌വർക്ക് ഡീബഗ്ഗിംഗ്
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

### കണ്ടെയ്‌നർ ഡീബഗ്ഗിംഗ്
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

### ഡാറ്റാബേസ് കണക്ഷൻ ഡീബഗ്ഗിംഗ്
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

## 🔬 പ്രകടന ഡീബഗ്ഗിംഗ്

### ആപ്ലിക്കേഷൻ പ്രകടനം നിരീക്ഷണം
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

### റിസോഴ്‌സ് ഉപയോഗ വിശകലനം
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

## 🧪 പരിശോധനയും സ്ഥിരീകരണവും

### ഇന്റഗ്രേഷൻ ടെസ്റ്റ് ഡീബഗ്ഗിംഗ്
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

### ഡീബഗ്ഗിംഗിനായി ലോഡ് ടെസ്റ്റിംഗ്
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

## 🔧 ഇൻഫ്രാസ്ട്രക്ചർ ഡീബഗ്ഗിംഗ്

### ബിസെപ് ടെംപ്ലേറ്റ് ഡീബഗ്ഗിംഗ്
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

### റിസോഴ്‌സ് നില വിശകലനം
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

## 🔒 സുരക്ഷാ ഡീബഗ്ഗിംഗ്

### ഓഥന്റിക്കേഷൻ ഫ്ലോ ഡീബഗ്ഗിംഗ്
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

### നെറ്റ്‌വർക്ക് സുരക്ഷാ ഡീബഗ്ഗിംഗ്
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

## 📱 ആപ്ലിക്കേഷൻ-സ്പെസിഫിക് ഡീബഗ്ഗിംഗ്

### Node.js ആപ്ലിക്കേഷൻ ഡീബഗ്ഗിംഗ്
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

### ഡാറ്റാബേസ് ക്വറി ഡീബഗ്ഗിംഗ്
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

## 🚨 അടിയന്തര ഡീബഗ് നടപടികൾ

### പ്രൊഡക്ഷൻ പ്രശ്ന പ്രതികരണം
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

### റോള്ബാക്ക് നടപടികൾ
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

ഈ കോഡ് മാത്രം റോള്ബാക്ക് ഇൻഫ്രാസ്ട്രക്ചർ, ഡാറ്റാബേസ് മൈഗ്രേഷൻസ്, അല്ലെങ്കിൽ രഹസ്യങ്ങൾ മടങ്ങിയാക്കുന്നില്ല. ശുചിയായ വേർക്‌ട്രി ഉപയോഗിക്കുക, ആരംഭ കമ്മിറ്റ് രേഖപ്പെടുത്തുക, ശേഷം അതിനെ പുനഃസ്ഥാപിക്കുക; കമാൻഡ് നിലവിലുള്ള റിപോസിറ്ററിയിൽ തിരഞ്ഞെടുത്ത കമ്മിറ്റ് പരിശോധിക്കും.

## 📊 ഡീബഗ്ഗിംഗ് ഡാഷ്ബോർഡുകൾ

### കസ്റ്റം നിരീക്ഷണ ഡാഷ്ബോർഡ്
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

### ലോഗ് സമാഹരണം
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

## 🔗 ആധുനിക വിഭവങ്ങൾ

### കസ്റ്റം ഡീബഗ് സ്ക്രിപ്റ്റുകൾ
ഒരു `scripts/debug/` ഡയറക്ടറി സൃഷ്ടിക്കുക:
- `health-check.sh` - സമഗ്രമായ ഹെൽത്ത് ചെക്കുകൾ
- `performance-test.sh` - ഓട്ടോമേറ്റഡ് പ്രകടന പരിശോധന
- `log-analyzer.py` - ആധികാരികമായ ലോഗ് പാഴ്സിംഗ്, വിശകലനം
- `resource-validator.sh` - ഇൻഫ്രാസ്ട്രക്ചർ പരിശോധന

### നിരീക്ഷണ ഇന്റഗ്രേഷൻ
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

## നല്ല പ്രവൃത്തികളുടെ മാർഗ്ഗനിർദ്ദേശങ്ങൾ

1. **പ്രൊഡക്ഷൻ-മല്ലാത്ത പരിതസ്ഥിതികളിൽ ഡീബഗ് ലോഗ്ഗിംഗ് എല്ലായ്പ്പോഴും സജീവമാക്കുക**
2. **പ്രശ്നങ്ങൾക്ക് പുനരാവർത്തിക്കാവുന്ന ടെസ്റ്റ് കേസുകൾ സൃഷ്ടിക്കുക**
3. **ഡീബഗ്ഗിംഗ് നടപടിക്രമങ്ങൾ നിങ്ങളുടെ ടീമിനായി ഡോക്യുമെന്റ് ചെയ്യുക**
4. **ഹെൽത്ത് ചെക്കുകളും നിരീക്ഷണവും സ്വയം ക്രമീകരിക്കുക**
5. **ആപ്ലിക്കേഷൻ മാറ്റങ്ങളോടെ ഡീബഗ് ഉപകരണങ്ങൾ അപ്‌ഡേറ്റ് ചെയ്യുക**
6. **അനിഷ്ട സാഹചര്യങ്ങൾ ഇല്ലാത്തപ്പോൾ ഡീബഗ് നടപടിക്രമങ്ങൾ അഭ്യസിക്കുക**

## തുടര്‍ന്നുള്ള ഘട്ടങ്ങൾ

- [ശേഷി പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ആവശ്യകതകൾ ആസൂത്രണം ചെയ്യുക
- [SKU തിരഞ്ഞെടുപ്പ്](../chapter-06-pre-deployment/sku-selection.md) - അനുയോജ്യമായ സർവീസ് ടിയേഴ്‌സ് തിരഞ്ഞെടുക്കുക
- [പ്രിഫ്ലൈറ്റ് ചെക്കുകൾ](../chapter-06-pre-deployment/preflight-checks.md) - വിന്യാസ മുമ്പത്തെ സ്ഥിരീകരണം
- [ചീറ്റ്ഷീറ്റ്](../../resources/cheat-sheet.md) - വേഗത്തിലുള്ള റഫറൻസ് കമാൻഡുകൾ

---

**ഓർമ്മിക്കുക**: നല്ല ഡീബഗ്ഗിംഗ് സിസ്റ്റമാറ്റിക്,ുള്ളതിനായും സമഗ്രമായതിനും ധൈര്യമുള്ളതിനും ആയിരിക്കണം. ഈ ഉപകരണങ്ങളും സാങ്കേതിക വിദ്യകളും പ്രശ്നങ്ങൾ വേഗത്തിൽ ഫലപ്രദമായി കണ്ടെത്താൻ സഹായിക്കും.

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [സാധാരണ പ്രശ്നങ്ങൾ](common-issues.md)

- **അടുത്ത പാഠം**: [ശേഷി പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->