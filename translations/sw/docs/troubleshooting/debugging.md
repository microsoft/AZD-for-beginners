# Mwongozo wa Kudebug kwa AZD Deployments

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 7 - Utatuzi wa Shida & Kudebug
- **⬅️ Iliyopita**: [Masuala ya Kawaida](common-issues.md)
- **➡️ Inayofuata**: [Utatuzi wa Shida Maalum za AI](ai-troubleshooting.md)
- **🚀 Sura Inayofuata**: [Sura ya 8: Mifumo ya Uzalishaji & Biashara](../microsoft-foundry/production-ai-practices.md)

## Utangulizi

Mwongozo huu wa kina unatoa mikakati ya hali ya juu ya kudebug, zana, na mbinu za kugundua na kutatua masuala magumu yanayohusiana na deployments za Azure Developer CLI. Jifunze mbinu za utatuzi wa shida kwa utaratibu, uchambuzi wa logi, ufuatiliaji wa utendaji, na zana za hali ya juu za uchunguzi ili kutatua masuala ya deployment na wakati wa utekelezaji kwa ufanisi.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utaweza:
- Kumudu mbinu za utatuzi wa shida kwa utaratibu kwa masuala ya Azure Developer CLI
- Kuelewa usanidi wa hali ya juu wa logi na mbinu za uchambuzi wa logi
- Kutekeleza mikakati ya ufuatiliaji wa utendaji na uchambuzi
- Kutumia zana na huduma za uchunguzi za Azure kwa utatuzi wa matatizo magumu
- Kutumia mbinu za kudebug mtandao na usalama
- Kusimamia ufuatiliaji wa kina na tahadhari kwa kugundua masuala mapema

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kutumia mbinu ya TRIAGE kudebug masuala magumu ya deployment kwa utaratibu
- Kusimamia na kuchambua taarifa za logi na ufuatiliaji kwa kina
- Kutumia Azure Monitor, Application Insights, na zana za uchunguzi kwa ufanisi
- Kudebug masuala ya muunganisho wa mtandao, uthibitishaji, na ruhusa kwa uhuru
- Kutekeleza mikakati ya ufuatiliaji wa utendaji na uboreshaji
- Kuunda script za kudebug maalum na otomatiki kwa masuala yanayojirudia

## Mbinu za Kudebug

### Mbinu ya TRIAGE
- **T**ime: Lini tatizo lilianza?
- **R**eproduce: Je, unaweza kulirudia mara kwa mara?
- **I**solate: Ni sehemu gani inashindwa?
- **A**nalyze: Logi zinaonyesha nini?
- **G**ather: Kusanya taarifa zote muhimu
- **E**scalate: Lini uombe msaada wa ziada

## Kuwasha Hali ya Debug

### Vigezo vya Mazingira
```bash
# Washa ufuatiliaji wa kina
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Ufuatiliaji wa Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Zima telemetry kwa matokeo safi
export AZD_DISABLE_TELEMETRY=true
```

### Usanidi wa Debug
```bash
# Weka usanidi wa urekebishaji kimataifa
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Washa ufuatiliaji wa kumbukumbu
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Mbinu za Uchambuzi wa Logi

### Kuelewa Viwango vya Logi
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Uchambuzi wa Logi Iliyopangiliwa
```bash
# Chuja kumbukumbu kwa kiwango
azd logs --level error --since 1h

# Chuja kwa huduma
azd logs --service api --level debug

# Hamisha kumbukumbu kwa uchambuzi
azd logs --output json > deployment-logs.json

# Changanua kumbukumbu za JSON kwa kutumia jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Ulinganishaji wa Logi
```bash
#!/bin/bash
# correlate-logs.sh - Linganisha kumbukumbu kati ya huduma

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Tafuta katika huduma zote
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Tafuta kumbukumbu za Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Zana za Kudebug za Hali ya Juu

### Maswali ya Azure Resource Graph
```bash
# Tafuta rasilimali kwa kutumia lebo
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Tafuta usambazaji ulioshindwa
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Angalia afya ya rasilimali
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Kudebug Mtandao
```bash
# Jaribu muunganisho kati ya huduma
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

# Matumizi
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Kudebug Kontena
```bash
# Tatua masuala ya programu ya kontena
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

### Kudebug Muunganisho wa Hifadhidata
```bash
# Kagua muunganisho wa hifadhidata
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

## 🔬 Kudebug Utendaji

### Ufuatiliaji wa Utendaji wa Programu
```bash
# Washa ufuatiliaji wa Application Insights
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

# Ufuatiliaji wa utendaji maalum
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

### Uchambuzi wa Matumizi ya Rasilimali
```bash
# Fuatilia matumizi ya rasilimali
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

## 🧪 Upimaji na Uthibitishaji

### Kudebug Upimaji wa Muunganiko
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Weka mazingira ya urekebishaji
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Pata ncha za huduma
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Jaribu ncha za afya
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

# Endesha majaribio
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Endesha majaribio maalum ya muunganisho
npm run test:integration
```

