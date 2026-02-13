# AZD ဖြန့်ချိမှုများအတွက် ပြဿနာရှာဖွေခြင်း လမ်းညွှန်

**အခန်း လမ်းကြောင်း:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD စတင်လေ့လာသူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၇ - ပြဿနာဖြေရှင်းခြင်းနှင့် အမှားရှာဖွေခြင်း
- **⬅️ ယခင် အခန်း**: [ပုံမှန် ပြဿနာများ](common-issues.md)
- **➡️ နောက်တစ်ခု**: [AI-သီးသန့် ပြဿနာဖြေရှင်းခြင်း](ai-troubleshooting.md)
- **🚀 နောက်ထပ် အခန်း**: [အခန်း ၈: ထုတ်လုပ်မှုနှင့် စီးပွားရေးအဖွဲ့ ပုံစံများ](../chapter-08-production/production-ai-practices.md)

## နိဒါန်း

ဒီလမ်းညွှန် လက်စွဲစာအုပ်သည် Azure Developer CLI ဖြင့် ဖြန့်ချိမှုများအတွင်း ဖြစ်ပေါ်နိုင်သည့် ဆ复杂ပြဿနာများကို ရှာဖွေပြီး ဖြေရှင်းနိုင်ရန် အဆင့်မြင့် debugging များ၊ ကိရိယာများနှင့် နည်းစနစ်များကို ပံ့ပိုးပေးပါသည်။ စနစ်တကျ ပြဿနာရှာဖွေမှု နည်းဗျူဟာများ၊ မှတ်တမ်း (log) ခွဲခြမ်းစိတ်ဖြာနည်းများ၊ စွမ်းဆောင်ရည် ထိန်းလေ့လာမှုများနှင့် အဆင့်မြင့် အခြေခံ ရှာဖွေရေးကိရိယာများကို သင်ယူပြီး ဖြန့်ချိမှုနှင့် runtime ပြဿနာများကို ထိရောက်စွာ ဖြေရှင်းနိုင်မည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်စွာ လေ့လာပြီးပါက သင်သည်:
- Azure Developer CLI ပြဿနာများအတွက် စနစ်တကျ အမှားရှာဖွေခြင်း နည်းဗျူဟာများကို ကျွမ်းကျင်စွာ အသုံးချနိုင်မည်
- အဆင့်မြင့် logging ဖွဲ့စည်းချက်များနှင့် မှတ်တမ်း ခွဲခြမ်းရေးနည်းများကို နားလည်မည်
- စွမ်းဆောင်ရည် ပရိုဖိုင်လုပ်ခြင်းနှင့် မော်နီတာစနစ်များကို တပ်ဆင်နိုင်မည်
- Azure diagnostic ကိရိယာများနှင့် ဝန်ဆောင်မှုများကို အကျိုးရှိရှိ အသုံးချနိုင်မည်
- ကွန်ယက် debugging နှင့် လုံခြုံရေး ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်မည်
- ကြိုတင် သိရှိမှုပြဿနာ ဖော်ထုတ်ရေးအတွက် တိကျစွာ monitoring နှင့် alerting ဆက်တင်များကို ပြုလုပ်နိုင်မည်

## သင်ယူပြီးရရှိမည့် အကျိုးရလဒ်များ

ပြီးမြောက်လိုက်သည်နှင့် သင်သည်:
- ဇယားနည်း TRIAGE ကို အသုံးပြု၍ စနစ်တကျ အဆင့်ဆင့် ပြဿနာရှာဖွေနိုင်မည်
- စုံလင်သော logging နှင့် tracing အချက်အလက်များကို ဖွဲ့စည်း၊ ခွဲခြမ်းစစ်ဆေးနိုင်မည်
- Azure Monitor, Application Insights နှင့် diagnostic ကိရိယာများကို ထိရောက်စွာ အသုံးချနိုင်မည်
- ကွန်ယက် ချိတ်ဆက်မှု, authentication နှင့် ခွင့်ပြုချက် ပြဿနာများကို ကိုယ်တိုင် ပြန်လည်ရှာဖွေ ဖြေရှင်းနိုင်မည်
- စွမ်းဆောင်ရည် မော်နီတာလုပ်ငန်းစဉ်များနှင့် မြှင့်တင်ရေးနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- ပြန်ကျူးရှရာ ပြဿနာများအတွက် စိတ်ကြိုက် debugging script များနှင့် အလိုအလျောက်လုပ်ဆောင်ခြင်းကို ဖန်တီးနိုင်မည်

## အမှားရှာဖွေခြင်း နည်းဗျူဟာ

