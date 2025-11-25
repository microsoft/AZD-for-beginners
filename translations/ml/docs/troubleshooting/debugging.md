<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-24T23:50:58+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "ml"
}
-->
# AZD ഡിപ്ലോയ്മെന്റുകൾക്കുള്ള ഡീബഗിംഗ് ഗൈഡ്

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 7 - പ്രശ്നപരിഹാരവും ഡീബഗിംഗും
- **⬅️ മുൻപത്തെ**: [സാധാരണ പ്രശ്നങ്ങൾ](common-issues.md)
- **➡️ അടുത്തത്**: [AI-സംബന്ധമായ പ്രശ്നപരിഹാരം](ai-troubleshooting.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 8: പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് പാറ്റേണുകൾ](../microsoft-foundry/production-ai-practices.md)

## പരിചയം

ഈ സമഗ്രമായ ഗൈഡ് Azure Developer CLI ഡിപ്ലോയ്മെന്റുകളുമായി ബന്ധപ്പെട്ട സങ്കീർണ്ണമായ പ്രശ്നങ്ങൾ തിരിച്ചറിയാനും പരിഹരിക്കാനും സഹായിക്കുന്ന പുരോഗതിയായ ഡീബഗിംഗ് തന്ത്രങ്ങൾ, ഉപകരണങ്ങൾ, സാങ്കേതിക വിദ്യകൾ എന്നിവ നൽകുന്നു. സിസ്റ്റമാറ്റിക് പ്രശ്നപരിഹാര രീതികൾ, ലോഗ് വിശകലന സാങ്കേതിക വിദ്യകൾ, പ്രകടന പ്രൊഫൈലിംഗ്, പുരോഗതിയായ ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങൾ എന്നിവയെക്കുറിച്ച് പഠിച്ച് ഡിപ്ലോയ്മെന്റും റൺടൈമും സംബന്ധിച്ച പ്രശ്നങ്ങൾ കാര്യക്ഷമമായി പരിഹരിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുന്നതിലൂടെ, നിങ്ങൾ:
- Azure Developer CLI പ്രശ്നങ്ങൾക്കുള്ള സിസ്റ്റമാറ്റിക് ഡീബഗിംഗ് രീതികൾ കൈകാര്യം ചെയ്യുക
- പുരോഗതിയായ ലോഗിംഗ് കോൺഫിഗറേഷനും ലോഗ് വിശകലന സാങ്കേതിക വിദ്യകളും മനസ്സിലാക്കുക
- പ്രകടന പ്രൊഫൈലിംഗ്, മോണിറ്ററിംഗ് തന്ത്രങ്ങൾ നടപ്പിലാക്കുക
- സങ്കീർണ്ണമായ പ്രശ്നപരിഹാരത്തിനായി Azure ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങളും സേവനങ്ങളും ഉപയോഗിക്കുക
- നെറ്റ്‌വർക്ക് ഡീബഗിംഗും സുരക്ഷാ പ്രശ്നപരിഹാര സാങ്കേതിക വിദ്യകളും പ്രയോഗിക്കുക
- പ്രോആക്ടീവ് പ്രശ്നങ്ങൾ കണ്ടെത്തുന്നതിനായി സമഗ്രമായ മോണിറ്ററിംഗും അലർട്ടിംഗും കോൺഫിഗർ ചെയ്യുക

## പഠന ഫലങ്ങൾ

പഠനം പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങൾക്ക് കഴിയും:
- സങ്കീർണ്ണമായ ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ സിസ്റ്റമാറ്റിക് ആയി ഡീബഗ് ചെയ്യാൻ TRIAGE രീതിശാസ്ത്രം പ്രയോഗിക്കുക
- സമഗ്രമായ ലോഗിംഗ്, ട്രേസിംഗ് വിവരങ്ങൾ കോൺഫിഗർ ചെയ്യുകയും വിശകലനം ചെയ്യുകയും ചെയ്യുക
- Azure Monitor, Application Insights, ഡയഗ്നോസ്റ്റിക് ഉപകരണങ്ങൾ ഫലപ്രദമായി ഉപയോഗിക്കുക
- നെറ്റ്‌വർക്ക് കണക്റ്റിവിറ്റി, ഓതന്റിക്കേഷൻ, അനുമതി പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി ഡീബഗ് ചെയ്യുക
- പ്രകടന മോണിറ്ററിംഗും ഓപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങളും നടപ്പിലാക്കുക
- ആവർത്തിക്കുന്ന പ്രശ്നങ്ങൾക്ക് കസ്റ്റം ഡീബഗിംഗ് സ്ക്രിപ്റ്റുകളും ഓട്ടോമേഷൻ സൃഷ്ടിക്കുക

