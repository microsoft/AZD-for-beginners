# AZD ဖြန့်ချိမှုများအတွက် ချဲ့ထွင်စစ်ဆေးခြင်း လမ်းညွှန်

**အခန်းလမ်းညွှန်မှု:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - ပြဿနာဖြေရှင်းခြင်းနှင့် ချဲ့ထွင်စစ်ဆေးခြင်း
- **⬅️ ယခင်အခန်း**: [ပုံမှန်ပြဿနာများ](common-issues.md)
- **➡️ နောက်တစ်ခု**: [AI-အထူးပြဿနာဖြေရှင်းခြင်း](ai-troubleshooting.md)
- **🚀 နောက်လမ်းအခန်း**: [အခန်း ၈: ထုတ်လုပ်မှုနှင့် စီးပွားရေး ပုံစံများ](../chapter-08-production/production-ai-practices.md)

## နိဒါန်း

ဤကျယ်ပြန့်သောလမ်းညွှန်စာအုပ်သည် Azure Developer CLI ဖြန့်ချိမှုများအား ပြဿနာရှာဖွေရေးနှင့် ဖြေရှင်းခြင်းအတွက် တိုးတက်သော ချဲ့ထွင်စစ်ဆေးနည်းများ၊ ကိရိယာများနှင့် နည်းစနစ်များကို ပေးသည်။ စနစ်တကျ ပြဿနာရှာဖွေမှုနည်းလမ်းများ၊ မှတ်တမ်းဖတ်ခြင်းနည်းပညာများ၊ စွမ်းဆောင်ရည် တိုင်းတာခြင်းနှင့် တိုးတက်သော စိစစ်မှုကိရိယာများကို သင်ယူကာ ဖြန့်ချိမှုနှင့် အလုပ်လုပ်ချိန် ပြဿနာများကို ထိရောက်စွာ ဖြေရှင်းနိုင်မည်ဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤလမ်းညွှန်အား ပြီးမြောက်စွာ အတတ်ပညာရယူခြင်းဖြင့်:
- Azure Developer CLI ပြဿနာများအတွက် စနစ်တကျ ချဲ့ထွင်စစ်ဆေးနည်းများ ကျွမ်းကျင်ပါမည်
- တိုးတက်သော မှတ်တမ်းဖတ်ခြင်းဖွဲ့စည်းမှုနှင့် မှတ်တမ်းခွဲခြမ်းစိတ်ဖြာနည်းများကို နားလည်ပါမည်
- စွမ်းဆောင်ရည်တိုးတက်မှု ချဲ့ထွင်ခြင်းနှင့် စောင့်ကြည့်မှုနည်းလမ်းများကို လက်တွေ့ကျင့်သုံးပါမည်
- Azure ၏ စိစစ်ကိရိယာများနှင့် ဝန်ဆောင်မှုများကို ပြဿနာရှာဖွေဖို့ အသုံးပြုနိုင်ပါမည်
- ကွန်ရက်ချဲ့ထွင်စစ်ဆေးခြင်းနှင့် လုံခြုံရေး ပြဿနာဖြေရှင်းနည်းများကို အသုံးပြုပါမည်
- ရှေ့ကြိုပြဿနာရှာဖွေရေးအတွက် စုံလင်သော စောင့်ကြည့်မှုနှင့် အချက်ပေးမှုများ ဖန်တီးပါမည်

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

လုပ်ဆောင်ပြီးနောက် သင်သည်:
- အဆင့်မြင့်ဖြန့်ချိမှု ပြဿနာများကို TRIAGE နည်းလမ်းဖြင့် စနစ်တကျ ချဲ့ထွင်စစ်ဆေးနိုင်ပါမည်
- စုံလင်သော မှတ်တမ်းခြုံမှတ်ချက်များနှင့် စစ်ဆေးမှုအချက်အလက်များကို ဖန်တီးခြင်းနှင့် စိစစ်နိုင်ပါမည်
- Azure Monitor, Application Insights နှင့် စိစစ်မှုကိရိယာများကို ထိရောက်စွာ အသုံးပြုနိုင်ပါသည်
- ကွန်ရက်ချိတ်ဆက်မှု၊ အတည်ပြုမှုနှင့် ခွင့်ပြုချက် ပြဿနာများကို လွတ်လပ်စွာ ချဲ့ထွင်စစ်ဆေးနိုင်ပါမည်
- စွမ်းဆောင်ရည် စောင့်ကြည့်ခြင်းနှင့် စိတ်ပိုင်းဆိုင်ရာ တိုးတက်မှုများ ပြုလုပ်နိုင်ပါသည်
- ပြဿနာများ မကြာခဏ ဖြစ်ပေါ်သောအခါက ထပ်မံအသုံးပြုရန် စိတ်ကြိုက်ချဲ့ထွင်စစ်ဆေးရေး script များနှင့် အလိုအလျောက်စနစ်များ ဖန်တီးနိုင်သည်

## ချဲ့ထွင်စစ်ဆေးခြင်း နည်းစနစ်

