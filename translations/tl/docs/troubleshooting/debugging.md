<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-22T10:15:26+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "tl"
}
-->
# Gabay sa Pag-debug para sa AZD Deployments

**Pag-navigate sa Kabanata:**
- **📚 Kurso Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pag-troubleshoot at Pag-debug
- **⬅️ Nakaraan**: [Karaniwang Isyu](common-issues.md)
- **➡️ Susunod**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 Susunod na Kabanata**: [Kabanata 8: Mga Pattern para sa Produksyon at Enterprise](../microsoft-foundry/production-ai-practices.md)

## Panimula

Ang komprehensibong gabay na ito ay nagbibigay ng mga advanced na estratehiya, tools, at teknolohiya para sa pag-diagnose at pagresolba ng mga kumplikadong isyu sa Azure Developer CLI deployments. Matutunan ang sistematikong pamamaraan ng pag-troubleshoot, pagsusuri ng logs, pag-profile ng performance, at mga advanced na diagnostic tools para mabilis na maayos ang mga isyu sa deployment at runtime.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa sistematikong pamamaraan ng pag-debug para sa mga isyu sa Azure Developer CLI
- Maiintindihan ang advanced na configuration ng logging at mga teknik sa pagsusuri ng logs
- Makakapagpatupad ng mga estratehiya sa pag-profile ng performance at monitoring
- Magagamit ang mga diagnostic tools at serbisyo ng Azure para sa kumplikadong pagresolba ng problema
- Makakapag-apply ng mga teknik sa pag-debug ng network at seguridad
- Makakapag-configure ng komprehensibong monitoring at alerting para sa proactive na pag-detect ng isyu

## Mga Resulta ng Pag-aaral

Sa pagtatapos, magagawa mo:
- I-apply ang TRIAGE methodology para sistematikong ma-debug ang mga kumplikadong isyu sa deployment
- I-configure at suriin ang komprehensibong impormasyon sa logging at tracing
- Magamit nang epektibo ang Azure Monitor, Application Insights, at mga diagnostic tools
- Mag-debug ng mga isyu sa network connectivity, authentication, at permission nang mag-isa
- Magpatupad ng mga estratehiya sa performance monitoring at optimization
- Gumawa ng custom debugging scripts at automation para sa mga paulit-ulit na isyu

## Pamamaraan sa Pag-debug

### Ang TRIAGE Approach
- **T**ime: Kailan nagsimula ang isyu?
- **R**eproduce: Maaari mo bang paulit-ulit itong ma-reproduce?
- **I**solate: Aling bahagi ang nagkakaroon ng problema?
- **A**nalyze: Ano ang sinasabi ng mga logs?
- **G**ather: Kolektahin ang lahat ng kaugnay na impormasyon
- **E**scalate: Kailan dapat humingi ng karagdagang tulong

## Pag-enable ng Debug Mode

### Mga Environment Variables
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

### Debug Configuration
```bash
# Itakda ang debug configuration sa buong sistema
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Paganahin ang trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Mga Teknik sa Pagsusuri ng Logs

### Pag-unawa sa Log Levels
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
# Salain ang mga log ayon sa antas
azd logs --level error --since 1h

# Salain ayon sa serbisyo
azd logs --service api --level debug

# I-export ang mga log para sa pagsusuri
azd logs --output json > deployment-logs.json

# I-parse ang mga JSON log gamit ang jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Iugnay ang mga log sa iba't ibang serbisyo

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Maghanap sa lahat ng serbisyo
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Maghanap ng mga log sa Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Mga Advanced na Tools sa Pag-debug

### Azure Resource Graph Queries
```bash
# Maghanap ng mga mapagkukunan gamit ang mga tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Hanapin ang mga nabigong deployment
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Suriin ang kalusugan ng mapagkukunan
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Pag-debug ng Network
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

### Pag-debug ng Container
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

### Pag-debug ng Database Connection
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

## 🔬 Pag-debug ng Performance

### Application Performance Monitoring
```bash
# Paganahin ang Application Insights debugging
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

# Pasadyang pagsubaybay sa pagganap
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

### Pagsusuri ng Resource Utilization
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

## 🧪 Pagsusuri at Pag-validate

### Pag-debug ng Integration Test
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

# Subukan ang mga health endpoint
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

# Patakbuhin ang mga pagsusuri
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Patakbuhin ang mga pasadyang pagsusuri ng integrasyon
npm run test:integration
```

