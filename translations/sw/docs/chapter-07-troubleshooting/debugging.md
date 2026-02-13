# Mwongozo wa Utatuzi wa Hitilafu kwa Utekelezaji wa AZD

**Uelekezaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 7 - Utatuzi wa Matatizo & Urekebishaji
- **⬅️ Iliyopita**: [Masuala ya Kawaida](common-issues.md)
- **➡️ Ifuatayo**: [Utatuzi wa Matatizo kwa AI](ai-troubleshooting.md)
- **🚀 Sura Inayofuata**: [Sura 8: Mifumo ya Uzalishaji na Biashara](../chapter-08-production/production-ai-practices.md)

## Utangulizi

Mwongozo huu kamili unatoa mbinu za juu za urekebishaji, zana, na mbinu za utambuzi na utatuzi wa matatizo magumu katika utekelezaji wa Azure Developer CLI. Jifunze metodolojia za kimfumo za utatuzi wa matatizo, mbinu za uchambuzi wa logi, utambuzi wa utendaji, na zana za uchunguzi za kitaalamu ili kutatua kwa ufanisi matatizo ya utekelezaji na wakati wa kukimbia.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utapata:
- Uwezo wa mbinu za kimfumo za urekebishaji kwa masuala ya Azure Developer CLI
- Uelewa wa usanidi wa kina wa uandishi wa logi na mbinu za uchambuzi wa logi
- Utekelezaji wa utambuzi wa utendaji na mikakati ya ufuatiliaji
- Matumizi ya zana na huduma za uchunguzi za Azure kwa utatuzi wa matatizo magumu
- Utekelezaji wa mbinu za urekebishaji mtandao na utatuzi wa usalama
- Usanidi wa ufuatiliaji wa kina na onyo kwa ugundaji wa matatizo mapema

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kutumia metodolojia ya TRIAGE kutatua kwa mfumo matatizo magumu ya utekelezaji
- Kusanidi na kuchambua taarifa za kina za uandishi wa logi na ufuatiliaji
- Kutumia Azure Monitor, Application Insights, na zana za uchunguzi kwa ufanisi
- Kutatua kwa uhuru matatizo ya muunganisho wa mtandao, uthibitisho, na ruhusa
- Kutekeleza ufuatiliaji wa utendaji na mikakati ya uboreshaji
- Kuunda skripti maalum za urekebishaji na uendeshaji wa moja kwa moja kwa matatizo yanayoendelea

## Mbinu za Utatuzi wa Matatizo

### The TRIAGE Approach
- **T**ime: Je, tatizo lilianza lini?
- **R**eproduce: Je, unaweza kurudia tatizo mara kwa mara?
- **I**solate: Ni sehemu gani inayoshindwa?
- **A**nalyze: Logi zinaeleza nini?
- **G**ather: Kusanya taarifa zote muhimu
- **E**scalate: Wakati wa kutafuta msaada wa ziada

## Kuwezesha Hali ya Urekebishaji

### Environment Variables
```bash
# Wezesha ufuatiliaji wa makosa kwa kina
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Ufuatiliaji wa Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Zima telemetri kwa pato safi zaidi
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Weka usanidi wa debug kimataifa
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Washa ufuatiliaji wa logi
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

### Uchambuzi wa Logi Zilizopangwa
```bash
# Tazama logi kwa Azure Monitor (kupitia azd monitor)
azd monitor --logs

# Tazama logi za programu kwa wakati halisi
azd monitor --live

# Kwa uchambuzi wa kina wa logi, tumia Azure CLI na App Service yako au Container App:
# Logi za App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Logi za Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Hamisha logi za Application Insights kwa uchambuzi
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Kuhusisha Logi
```bash
#!/bin/bash
# correlate-logs.sh - Kuunganisha logi kati ya huduma kwa kutumia Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Tafuta logi zinazohusiana katika Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Tafuta logi za shughuli za Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Vifaa vya Juu vya Urekebishaji

### Maswali ya Azure Resource Graph
```bash
# Tafuta rasilimali kwa lebo
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Tafuta utekelezaji ulioshindwa
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Angalia afya ya rasilimali
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Urekebishaji wa Mtandao
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

### Urekebishaji wa Kontena
```bash
# Tafuta na rekebisha matatizo ya programu ya kontena
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

### Urekebishaji wa Muunganisho wa Hifadhidata
```bash
# Tambua na rekebisha muunganisho wa hifadhidata
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

## 🔬 Urekebishaji wa Utendaji

### Ufuatiliaji wa Utendaji wa Programu
```bash
# Wezesha uchunguzi wa mdudu wa Application Insights
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

# Ufuatiliaji wa utendaji uliobinafsishwa
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

## 🧪 Upimaji na Uthibitisho

### Urekebishaji wa Majaribio ya Muunganisho
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Weka mazingira ya kufuatilia makosa
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Pata anwani za mwisho za huduma
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Pima anwani za afya
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

# Endesha majaribio maalum ya ujumuishaji
npm run test:integration
```

