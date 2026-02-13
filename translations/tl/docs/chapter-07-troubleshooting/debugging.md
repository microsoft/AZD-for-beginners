# Gabay sa Pag-debug para sa Mga Pag-deploy ng AZD

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraang**: [Karaniwang Mga Isyu](common-issues.md)
- **➡️ Susunod**: [Pag-troubleshoot na Espesipiko sa AI](ai-troubleshooting.md)
- **🚀 Susunod na Kabanata**: [Kabanata 8: Mga Pattern sa Produksyon at Enterprise](../chapter-08-production/production-ai-practices.md)

## Panimula

Ang komprehensibong gabay na ito ay nagbibigay ng mga advanced na estratehiya sa pag-debug, mga tool, at mga teknik para sa pag-diagnose at paglutas ng kumplikadong mga isyu sa mga pag-deploy gamit ang Azure Developer CLI. Matututuhan mo ang mga sistematikong metodolohiya ng pag-troubleshoot, mga teknik sa pagsusuri ng log, profiling ng pagganap, at mga advanced na diagnostic na tool upang mabisang malutas ang mga isyu sa pag-deploy at runtime.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, matututuhan mo:
- Maging bihasa sa sistematikong mga metodolohiya sa pag-debug para sa mga isyu ng Azure Developer CLI
- Unawain ang advanced na konfigurasyon ng pag-log at mga teknik sa pagsusuri ng log
- Ipatupad ang profiling ng pagganap at mga estratehiya sa pagmo-monitor
- Gamitin ang mga diagnostic na tool at serbisyo ng Azure para sa paglutas ng kumplikadong problema
- Ilapat ang mga teknik sa pag-debug ng network at pag-troubleshoot ng seguridad
- I-configure ang komprehensibong pagmo-monitor at pag-aalerto para sa maagap na pagtuklas ng mga isyu

## Mga Kinalabasan ng Pagkatuto

Sa pagtatapos, magagawa mo:
- Ilapat ang metodolohiyang TRIAGE para sistematikong i-debug ang kumplikadong mga isyu sa pag-deploy
- I-configure at suriin ang komprehensibong impormasyon ng pag-log at tracing
- Gamitin nang epektibo ang Azure Monitor, Application Insights, at mga diagnostic na tool
- Mag-debug ng mga isyu sa konektividad ng network, authentication, at mga permiso nang mag-isa
- Ipatupad ang mga estratehiya sa pagmo-monitor at pag-optimize ng pagganap
- Lumikha ng mga custom na script para sa pag-debug at automation para sa mga paulit-ulit na isyu

## Metodolohiya sa Pag-debug

### Ang Pamamaraan ng TRIAGE
- **T**ime: Kailan nagsimula ang isyu?
- **R**eproduce: Maaari mo bang paulit-ulit na ma-reproduce ito?
- **I**solate: Aling bahagi ang pumapalya?
- **A**nalyze: Ano ang sinasabi ng mga log?
- **G**ather: Kolektahin ang lahat ng may-kinalamang impormasyon
- **E**scalate: Kailan maghahanap ng karagdagang tulong

## Pagpapagana ng Debug Mode

### Mga Environment Variable
```bash
# Paganahin ang komprehensibong pag-debug
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Pag-debug ng Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# I-disable ang telemetry para sa mas malinis na output
export AZD_DISABLE_TELEMETRY=true
```

### Konfigurasyon ng Debug
```bash
# Itakda ang debug na konfigurasyon nang global
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Paganahin ang trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Mga Teknik sa Pagsusuri ng Log

### Pag-unawa sa Mga Antas ng Log
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
# Tingnan ang mga log gamit ang Azure Monitor (sa pamamagitan ng azd monitor)
azd monitor --logs

# Tingnan ang mga log ng aplikasyon sa real-time
azd monitor --live

# Para sa mas detalyadong pagsusuri ng mga log, gamitin ang Azure CLI kasama ang iyong App Service o Container App:
# Mga log ng App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Mga log ng Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# I-export ang mga log ng Application Insights para sa pagsusuri
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - I-korelasyon ang mga log sa iba't ibang serbisyo gamit ang Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Maghanap sa Application Insights para sa mga magkakaugnay na log
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Maghanap sa mga tala ng aktibidad ng Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Mga Advanced na Tool sa Pag-debug

### Azure Resource Graph Queries
```bash
# Mag-query ng mga resource ayon sa mga tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Hanapin ang mga nabigong deployment
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Suriin ang kalusugan ng resource
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# Subukan ang koneksyon sa pagitan ng mga serbisyo
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

# Paggamit
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# I-debug ang mga isyu ng container app
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
# I-debug ang koneksyon sa database
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

## 🔬 Pag-debug ng Pagganap

### Application Performance Monitoring
```bash
# Paganahin ang pag-debug ng Application Insights
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

# Pasadyang pagmamanman ng pagganap
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
# Subaybayan ang paggamit ng mga mapagkukunan
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

## 🧪 Pagsusuri at Pagpapatunay

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Itakda ang debug na kapaligiran
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Kunin ang mga endpoint ng serbisyo
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Subukan ang mga endpoint ng kalusugan
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

# Patakbuhin ang mga pagsubok
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Patakbuhin ang mga pasadyang pagsubok sa integrasyon
npm run test:integration
```