### TRIAGE နည်းလမ်း
- **T**ime: ပြဿနာသည် ဘယ်အချိန်မှာ စတင်ခဲ့ပါသလဲ?
- **R**eproduce: သင်တပြိုင်နက်တွင် ပြန်ထွက်ပေါ်စေနိုင်ပါသလား?
- **I**solate: မည်သည့်ပစ္စည်းက မအောင်မြင်နေလဲ?
- **A**nalyze: မှတ်တမ်းများက ဘာများကို ပြောပြနေသလဲ?
- **G**ather: ဆက်စပ်သည့် အချက်အလက်များအားလုံး စုဆောင်းပါ
- **E**scalate: အပိုအသုံးပြုသော အကူအညီ ရှာဖွေရမည့် အချိန်

## ချဲ့ထွင်စစ်ဆေးမှု မုဒ်ဖွင့်ခြင်း

> **Scope:** ၎င်းက စစ်ဆေးရေး ဥပမာများဖြစ်ပြီး၊ မရရှိသော script အသုံးအဆောင် မဟုတ်ပါ။ အရင်းအမြစ်အမည်များ/IDs များအား ပြောင်းလဲအသုံးပြုပါက၊ shell block များအတွက် Bash ကို သုံးပါ။ `--debug` ထွက်ရှိမှုနှင့် ပတ်ဝန်းကျင် တန်ဖိုးများတွင် လျှို့ဝှက်ချက်များပါဝင်နိုင်၊ မျှဝေရခြင်းမပြုမီ စစ်ဆေး/ဖယ်ရှားရန် လိုအပ်ပါသည်။ ဖြန့်ချိခြင်း၊ ပြန်လည်ဆောင်ရွက်ခြင်း သို့မဟုတ် ဖော်ပြချက်ပြောင်းလဲခြင်း ပြုလုပ်သော ဥပမာများတွင် ကိရိယာပိုင်ရှင်၏ ခွင့်ပြုချက် လိုအပ်ပါသည်။