## ഡീബഗിംഗ് രീതിശാസ്ത്രം

### TRIAGE സമീപനം
- **T**ime: പ്രശ്നം എപ്പോൾ ആരംഭിച്ചു?
- **R**eproduce: ഇത് സ്ഥിരമായി പുനരാവർത്തിക്കാൻ കഴിയുമോ?
- **I**solate: ഏത് ഘടകമാണ് പരാജയപ്പെടുന്നത്?
- **A**nalyze: ലോഗുകൾ നമ്മോട് എന്താണ് പറയുന്നത്?
- **G**ather: എല്ലാ ബന്ധപ്പെട്ട വിവരങ്ങളും ശേഖരിക്കുക
- **E**scalate: അധിക സഹായം തേടേണ്ട സമയമെന്ന് തിരിച്ചറിയുക

## ഡീബഗ് മോഡ് എനേബിൾ ചെയ്യൽ

### എൻവയോൺമെന്റ് വേരിയബിളുകൾ
```bash
# സമഗ്രമായ ഡീബഗിംഗ് സജ്ജമാക്കുക
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI ഡീബഗിംഗ്
export AZURE_CLI_DIAGNOSTICS=true

# ക്ലീൻ ഔട്ട്പുട്ടിനായി ടെലിമെട്രി അപ്രാപ്തമാക്കുക
export AZD_DISABLE_TELEMETRY=true
```

### ഡീബഗ് കോൺഫിഗറേഷൻ
```bash
# ഡീബഗ് കോൺഫിഗറേഷൻ ആഗോളമായി സജ്ജമാക്കുക
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ട്രേസ് ലോഗിംഗ് പ്രാപ്തമാക്കുക
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ലോഗ് വിശകലന സാങ്കേതിക വിദ്യകൾ

### ലോഗ് ലെവലുകൾ മനസ്സിലാക്കുക
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ഘടനാപരമായ ലോഗ് വിശകലനം
```bash
# ലോഗുകൾ ലെവൽ പ്രകാരം ഫിൽട്ടർ ചെയ്യുക
azd logs --level error --since 1h

# സേവനം പ്രകാരം ഫിൽട്ടർ ചെയ്യുക
azd logs --service api --level debug

# വിശകലനത്തിനായി ലോഗുകൾ എക്സ്പോർട്ട് ചെയ്യുക
azd logs --output json > deployment-logs.json

# jq ഉപയോഗിച്ച് JSON ലോഗുകൾ പാഴ്സ് ചെയ്യുക
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### ലോഗ് കോറലേഷൻ
```bash
#!/bin/bash
# correlate-logs.sh - സേവനങ്ങൾക്കിടയിൽ ലോഗുകൾ ബന്ധിപ്പിക്കുക

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# എല്ലാ സേവനങ്ങളിലും തിരയുക
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure ലോഗുകളിൽ തിരയുക
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ പുരോഗതിയായ ഡീബഗിംഗ് ഉപകരണങ്ങൾ

### Azure Resource Graph Queries
```bash
# ടാഗുകൾ ഉപയോഗിച്ച് വിഭവങ്ങൾ തിരയുക
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# പരാജയപ്പെട്ട വിന്യാസങ്ങൾ കണ്ടെത്തുക
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# വിഭവങ്ങളുടെ ആരോഗ്യനില പരിശോധിക്കുക
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
# ഡാറ്റാബേസ് കണക്റ്റിവിറ്റി ഡീബഗ് ചെയ്യുക
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

### ആപ്ലിക്കേഷൻ പ്രകടന മോണിറ്ററിംഗ്
```bash
# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഡീബഗിംഗ് സജീവമാക്കുക
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

# ഇഷ്ടാനുസൃത പ്രകടന നിരീക്ഷണം
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
# വിഭവ ഉപയോഗം നിരീക്ഷിക്കുക
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

## 🧪 ടെസ്റ്റിംഗും സാധൂകരണവും

### ഇന്റഗ്രേഷൻ ടെസ്റ്റ് ഡീബഗിംഗ്
```bash
#!/bin/bash
# ഡീബഗ്-ഇന്റഗ്രേഷൻ-ടെസ്റ്റുകൾ.sh

set -e

echo "Running integration tests with debugging..."

