# មគ្គុទេសក៍កែតម្រូវកំហុសសម្រាប់ការដាក់ពាក្យ AZD

**ការ​ណែនាំ​ជំពូក៖**
- **📚 ទំព័រដើមវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 7 - ការជួយដោះស្រាយបញ្ហា និងកែតម្រូវកំហុស
- **⬅️ មុន​មក**: [បញ្ហាទូទៅ](common-issues.md)
- **➡️ បន្ទាប់**: [ការជួសជុលបញ្ហាផ្នែក AI](ai-troubleshooting.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 8: លំនាំផលិតកម្ម និងសហគ្រាស](../chapter-08-production/production-ai-practices.md)

## ការណែនាំ

មគ្គុទេសក៍នេះផ្ដល់នូវយុទ្ធសាស្ត្រកែតម្រូវកំហុសកម្រិតខ្ពស់ ឧបករណ៍ និងបច្ចេកទេសសម្រាប់វាយតម្លៃ និងដោះស្រាយបញ្ហាចម្រូងចម្រាស់ជាមួយការដាក់ពាក្យ Azure Developer CLI ។ សូមរៀនពីវិធីសាស្ត្រជួយដោះស្រាយបញ្ហាអោយមានប្រព័ន្ធ វិធីវិភាគកំណត់ហេតុ វិភាគប្រសិទ្ធភាព និងឧបករណ៍វាយតម្លៃកម្រិតខ្ពស់ដើម្បីដោះស្រាយបញ្ហា deployment និង runtime យ៉ាងមានប្រសិទ្ធភាព។

## គោលបំណងសិក្សា

ក្រោយពីបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹងអាច៖
- ជំនាញវិធីសាស្ត្រកែតម្រូវកំហុសមានប្រព័ន្ធសម្រាប់បញ្ហា Azure Developer CLI
- ដឹងពីការកំណត់កំណត់ហេតុដ៏ខ្ពស់ និងវិធីវិភាគកំណត់ហេតុ
- អនុវត្តប្រសិទ្ធភាពប្រសិទ្ធន៍ និងយុទ្ធសាស្ត្រតាមដាន
- ប្រើប្រាស់ឧបករណ៍ និងសេវាកម្មវាយតម្លៃរបស់ Azure សម្រាប់ដោះស្រាយបញ្ហាចម្រូងចម្រាស់
- អនុវត្តវិធីសាស្ត្រកែតម្រូវបណ្ដាញ និងជួយដោះស្រាយបញ្ញាអ្នកសុវត្ថិភាព
- កំណត់ការតាមដាន និងរោទិ៍ព្រឹត្តិការណ៍យ៉ាងទូលំទូលាយដើម្បីរកឃើញបញ្ហាមុនពេលកើតឡើង

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- អនុវត្តវិធីសាស្ត្រ TRIAGE ដើម្បីកែតម្រូវស្ថានការណ៍deployment ដែលស្មុគស្មាញយ៉ាងប្រព័ន្ធ
- កំណត់និងវិភាគព័ត៌មានកំណត់ហេតុ និងការតាមដានទាំងមូល
- ប្រើប្រាស់ Azure Monitor, Application Insights និងឧបករណ៍វាយតម្លៃយ៉ាងមានប្រសិទ្ធភាព
- ជួយស្រាយបញ្ហាការតភ្ជាប់បណ្តាញ ការផ្ទៀងផ្ទាត់ និងសិទ្ធិដោយឯករាជ្យ
- អនុវត្តការតាមដានប្រសិទ្ធភាព និងយុទ្ធសាស្ត្របង្កើនប្រសិទ្ធភាព
- បង្កើតស្ក្រីបកែតម្រូវ និងអូតូម៉ាទ័រតសម្រាប់បញ្ហាដដែលៗ

## វិធីសាស្ត្រកែតម្រូវកំហុស

### វិធីសាស្ត្រ TRIAGE
- **T**ime: បញ្ហាបានចាប់ផ្តើមពេលណា?
- **R**eproduce: តើអ្នកអាចផលិតបញ្ហាទៅវិញទៅមកបានជាប្រព័ន្ធទេ?
- **I**solate: ជាធាតុណាដែលបរាជ័យ?
- **A**nalyze: កំណត់ហេតុប្រាប់យើងថាអ្វី?
- **G**ather: ប្រមួលព័ត៌មានទាំងអស់ដែលពាក់ព័ន្ធ
- **E**scalate: ពេលណាដែលត្រូវការជំនួយបន្ថែម