### ပတ်ဝန်းကျင်အရည်အသွေးများ
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### ချဲ့ထွင်စစ်ဆေးမှု ဖော်ပြချက်
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` သည် သီးသန့်သော သော့များ သိမ်းဆည်းနိုင်ပေမယ့် `debug.enabled`, `debug.logLevel` သို့မဟုတ် `trace.outputPath` ၏ ထောက်ခံထားသော ဆက်တင်များ မဟုတ်ပါ။ ထုတ်လွှင့်ထားသော command ၏ `--debug` flag ကိုသာ အသုံးပြုပါ။

## 📊 မှတ်တမ်းခွဲခြမ်းစိတ်ဖြာနည်းများ

### မှတ်တမ်းအဆင့်များနားလည်ခြင်း
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ဖွဲ့စည်းတည်ဆောက်ထားသော မှတ်တမ်းခွဲခြမ်းစိတ်ဖြာခြင်း
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

### မှတ်တမ်းချိတ်ဆက်မှု
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

## 🛠️ တိုးတက်သော ချဲ့ထွင်စစ်ဆေးမှု ကိရိယာများ

### Azure Resource Graph မေးခွန်းများ
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ကွန်ရက် ချဲ့ထွင်စစ်ဆေးခြင်း
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

### ကွန်တိနာ ချဲ့ထွင်စစ်ဆေးခြင်း
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

### ဒေတာဘေ့စ် ချိတ်ဆက်ခွင့် စစ်ဆေးခြင်း
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

## 🔬 စွမ်းဆောင်ရည် ချဲ့ထွင်စစ်ဆေးခြင်း

### အပလီကေးရှင်း မြန်နှုန်း စောင့်ကြည့်ခြင်း
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

### အရင်းအမြစ် အသုံးပြုမှု ခွဲခြမ်းစိတ်ဖြာခြင်း
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

## 🧪 စမ်းသပ်မှုနှင့် အတည်ပြုခြင်း

### ပေါင်းစပ်စမ်းသပ်မှု ချဲ့ထွင်စစ်ဆေးခြင်း
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

### စွမ်းဆောင်ရည် စမ်းသပ်မှု ချဲ့ထွင်စစ်ဆေးခြင်း
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

## 🔧 အဆောက်အအုံ ချဲ့ထွင်စစ်ဆေးခြင်း

### Bicep ပုံစံချဲ့ထွင် စစ်ဆေးခြင်း
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

### အရင်းအမြစ် အခြေအနေ ခွဲခြမ်းစိတ်ဖြာခြင်း
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

## 🔒 လုံခြုံရေး ချဲ့ထွင်စစ်ဆေးခြင်း

### အတည်ပြုမှု လွှဲပြောင်းမှု ချဲ့ထွင်စစ်ဆေးခြင်း
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

### ကွန်ရက် လုံခြုံရေး ချဲ့ထွင်စစ်ဆေးခြင်း
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

## 📱 အပလီကေးရှင်း အထူးခွင့် ချဲ့ထွင်စစ်ဆေးခြင်း

### Node.js အပလီကေးရှင်း ချဲ့ထွင်စစ်ဆေးခြင်း
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

### ဒေတာဘေ့စ် မေးခွန်း ချဲ့ထွင်စစ်ဆေးခြင်း
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

## 🚨 အရေးပေါ် ချဲ့ထွင်စစ်ဆေးမှု လုပ်ထုံးလုပ်နည်းများ

### ထုတ်လုပ်မှု ပြဿနာ တုံ့ပြန်မှု
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

### ပြန်လည်ဆွဲတင်ခြင်း လုပ်ထုံးလုပ်နည်းများ
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

ဤ code-only ပြန်လည်ဆွဲတင်ခြင်းသည် အဆောက်အအုံ၊ ဒေတာဘေ့စ် ပြောင်းလဲမှုများ သို့မဟုတ် လျှို့ဝှက်ချက်များကို မပြန်ကြစေပါ။ သန့်ရှင်းသော worktree ကို သုံး၍ စတင်ကွန်မစ်ကို မှတ်တမ်းတင်ပြီး နောက်မှ ပြန်လည်ထုတ်ယူပါ၊ command သည် လက်ရှိ ရေဇာရီတွင် ရွေးချယ်ထားသော commit ကို ရှာထုတ်ပေးသည်။

## 📊 ချဲ့ထွင်စစ်ဆေးမှု ဒက်ရှ်ဘုတ်များ

### စိတ်ကြိုက် စောင့်ကြည့်မှု ဒက်ရှ်ဘုတ်
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

### မှတ်တမ်း စုစည်းခြင်း
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

## 🔗 တိုးတက်သော အရင်းအမြစ်များ

### စိတ်ကြိုက် ချဲ့ထွင်စစ်ဆေးရေး Scripts
`scripts/debug/` ဖိုင်ဆော့ဖျ်ဒီးရဲအတွင်း ဖန်တီးပါ:
- `health-check.sh` - ကျန်းမာရေးစစ်ဆေးမှု စုံလင်မှု
- `performance-test.sh` - အလိုအလျောက် စွမ်းဆောင်ရည် စမ်းသပ်မှု
- `log-analyzer.py` - တိုးတက်သော မှတ်တမ်းခွဲခြမ်းစိတ်ဖြာခြင်း
- `resource-validator.sh` - အဆောက်အအုံအတည်ပြုမှု

### စောင့်ကြည့်မှု ပေါင်းစပ်မှု
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

## အကောင်းဆုံး လေ့လာမှုများ

1. **မထုတ်လုပ်သည့် ပတ်ဝန်းကျင်များတွင် အမြဲ debug မှတ်တမ်းဖွင့်ပါ**
2. **ပြဿနာများအတွက် ထပ်မံဖော်ဆောင်နိုင်သော စမ်းသပ်မှုများ ဖန်တီးပါ**
3. **သင်၏ အဖွဲ့အတွက် ချဲ့ထွင်စစ်ဆေးမှု လုပ်ထုံးလုပ်နည်းများ မှတ်တမ်းတင်ပါ**
4. **ကျန်းမာရေး စစ်ဆေးမှုများနှင့် စောင့်ကြည့်မှုများကို အလိုအလျောက် ပြုလုပ်ပါ**
5. **debug ကိရိယာများကို သင့် အပလီကေးရှင်း ပြင်ဆင်ပြောင်းလဲမှုများနှင့်အတူ အပ်ဒိတ်တင်ထားပါ**
6. **မဖြစ်ပွားသည့်အချိန်များတွင် ချဲ့ထွင်စစ်ဆေးရယူမှု လေ့ကျင့်ပါ**

## နောက်တစ်ဆင့်

- [စွမ်းရည် ကြိုတင်စီမံခြင်း](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် လိုအပ်ချက်များ စီမံခြင်း
- [SKU ရွေးချယ်ခြင်း](../chapter-06-pre-deployment/sku-selection.md) - သင့်တော်သော ဝန်ဆောင်မှု အဆင့်များ ရွေးချယ်ခြင်း
- [ကူးပြောင်း စစ်ဆေးမှုများ](../chapter-06-pre-deployment/preflight-checks.md) - ဖြန့်ချိခြင်းမပြုမီ အတည်ပြုမှု
- [အစာရှောင် စာရွက်](../../resources/cheat-sheet.md) - အမြန် ရည်ညွှန်းရန် command များ

---

**မှတ်ချက်**: ကောင်းမွန်သော ချဲ့ထွင်စစ်ဆေးမှုသည် စနစ်တကျ၊ သေချာမှုနှင့် သည်းခံမှုရှိခြင်းအကြောင်းဖြစ်သည်။ ဤကိရိယာများနှင့် နည်းစနစ်များက သင်၏ ပြဿနာများကို ပိုမိုလျင်မြန်ပြီး ထိရောက်စွာ အကြံဉာဏ်ပေးနိုင်မည်ဖြစ်သည်။

---

**လမ်းကြောင်း**
- **ယခင် သင်ခန်းစာ**: [ပုံမှန်ပြဿနာများ](common-issues.md)

- **နောက်တစ်ခု သင်ခန်းစာ**: [စွမ်းရည် ကြိုတင်စီမံခြင်း](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->