### TRIAGE နည်းလမ်း
- **T**ime: ပြဿနာ ဘယ်အချိန်မှာ စတင်ခဲ့ပါသလဲ?
- **R**eproduce: အဲဒါကို မကြာခဏ ပြန်လည်ဖန်တီးနိုင်ပါသလား?
- **I**solate: မည်သူ့ component ဆဲလ်က ပျက်ယွင်းနေပါသလဲ?
- **A**nalyze: မှတ်တမ်းများက ဘာပြောပြနေပါသလဲ?
- **G**ather: သက်ဆိုင်ရာ အချက်အလက်များအားလုံး စုဆောင်းပါ
- **E**scalate: ဘယ်အခါမှာ နောက်ထပ် အကူအညီတောင်းရမလဲ

## Debug Mode ကို ဖွင့်ခြင်း

### ပတ်ဝန်းကျင် အပြောင်းအလဲများ
```bash
# အပြည့်အစုံ အမှားရှာဖွေရေးကို ဖွင့်ပါ
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI အမှားရှာဖွေရေး
export AZURE_CLI_DIAGNOSTICS=true

# ထုတ်လွှတ်ချက် ပိုသန့်ရှင်းအောင် တယ်လီမက်ထရီကို ပိတ်ပါ
export AZD_DISABLE_TELEMETRY=true
```

### Debug ဖွဲ့စည်းထားမှု
```bash
# အမှားရှာရေး ဆက်တင်ကို ကမ္ဘာလုံးဆိုင်ရာအနေဖြင့် သတ်မှတ်ပါ
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# အကြောင်းလမ်းကြောင်း မှတ်တမ်းတင်မှုကို ဖွင့်ပါ
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 မှတ်တမ်း ခွဲခြမ်းစိစစ်နည်းများ

### Log အဆင့်များကို နားလည်ခြင်း
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ဖွဲ့စည်းထားသော မှတ်တမ်း (Structured Log) ခွဲခြမ်းခြင်း
```bash
# Azure Monitor ဖြင့် မှတ်တမ်းများကို ကြည့်ရှုပါ (azd monitor အသုံးပြု၍)
azd monitor --logs

# အက်ပလီကေးရှင်းမှတ်တမ်းများကို တိုက်ရိုက် အချိန်တွင် ကြည့်ရှုပါ
azd monitor --live

# အသေးစိတ် မှတ်တမ်း ခွဲခြမ်းစိစစ်ရန် သင့် App Service သို့မဟုတ် Container App နှင့်အတူ Azure CLI ကို အသုံးပြုပါ:
# App Service မှတ်တမ်းများ
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App မှတ်တမ်းများ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ခွဲခြမ်းစိစစ်ရန် Application Insights မှတ်တမ်းများကို တင်ပို့ပါ
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ကို အသုံးပြု၍ ဝန်ဆောင်မှုများအနှံ့ရှိ လော့ဂ်များကို ဆက်စပ်ရန်

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights တွင် ဆက်စပ်ထားသော လော့ဂ်များကို ရှာဖွေပါ
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure လှုပ်ရှားမှု မှတ်တမ်းများကို ရှာဖွေပါ
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ အဆင့်မြင့် Debugging ကိရိယာများ

### Azure Resource Graph Queries
```bash
# Tag များဖြင့် အရင်းအမြစ်များကို ရှာဖွေပါ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# မအောင်မြင်သော တပ်ဆင်မှုများကို ရှာဖွေပါ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# အရင်းအမြစ်များ၏ ကျန်းမာရေးကို စစ်ဆေးပါ
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ကွန်ယနက် Debugging
```bash
# ဝန်ဆောင်မှုများအကြား ဆက်သွယ်နိုင်မှုကို စမ်းသပ်ပါ
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

# အသုံးပြုနည်း
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### ကွန်တိုင်နာ Debugging
```bash
# ကွန်တိန်နာ အက်ပ်ဆိုင်ရာ ပြဿနာများကို အမှားရှာဖွေပြင်ဆင်ခြင်း
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

### ဒေတာဘေ့စ် ချိတ်ဆက်မှု Debugging
```bash
# ဒေတာဘေ့စ် ချိတ်ဆက်မှုကို အမှားရှာဖော်ပါ
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

## 🔬 စွမ်းဆောင်ရည် မျက်နှာဖုံးတန်းစစ်ဆေးခြင်း

### Application Performance Monitoring
```bash
# Application Insights အတွက် အမှားရှာဖွေခြင်းကို ဖွင့်ပါ
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

# စိတ်ကြိုက် စွမ်းဆောင်ရည် စောင့်ကြည့်မှု
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

### အရင်းအမြစ် အသုံးပြုမှု ခွဲခြမ်းစစ်တမ်း
```bash
# အရင်းအမြစ် အသုံးပြုမှုကို စောင့်ကြည့်ပါ
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