### Load Testing for Debugging
```bash
# Simpleng load test upang matukoy ang mga bottleneck sa pagganap
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Gumagamit ng Apache Bench (i-install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Kunin ang mga pangunahing sukatan
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Suriin kung may mga pagkabigo
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Pag-debug ng Imprastraktura

### Bicep Template Debugging
```bash
# I-validate ang mga Bicep template na may detalyadong output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Pag-validate ng syntax
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Pag-validate ng lint
    az bicep lint --file "$template_file"
    
    # What-if na deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Pag-debug ng pag-deploy ng template
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
# Suriin ang mga estado ng mga resource para sa mga hindi pagkakatugma
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Ilista ang lahat ng mga resource at ang kanilang mga estado
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Suriin ang mga nabigong resource
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

## 🔒 Pag-debug ng Seguridad

### Authentication Flow Debugging
```bash
# I-debug ang pag-authenticate sa Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # I-decode ang JWT token (nangangailangan ng jq at base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# I-debug ang pag-access sa Key Vault
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
# I-debug ang mga grupo ng seguridad ng network
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Suriin ang mga patakaran sa seguridad
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Pag-debug na Nakatuon sa Aplikasyon

### Node.js Application Debugging
```javascript
// debug-middleware.js - Express middleware para sa pag-debug
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // I-log ang mga detalye ng kahilingan
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // I-override ang res.json upang i-log ang mga tugon
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
// database-debug.js - Mga utility para sa pag-debug ng database
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

## 🚨 Mga Pamamaraan sa Emergency Debugging

### Production Issue Response
```bash
#!/bin/bash
# emergency-debug.sh - Pang-emergency na pag-debug ng produksyon

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

# Lumipat sa tamang kapaligiran
azd env select "$ENVIRONMENT"

# Kolektahin ang mahahalagang impormasyon
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Gamitin ang Azure Monitor para sa mga error log
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

### Rollback Procedures
```bash
# Mabilis na script ng rollback
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Lumipat ng kapaligiran
    azd env select "$environment"
    
    # I-rollback gamit ang Git (ang AZD ay walang built-in na rollback)
    git checkout "$previous_commit"
    azd deploy
    
    # Kumpirmahin ang rollback
    echo "Verifying rollback..."
    azd show
    
    # Subukan ang mga kritikal na endpoint
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Mga Dashboard para sa Pag-debug

### Custom Monitoring Dashboard
```bash
# Lumikha ng mga query ng Application Insights para sa pag-debug
create_debug_queries() {
    local app_insights_name=$1
    
    # Query para sa mga error
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query para sa mga isyu sa pagganap
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query para sa mga pagkabigo ng dependency
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# Pagsamahin ang mga log mula sa iba't ibang pinagmulan ng Azure
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

## 🔗 Mga Advanced na Mapagkukunan

### Custom Debug Scripts
Lumikha ng isang `scripts/debug/` directory na may:
- `health-check.sh` - Komprehensibong health checking
- `performance-test.sh` - Automated na pagsubok ng pagganap
- `log-analyzer.py` - Advanced na pag-parse at pagsusuri ng log
- `resource-validator.sh` - Pagpapatunay ng imprastraktura

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

## Mga Pinakamahuhusay na Gawain

1. **Laging i-enable ang debug logging** sa mga non-production na kapaligiran
2. **Gumawa ng reproducible test cases** para sa mga isyu
3. **Idokumento ang mga pamamaraan ng pag-debug** para sa iyong koponan
4. **I-automate ang health checks** at pagmo-monitor
5. **Panatilihing napapanahon ang mga debug tool** kasabay ng mga pagbabago sa iyong aplikasyon
6. **Sanayin ang mga pamamaraan ng pag-debug** sa mga oras na walang insidente

## Susunod na Mga Hakbang

- [Pagpaplano ng Kapasidad](../chapter-06-pre-deployment/capacity-planning.md) - Planuhin ang mga kinakailangang mapagkukunan
- [Pagpili ng SKU](../chapter-06-pre-deployment/sku-selection.md) - Pumili ng angkop na mga tier ng serbisyo
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Pagpapatunay bago ang pag-deploy
- [Cheat Sheet](../../resources/cheat-sheet.md) - Mabilisang sanggunian ng mga utos

---

**Tandaan**: Ang mahusay na pag-debug ay tungkol sa pagiging sistematiko, masusi, at matiyaga. Ang mga tool at teknik na ito ay makakatulong sa iyo na mas mabilis at mas epektibong ma-diagnose ang mga isyu.

---

**Pag-navigate**
- **Nakaraang Aralin**: [Karaniwang Mga Isyu](common-issues.md)

- **Susunod na Aralin**: [Pagpaplano ng Kapasidad](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na tagasalin na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi kawastuhan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->