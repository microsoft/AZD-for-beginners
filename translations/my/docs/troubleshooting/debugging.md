<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-23T22:46:47+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "my"
}
-->
# AZD တင်သွင်းမှုများအတွက် Debugging လမ်းညွှန်

**အခန်းအကြောင်းအရာ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - ပြဿနာရှာဖွေခြင်းနှင့် Debugging
- **⬅️ အရင်**: [ပုံမှန်ပြဿနာများ](common-issues.md)
- **➡️ နောက်တစ်ခု**: [AI အထူးပြဿနာရှာဖွေခြင်း](ai-troubleshooting.md)
- **🚀 နောက်အခန်း**: [အခန်း ၈: ထုတ်လုပ်မှုနှင့် စီးပွားရေးပုံစံများ](../microsoft-foundry/production-ai-practices.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်မှာ Azure Developer CLI တင်သွင်းမှုများနှင့်ပတ်သက်သော ရှုပ်ထွေးသောပြဿနာများကို ရှာဖွေဖြေရှင်းရန်အတွက် အဆင့်မြင့် Debugging နည်းလမ်းများ၊ ကိရိယာများနှင့်နည်းစနစ်များကို ဖော်ပြထားပါတယ်။ ပြဿနာရှာဖွေခြင်းနည်းလမ်းများ၊ လော့ဂ်ခွဲခြမ်းစိတ်ဖြာနည်းလမ်းများ၊ စွမ်းဆောင်ရည်ကို ပရိုဖိုင်းလုပ်ခြင်းနှင့် အဆင့်မြင့် Diagnostic ကိရိယာများကို သင်ယူပြီး တင်သွင်းမှုနှင့် လုပ်ဆောင်မှုဆိုင်ရာပြဿနာများကို ထိရောက်စွာဖြေရှင်းနိုင်ပါမည်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကိုပြီးမြောက်ပါက၊ သင်သည်:
- Azure Developer CLI ပြဿနာများအတွက် စနစ်တကျ Debugging နည်းလမ်းများကို ကျွမ်းကျင်စွာအသုံးပြုနိုင်မည်
- အဆင့်မြင့်လော့ဂ်ဖွဲ့စည်းမှုနှင့် လော့ဂ်ခွဲခြမ်းစိတ်ဖြာနည်းလမ်းများကို နားလည်မည်
- စွမ်းဆောင်ရည်ကို ပရိုဖိုင်းလုပ်ခြင်းနှင့် မော်နီတာလုပ်ခြင်းနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- Azure Diagnostic ကိရိယာများနှင့် ဝန်ဆောင်မှုများကို အသုံးပြု၍ ရှုပ်ထွေးသောပြဿနာများကို ဖြေရှင်းနိုင်မည်
- Network Debugging နှင့် လုံခြုံရေးပြဿနာရှာဖွေခြင်းနည်းလမ်းများကို အသုံးပြုနိုင်မည်
- ပြဿနာများကို ကြိုတင်ရှာဖွေဖော်ထုတ်ရန်အတွက် စုံလင်သော မော်နီတာလုပ်ခြင်းနှင့် အချက်ပေးခြင်းကို ဖွဲ့စည်းနိုင်မည်

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ပြီးမြောက်ပါက၊ သင်သည်:
- TRIAGE နည်းလမ်းကို အသုံးပြု၍ ရှုပ်ထွေးသောတင်သွင်းမှုပြဿနာများကို စနစ်တကျ Debugging လုပ်နိုင်မည်
- စုံလင်သော လော့ဂ်နှင့် Trace အချက်အလက်များကို ဖွဲ့စည်းပြီး ခွဲခြမ်းစိတ်ဖြာနိုင်မည်
- Azure Monitor, Application Insights နှင့် Diagnostic ကိရိယာများကို ထိရောက်စွာအသုံးပြုနိုင်မည်
- Network ချိတ်ဆက်မှု၊ Authentication နှင့် Permission ပြဿနာများကို ကိုယ်တိုင် Debugging လုပ်နိုင်မည်
- စွမ်းဆောင်ရည်ကို မော်နီတာလုပ်ခြင်းနှင့် အဆင့်မြှင့်တင်ခြင်းနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- ထပ်တလဲလဲဖြစ်သောပြဿနာများအတွက် စိတ်ကြိုက် Debugging Scripts နှင့် Automation ဖန်တီးနိုင်မည်

## Debugging နည်းလမ်း

### TRIAGE နည်းလမ်း
- **T**ime: ပြဿနာက ဘယ်အချိန်မှာ စတင်ဖြစ်လာတာလဲ?
- **R**eproduce: ပြဿနာကို အမြဲတမ်း ပြန်လည်ဖြစ်ပေါ်စေနိုင်ပါသလား?
- **I**solate: ဘယ်ကွန်ပိုနင့်က Fail ဖြစ်နေလဲ?
- **A**nalyze: လော့ဂ်တွေက ဘာပြောနေလဲ?
- **G**ather: သက်ဆိုင်တဲ့ အချက်အလက်အားလုံးကို စုဆောင်းပါ
- **E**scalate: အကူအညီတောင်းဖို့ အချိန်ရောက်ပြီလား?

## Debug Mode ဖွင့်ခြင်း

### Environment Variables
```bash
# အကျွမ်းတဝင် အမှားရှာဖွေမှုကို ဖွင့်ပါ
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI အမှားရှာဖွေမှု
export AZURE_CLI_DIAGNOSTICS=true

# သန့်ရှင်းသော output အတွက် telemetry ကို ပိတ်ပါ
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# အပြည့်အဝ debug configuration ကို သတ်မှတ်ပါ။
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# trace logging ကို ဖွင့်ပါ။
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 လော့ဂ်ခွဲခြမ်းစိတ်ဖြာနည်းလမ်းများ

### Log Levels နားလည်ခြင်း
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
# အဆင့်အလိုက် မှတ်တမ်းများကို စစ်ထုတ်ပါ
azd logs --level error --since 1h

# ဝန်ဆောင်မှုအလိုက် စစ်ထုတ်ပါ
azd logs --service api --level debug

# ခွဲခြမ်းစိတ်ဖြာရန် မှတ်တမ်းများကို တင်ပို့ပါ
azd logs --output json > deployment-logs.json

# jq ဖြင့် JSON မှတ်တမ်းများကို ဖော်ထုတ်ပါ
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - ဝန်ဆောင်မှုများအကြား log များကို ဆက်စပ်ပါ

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# ဝန်ဆောင်မှုအားလုံးအတွင်း ရှာဖွေပါ
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure log များကို ရှာဖွေပါ
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ အဆင့်မြင့် Debugging ကိရိယာများ

### Azure Resource Graph Queries
```bash
# တက်ဂ်များဖြင့်အရင်းအမြစ်များကိုရှာဖွေပါ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# မအောင်မြင်သော deployment များကိုရှာပါ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# အရင်းအမြစ်ကျန်းမာရေးကိုစစ်ဆေးပါ
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# ဝန်ဆောင်မှုများအကြား ချိတ်ဆက်မှုကို စမ်းသပ်ပါ
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

# အသုံးပြုမှု
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# ကွန်တိန်နာအက်ပ်ပြဿနာများကို Debug လုပ်ပါ
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

### Database Connection Debugging
```bash
# ဒေတာဘေ့စ်ချိတ်ဆက်မှုကို Debug လုပ်ပါ
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

### Application Performance Monitoring
```bash
# အက်ပလီကေးရှင်းအိုင်ဆိုက် Debugging ကိုဖွင့်ပါ
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

# စိတ်ကြိုက်စွမ်းဆောင်ရည်ကြည့်ရှုခြင်း
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

### Resource Utilization Analysis
```bash
# အရင်းအမြစ်အသုံးပြုမှုကိုကြည့်ရှုပါ
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

## 🧪 စမ်းသပ်ခြင်းနှင့် အတည်ပြုခြင်း

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# အပြစ်ရှာပတ်ဝန်းကျင်ကို သတ်မှတ်ပါ
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ဝန်ဆောင်မှုအဆုံးစွန်များကို ရယူပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ကျန်းမာရေးအဆုံးစွန်များကို စမ်းသပ်ပါ
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

# စမ်းသပ်မှုများကို လုပ်ဆောင်ပါ
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# စိတ်ကြိုက် ပေါင်းစည်းစမ်းသပ်မှုများကို လုပ်ဆောင်ပါ
npm run test:integration
```

### Load Testing for Debugging
```bash
# စွမ်းဆောင်ရည်အခက်အခဲများကိုဖော်ထုတ်ရန်ရိုးရှင်းသော load စမ်းသပ်မှု
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ကိုအသုံးပြုခြင်း (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # အဓိက metrics များကိုထုတ်ယူပါ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # မအောင်မြင်မှုများကိုစစ်ဆေးပါ
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 အခြေခံအဆောက်အအုံ Debugging

### Bicep Template Debugging
```bash
# Bicep template များကို အသေးစိတ် output ဖြင့် အတည်ပြုပါ
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax အတည်ပြုခြင်း
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint အတည်ပြုခြင်း
    az bicep lint --file "$template_file"
    
    # What-if deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Template deployment ကို Debug လုပ်ပါ
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

### Resource State Analysis
```bash
# အရင်းအမြစ်အခြေအနေများကို မတူညီမှုများအတွက် ချဉ်းကပ်ပါ။
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # အရင်းအမြစ်အားလုံးကို ၎င်းတို့၏ အခြေအနေများနှင့်အတူ စာရင်းပြုပါ။
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # မအောင်မြင်သော အရင်းအမြစ်များကို စစ်ဆေးပါ။
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

### Authentication Flow Debugging
```bash
# Azure အတည်ပြုမှုကို အမှားရှာပါ
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT token ကို ဖော်ထုတ်ပါ (jq နှင့် base64 လိုအပ်သည်)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault ဝင်ရောက်မှုကို အမှားရှာပါ
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

### Network Security Debugging
```bash
# နက်ဝက်ကာကွယ်ရေးအုပ်စုများကို အမှားရှာပါ
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # လုံခြုံရေးစည်းမျဉ်းများကို စစ်ဆေးပါ
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 အထူး Application Debugging

### Node.js Application Debugging
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // တောင်းဆိုမှုအသေးစိတ်များကို မှတ်တမ်းတင်ပါ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // တုံ့ပြန်မှုများကို မှတ်တမ်းတင်ရန် res.json ကို အစားထိုးပါ
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
// database-debug.js - ဒေတာဘေ့စ် အမှားရှာဖွေမှု အသုံးအဆောင်များ
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

### Production Issue Response
```bash
#!/bin/bash
# emergency-debug.sh - အရေးပေါ်ထုတ်လုပ်မှုအဆင်မပြေမှုရှာဖွေခြင်း

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

# မှန်ကန်သောပတ်ဝန်းကျင်သို့ပြောင်းပါ
azd env select "$ENVIRONMENT"

# အရေးကြီးသောအချက်အလက်များစုဆောင်းပါ
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

### Rollback Procedures
```bash
# အမြန်ပြန်လည်ပြင်ဆင်ရေး script
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # ပတ်ဝန်းကျင်ကိုပြောင်းရန်
    azd env select "$environment"
    
    # အက်ပလီကေးရှင်းကိုပြန်လည်ပြင်ဆင်ရန်
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # ပြန်လည်ပြင်ဆင်မှုကိုအတည်ပြုရန်
    echo "Verifying rollback..."
    azd show
    
    # အရေးကြီးသော endpoint များကိုစမ်းသပ်ရန်
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboards

### Custom Monitoring Dashboard
```bash
# အက်ဉ်းချုပ်များကို Debugging အတွက် Application Insights queries ဖန်တီးပါ
create_debug_queries() {
    local app_insights_name=$1
    
    # အမှားများအတွက် Query
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # စွမ်းဆောင်ရည်ပြဿနာများအတွက် Query
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # အချင်းချင်းမအောင်မြင်မှုများအတွက် Query
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# အမျိုးမျိုးသောအရင်းအမြစ်များမှ မှတ်တမ်းများကိုစုစည်းပါ
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

## 🔗 အဆင့်မြင့်အရင်းအမြစ်များ

### Custom Debug Scripts
`scripts/debug/` directory ကို ဖန်တီးပြီး:
- `health-check.sh` - Comprehensive health checking
- `performance-test.sh` - Automated performance testing
- `log-analyzer.py` - Advanced log parsing and analysis
- `resource-validator.sh` - Infrastructure validation

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

## အကောင်းဆုံးအလေ့အကျင့်များ

1. **Debug logging ကို အမြဲဖွင့်ထားပါ** production မဟုတ်သော ပတ်ဝန်းကျင်များတွင်
2. **ပြဿနာများအတွက် ပြန်လည်စမ်းသပ်နိုင်သော Test Cases ဖန်တီးပါ**
3. **Debugging လုပ်ငန်းစဉ်များကို သင့်အဖွဲ့အတွက် Documentation လုပ်ပါ**
4. **Health Checks နှင့် Monitoring ကို အလိုအလျောက်လုပ်ဆောင်ပါ**
5. **Debugging ကိရိယာများကို သင့် Application ပြောင်းလဲမှုများနှင့်အတူ Update လုပ်ပါ**
6. **ပြဿနာမရှိသောအချိန်များတွင် Debugging လုပ်ငန်းစဉ်များကို လေ့ကျင့်ပါ**

## နောက်တစ်ဆင့်များ

- [Capacity Planning](../pre-deployment/capacity-planning.md) - အရင်းအမြစ်လိုအပ်ချက်များကို စီမံပါ
- [SKU Selection](../pre-deployment/sku-selection.md) - သင့်ဝန်ဆောင်မှုအဆင့်များကို ရွေးချယ်ပါ
- [Preflight Checks](../pre-deployment/preflight-checks.md) - တင်သွင်းမှုမတိုင်မီ အတည်ပြုခြင်း
- [Cheat Sheet](../../resources/cheat-sheet.md) - အမြန်အသုံးပြုနိုင်သော Commands

---

**သတိပြုပါ**: Debugging က စနစ်တကျ၊ အလေးအနက်ထားပြီး သည်းခံမှုရှိဖို့အရေးကြီးပါတယ်။ ဒီကိရိယာများနှင့်နည်းလမ်းများက သင့်ကို ပြဿနာများကို ပိုမိုမြန်ဆန်ပြီး ထိရောက်စွာ ရှာဖွေဖြေရှင်းနိုင်စေပါမည်။

---

**အခန်းအကြောင်းအရာ**
- **အရင်သင်ခန်းစာ**: [ပုံမှန်ပြဿနာများ](common-issues.md)

- **နောက်သင်ခန်းစာ**: [Capacity Planning](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->