### Majaribio ya Mzigo kwa Urekebishaji
```bash
# Mtihani rahisi wa mzigo ili kutambua vizuizi vya utendaji
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Kutumia Apache Bench (sakinisha: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Toa vipimo muhimu
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Kagua kwa ajili ya makosa
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Urekebishaji wa Miundombinu

### Urekebishaji wa Mifano ya Bicep
```bash
# Thibitisha templeti za Bicep kwa matokeo ya kina
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Uthibitishaji wa sintaksia
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Uthibitishaji wa lint
    az bicep lint --file "$template_file"
    
    # Utekelezaji wa 'what-if'
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Urekebishaji wa utekelezaji wa templeti
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
# Changanua hali za rasilimali kwa usiofanana
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

## 🔒 Urekebishaji wa Usalama

### Urekebishaji wa Mtiririko wa Uthibitishaji
```bash
# Kufuatilia na kutatua matatizo ya uthibitishaji wa Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Tafsiri token ya JWT (inahitaji jq na base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Kufuatilia na kutatua matatizo ya upatikanaji wa Key Vault
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

### Urekebishaji wa Usalama wa Mtandao
```bash
# Tambua na tatua matatizo ya vikundi vya usalama vya mtandao
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Kagua sheria za usalama
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Urekebishaji Maalum wa Programu

### Urekebishaji wa Programu za Node.js
```javascript
// debug-middleware.js - middleware ya kutatua mende ya Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Rekodi maelezo ya ombi
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Badilisha res.json ili kurekodi majibu
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Urekebishaji wa Maswali ya Hifadhidata
```javascript
// Zana za kutatua mdudu za hifadhidata
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

## 🚨 Taratibu za Dharura za Urekebishaji

### Majibu kwa Masuala ya Uzalishaji
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
# Tumia Azure Monitor kwa rejista za makosa
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

### Taratibu za Kurudisha (Rollback)
```bash
# Skripti ya kurejesha haraka
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Badilisha mazingira
    azd env select "$environment"
    
    # Kurejesha kwa kutumia Git (AZD haina urejeshaji uliyojengwa)
    git checkout "$previous_commit"
    azd deploy
    
    # Thibitisha urejeshaji
    echo "Verifying rollback..."
    azd show
    
    # Jaribu vituo vya mwisho muhimu
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashibodi za Urekebishaji

### Dashibodi ya Ufuatiliaji Iliyoamilishwa
```bash
# Unda maswali ya Application Insights kwa ajili ya utambuzi na utatuzi wa makosa
create_debug_queries() {
    local app_insights_name=$1
    
    # Ulizi la makosa
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Ulizi wa matatizo ya utendaji
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Ulizi wa kushindwa kwa utegemezi
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Ukusanyaji wa Logi
```bash
# Kukusanya kumbukumbu kutoka kwa vyanzo vingi vya Azure
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

## 🔗 Rasilimali za Juu

### Skripti Maalum za Urekebishaji
Unda saraka `scripts/debug/` yenye:
- `health-check.sh` - Ukaguzi wa kina wa afya
- `performance-test.sh` - Majaribio ya utendaji otomatiki
- `log-analyzer.py` - Uchambuzi na uchakataji wa logi wa hali ya juu
- `resource-validator.sh` - Uthibitishaji wa miundombinu

### Uingizaji wa Ufuatiliaji
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

## Mbinu Bora

1. **Daima wezesha uandishi wa logi za urekebishaji** katika mazingira yasiyo ya uzalishaji
2. **Tengeneza kesi za mtihani zinazoweza kurudiwa** kwa matatizo
3. **Andika taratibu za urekebishaji** kwa timu yako
4. **Otomatisha ukaguzi wa afya** na ufuatiliaji
5. **Sasisha zana za urekebishaji** pamoja na mabadiliko ya programu yako
6. **Fanya mazoezi ya taratibu za urekebishaji** wakati hakuna tukio

## Hatua Zifuatazo

- [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md) - Panga mahitaji ya rasilimali
- [Uchaguzi wa SKU](../chapter-06-pre-deployment/sku-selection.md) - Chagua ngazi za huduma zinazofaa
- [Ukaguzi wa Awali](../chapter-06-pre-deployment/preflight-checks.md) - Uthibitisho kabla ya utekelezaji
- [Karatasi ya Mbinu](../../resources/cheat-sheet.md) - Amri za marejeo ya haraka

---

**Kumbuka**: Urekebishaji mzuri unahusu kuwa wa kimfumo, wa kina, na mwenye subira. Zana na mbinu hizi zitakusaidia kugundua matatizo kwa haraka na kwa ufanisi zaidi.

---

**Uelekezaji**
- **Somo lililopita**: [Masuala ya Kawaida](common-issues.md)

- **Somo Linalofuata**: [Mipango ya Uwezo](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwajibika:
Waraka huu umefasiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Waraka asili katika lugha yake ya asili unapaswa kutumika kama chanzo cha kuaminika. Kwa taarifa muhimu, inashauriwa kupata tafsiri ya kitaalamu ya kibinadamu. Hatubebei dhamana kwa kutokuelewana au tafsiri isiyo sahihi inayotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->