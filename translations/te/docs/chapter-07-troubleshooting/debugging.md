# AZD డిప్లాయ్‌మెంట్ల కోసం డీబగ్గింగ్ గైడ్

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకోసం](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 7 - సమస్య పరిష్కారం & డీబగ్గింగ్
- **⬅️ గతం**: [సాధారణ సమస్యలు](common-issues.md)
- **➡️ తరువాత**: [AI ప్రత్యేక సమస్య పరిష్కారం](ai-troubleshooting.md)
- **🚀 తరువాత అధ్యాయం**: [అధ్యాయం 8: ఉత్పత్తి & ఎంటర్ప్రైజ్ నమూనాలు](../chapter-08-production/production-ai-practices.md)

## పరిచయం

ఈ సమగ్ర గైడ్ అనేక సంక్లిష్టమైన Azure Developer CLI డిప్లాయ్‌మెంట్‌ల సమస్యలను నిర్ధారణ చేయడం మరియు పరిష్కరించేందుకు అధునాతన డీబగ్గింగ్ వ్యూహాలు, పరికరాలు మరియు సాంకేతికతలను అందిస్తుంది. వ్యస్థాబద్ధమైన సమస్య పరిష్కారం విధానాలు, లాగ్ విశ్లేషణ సాంకేతికతలు, పనితీరు ప్రొఫైలింగ్ మరియు అధునాతన నిర్ధారణ పరికరాలను నేర్చుకుని డిప్లాయ్‌మెంట్ మరియు రన్‌టైమ్ సమస్యలను సమర్థవంతంగా పరిష్కరించండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

ఈ గైడ్ పూర్తి చేయడం ద్వారా మీరు:
- Azure Developer CLI సమస్యల కోసం వ్యస్థాబద్ధమైన డీబగ్గింగ్ విధానాలను ఆర్జించుకుంటారు
- అధునాతన లాగింగ్ కాన్ఫిగరేషన్ మరియు లాగ్ విశ్లేషణ సాంకేతికతలను అర్థం చేసుకుంటారు
- పనితీరు ప్రొఫైలింగ్ మరియు మానిటరింగ్ వ్యూహాలను అమలు చేస్తారు
- సంక్లిష్ట సమస్య పరిష్కారం కోసం Azure నిర్ధారణ పరికరాలు మరియు సేవలను ఉపయోగిస్తారు
- నెట్వర్క్ డీబగ్గింగ్ మరియు భద్రత సమస్య పరిష్కారం సాంకేతికతలను వర్తింపజేస్తారు
- ముందు జాగ్రత్తగా సమస్య గుర్తింపు కోసం సమగ్ర మానిటరింగ్ మరియు అలెర్టింగ్‌ను కంఫిగర్ చేస్తారు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తరువాత, మీరు చేయగలుగుతారు:
- సంక్లిష్ట డిప్లాయ్‌మెంట్ సమస్యలను వ్యస్థాబద్ధంగా TRIAGE పద్ధతిని వర్తింపజేయండి
- సమగ్ర లాగింగ్ మరియు ట్రేసింగ్ సమాచారాన్ని కంఫిగర్ చేసి విశ్లేషించండి
- Azure మానిటర్, అప్లికేషన్ ఇన్సైట్స్, మరియు నిర్ధారణ పరికరాలను సమర్థవంతంగా ఉపయోగించండి
- నెట్వర్క్ కనెక్టివిటీ, ఆథెంటికేషన్ మరియు అనుమతి సమస్యలను స్వతంత్రంగా డీబగ్గ్ చేయండి
- పనితీరు మానిటరింగ్ మరియు ఆప్టిమైజేషన్ వ్యూహాలను అమలు చేయండి
- పునరావృత సమస్యల కోసం కస్టమ్ డీబగ్గింగ్ స్క్రిప్టులు మరియు ఆటోమేషన్ సృష్టించండి

## డీబగ్గింగ్ విధానాలు

### TRIAGE దృష్టికోణం
- **T** సమయం: సమస్య ఎప్పుడూ ప్రారంభమైంది?
- **R** పునరుత్పత్తి: మీరు దాన్ని స్థిరంగా పునరుత్పత్తి చేయగలరా?
- **I** విడగొట్టు: ఏ భాగం విఫలమవుతోంది?
- **A** విశ్లేషించు: లాగ్లు ఏం చెబుతున్నాయి?
- **G** సేకరించు: సంబంధిత సమాచారాన్ని సేకరించు
- **E** పెంపొందించు: అదనపు సహాయం ఎప్పుడు కోరుకోవాలి

## డీబగ్ మోడ్ ప్రారంభించుట

> **వ్యాప్తి:** ఇవి అనుకూలపరచు నిర్ధారణ ఉదాహరణలు; అందించిన స్క్రిప్ట్ సూట్ కాదు. వనరుల పేర్లు/IDలను మార్చండి; షెల్ బ్లోక్స్ కోసం Bash ఉపయోగించండి. `--debug` అవుట్పుట్ మరియు పర్యావరణ విలువల్లో సున్నితమైన సమాచారాలు ఉండవచ్చు—పంపకం ముందు సమీక్షించండి/సవరించండి. డిప్లాయ్, రోల్ బ్యాక్ చేయడం లేదా కాన్ఫిగరేషన్ మార్చే ఉదాహరణలకోసం స్పష్టమైన ఆపరేటర్ ఆమోదం అవసరం.

### పర్యావరణ చలక్స్
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### డీబగ్ కాన్ఫిగరేషన్
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` ఏదైనా కీస్ నిల్వ చేయవచ్చు; ఇది `debug.enabled`, `debug.logLevel` లేదా `trace.outputPath` మద్దతు ఉన్న సెట్టింగ్స్ అవ్వవు. విడుదలైన కమాండ్ యొక్క `--debug` ఫ్లాగ్ ను ఉపయోగించండి.

## 📊 లాగ్ విశ్లేషణ సాంకేతికతలు

### లాగ్ స్థాయిలర్ను అర్థం చేసుకోండి
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### నిర్మిత లాగ్ విశ్లేషణ
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

### లాగ్ సంబంధం
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

## 🛠️ అధునాతన డీబగ్గింగ్ పరికరాలు

### Azure రిసోర్స్ గ్రాఫ్ క్వెరీస్
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### నెట్‌వర్క్ డీబగ్గింగ్
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

### కంటైనర్ డీబగ్గింగ్
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

### డేటాబేస్ కనెక్షన్ డీబగ్గింగ్
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

## 🔬 పనితీరు డీబగ్గింగ్

### అప్లికేషన్ పనితీరు మానిటరింగ్
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

### వనరు వినియోగ విశ్లేషణ
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

## 🧪 పరీక్ష మరియు ధృవీకరణ

### ఇంటిగ్రేషన్ టెస్ట్ డీబగ్గింగ్
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

### డీబగ్గింగ్ కోసం లోడ్ టెస్టింగ్
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

## 🔧 మౌలిక సదుపాయాల డీబగ్గింగ్

### బైసెప్ టెంప్లేట్ డీబగ్గింగ్
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

### వనరు స్థితి విశ్లేషణ
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

## 🔒 భద్రత డీబగ్గింగ్

### ఆథెంటికేషన్ ఫ్లో డీబగ్గింగ్
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

### నెట్‌వర్క్ భద్రత డీబగ్గింగ్
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

## 📱 అప్లికేషన్ ప్రత్యేక డీబగ్గింగ్

### Node.js అప్లికేషన్ డీబగ్గింగ్
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

### డేటాబేస్ క్వెరీ డీబగ్గింగ్
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

## 🚨 అత్యవసర డీబగ్గింగ్ ప్రక్రియలు

### ఉత్పత్తి సమస్య స్పందన
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

### రోల్ బ్యాక్ ప్రక్రియలు
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

ఈ కోడ్-కేవలం రోల్ బ్యాక్ మౌలిక సదుపాయాలు, డేటాబేస్ మైగ్రేషన్లు లేదా సీక్రెట్లు తిరుగుదల చేయదు. ఒక శుభ్రమైన వర్క్‌ట్రీ ఉపయోగించండి, ప్రారంభ కమిట్‌ను నమోదు చేసి తరువాత దాన్ని పునరుద్ధరించండి; ఈ కమాండ్ ప్రస్తుత రిపాజిటరీలో ఎంచుకున్న కమిట్‌ను చెక్‌ఔట్ చేస్తుంది.

## 📊 డీబగ్గింగ్ డ్యాష్‌బోర్డ్లు

### కస్టమ్ మానిటరింగ్ డ్యాష్‌బోర్డు
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

### లాగ్ సమీకరణ
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

## 🔗 అధునాతన వనరులు

### కస్టమ్ డీబగ్ స్క్రిప్టులు
క్రింది అంశాలతో `scripts/debug/` డైరెక్టరీని సృష్టించండి:
- `health-check.sh` - సమగ్ర ఆరోగ్య తనిఖీలు
- `performance-test.sh` - ఆటోమేటెడ్ పనితీరు పరీక్షలు
- `log-analyzer.py` - అధునాతన లాగ్ పార్సింగ్ మరియు విశ్లేషణ
- `resource-validator.sh` - మౌలిక సదుపాయాల ధృవీకరణ

### మానిటరింగ్ ఇంటిగ్రేషన్
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

## ఉత్తమ ప్రవర్తనలు

1. **అధికారం లేని వాతావరణాలలో ఎప్పుడూ డీబగ్ లాగింగ్ ప్రారంభించండి**
2. **సమస్యల కోసం పునరుత్పత్తి చేసుకోగల టెస్ట్ కేసులు సృష్టించండి**
3. **మీ బృందం కోసం డీబగ్గింగ్ ప్రక్రియలను డాక్యుమెంట్ చేయండి**
4. **ఆరోగ్య తనిఖీలు మరియు మానిటరింగ్ ఆటోమేట్ చేయండి**
5. **మీ అప్లికేషన్ మార్పులకు అనుగుణంగా డీబగ్గింగ్ పరికరాలను అప్డేట్ చేయండి**
6. **సాధారణ కాలాల్లో డీబగ్గింగ్ ప్రక్రియలను శిక్షణపై చేర్చండి**

## తదుపరి దశలు

- [క్యాపాసిటీ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md) - వనరు అవసరాలను ప్రణాళిక చేయండి
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సరైన సేవా స్థాయిలను ఎంచుకోండి
- [ప్రీఫ్లైట్ తనిఖీలు](../chapter-06-pre-deployment/preflight-checks.md) - డిప్లాయ్‌మెంట్ ముందస్తు ధృవీకరణ
- [చీట్ షీట్](../../resources/cheat-sheet.md) - త్వరిత సూచన కమాండ్లు

---

**గమనిక**: మంచి డీబగ్గింగ్ అనేది వ్యస్థాబద్ధంగా, సమగ్రంగా మరియు ఓర్పుతో ఉండాలి. ఈ పరికరాలు మరియు సాంకేతికతలు సమస్యలను వేగంగా మరియు సమర్థవంతంగా గుర్తించడంలో సహాయ పడతాయి.

---

**నావిగేషన్**
- **గత పాఠం**: [సాధారణ సమస్యలు](common-issues.md)

- **తదుపరి పాఠం**: [క్యాపాసిటీ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->