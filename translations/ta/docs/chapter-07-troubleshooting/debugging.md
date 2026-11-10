# AZD பயன்பாடுகளுக்கான பிழைதிருத்தும் வழிகாட்டி

**அத்தியாயச் சருகல்:**
- **📚 பாடநூல் முகப்பு**: [ஆரம்ப பயனர்களுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைபடையல் மற்றும் பிழைத்திருத்தல்
- **⬅️ முந்தைய**: [பொதுவான பிரச்சினைகள்](common-issues.md)
- **➡️ அடுத்தது**: [புலமை இயற்கை தொடர்பான பிழைத்திருத்தல்](ai-troubleshooting.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவுகள்](../chapter-08-production/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI பயன்பாடுக்களில் உள்ள சிக்கலான பிரச்சினைகளை கண்டறிந்து தீர்ப்பதற்கான மேம்பட்ட பிழைத்திருத்து நுட்பங்கள், கருவிகள் மற்றும் முறைகளை வழங்குகிறது. கட்டமைக்கப்பட்ட பிழைத்திருத்து முறைமைகள், பதிவு பகுப்பாய்வு நுட்பங்கள், செயல்திறன் கண்காணித்தல் மற்றும் மேம்பட்ட உளாங்கல் கருவிகளை கற்கவும்.

## கற்கும் இலக்குகள்

இந்த வழிகாட்டியை முடித்தவுடன் நீங்கள்:
- Azure Developer CLI பிரச்சினைகளுக்கு கட்டமைக்கப்பட்ட பிழைத்திருத்து முறைகளை கற்று கொள்ளுவீர்கள்
- மேம்பட்ட பதிவு கட்டமைப்பு மற்றும் பதிவு பகுப்பாய்வு நுட்பங்களை புரிந்துகொள்ளுவீர்கள்
- செயல்திறன் கண்காணித்தல் மற்றும் மேம்பாட்டு திட்டங்களை அமல்படுத்துவீர்கள்
- சிக்கலான பிரச்சினைகளை தீர்க்க Azure உளாங்கல் கருவிகள் மற்றும் சேவைகளை பயன்படுத்துவீர்கள்
- நெட்வொர்க் பிழைத்திருத்தல் மற்றும் பாதுகாப்பு சம்பந்தமான நுட்பங்களை பயன்படுத்துவீர்கள்
- குறிக்கால சிரமங்களை முன்கூட்டியே கண்டறிவதற்கான கண்காணிப்பு மற்றும் முன்கூட்டும் அறிவிப்பு அமைப்புகளை அமைப்பீர்கள்

## கற்கும் முடிவுகள்

முடிந்ததும் நீங்கள் முடியும்:
- சிக்கலான பயன்பாட்டுப் பிரச்சினைகளை கட்டமைக்கப்பட்ட முறையில் TRIAGE முறையை பயன்படுத்தி பிழைத்திருத்து செய்ய
- முழுமையான பதிவு மற்றும் தடம் தகவல்களை அமைத்து பகுப்பாய்வு செய்ய
- Azure Monitor, Application Insights மற்றும் உளாங்கல் கருவிகளை சிறப்பாகப் பயன்படுத்த
- நெட்வொர்க் இணைப்பு, அங்கீகாரம் மற்றும் அனுமதி பிரச்சினைகளை தனியாக பிழைத்திருத்து செய்ய
- செயல்திறன் கண்காணித்தல் மற்றும் யோசனைகளை அமல்படுத்த
- மறு நிகழும் பிரச்சினைகளுக்கு தனிப்பயனான பிழைத்திருத்து ஸ்கிரிப்ட்கள் மற்றும் தானியங்கி முறைகள் உருவாக்க

## பிழைத்திருத்து முறைமைகள்

### TRIAGE அணுகுமுறை
- **T**ime (நேரம்): பிரச்சினை எப்போது தொடங்கியது?
- **R**eproduce (மறு நிகழ்த்தல்): இதை தொடர்ச்சியாக உருவாக்க முடியுமா?
- **I**solate (பிரிவாகேடுத்து): எந்த கூறு தோல்வியடைகிறது?
- **A**nalyze (பகுப்பாய்வு): பதிவுகள் என்ன கூறுகின்றன?
- **G**ather (இணைத்தல்): அனைத்து தொடர்புடைய தகவலையும் சேகரிக்கவும்
- **E**scalate (மேலிடுதல்): எப்போது மேலதிக உதவி தேவை

## பிழைத்திருத்து நிலையில் செலுத்துதல்

> **பரப்பு:** இவை பயன்படுத்த தகுந்த உளாங்கல் உதாரணங்கள்; வழக்கமாக வழங்கப்படும் ஸ்கிரிப்ட்கள் அல்ல. வளத்தினை பெயர்கள்/IDs மாற்றவும்; ஷெல் தொகுக்கைக்காக பாஷ் பயன்படுத்தவும். `--debug` வெளியீடு மற்றும் சுற்றுச்சூழல் மதிப்புகள் உணர்வு தகவல்களை கொண்டிருக்கலாம்—பகிர்வதற்கு முன் அவற்றை சரிபார்த்து/அதிரவியுங்கள். குறியீடு இயக்கு, மீண்டும் திருப்புக அல்லது கட்டமைப்பை மாற்றக்கூடிய உதாரணங்கள் இயக்குனர் அனுமதியைத் தேவைபடுத்தும்.

### சுற்றுச்சூழல் மாறிலிகள்
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### பிழைத்திருத்து அமைப்பு
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` யில் எச்சிலமான விசைகளை சேமிக்கலாம்; இது `debug.enabled`, `debug.logLevel`, அல்லது `trace.outputPath` ஆதரவு அமைப்புகள் என்பது அல்ல. வெளியிடப்பட்ட கட்டளையின் `--debug` காட்டு சின்னியைப் பயன்படுத்தவும்.

## 📊 பதிவு பகுப்பாய்வு நுட்பங்கள்

### பதிவு மட்டங்கள் புரிதல்
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### கட்டமைக்கப்பட்ட பதிவு பகுப்பாய்வு
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

### பதிவு தொடர்பு
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

## 🛠️ மேம்பட்ட பிழைத்திருத்து கருவிகள்

### Azure வள வரைவுப் பட்டியல் கேள்விகள்
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### நெட்வொர்க் பிழைத்திருத்தல்
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

### கொண்டெய்னர் பிழைத்திருத்தல்
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

### தரவுத்தளம் இணைப்பு பிழைத்திருத்தல்
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

## 🔬 செயல்திறன் பிழைத்திருத்தல்

### பயன்பாட்டு செயல்திறன் கண்காணித்தல்
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

### வள பயன்பாடு பகுப்பாய்வு
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

## 🧪 சோதனை மற்றும் சரிபார்ப்பு

### ஒருங்கிணைப்பு சோதனை பிழைத்திருத்தல்
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

### ஓட்டம் சோதனை பிழைத்திருத்தல்
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

## 🔧 கட்டமைப்பு பிழைத்திருத்தல்

### பைசெப் டெம்பிளேட் பிழைத்திருத்தல்
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

### வள நிலைமை பகுப்பாய்வு
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

## 🔒 பாதுகாப்பு பிழைத்திருத்தல்

### அங்கீகாரரோடு தொடர்பான பிழைத்திருத்தல்
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

### நெட்வொர்க் பாதுகாப்பு பிழைத்திருத்தல்
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

## 📱 பயன்பாட்டுப் தனிப்பட்ட பிழைத்திருத்தல்

### Node.js பயன்பாட்டு பிழைத்திருத்தல்
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

### தரவுத்தளம் கேள்வி பிழைத்திருத்தல்
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

## 🚨 அவசர பிழைத்திருத்தல் செயல்முறைகள்

### உற்பத்தி பிரச்சினை பதிலளிப்பு
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

### மீளுருவாக்கும் செயல்முறைகள்
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

இந்த குறியீடு மட்டுமே மீளுருவாக்கல் கட்டமைப்புக்களை, தரவுத்தள மாற்றங்களை அல்லது இரகசியங்களை மாற்றாது. சுத்தமான வேலைதோட்டம் பயன்படுத்தவும், தொடக்க கமிட்டைப் பதிவு செய்து அப்படியே மீட்டமைக்கவும்; கட்டளை தற்போதைய சேமிப்பகத்தில் தேர்ந்தெடுத்த கமிட்டை எடுக்கிறது.

## 📊 பிழைத்திருத்து அறைகள்

### தனிப்பயன் கண்காணிப்பு அறை
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

### பதிவு ஒன்றிணைப்பு
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

## 🔗 மேம்பட்ட வளங்கள்

### தனிப்பயன் பிழைத்திருத்து ஸ்கிரிப்ட்கள்
ஒரு `scripts/debug/` அடைவு உருவாக்கவும்:
- `health-check.sh` - முழுமையான ஆரோக்கியச் சோதனைகள்
- `performance-test.sh` - தானியங்கி செயல்திறன் சோதனை
- `log-analyzer.py` - மேம்பட்ட பதிவு பகுப்பாய்வு மற்றும் பகுப்பாய்வு
- `resource-validator.sh` - கட்டமைப்பு சரிபார்ப்பு

### கண்காணிப்பு ஒருங்கிணைப்பு
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

## சிறந்த பழக்கவழக்கங்கள்

1. **பயன்பாட்டுக்கு வெளியான சூழல்களில் பிழைத்திருத்து பதிவுகளை நிச்சயமாக இயக்கவும்**
2. **பிரச்சினைகளுக்கான மறுபடியும் உருவாக்கக்கூடிய சோதனை வழக்குகள் உருவாக்கவும்**
3. **உங்கள் குழுவிற்கான பிழைத்திருத்து செயல்முறைகளை ஆவணப்படுத்தவும்**
4. **ஆரோக்கியச் சோதனைகள் மற்றும் கண்காணிப்புகளை தானியக்கமாக்கவும்**
5. **உங்கள் பயன்பாட்டுத் திருத்தங்களுடன் பிழைத்திருத்து கருவிகளை புதுப்பித்து வைத்திருங்கள்**
6. **சிக்கல்கள் இல்லாத நேரங்களில் பிழைத்திருத்து செயல்முறைகளைப் பயிற்சி செய்யவும்**

## அடுத்த படிகள்

- [மிகுவை திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - வள தேவைகளை திட்டமிடல்
- [SKU தேர்வு](../chapter-06-pre-deployment/sku-selection.md) - ஏற்ற சேவை நிலைகளைத் தேர்வு செய்யவும்
- [முந்தைய பரிசோதனைகள்](../chapter-06-pre-deployment/preflight-checks.md) - முந்தைய பயன்பாட்டு மதிப்பீடு
- [சீட் சுருக்கம்](../../resources/cheat-sheet.md) - அதிவேக குறிப்பு கட்டளைகள்

---

**கூடுதலாக நினைவில் வைத்துக் கொள்ளவும்**: நல்ல பிழைத்திருத்து என்பது கட்டமைக்கப்பட்ட, முழுமையான மற்றும் பொறுமையானது ஆகும். இந்த கருவிகள் மற்றும் நுட்பங்கள் உங்களுக்கு பிரச்சினைகளை வேகமாகவும் சிறப்பாகவும் கண்டறிவதில் உதவும்.

---

**சருகல்**
- **முந்தைய பாடம்**: [பொதுவான பிரச்சினைகள்](common-issues.md)

- **அடுத்த பாடம்**: [மிகுவை திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->