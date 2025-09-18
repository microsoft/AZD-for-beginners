<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d02a4ed24d16a82e651a7d3e8c618e8",
  "translation_date": "2025-09-18T13:23:44+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "my"
}
-->
# AZD တင်သွင်းမှုများအတွက် Debugging လမ်းညွှန်

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - ပြဿနာရှာဖွေခြင်းနှင့် Debugging
- **⬅️ ယခင်အခန်း**: [Common Issues](common-issues.md)
- **➡️ နောက်အခန်း**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 နောက်အခန်း**: [အခန်း ၈: Production & Enterprise Patterns](../ai-foundry/production-ai-practices.md)

## နိဒါန်း

ဒီလမ်းညွှန်မှာ Azure Developer CLI တင်သွင်းမှုများနှင့်ပတ်သက်သော ရှုပ်ထွေးသောပြဿနာများကို ရှာဖွေဖြေရှင်းရန် အဆင့်မြင့် Debugging များ၊ ကိရိယာများနှင့် နည်းလမ်းများကို ဖော်ပြထားပါတယ်။ ပြဿနာရှာဖွေမှုစနစ်များ၊ လော့ဖိုင်ခွဲခြမ်းစိတ်ဖြာမှုနည်းလမ်းများ၊ စွမ်းဆောင်ရည်ကို အကဲဖြတ်ခြင်းနည်းလမ်းများနှင့် အဆင့်မြင့် Diagnostic ကိရိယာများကို သင်ယူပြီး တင်သွင်းမှုနှင့် အလုပ်လည်ပတ်မှုဆိုင်ရာ ပြဿနာများကို ထိရောက်စွာ ဖြေရှင်းနိုင်ပါမည်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်သင်ယူပြီးနောက်၊ သင်သည်:
- Azure Developer CLI ပြဿနာများအတွက် စနစ်တကျ Debugging နည်းလမ်းများကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်မည်
- အဆင့်မြင့် လော့ဖိုင်များကို ပြင်ဆင်ခြင်းနှင့် ခွဲခြမ်းစိတ်ဖြာခြင်းနည်းလမ်းများကို နားလည်မည်
- စွမ်းဆောင်ရည်ကို အကဲဖြတ်ခြင်းနှင့် စောင့်ကြည့်မှုနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- Azure Diagnostic ကိရိယာများနှင့် ဝန်ဆောင်မှုများကို အသုံးပြု၍ ရှုပ်ထွေးသော ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- ကွန်ယက် Debugging နှင့် လုံခြုံရေးပြဿနာရှာဖွေမှုနည်းလမ်းများကို အသုံးပြုနိုင်မည်
- ပြဿနာရှာဖွေမှုနှင့် သတိပေးမှုများကို စနစ်တကျ ပြင်ဆင်နိုင်မည်

## သင်ယူပြီးနောက်ရလဒ်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်သင်ယူပြီးနောက်၊ သင်သည်:
- TRIAGE နည်းလမ်းကို အသုံးပြု၍ ရှုပ်ထွေးသော တင်သွင်းမှုပြဿနာများကို စနစ်တကျ Debugging ပြုလုပ်နိုင်မည်
- လော့ဖိုင်များနှင့် ခြေရာခံမှုအချက်အလက်များကို ပြင်ဆင်ပြီး ခွဲခြမ်းစိတ်ဖြာနိုင်မည်
- Azure Monitor, Application Insights နှင့် Diagnostic ကိရိယာများကို ထိရောက်စွာ အသုံးပြုနိုင်မည်
- ကွန်ယက်ချိတ်ဆက်မှု၊ Authentication နှင့် ခွင့်ပြုချက်ပြဿနာများကို ကိုယ်တိုင် Debugging ပြုလုပ်နိုင်မည်
- စွမ်းဆောင်ရည် စောင့်ကြည့်မှုနှင့် အကောင်းဆုံးအခြေအနေများကို အကောင်အထည်ဖော်နိုင်မည်
- ထပ်တလဲလဲဖြစ်ပေါ်နေသော ပြဿနာများအတွက် စိတ်ကြိုက် Debugging စက်ရုပ်များနှင့် Automation များကို ဖန်တီးနိုင်မည်

## Debugging နည်းလမ်း

### TRIAGE နည်းလမ်း
- **T**ime: ပြဿနာစတင်ဖြစ်ပေါ်ချိန်က ဘယ်အချိန်လဲ?
- **R**eproduce: ပြဿနာကို ထပ်မံဖြစ်ပေါ်အောင် ပြုလုပ်နိုင်ပါသလား?
- **I**solate: ဘယ်ကွန်ပိုနင့်မှာ ပြဿနာရှိနေလဲ?
- **A**nalyze: လော့ဖိုင်တွေက ဘာပြောပြနေသလဲ?
- **G**ather: သက်ဆိုင်ရာ အချက်အလက်အားလုံးကို စုဆောင်းပါ
- **E**scalate: အကူအညီတောင်းဖို့ လိုအပ်တဲ့အချိန်မှာ ဘယ်လိုလုပ်မလဲ?

## Debug Mode ဖွင့်ရန်

### Environment Variables
```bash
# Enable comprehensive debugging
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI debugging
export AZURE_CLI_DIAGNOSTICS=true

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Log ခွဲခြမ်းစိတ်ဖြာမှုနည်းလမ်းများ

### Log Level များကို နားလည်ခြင်း
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Structured Log ခွဲခြမ်းစိတ်ဖြာမှု
```bash
# Filter logs by level
azd logs --level error --since 1h