## ការបើកដំណើរការជាលទ្ធផល Debug Mode

> **ដែនកំណត់៖** ទាំងនេះជាគំរូវាយតម្លៃ សម្រាប់ផ្លាស់ប្តូរ មិនមែនជាស្គ្រីបដែលបានផ្តល់ជូនទេ។ សូមផ្លាស់ប្តូរឈ្មោះ/ID របស់ធនធាន; ប្រើ Bash សម្រាប់ប្លុក shell ។ `--debug` លទ្ធផល និងតម្លៃបរិស្ថានអាចមានព័ត៌មានសំងាត់— សូមពិនិត្យ និងលុបចោលមុនចែករំលែក។ គំរូដែលដាក់ពាក្យ ដកក្រោយ ឬផ្លាស់ប្តូរការកំណត់ត្រូវការអនុវត្តដោយអ្នកប្រតិបត្តិ។

### បរិយាកាស Environment Variables
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### ការកំណត់ Debug Configuration
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` អាចរក្សាសោ arbitrary; នេះមិនមានន័យថា `debug.enabled`, `debug.logLevel` ឬ `trace.outputPath` គឺជាការកំណត់ដែលគាំទ្រ។ សូមប្រើបន្តិច `--debug` នៃពាក្យបញ្ជារដែលបានចេញផ្សាយ។

## 📊 វិធីវិភាគកំណត់ហេតុ Log Analysis Techniques

### ការយល់ដឹងពីជំហានកំណត់ហេតុ Log Levels
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### វិភាគកំណត់ហេតុដោយមានរចនាសម្ព័ន្ធ Structured Log Analysis
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

### ការតភ្ជាប់កំណត់ហេតុ Log Correlation
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

## 🛠️ ឧបករណ៍កែតម្រូវកំហុសកម្រិតខ្ពស់ Advanced Debugging Tools

### សិក្សាសំណួរលើ Azure Resource Graph Queries
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ការជួសជុលបណ្តាញ Network Debugging
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

### ការជួសជុលធុង Container Debugging
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

### ការជួសជុលការតភ្ជាប់ប្រព័ន្ធដាតាបេស Database Connection Debugging
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

## 🔬 ការជួសជុលប្រសិទ្ធភាព Performance Debugging

### ការតាមដានប្រសិទ្ធភាពកម្មវិធី Application Performance Monitoring
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

### ការវិភាគប្រើប្រាស់ធនធាន Resource Utilization Analysis
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

## 🧪 ការធ្វើតេស្ត និងផ្ទៀងផ្ទាត់ Testing and Validation

### ការជួយស្រាយបញ្ហាផ្នែកតេស្តរួម Integration Test Debugging
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

### ការធ្វើតេស្តឈរ Load Testing for Debugging
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

## 🔧 ការជួសជុលរចនាសម្ព័ន្ធ Infrastructure Debugging

### ការជួសជុលពុម្ព Bicep Template Debugging
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

### ការវិភាគស្ថានភាពធនធាន Resource State Analysis
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

## 🔒 ការជួសជុលសុវត្ថិភាព Security Debugging

### ការជួសជុលលំហូរត្រួតពិនិត្យការផ្ទៀងផ្ទាត់(Authentication Flow Debugging)
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

### ការជួសជុលសុវត្ថិភាពបណ្តាញ Network Security Debugging
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

## 📱 ការជួសជុលកម្មវិធីជាពិសេស Application-Specific Debugging

### ការជួសជុលកម្មវិធី Node.js Application Debugging
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

### ការជួសជុលសំណួរប្រព័ន្ធដាតាបេស Database Query Debugging
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

## 🚨 វិធានការជួយស្រាយបញ្ហាដោយហឺងហែរ Emergency Debugging Procedures

### និន្នាការឆ្លើយតបបញ្ហាផលិតកម្ម Production Issue Response
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

### វិធានការបង្រ្កាប Rollback Procedures
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

ការបង្រ្កាបតែមួយនេះមិនត្រូវបញ្ច្រាសរចនាសម្ព័ន្ធ មីក្រេស៊ីន្ន័យឃ្លាំង ទិន្នន័យ ឬសម្ងាត់ទេ។ សូមប្រើ worktree ស្អាត កំណត់កំណត់ចាប់ផ្តើម ហើយស្ដារ​វាឡើងវិញបន្ទាប់ពីនោះ; ពាក្យបញ្ជារនេះនឹងចាប់កំណត់(commit)ដែលបានជ្រើសនៅក្នុងបណ្ណាល័យបច្ចុប្បន្ន។

## 📊 ផ្ទាំងគ្រប់គ្រង Debugging Dashboards

### ផ្ទាំងតាមដានផ្ទាល់ខ្លួន Custom Monitoring Dashboard
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

### ការប្រមូលកំណត់ហេតុ Log Aggregation
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

## 🔗 ធនធានកម្រិតខ្ពស់ Advanced Resources

### ស្គ្រីប Debug ផ្ទាល់ខ្លួន Custom Debug Scripts
បង្កើតថត `scripts/debug/` ដែលមាន៖
- `health-check.sh` - ការត្រួតពិនិត្យសុខភាពទូលំទូលាយ
- `performance-test.sh` - ការធ្វើតេស្តប្រសិទ្ធភាពដោយស្វ័យប្រវត្តិ
- `log-analyzer.py` - វិភាគកំណត់ហេតុខ្ពស់ និងការវិភាគ
- `resource-validator.sh` - ផ្ទៀងផ្ទាត់រចនាសម្ព័ន្ធ

### ការបញ្ចូលរួម Monitoring Integration
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

## م្ជាល់ការប្រើប្រាស់ល្អ Best Practices

1. **តែងតែបើកកំណត់ហេតុកែតម្រូវកំហុស** នៅបរិយាកាសមិនមែនផលិតកម្ម
2. **បង្កើតករណីតេស្តដែលអាចផលិតឡើងវិញបាន** សម្រាប់បញ្ហា
3. **ចុះបញ្ជីវិធានការកែតម្រូវកំហុស** សម្រាប់ក្រុមរបស់អ្នក
4. **អូតូម៉ាទ័រការត្រួតពិនិត្យសុខភាព** និងតាមដាន
5. **រក្សាឧបករណ៍កែតម្រូវកំហុសឱ្យទាន់សម័យ** ជាមួយការផ្លាស់ប្តូរកម្មវិធីរបស់អ្នក
6. **ហាត់ប្រាណវិធានការកែតម្រូវកំហុស** ក្នុងរយៈពេលដែលមិនមានហេតុការណ៍

## ជំហៀងបន្ទាប់ Next Steps

- [ការធ្វើផែនការចំនុចសមត្ថភាព](../chapter-06-pre-deployment/capacity-planning.md) - ផែនការពីតម្រូវធនធាន
- [ការជ្រើសរើស SKU](../chapter-06-pre-deployment/sku-selection.md) - ជ្រើសរើសថ្នាក់សេវាដែលសមរម្យ
- [ការត្រួតពិនិត្យមុនការដាក់ពាក្យ](../chapter-06-pre-deployment/preflight-checks.md) - ការផ្ទៀងផ្ទាត់មុនការដាក់ពាក្យ
- [សន្លឹក Cheat Sheet](../../resources/cheat-sheet.md) - ពាក្យបញ្ជារយោងរហ័ស

---

**ចងចាំ**៖ វិធីសាស្ត្រកែតម្រូវកំហុសល្អគឺជារឿងដែលមានរបៀប ប្រុងប្រយ័ត្ន និងអត់ធ្មត់។ ឧបករណ៍និងបច្ចេកទេសទាំងនេះនឹងជួយអ្នកវាយតម្លៃបញ្ហាយ៉ាងលឿន និងមានប្រសិទ្ធភាពជាងមុន។

---

**ការ​ណែនាំ**
- **មុខវិជ្ជាមុន**: [បញ្ហាទូទៅ](common-issues.md)

- **មុខវិជ្ជាបន្ទាប់**: [ការធ្វើផែនការចំនុចសមត្ថភាព](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->