# ഡീബഗ് പരിസ്ഥിതി സജ്ജമാക്കുക
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# സേവന എൻഡ്പോയിന്റുകൾ നേടുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ഹെൽത്ത് എൻഡ്പോയിന്റുകൾ പരിശോധിക്കുക
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

# ടെസ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുക
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# കസ്റ്റം ഇന്റഗ്രേഷൻ ടെസ്റ്റുകൾ പ്രവർത്തിപ്പിക്കുക
npm run test:integration
```

### ഡീബഗിംഗിനുള്ള ലോഡ് ടെസ്റ്റിംഗ്
```bash
# പ്രകടന തടസ്സങ്ങൾ തിരിച്ചറിയാൻ ലളിതമായ ലോഡ് ടെസ്റ്റ്
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # അപാച്ച് ബെഞ്ച് ഉപയോഗിക്കുന്നു (ഇൻസ്റ്റാൾ: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # പ്രധാന മെട്രിക്‌സ് എടുക്കുക
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # പരാജയങ്ങൾ പരിശോധിക്കുക
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ഇൻഫ്രാസ്ട്രക്ചർ ഡീബഗിംഗ്

### Bicep ടെംപ്ലേറ്റ് ഡീബഗിംഗ്
```bash
# വിശദമായ ഔട്ട്പുട്ടോടെ ബൈസെപ് ടെംപ്ലേറ്റുകൾ സാധൂകരിക്കുക
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # സിന്റാക്സ് സാധൂകരണം
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ലിന്റ് സാധൂകരണം
    az bicep lint --file "$template_file"
    
    # എന്ത്-എങ്കിൽ ഡിപ്ലോയ്‌മെന്റ്
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ടെംപ്ലേറ്റ് ഡിപ്ലോയ്‌മെന്റ് ഡീബഗ് ചെയ്യുക
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

### റിസോഴ്‌സ് സ്റ്റേറ്റ് വിശകലനം
```bash
# വിഭിന്നതകൾക്കായി വിഭവങ്ങളുടെ നിലകൾ വിശകലനം ചെയ്യുക
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # എല്ലാ വിഭവങ്ങളും അവയുടെ നിലകളുമായി പട്ടികപ്പെടുത്തുക
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # പരാജയപ്പെട്ട വിഭവങ്ങൾ പരിശോധിക്കുക
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
    
    # JWT ടോക്കൺ ഡീകോഡ് ചെയ്യുക (jq, base64 ആവശ്യമാണ്)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# കീ വോൾട്ട് ആക്സസ് ഡീബഗ് ചെയ്യുക
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

### നെറ്റ്‌വർക്ക് സുരക്ഷാ ഡീബഗിംഗ്
```bash
# നെറ്റ്‌വർക്കിന്റെ സുരക്ഷാ ഗ്രൂപ്പുകൾ ഡീബഗ് ചെയ്യുക
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

## 📱 ആപ്ലിക്കേഷൻ-സംബന്ധമായ ഡീബഗിംഗ്

### Node.js ആപ്ലിക്കേഷൻ ഡീബഗിംഗ്
```javascript
// ഡീബഗ്-മിഡിൽവെയർ.js - എക്സ്പ്രസ് ഡീബഗിംഗ് മിഡിൽവെയർ
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
    
    // പ്രതികരണങ്ങൾ ലോഗ് ചെയ്യാൻ res.json ഓവർറൈഡ് ചെയ്യുക
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
// ഡാറ്റാബേസ്-ഡീബഗ്.js - ഡാറ്റാബേസ് ഡീബഗിംഗ് ഉപകരണങ്ങൾ
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

## 🚨 അടിയന്തര ഡീബഗിംഗ് നടപടികൾ

### പ്രൊഡക്ഷൻ പ്രശ്ന പ്രതികരണം
```bash
#!/bin/bash
# emergency-debug.sh - അടിയന്തര ഉത്പാദന ഡീബഗിംഗ്

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

# നിർണായകമായ വിവരങ്ങൾ ശേഖരിക്കുക
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

### റോള്ബാക്ക് നടപടികൾ
```bash
# ദ്രുത റോള്ബാക്ക് സ്ക്രിപ്റ്റ്
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # പരിസ്ഥിതി മാറ്റുക
    azd env select "$environment"
    
    # ആപ്ലിക്കേഷൻ റോള്ബാക്ക് ചെയ്യുക
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # റോള്ബാക്ക് സ്ഥിരീകരിക്കുക
    echo "Verifying rollback..."
    azd show
    
    # നിർണായക എൻഡ്പോയിന്റുകൾ പരിശോധിക്കുക
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ഡീബഗിംഗ് ഡാഷ്ബോർഡുകൾ