### Upimaji wa Mzigo kwa Kudebug
```bash
# Jaribio rahisi la mzigo kutambua vikwazo vya utendaji
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Kutumia Apache Bench (sakinisha: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Chukua vipimo muhimu
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Angalia kushindwa
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Kudebug Miundombinu

### Kudebug Templeti za Bicep
```bash
# Thibitisha templeti za Bicep na matokeo ya kina
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Uthibitishaji wa sintaksia
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Uthibitishaji wa lint
    az bicep lint --file "$template_file"
    
    # Nini-ikiwa kupelekwa
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Kagua kupelekwa kwa templeti
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

### Uchambuzi wa Hali ya Rasilimali
```bash
# Changanua hali za rasilimali kwa kutofautiana
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Orodhesha rasilimali zote na hali zao
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Angalia rasilimali zilizoshindwa
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

## 🔒 Kudebug Usalama

### Kudebug Mtiririko wa Uthibitishaji
```bash
# Sakinisha uthibitisho wa Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Fafanua tokeni ya JWT (inahitaji jq na base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Sakinisha ufikiaji wa Key Vault
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

### Kudebug Usalama wa Mtandao
```bash
# Kagua vikundi vya usalama wa mtandao
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Angalia sheria za usalama
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Kudebug Maalum kwa Programu

### Kudebug Programu za Node.js
```javascript
// debug-middleware.js - Kati ya Express ya urekebishaji
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Ingiza maelezo ya ombi
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Badilisha res.json ili kuingiza majibu
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Kudebug Maswali ya Hifadhidata
```javascript
// database-debug.js - Huduma za urekebishaji wa hifadhidata
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

## 🚨 Taratibu za Kudebug Dharura

### Majibu ya Masuala ya Uzalishaji
```bash
#!/bin/bash
# emergency-debug.sh - Urekebishaji wa dharura wa uzalishaji

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

# Badilisha kwa mazingira sahihi
azd env select "$ENVIRONMENT"

# Kusanya taarifa muhimu
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

### Taratibu za Kurudisha Nyuma
```bash
# Skripti ya kurudisha haraka
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Badilisha mazingira
    azd env select "$environment"
    
    # Rudisha programu
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Thibitisha kurudisha
    echo "Verifying rollback..."
    azd show
    
    # Jaribu sehemu muhimu
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashibodi za Kudebug

### Dashibodi ya Ufuatiliaji Maalum
```bash
# Unda maswali ya Application Insights kwa kusuluhisha hitilafu
create_debug_queries() {
    local app_insights_name=$1
    
    # Uliza kuhusu makosa
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Uliza kuhusu masuala ya utendaji
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Uliza kuhusu kushindwa kwa utegemezi
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Ukusanyaji wa Logi
```bash
# Kusanya kumbukumbu kutoka vyanzo mbalimbali
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

## 🔗 Rasilimali za Hali ya Juu

### Script za Kudebug Maalum
Unda saraka `scripts/debug/` yenye:
- `health-check.sh` - Ukaguzi wa afya wa kina
- `performance-test.sh` - Upimaji wa utendaji otomatiki
- `log-analyzer.py` - Uchambuzi wa hali ya juu wa logi
- `resource-validator.sh` - Uthibitishaji wa miundombinu

### Ujumuishaji wa Ufuatiliaji
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

## Mazoea Bora

1. **Washa logi za debug kila wakati** katika mazingira yasiyo ya uzalishaji
2. **Unda kesi za majaribio zinazoweza kurudiwa** kwa masuala
3. **Andika taratibu za kudebug** kwa timu yako
4. **Otomatisha ukaguzi wa afya** na ufuatiliaji
5. **Sasisha zana za debug** kulingana na mabadiliko ya programu yako
6. **Fanya mazoezi ya taratibu za kudebug** wakati wa nyakati zisizo za tukio

## Hatua Zifuatazo

- [Mipango ya Uwezo](../pre-deployment/capacity-planning.md) - Panga mahitaji ya rasilimali
- [Uchaguzi wa SKU](../pre-deployment/sku-selection.md) - Chagua viwango vya huduma vinavyofaa
- [Ukaguzi wa Kabla ya Utekelezaji](../pre-deployment/preflight-checks.md) - Uthibitishaji wa kabla ya utekelezaji
- [Karatasi ya Msaada](../../resources/cheat-sheet.md) - Amri za rejeleo la haraka

---

**Kumbuka**: Kudebug vizuri ni kuhusu kuwa na utaratibu, makini, na uvumilivu. Zana na mbinu hizi zitakusaidia kugundua masuala kwa haraka na kwa ufanisi.

---

**Urambazaji**
- **Somo Lililopita**: [Masuala ya Kawaida](common-issues.md)

- **Somo Linalofuata**: [Mipango ya Uwezo](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->