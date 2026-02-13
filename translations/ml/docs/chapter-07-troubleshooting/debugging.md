# AZD ഡിപ്ലോയ്മെന്റുകൾക്കുള്ള ഡീബഗിംഗ് ഗൈഡ്

**Chapter Navigation:**
- **📚 Course Home**: [AZD - തുടക്കക്കാർക്കായി](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [സാധാരണ പ്രശ്നങ്ങൾ](common-issues.md)
- **➡️ Next**: [എഐ-സ്പെസിഫിക് പ്രശ്നപരിഹാരം](ai-troubleshooting.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## ആമുഖം

ഈ സമഗ്ര ഗൈഡ് Azure Developer CLI ഡീപ്ലോയ്മെന്റുകളിലെ സങ്കീർണ പ്രശ്നങ്ങൾ диагност് ചെയ്യാനും പരിഹരിക്കാനുമായി എഡ്വാൻസ്ഡ് ഡീബഗിംഗ് തന്ത്രങ്ങൾ, ഉപകരണങ്ങൾ, സാങ്കേതിക വിദ്യകൾ എന്നിവ നൽകുന്നു. സിസ്റ്റമാറ്റിക് ട്രബ്ബിൽഷൂട്ടിംഗ് രീതി, ലോഗ് വിശകലന സാങ്കേതികതകൾ, പ്രകടന പ്രൊഫൈലിംഗ്, ഉയർന്ന നില ഡയഗ്നോസ്റിക് ടൂളുകൾ എന്നിവ പഠിച്ച് ഡീപ്ലോയ്മെന്റ് மற்றும் റൺടൈം പ്രശ്നങ്ങൾ തുടർന്ന് എളുപ്പത്തിൽ പരിഹരിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

By completing this guide, you will:
- Azure Developer CLI പ്രശ്നങ്ങൾക്ക് സിസ്റ്റമാറ്റിക് ഡീബഗിംഗ് മെഥഡോളജികൾ ആസ്വദിക്കുക
- അതിവിശ്വാസകരമായ ലോഗിംഗ് കോൺഫിഗറേഷൻ మరియు ലോഗ് വിശകലന സാങ്കേതികതകൾ വായിക്കുക
- പ്രകടന പ്രൊഫൈലിംഗ് және മോണിറ്ററിംഗ് തന്ത്രങ്ങൾ നടപ്പിലാക്കുക
- സങ്കീർണ പ്രശ്നപരിഹാരത്തിനായി Azure ഡയഗ്നോസ്റ്റിക് ടൂളുകളും സേവനങ്ങളും ഉപയോഗിക്കുക
- നെറ്റ്‌വർക്ക് ഡീബഗിംഗ് மற்றும் സുരക്ഷാ ട്രബിള്ഷൂട്ടിംഗ് സാങ്കേതികതകൾ ഉപയോഗപ്പെടുത്തുക
- പ്രശ്നങ്ങൾ മുൻകൂർ തിരിച്ചറിയാൻ സമഗ്രമായ മോണിറ്ററിംഗ് மற்றும் അലേർട്ടിംഗ് ക്രമീകരിക്കുക

## പഠനഫലങ്ങൾ

Upon completion, you will be able to:
- TRIAGE മെഥഡോളജിയെ പ്രയോജനപ്പെടുത്തി സങ്കീർണ ഡീപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ സിസ്റ്റമാറ്റിക്കായി ഡീബഗ് ചെയ്യാൻ കഴിയും
- സമഗ്രമായ ലോഗിംഗ്, ട്രേസിംഗ് വിവരങ്ങൾ കോൺഫിഗർ ചെയ്യാനും വിശകലനം ചെയ്യാനും കഴിയും
- Azure Monitor, Application Insights, എന്നിവയും ഡയഗ്നോസ്റ്റിക് ടൂളുകളും ഫലപ്രദമായി ഉപയോഗിക്കാം
- നെറ്റ്‌വർക്ക് കണക്ടിവിറ്റി, ഓതന്റിക്കേഷൻ, അവകാശ പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി ഡീബഗ് ചെയ്യാൻ കഴിയും
- പ്രകടന നിരീക്ഷണവും ഒപ്റ്റിമൈസേഷനും നടപ്പിലാക്കുക
- ആവർത്തിക്കുന്ന പ്രശ്നങ്ങൾക്ക് കസ്റ്റം ഡീബഗിംഗ് സ്ക്രിപ്റ്റുകളും ഓട്ടോമേഷൻകളും രൂപികൊക്കുക

## ഡീബഗിംഗ് പ്രവർത്തനരീതി

### The TRIAGE Approach
- **T**ime: പ്രശ്നം എപ്പോൾ ആരംഭിച്ചു?
- **R**eproduce: നിങ്ങൾ അത് സ്ഥിരമായി പുനരാവൃത്തീകരിക്കാൻ കഴിയുന്നുവോ?
- **I**solate: ഏത് ഘടകം പരാജയപ്പെടുന്നു?
- **A**nalyze: ലോഗുകൾ നമ്മെ എന്ത് പറയുന്നു?
- **G**ather: അനുയോജ്യമായ എല്ലാ വിവരങ്ങളും ശേഖരിക്കുക
- **E**scalate: അധിക സഹായം എപ്പോൾ അന്വേഷിക്കണം

## Enabling Debug Mode

### Environment Variables
```bash
# സമഗ്രമായ ഡീബഗിംഗ് സജ്ജമാക്കുക
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI ഡീബഗിംഗ്
export AZURE_CLI_DIAGNOSTICS=true

# കൂടുതൽ ശുദ്ധമായ ഔട്ട്പുട്ടിനായി ടെലിമെട്രി നിഷ്ക്രിയമാക്കുക
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# ഡീബഗ് കോൺഫിഗറേഷൻ ആഗോളമായി സജ്ജീകരിക്കുക
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ട്രേസ് ലോഗിംഗ് സജീവമാക്കുക
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ലോഗ് വിശകലന തന്ത്രങ്ങൾ

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
# Azure Monitor ഉപയോഗിച്ച് ലോഗുകൾ കാണുക (azd monitor വഴി)
azd monitor --logs

# അപ്ലിക്കേഷൻ ലോഗുകൾ റിയൽ-ടൈമിൽ കാണുക
azd monitor --live

# വിശദമായ ലോഗ് വിശകലനത്തിന്, നിങ്ങളുടെ App Service അല്ലെങ്കിൽ Container App-നൊപ്പം Azure CLI ഉപയോഗിക്കുക:
# App Service ലോഗുകൾ
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App ലോഗുകൾ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# വിശകലനത്തിന് Application Insights ലോഗുകൾ എക്സ്‌പോർട്ട് ചെയ്യുക
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ഉപയോഗിച്ച് 다양한 സേവനങ്ങളിലുടനീളം ലോഗുകൾ സമന്വയിപ്പിക്കുക

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights-ൽ ബന്ധമുള്ള ലോഗുകൾ തിരയുക
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure പ്രവർത്തന ലോഗുകൾ തിരയുക
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ഉയർന്ന തലത്തിലുള്ള ഡീബഗിംഗ് ടൂളുകൾ

### Azure Resource Graph ക്വെറികൾ
```bash
# ടാഗുകൾ ഉപയോഗിച്ച് റിസോഴ്‌സുകൾ തിരയുക
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# പരാജയപ്പെട്ട ഡിപ്ലോയ്മെന്റുകൾ കണ്ടെത്തുക
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# റിസോഴ്‌സിന്റെ ആരോഗ്യ നില പരിശോധിക്കുക
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### നെറ്റ്‌വർക്ക് ഡീബഗിംഗ്
```bash
# സേവനങ്ങൾ തമ്മിലുള്ള കണക്റ്റിവിറ്റി പരിശോധിക്കുക
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

# ഉപയോഗം
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### കണ്ടെയ്‌നർ ഡീബഗിംഗ്
```bash
# കണ്ടെയ്നർ ആപ്പ് പ്രശ്നങ്ങൾ ഡീബഗ് ചെയ്യുക
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

### ഡാറ്റാബേസ് കണക്ഷൻ ഡീബഗിംഗ്
```bash
# ഡാറ്റാബേസ് കണക്ടിവിറ്റി ഡീബഗ് ചെയ്യുക
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

## 🔬 പ്രകടന ഡീബഗിംഗ്

### അപ്ലിക്കേഷൻ പ്രകടന നിരീക്ഷണം
```bash
# Application Insights ഡീബഗിംഗ് സജീവമാക്കുക
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

# ഇച്ഛാനുസൃത പ്രകടന നിരീക്ഷണം
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

### റിസോഴ്‌സ് ഉപയോഗ വിശകലനം
```bash
# റിസോഴ്‌സ് ഉപയോഗം നിരീക്ഷിക്കുക
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

## 🧪 പരീക്ഷണങ്ങളും സ്ഥിരീകരണവും

### ഇന്റഗ്രേഷൻ ടെസ്റ്റ് ഡീബഗിംഗ്
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# ഡീബഗ് പരിസ്ഥിതി സജ്ജീകരിക്കുക
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# സേവന എൻഡ്പോയിന്റുകൾ നേടുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ആരോഗ്യ എൻഡ്പോയിന്റുകൾ പരീക്ഷിക്കുക
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

# ടെസ്റ്റുകൾ ഓടിക്കുക
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# കസ്റ്റം ഇന്റഗ്രേഷൻ ടെസ്റ്റുകൾ ഓടിക്കുക
npm run test:integration
```

### ഡീബഗിംഗിന് ലോഡ് ടെസ്റ്റിംഗ്
```bash
# പ്രകടന ബോട്ടിൽനെക്കുകൾ തിരിച്ചറിയുന്നതിനുള്ള ലളിതമായ ലോഡ് ടെസ്റ്റ്
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ഉപയോഗിക്കുക (സ്ഥാപിക്കാൻ: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # പ്രധാന മെട്രിക്കുകൾ എടുക്കുക
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # പരാജയങ്ങൾ പരിശോധിക്കുക
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ഇൻഫ്രാസ്ട്രക്ചർ ഡീബഗിംഗ്

### Bicep ടെമ്പ്ലേറ്റ് ഡീബഗിംഗ്
```bash
# വിശദമായ ഔട്ട്‌പുട്ട് സഹിതം Bicep ടെംപ്ലേറ്റുകൾ സാധൂകരിക്കുക
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # സിന്താക്സ് പരിശോധന
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ലിന്റ് പരിശോധന
    az bicep lint --file "$template_file"
    
    # വോട്ട്ത്-ഇഫ് വിന്യാസം
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ടെംപ്ലേറ്റ് വിന്യാസം ഡീബഗ് ചെയ്യുക
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
# അസംഗതികൾക്കായി റിസോഴ്‌സ് നിലകൾ വിശകലനം ചെയ്യുക
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # അവയുടെ നിലകളോടെ എല്ലാ റിസോഴ്‌സുകളും പട്ടികപ്പെടുത്തുക
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # പരാജയപ്പെട്ട റിസോഴ്‌സുകൾ ഉണ്ടോ എന്ന് പരിശോധിക്കുക
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

## 🔒 സുരക്ഷാ ഡീബഗിംഗ്

### ഓതന്റിക്കേഷൻ ഫ്ലോ ഡീബഗിംഗ്
```bash
# Azure പ്രാമാണീകരണം ഡീബഗ് ചെയ്യുക
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT ടോക്കൺ ഡീകോഡ് ചെയ്യുക (jqയും base64യും ആവശ്യമാണ്)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault പ്രവേശനം ഡീബഗ് ചെയ്യുക
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

### നെറ്റ്‌വർക്ക് സുരക്ഷ ഡീബഗിംഗ്
```bash
# നെറ്റ്‌വർക്ക് സുരക്ഷാ ഗ്രൂപ്പുകൾ ഡീബഗ് ചെയ്യുക
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # സുരക്ഷാ നിയമങ്ങൾ പരിശോധിക്കുക
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ആപ്ലിക്കേഷൻ-സ്പെസിഫിക് ഡീബഗിംഗ്

### Node.js അപ്ലിക്കേഷൻ ഡീബഗിംഗ്
```javascript
// debug-middleware.js - എക്സ്പ്രസ് ഡീബഗിംഗ് മിഡിൽവേർ
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // അഭ്യർത്ഥനയുടെ വിശദാംശങ്ങൾ ലോഗ് ചെയ്യുക
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // പ്രതികരണങ്ങൾ ലോഗ് ചെയ്യുന്നതിനായി res.json ഓവർറൈഡ് ചെയ്യുക
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ഡാറ്റാബേസ് ക്വറി ഡീബഗിംഗ്
```javascript
// database-debug.js - ഡേറ്റാബേസ് ഡീബഗിംഗ് ഉപകരണങ്ങൾ
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

## 🚨 അടിയന്തര ഡീബഗിംഗ് പ്രക്രിയകൾ

### പ്രൊഡക്ഷൻ പ്രശ്നങ്ങൾക്ക് പ്രതികരണം
```bash
#!/bin/bash
# emergency-debug.sh - അടിയന്തര ഉത്പാദന ഡിബഗിംഗ്

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

# ശരിയായ പരിസ്ഥിതിയിലേക്ക് മാറുക
azd env select "$ENVIRONMENT"

# നിർണ്ണായക വിവരങ്ങൾ ശേഖരിക്കുക
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# പിശക് ലോഗുകൾക്കായി Azure Monitor ഉപയോഗിക്കുക
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

### റോള്ബാക്ക് നടപടികൾ
```bash
# ദ്രുത റോള്ബാക്ക് സ്ക്രിപ്റ്റ്
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # പരിസ്ഥിതി മാറ്റുക
    azd env select "$environment"
    
    # Git ഉപയോഗിച്ച് റോള്ബാക്ക് (AZD-യ്ക്ക് സ്ഥാപിത റോള്ബാക്ക് ഇല്ല)
    git checkout "$previous_commit"
    azd deploy
    
    # റോള്ബാക്ക് പരിശോധിക്കുക
    echo "Verifying rollback..."
    azd show
    
    # പ്രധാന എൻഡ്‌പോയിന്റുകൾ പരീക്ഷിക്കുക
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ഡീബഗിംഗ് ഡാഷ്ബോർഡുകൾ

### കസ്റ്റം മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ്
```bash
# ഡീബഗിംഗിനായി Application Insights ക്വെറികൾ സൃഷ്ടിക്കുക
create_debug_queries() {
    local app_insights_name=$1
    
    # പിശകുകൾക്കുള്ള ക്വെറി
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # പ്രവർത്തന പ്രശ്നങ്ങൾക്കുള്ള ക്വെറി
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ഡിപ്പെൻഡൻസി പരാജയങ്ങൾക്കുള്ള ക്വെറി
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ലോഗ് സമാഹരണം
```bash
# വിവിധ Azure സ്രോതസ്സുകളിൽ നിന്ന് ലോഗുകൾ സമാഹരിക്കുക
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

## 🔗 ഉയർന്ന തലത്തിലുള്ള വിഭവങ്ങൾ

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - സമഗ്ര ആരോഗ്യ പരിശോധന
- `performance-test.sh` - സ്വയമേറ്റേഡ് പ്രകടന പരീക്ഷണം
- `log-analyzer.py` - ഉയർന്ന തലത്തിലുള്ള ലോഗ് പാഴ്സിംഗ് மற்றும் വിശകലനം
- `resource-validator.sh` - ഇൻഫ്രാസ്ട്രക്ചർ സ്ഥിരീകരണം

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

## ഉത്തമ രീതികൾ

1. **എപ്പോഴും ഡീബഗ് ലോഗിംഗ് സജീവമാക്കുക** ഉൽപ്പാദനമല്ലാത്ത പരിസ്ഥിതികളിൽ
2. **പുനഃസൃഷ്ടിക്കാവുന്ന ടെസ്റ്റ് കേസുകൾ സൃഷ്ടിക്കുക** പ്രശ്നങ്ങൾക്കായി
3. **ഡീബഗിംഗ് നടപടികൾ രേഖപ്പെടുത്തുക** നിങ്ങളുടെ ടീമിനായി
4. **ആരോഗ്യ പരിശോധനകൾ ഓട്ടോമേറ്റുചെയ്യുക** എന്നും മോണിറ്ററിംഗ് നടപ്പിലാക്കുക
5. **ഡീബഗ് ടൂളുകൾ അപ്‌ഡേറ്റ് ചെയ്ത നിലയിൽ വയ്ക്കുക** നിങ്ങളുടെ ആപ്ലിക്കേഷൻ മാറ്റങ്ങളോടൊപ്പം
6. **ഡീബഗിംഗ് നടപടികൾ അഭ്യാസമാക്കുക** പ്രശ്നമില്ലാത്ത സമയങ്ങളിൽ

## അടുത്ത ഘട്ടങ്ങൾ

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ആവശ്യകതകൾ ആസൂത്രണം ചെയ്യുക
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - യോഗ്യമായ സേവന തലങ്ങൾ തിരഞ്ഞെടുക്കുക
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - പ്രീ-ഡിപ്പ്ലോയ്മെന്റ് സ്ഥിരീകരണം
- [Cheat Sheet](../../resources/cheat-sheet.md) - ത്വരിത റഫറൻസ് കമാൻഡുകൾ

---

**ഓർമിക്കുക**: നല്ല ഡീബഗിംഗ് സിസ്റ്റമാറ്റിക്, വിശദമായതും ക്ഷമയുള്ളതും ആകുകയാണ്. ഈ ഉപകരണങ്ങളും സാങ്കേതികതകളും നിങ്ങൾക്ക് പ്രശ്നങ്ങൾ വേഗത്തിൽ ഒപ്പം ഫലപ്രദമായി പരിശോധിക്കാൻ സഹായിക്കും.

---

**നാവിഗേഷൻ**
- **Previous Lesson**: [സാധാരണ പ്രശ്നങ്ങൾ](common-issues.md)

- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഒഴിവാക്കൽ:
ഈ രേഖ AI പരിഭാഷാ സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെട്ടതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്ക് ശ്രമിക്കുന്നു; എങ്കിലും ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ അപൂർണതകൾ ഉണ്ടാകാവുന്നതാണ്. അതിന്റെ മാതൃഭാഷയിൽ ഉള്ള മൂല രേഖയാണ് അധികാരം ഉള്ള ഉറവിടം എന്നറിയുക. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യപരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷയുടെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->