## 🧪 စမ်းသပ်မှုနှင့် အတည်ပြုခြင်း

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# debug ပတ်ဝန်းကျင် သတ်မှတ်ခြင်း
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ဝန်ဆောင်မှု endpoint များ ရယူခြင်း
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# health endpoint များ စမ်းသပ်ခြင်း
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

# စမ်းသပ်မှုများ လုပ်ဆောင်ခြင်း
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# စိတ်ကြိုက် ပေါင်းစည်း စမ်းသပ်မှုများ လုပ်ဆောင်ခြင်း
npm run test:integration
```

### Load Testing များကို အသုံးပြု၍ Debugging
```bash
# စွမ်းဆောင်ရည် အနှောင့်အယှက်ဖြစ်စေသည့် အချက်များကို ရှာဖွေရန် ရိုးရှင်းသော တင်ပမာဏ စမ်းသပ်မှု
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ကို အသုံးပြုခြင်း (တပ်ဆင်ရန်: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # အဓိက တိုင်းတာချက်များကို ထုတ်ယူပါ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ချို့ယွင်းချက်များကို စစ်ဆေးပါ
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 အင်ဖရာစတြပ်ချာ Debugging

### Bicep Template Debugging
```bash
# Bicep template များကို အသေးစိတ် အထွက်နှင့်အတူ မှန်ကြောင်း စစ်ဆေးပါ
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # သဒ္ဒါ စစ်ဆေးခြင်း
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint စစ်ဆေးခြင်း
    az bicep lint --file "$template_file"
    
    # What-if ဖြန့်ချိခြင်း
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# template ဖြန့်ချိမှုကို အမှားရှာဖွေပါ
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

### အရင်းအမြစ် အခြေအနေ ခွဲခြမ်းစစ်ဆေးခြင်း
```bash
# အရင်းအမြစ်၏ အခြေအနေများကို မကိုက်ညီမှုများအတွက် ခွဲခြမ်းစစ်ဆေးပါ
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # အရင်းအမြစ်အားလုံးနှင့် ၎င်းတို့၏ အခြေအနေများကို စာရင်းပြုစုပါ
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # မအောင်မြင်သော အရင်းအမြစ်များကို စစ်ဆေးပါ
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

### Authentication စီးရီး အစီအစဉ် Debugging
```bash
# Azure အတည်ပြုမှု အမှားရှာဖွေရန်
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT token ကို ဖော်ထုတ်ရန် (jq နှင့် base64 လိုအပ်သည်)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault သို့ ဝင်ရောက်ခွင့် အမှားရှာဖွေရန်
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

### ကွန်ယက် လုံခြုံရေး Debugging
```bash
# ကွန်ယက်လုံခြုံရေးအဖွဲ့များ၏ ပြဿနာများကို ရှာဖွေပါ
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

## 📱 အက်ပလီကေးရှင်း သီးသန့် Debugging

### Node.js အက်ပလီကေးရှင်း Debugging
```javascript
// debug-middleware.js - Express အတွက် အမှားရှာဖွေပေးမည့် middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // တောင်းဆိုချက်အသေးစိတ်များကို မှတ်တမ်းတင်ပါ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // တုံ့ပြန်ချက်များကို မှတ်တမ်းတင်ရန် res.json ကို override လုပ်ပါ
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ဒေတာဘေ့စ် မေးခွန်း Debugging
```javascript
// database-debug.js - ဒေတာဘေ့စ် အမှားရှာဖွေရေး အထောက်အကူပစ္စည်းများ
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

## 🚨 အရေးပေါက် Debugging လုပ်ထုံးလုပ်နည်းများ

### ထုတ်လုပ်မှုပတ်ဝန်းကျင် ပြဿနာ တုံ့ပြန်ကြားနာခြင်း
```bash
#!/bin/bash
# emergency-debug.sh - အရေးပေါ် ထုတ်လုပ်ရေး အမှားရှာဖွေရေး

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

# မှန်ကန်သော ပတ်ဝန်းကျင်သို့ ပြောင်းပါ
azd env select "$ENVIRONMENT"

# အရေးကြီးသော အချက်အလက်များကို စုဆောင်းပါ
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# မှားယွင်းမှတ်တမ်းများအတွက် Azure Monitor ကို အသုံးပြုပါ
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

### ပြန်လည်နောက်ရောက်စေနည်းလမ်းများ
```bash
# လျင်မြန်စွာ ပြန်လည်လှည့်ရန် စကရစ်
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # ပတ်ဝန်းကျင်ကို ပြောင်းရန်
    azd env select "$environment"
    
    # Git ဖြင့် ပြန်လည်လှည့်ခြင်း (AZD တွင် ထည့်သွင်းထားသော rollback မရှိပါ)
    git checkout "$previous_commit"
    azd deploy
    
    # ပြန်လည်လှည့်မှုကို အတည်ပြုရန်
    echo "Verifying rollback..."
    azd show
    
    # အရေးကြီးသော endpoint များကို စမ်းသပ်ရန်
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging မျက်နှာပြင်များ

### စိတ်ကြိုက် မော်နီတာ မျက်နှာပြင်
```bash
# အမှားရှာဖွေရန် Application Insights မေးခွန်းများ ဖန်တီးပါ
create_debug_queries() {
    local app_insights_name=$1
    
    # အမှားများကို ရှာဖွေရန် မေးခွန်း
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # ဆောင်ရွက်မှု ပြဿနာများကို ရှာဖွေရန် မေးခွန်း
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # မူတည်မှု ပျက်ကွက်မှုများကို ရှာဖွေရန် မေးခွန်း
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### မှတ်တမ်း စုပေါင်းခြင်း
```bash
# Azure ရင်းမြစ်အမျိုးမျိုးမှ မှတ်တမ်းများကို စုစည်းခြင်း
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

## 🔗 အဆင့်မြင့် အရင်းအမြစ်များ

### စိတ်ကြိုက် Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - ဝန်ဆောင်မှုများ၏ ကျန်းမာရေးကို တိကျစွာ စုံလင်စွာ စစ်ဆေးခြင်း
- `performance-test.sh` - အလိုအလျောက် စွမ်းဆောင်ရည် စမ်းသပ်မှုများ
- `log-analyzer.py` - အဆင့်မြင့် log ပေါင်းစည်းခွဲခြမ်းစိတ်ဖြာခြင်း
- `resource-validator.sh` - အရင်းအမြစ်များကို အတည်ပြုစစ်ဆေးခြင်း

### မော်နီတာ ပေါင်းစည်းခြင်း
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

## အကောင်းဆုံး အကျင့်များ

1. **မထုတ်လုပ်ရေး ပတ်ဝန်းကျင်များတွင် အမြဲ debug logging ကို ဖွင့်ထားပါ**
2. **ပြဿနာများအတွက် ပြန်လည်ဖန်တီးနိုင်သော စမ်းသပ်မှုကိစ္စများ ဖန်တီးပါ**
3. **အသင်းအတွက် debugging လုပ်ထုံးလုပ်နည်းများကို မှတ်တမ်းတင်ထားပါ**
4. **ကျန်းမာရေး စစ်ဆေးမှုများနှင့် မော်နီတာများကို အလိုအလျောက် ပြုလုပ်ပါ**
5. **သင့် application ပြောင်းလဲမှုများနှင့် အညီ debug tools များကို အပ်ဒိတ်ထားပါ**
6. **မဖြစ်ပွားချိန်များတွင် debugging လုပ်ထုံးလုပ်နည်းများကို လေ့ကျင့်ပါ**

## နောက်ဆက်တွဲ လုပ်ဆောင်ရမည့် အချက်များ

- [စွမ်းရည် စီမံချက်](../chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် လိုအပ်ချက်များကို စီစဉ်ပါ
- [SKU ရွေးချယ်ခြင်း](../chapter-06-pre-deployment/sku-selection.md) - သင့်တော်သော ဝန်ဆောင်မှု အဆင့်များကို ရွေးချယ်ပါ
- [Preflight စစ်ဆေးမှုများ](../chapter-06-pre-deployment/preflight-checks.md) - ဖြန့်ချိမခံမတိုင်မီ အတည်ပြုစစ်ဆေးမှုများ
- [Cheat Sheet](../../resources/cheat-sheet.md) - အမြန်ရယူနိုင်သော လမ်းညွှန်ချက်များ

---

**မှတ်သားရန်**: ကောင်းမွန်သော debugging သည် စနစ်တကျ၊ သေချာပြီး သည်းခံမှုရှိရပါသည်။ ဒီကိရိယာများနှင့် နည်းလမ်းများက ပြဿနာများကို ပိုမြန်ပြီး ထိရောက်စွာ ခွဲခြမ်းနိုင်စေပါသည်။

---

**လမ်းကြောင်း**
- **ယခင် သင်ခန်းစာ**: [ပုံမှန် ပြဿနာများ](common-issues.md)

- **နောက်တစ်ခု သင်ခန်းစာ**: [စွမ်းရည် စီမံချက်](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်မခံကြောင်း သတိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြုပြီး ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာတမ်းကို တရားဝင် အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်ရမည်ဖြစ်သည်။ အရေးပါသော အချက်အလက်များအတွက် သေချာမှုရရှိစေရန် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်တစ်ဦးအား အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းသော အဓိပ္ပါယ်ယူချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->