# Filter by service
azd logs --service api --level debug

# Export logs for analysis
azd logs --output json > deployment-logs.json

# Parse JSON logs with jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search across all services
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Search Azure logs
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ အဆင့်မြင့် Debugging ကိရိယာများ

### Azure Resource Graph Queries
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ကွန်ယက် Debugging
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
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# Debug container app issues
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

### Database ချိတ်ဆက်မှု Debugging
```bash
# Debug database connectivity
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

## 🔬 စွမ်းဆောင်ရည် Debugging

### Application စွမ်းဆောင်ရည် စောင့်ကြည့်မှု
```bash
# Enable Application Insights debugging
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

# Custom performance monitoring
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

### အရင်းအမြစ်အသုံးပြုမှု ခွဲခြမ်းစိတ်ဖြာမှု
```bash
# Monitor resource usage
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

## 🧪 စမ်းသပ်မှုနှင့် အတည်ပြုမှု

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
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

# Run tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run custom integration tests
npm run test:integration
```

### Debugging အတွက် Load Testing
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

## 🔧 အခြေခံဖွဲ့စည်းမှု Debugging

### Bicep Template Debugging
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # What-if deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
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

### အရင်းအမြစ်အခြေအနေ ခွဲခြမ်းစိတ်ဖြာမှု
```bash
# Analyze resource states for inconsistencies
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources with their states
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Check for failed resources
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

## 🔒 လုံခြုံရေး Debugging

### Authentication လမ်းကြောင်း Debugging
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT token (requires jq and base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
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

### ကွန်ယက်လုံခြုံရေး Debugging
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

## 📱 အထူးသတ်မှတ်ထားသော Debugging

### Node.js Application Debugging
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Database Query Debugging
```javascript
// database-debug.js - Database debugging utilities
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

## 🚨 အရေးပေါ် Debugging လုပ်ငန်းစဉ်များ

### Production ပြဿနာတုံ့ပြန်မှု
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

### Rollback လုပ်ငန်းစဉ်များ
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback application
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboard များ

### စိတ်ကြိုက် Monitoring Dashboard
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1
    
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

### Log Aggregation
```bash
# Aggregate logs from multiple sources
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

## 🔗 အဆင့်မြင့် အရင်းအမြစ်များ

### စိတ်ကြိုက် Debug Scripts
`scripts/debug/` directory ထဲတွင် ဖန်တီးပါ:
- `health-check.sh` - ကျန်းမာရေးစစ်ဆေးမှုအပြည့်အစုံ
- `performance-test.sh` - စွမ်းဆောင်ရည်စမ်းသပ်မှု အလိုအလျောက်ပြုလုပ်ခြင်း
- `log-analyzer.py` - အဆင့်မြင့် Log ခွဲခြမ်းစိတ်ဖြာမှု
- `resource-validator.sh` - အခြေခံဖွဲ့စည်းမှု အတည်ပြုမှု

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

## အကောင်းဆုံးအလေ့အထများ

1. **Debug Logging ကို အမြဲဖွင့်ထားပါ** (Non-Production ပတ်ဝန်းကျင်များတွင်သာ)
2. **ပြဿနာများအတွက် ပြန်လည်ဖြစ်ပေါ်စေသော စမ်းသပ်မှုများ ဖန်တီးပါ**
3. **Debugging လုပ်ငန်းစဉ်များကို သင့်အဖွဲ့အတွက် မှတ်တမ်းတင်ထားပါ**
4. **ကျန်းမာရေးစစ်ဆေးမှုများနှင့် စောင့်ကြည့်မှုများကို အလိုအလျောက်ပြုလုပ်ပါ**
5. **Debug Tools များကို သင့်အက်ပ်နှင့်အတူ အမြဲအပ်ဒိတ်လုပ်ပါ**
6. **ပြဿနာမရှိသောအချိန်များတွင် Debugging လုပ်ငန်းစဉ်များကို လေ့ကျင့်ပါ**

## နောက်တစ်ဆင့်

- [Capacity Planning](../pre-deployment/capacity-planning.md) - အရင်းအမြစ်လိုအပ်ချက်များကို စီစဉ်ပါ
- [SKU Selection](../pre-deployment/sku-selection.md) - သင့်တော်သော ဝန်ဆောင်မှုအဆင့်များကို ရွေးချယ်ပါ
- [Preflight Checks](../pre-deployment/preflight-checks.md) - တင်သွင်းမှုမတိုင်မီ အတည်ပြုမှု
- [Cheat Sheet](../../resources/cheat-sheet.md) - အမြန်ရယူနိုင်သော အမိန့်များ

---

**သတိရပါ**: Debugging က စနစ်တကျ၊ ပြည့်စုံမှုနှင့် သည်းခံမှုအပေါ် မူတည်ပါတယ်။ ဒီကိရိယာများနှင့် နည်းလမ်းများက သင့်ကို ပြဿနာများကို ပိုမိုမြန်ဆန်စွာနှင့် ထိရောက်စွာ ဖြေရှင်းနိုင်စေပါမည်။

---

**အခန်းအကြောင်းအရာများ**
- **ယခင်သင်ခန်းစာ**: [Common Issues](common-issues.md)

- **နောက်သင်ခန်းစာ**: [Capacity Planning](../pre-deployment/capacity-planning.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။