### Load Testing para sa Pag-debug
```bash
# Simpleng load test upang matukoy ang mga bottleneck sa performance
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Gamit ang Apache Bench (i-install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Kunin ang mga pangunahing sukatan
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Suriin ang mga pagkabigo
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Pag-debug ng Infrastructure

### Pag-debug ng Bicep Template
```bash
# I-validate ang mga Bicep template na may detalyadong output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Pag-validate ng syntax
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Pag-validate ng lint
    az bicep lint --file "$template_file"
    
    # Ano kung deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# I-debug ang deployment ng template
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

### Pagsusuri ng Resource State
```bash
# Suriin ang mga estado ng mapagkukunan para sa mga hindi pagkakapare-pareho
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Ilista ang lahat ng mapagkukunan kasama ang kanilang mga estado
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Suriin ang mga nabigong mapagkukunan
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

### Pag-debug ng Authentication Flow
```bash
# I-debug ang Azure authentication
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

# I-debug ang access sa Key Vault
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

### Pag-debug ng Network Security
```bash
# I-debug ang mga network security group
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

### Pag-debug ng Node.js Application
```javascript
// debug-middleware.js - Express debugging middleware
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
    
    // Palitan ang res.json upang i-log ang mga tugon
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Pag-debug ng Database Query
```javascript
// database-debug.js - Mga kagamitan para sa pag-debug ng database
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

### Tugon sa Isyu sa Produksyon
```bash
#!/bin/bash
# emergency-debug.sh - Pang-emergency na pag-debug sa produksyon

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

# Kolektahin ang mahalagang impormasyon
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

### Mga Pamamaraan sa Rollback
```bash
# Mabilis na script ng pag-rollback
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Palitan ang kapaligiran
    azd env select "$environment"
    
    # I-rollback ang aplikasyon
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # I-verify ang pag-rollback
    echo "Verifying rollback..."
    azd show
    
    # Subukan ang mga kritikal na endpoint
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Mga Dashboard sa Pag-debug

### Custom Monitoring Dashboard
```bash
# Gumawa ng mga query sa Application Insights para sa pag-debug
create_debug_queries() {
    local app_insights_name=$1
    
    # Mag-query para sa mga error
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Mag-query para sa mga isyu sa pagganap
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Mag-query para sa mga pagkabigo ng dependency
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# Ipunin ang mga log mula sa iba't ibang pinagmulan
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

## 🔗 Mga Advanced na Resources

### Custom Debug Scripts
Gumawa ng `scripts/debug/` directory na may:
- `health-check.sh` - Komprehensibong pagsusuri ng kalusugan
- `performance-test.sh` - Automated na pagsusuri ng performance
- `log-analyzer.py` - Advanced na pagsusuri at pag-parse ng logs
- `resource-validator.sh` - Pag-validate ng infrastructure

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

## Mga Best Practices

1. **Laging i-enable ang debug logging** sa mga non-production environment
2. **Gumawa ng reproducible test cases** para sa mga isyu
3. **I-dokumenta ang mga pamamaraan sa pag-debug** para sa iyong team
4. **I-automate ang health checks** at monitoring
5. **Panatilihing updated ang mga debug tools** kasabay ng mga pagbabago sa iyong application
6. **Sanayin ang mga pamamaraan sa pag-debug** sa mga oras na walang insidente

## Mga Susunod na Hakbang

- [Capacity Planning](../pre-deployment/capacity-planning.md) - Planuhin ang mga kinakailangang resources
- [SKU Selection](../pre-deployment/sku-selection.md) - Pumili ng naaangkop na service tiers
- [Preflight Checks](../pre-deployment/preflight-checks.md) - Pre-deployment validation
- [Cheat Sheet](../../resources/cheat-sheet.md) - Mabilisang reference sa mga commands

---

**Tandaan**: Ang mahusay na pag-debug ay tungkol sa pagiging sistematiko, masinsinan, at matiyaga. Ang mga tools at teknik na ito ay makakatulong sa iyo na mas mabilis at mas epektibong ma-diagnose ang mga isyu.

---

**Pag-navigate**
- **Nakaraang Aralin**: [Karaniwang Isyu](common-issues.md)

- **Susunod na Aralin**: [Capacity Planning](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->