### കസ്റ്റം മോണിറ്ററിംഗ് ഡാഷ്ബോർഡ്
```bash
# ഡിബഗിംഗിനായി ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ക്വറികൾ സൃഷ്ടിക്കുക
create_debug_queries() {
    local app_insights_name=$1
    
    # പിശകുകൾക്കുള്ള ക്വറി
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # പ്രകടന പ്രശ്നങ്ങൾക്കുള്ള ക്വറി
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ആശ്രിതത്വ പരാജയങ്ങൾക്കുള്ള ക്വറി
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ലോഗ് അഗ്രിഗേഷൻ
```bash
# നിരവധി ഉറവിടങ്ങളിൽ നിന്ന് ലോഗുകൾ സമാഹരിക്കുക
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

## 🔗 പുരോഗതിയായ റിസോഴ്‌സുകൾ

### കസ്റ്റം ഡീബഗ് സ്ക്രിപ്റ്റുകൾ
`scripts/debug/` ഡയറക്ടറിയിൽ സൃഷ്ടിക്കുക:
- `health-check.sh` - സമഗ്രമായ ആരോഗ്യ പരിശോധന
- `performance-test.sh` - ഓട്ടോമേറ്റഡ് പ്രകടന പരിശോധന
- `log-analyzer.py` - പുരോഗതിയായ ലോഗ് പാഴ്സിംഗ്, വിശകലനം
- `resource-validator.sh` - ഇൻഫ്രാസ്ട്രക്ചർ സാധൂകരണം

### മോണിറ്ററിംഗ് ഇന്റഗ്രേഷൻ
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

## മികച്ച പ്രാക്ടീസുകൾ

1. **നോൺ-പ്രൊഡക്ഷൻ എൻവയോൺമെന്റുകളിൽ** എപ്പോഴും ഡീബഗ് ലോഗിംഗ് എനേബിൾ ചെയ്യുക
2. പ്രശ്നങ്ങൾക്ക് **പുനരാവർത്തിക്കാവുന്ന ടെസ്റ്റ് കേസുകൾ** സൃഷ്ടിക്കുക
3. **ഡീബഗിംഗ് നടപടികൾ** നിങ്ങളുടെ ടീമിനായി രേഖപ്പെടുത്തുക
4. **ആരോഗ്യ പരിശോധനകളും മോണിറ്ററിംഗും ഓട്ടോമേറ്റ് ചെയ്യുക**
5. **ഡീബഗ് ഉപകരണങ്ങൾ** നിങ്ങളുടെ ആപ്ലിക്കേഷൻ മാറ്റങ്ങളോടൊപ്പം അപ്‌ഡേറ്റ് ചെയ്യുക
6. **പ്രശ്നമില്ലാത്ത സമയങ്ങളിൽ** ഡീബഗിംഗ് നടപടികൾ പ്രാക്ടീസ് ചെയ്യുക

## അടുത്ത ചുവടുകൾ

- [ക്ഷമതാ പ്ലാനിംഗ്](../pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് ആവശ്യകതകൾ പ്ലാൻ ചെയ്യുക
- [SKU തിരഞ്ഞെടുപ്പ്](../pre-deployment/sku-selection.md) - അനുയോജ്യമായ സേവന ടിയറുകൾ തിരഞ്ഞെടുക്കുക
- [പ്രിഫ്ലൈറ്റ് ചെക്കുകൾ](../pre-deployment/preflight-checks.md) - പ്രീ-ഡിപ്ലോയ്മെന്റ് സാധൂകരണം
- [ചീറ്റ് ഷീറ്റ്](../../resources/cheat-sheet.md) - ക്വിക്ക് റഫറൻസ് കമാൻഡുകൾ

---

**ഓർമ്മിക്കുക**: നല്ല ഡീബഗിംഗ് സിസ്റ്റമാറ്റിക്, സമഗ്രമായ, ക്ഷമയുള്ളതായിരിക്കണം. ഈ ഉപകരണങ്ങളും സാങ്കേതിക വിദ്യകളും നിങ്ങൾക്ക് പ്രശ്നങ്ങൾ വേഗത്തിൽ, ഫലപ്രദമായി തിരിച്ചറിയാനും പരിഹരിക്കാനും സഹായിക്കും.

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [സാധാരണ പ്രശ്നങ്ങൾ](common-issues.md)

- **അടുത്ത പാഠം**: [ക്ഷമതാ പ്ലാനിംഗ്](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ രേഖ AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള മൗലിക രേഖ പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->