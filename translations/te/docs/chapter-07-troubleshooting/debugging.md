# AZD డిప్లాయ్‌మెంట్ల కోసం డీబగ్గింగ్ గైడ్

**Chapter Navigation:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [సామాన్య సమస్యలు](common-issues.md)
- **➡️ Next**: [AI-స్పెసిఫిక్ ట్రబుల్షూటింగ్](ai-troubleshooting.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI డిప్లాయ్‌మెంట్లతో సంబంధం ఉన్న సంక్లిష్ట సమస్యలను గుర్తించడానికి మరియు పరిష్కరించడానికి ఉన్న ఆధునిక డీబగ్గింగ్ వ్యూహాలు, సాధనాలు మరియు సాంకేతికాల గురించి వివరిస్తుంది. వ్యవస్థాత్మక ట్రబుల్షూటింగ్ పద్ధతులు, లాగ్ విశ్లేషణ సాంకేతికతలు, పనితీరు ప్రొఫైల్ చేయడం మరియు అధునాతన నిర్ధారణ సాధనాలు నేర్చుకుని డిప్లాయ్‌మెంట్ మరియు రన్‌టైమ్ సమస్యలను సమర్థవంతంగా పరిష్కరించండి.

## అధ్యయన లక్ష్యాలు

ఈ గైడ్ పూర్తి చేయడంవల్ల మీరు:
- Azure Developer CLI సమస్యల కోసం వ్యవస్థాత్మక డీబగ్గింగ్ పద్ధతులను నేర్చుకోవడం
- అధునాతన లాగింగ్ కాన్ఫిగరేషన్ మరియు లాగ్ విశ్లేషణ సాంకేతికతలను అవగాహన చేయడం
- పనితీరు ప్రొఫైలింగ్ మరియు మానిటరింగ్ వ్యూహాలను అమలు చేయడం
- సంక్లిష్ట సమస్య పరిష్కారానికి Azure డయాగ్నొస్టిక్ టూల్స్ మరియు సేవలను ఉపయోగించడం
- నెట్‌వర్క్ డీబగ్గింగ్ మరియు భద్రత ట్రబుల్షూటింగ్ సాంకేతికతలను వర్తింపజేయడం
- ప్రాక్టివ్ సమస్య గుర్తింపుకు సమగ్ర మానిటరింగ్ మరియు అలర్టింగ్ కాన్ఫిగరేషన్ చేయడం

## అభ్యాస ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- సంక్లిష్ట డిప్లాయ్‌మెంట్ సమస్యలను వ్యవస్థాత్మకంగా డీబగ్ చేయడానికి TRIAGE విధానాన్ని వర్తింపజేయండి
- సమగ్ర లాగింగ్ మరియు ట్రేసింగ్ సమాచారం కాన్ఫిగర్ చేయడం మరియు విశ్లేషించడం
- Azure Monitor, Application Insights మరియు డయాగ్నొస్టిక్ టూల్స్‌ను సమర్థంగా ఉపయోగించండి
- నెట్‌వర్క్ కనెక్టివిటీ, ఆథెంటికేషన్ మరియు అనుమతి సమస్యలను స్వతంత్రంగా డీబగ్ చేయండి
- పనితీరు మానిటరింగ్ మరియు ఆప్టిమైజేషన్ వ్యూహాలను అమలు చేయండి
- పునరావృత సమస్యల కోసం కస్టమ్ డీబగ్గింగ్ స్క్రిప్ట్స్ మరియు ఆటోమేషన్ సృష్టించండి

## డీబగ్గింగ్ విధానం

### The TRIAGE Approach
- **T**ime: When did the issue start?
- **R**eproduce: Can you consistently reproduce it?
- **I**solate: What component is failing?
- **A**nalyze: What do the logs tell us?
- **G**ather: Collect all relevant information
- **E**scalate: When to seek additional help

## డీబగ్ మోడ్‌ను ఎనేబుల్ చేయడం

### Environment Variables
```bash
# సమగ్ర డీబగ్గింగ్‌ను ప్రారంభించండి
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI డీబగ్గింగ్
export AZURE_CLI_DIAGNOSTICS=true

# శుభ్రమైన అవుట్‌పుట్ కోసం టెలిమెట్రీని నిలిపివేయండి
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# డీబగ్ కాన్ఫిగరేషన్‌ను గ్లోబల్‌గా సెట్ చేయండి
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ట్రేస్ లాగింగ్‌ను సక్రియం చేయండి
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 లాగ్ విశ్లేషణ సాంకేతికతలు

### లాగ్ స్థాయిలను అవగాహన చేసుకోవడం
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### స్ట్రక్చర్డ్ లాగ్ విశ్లేషణ
```bash
# Azure Monitor ద్వారా లాగ్‌లను వీక్షించండి (azd monitor ద్వారా)
azd monitor --logs

# అప్లికేషన్ లాగ్‌లను నిజసమయంలో వీక్షించండి
azd monitor --live

# వివరమైన లాగ్ విశ్లేషణ కోసం, మీ App Service లేదా Container App తో Azure CLI ఉపయోగించండి:
# App Service లాగ్‌లు
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App లాగ్‌లు
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# విశ్లేషణ కోసం Application Insights లాగ్‌లను ఎగుమతి చేయండి
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### లాగ్ కోరిలేషన్
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ఉపయోగించి సేవల మధ్య లాగ్‌లను సమన్వయపరచడం

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insightsలో సంబంధిత లాగ్‌లను శోధించండి
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure కార్యాచరణ లాగ్‌లను శోధించండి
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ అధునాతన డీబగ్గింగ్ టూల్స్

### Azure Resource Graph Queries
```bash
# ట్యాగ్‌ల ద్వారా వనరులను శోధించండి
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# విఫలమైన డిప్లాయ్‌మెంట్లను కనుగొనండి
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# వనరుల ఆరోగ్యాన్ని తనిఖీ చేయండి
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### నెట్‌వర్క్ డీబగ్గింగ్
```bash
# సర్వీసుల మధ్య కనెక్టివిటీని పరీక్షించండి
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

# ఉపయోగం
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### కంటైనర్ డీబగ్గింగ్
```bash
# కంటైనర్ యాప్ సమస్యలను డీబగ్గ్ చేయండి
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

### డేటాబేస్ కనెక్షన్ డీబగ్గింగ్
```bash
# డేటాబేస్ కనెక్టివిటీని డీబగ్ చేయండి
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

## 🔬 పనితీరు డీబగ్గింగ్

### అప్లికేషన్ పనితీరు మానిటరింగ్
```bash
# Application Insights డీబగ్గింగ్‌ను సక్రియం చేయండి
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

# అనుకూల పనితీరు పర్యవేక్షణ
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

### రిసోర్సు వినియోగ విశ్లేషణ
```bash
# వనరుల వినియోగాన్ని పర్యవేక్షించండి
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

## 🧪 పరీక్ష మరియు ధృవీకరణ

### ఇంటిగ్రేషన్ టెస్ట్ డీబగ్గింగ్
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# డీబగ్గింగ్ పర్యావరణాన్ని సెట్ చేయండి
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# సేవా ఎండ్‌పాయింట్లను పొందండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ఆరోగ్య ఎండ్‌పాయింట్లను పరీక్షించండి
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

# పరీక్షలను నడపండి
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# కస్టమ్ ఇంటిగ్రేషన్ పరీక్షలను నడపండి
npm run test:integration
```

### లోడ్ టెస్టింగ్ ఫర్ డీబగ్గింగ్
```bash
# పనితీరు అడ్డంకులను గుర్తించడానికి సరళమైన లోడ్ పరీక్ష
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ఉపయోగించడం (ఇన్‌స్టాల్: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ప్రధాన మెట్రిక్స్‌ను ఎక్స్‌ట్రాక్ట్ చేయండి
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # విఫలాల కోసం తనిఖీ చేయండి
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ఇన్‌ఫ్రాస్ట్రక్చర్ డీబగ్గింగ్

### Bicep టెంప్లేట్ డీబగ్గింగ్
```bash
# వివరమైన అవుట్‌పుట్‌తో Bicep టెంప్లేట్లను ధృవీకరించండి
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # సింటాక్స్ ధృవీకరణ
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # లింట్ ధృవీకరణ
    az bicep lint --file "$template_file"
    
    # What-if డిప్లాయ్‌మెంట్
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# టెంప్లేట్ డిప్లాయ్‌మెంట్‌ను డీబగ్ చేయండి
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

### రిసోర్స్ స్థితి విశ్లేషణ
```bash
# అసమంజసతల కోసం వనరుల స్థితులను విశ్లేషించండి
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # అన్ని వనరులను వాటి స్థితులతో జాబితా చేయండి
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # విఫలమైన వనరుల కోసం తనిఖీ చేయండి
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

## 🔒 భద్రత డీబగ్గింగ్

### ఆథెంటికేషన్ ఫ్లో డీబగ్గింగ్
```bash
# Azure ప్రామాణీకరణను డీబగ్ చేయండి
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT టోకెన్‌ను డీకోడ్ చేయండి (jq మరియు base64 అవసరం)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault ప్రవేశాన్ని డీబగ్ చేయండి
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

### నెట్‌వర్క్ సెక్యూరిటీ డీబగ్గింగ్
```bash
# నెట్‌వర్క్ భద్రతా గుంపులను డీబగ్ చేయండి
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # భద్రతా నియమాలను తనిఖీ చేయండి
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 అప్లికేషన్-స్పెసిఫిక్ డీబగ్గింగ్

### Node.js అప్లికేషన్ డీబగ్గింగ్
```javascript
// debug-middleware.js - Express డీబగ్గింగ్ మిడిల్వేర్
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // అభ్యర్థన వివరాలను లాగ్ చేయండి
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json ను ఓవర్‌రైడ్ చేసి స్పందనలను లాగ్ చేయండి
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### డేటాబేస్ క్వెరీ డీబగ్గింగ్
```javascript
// database-debug.js - డేటాబేస్ డీబగ్గింగ్ ఉపకరణాలు
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

## 🚨 అత్యవసర డీబగ్గింగ్ ప్రక్రియలు

### ప్రొడక్షన్ సమస్య స్పందన
```bash
#!/bin/bash
# emergency-debug.sh - అత్యవసర ఉత్పత్తి డీబగ్గింగ్

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

# సరైన పర్యావరణానికి మార్చండి
azd env select "$ENVIRONMENT"

# ముఖ్యమైన సమాచారాన్ని సేకరించండి
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# లోపాల లాగ్‌ల కోసం Azure Monitor ఉపయోగించండి
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

### రోల్‌బ్యాక్ ప్రక్రియలు
```bash
# త్వరిత రోల్‌బ్యాక్ స్క్రిప్ట్
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # పరిసరాన్ని మార్చడం
    azd env select "$environment"
    
    # Git ఉపయోగించి రోల్‌బ్యాక్ (AZDలో బిల్ట్-ఇన్ రోల్‌బ్యాక్ లేదు)
    git checkout "$previous_commit"
    azd deploy
    
    # రోల్‌బ్యాక్‌ను ధృవీకరించండి
    echo "Verifying rollback..."
    azd show
    
    # ముఖ్యమైన ఎండ్‌పాయింట్లను పరీక్షించండి
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 డీబగ్గింగ్ డాష్‌బోర్డ్స్

### కస్టమ్ మానిటరింగ్ డాష్‌బోర్డు
```bash
# డీబగ్గింగ్ కోసం Application Insights క్వెరీలు సృష్టించండి
create_debug_queries() {
    local app_insights_name=$1
    
    # లోపాల కోసం క్వెరీ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # పనితీరు సమస్యల కోసం క్వెరీ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # డిపెండెన్సీ విఫలతల కోసం క్వెరీ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### లాగ్ ఏగ్రిగేషన్
```bash
# అనేక Azure మూలాల నుండి లాగ్‌లను సమీకరించండి
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

## 🔗 అధునాతన వనరులు

### కస్టమ్ డీబగ్గింగ్ స్క్రిప్ట్స్
Create a `scripts/debug/` directory with:
- `health-check.sh` - సమగ్ర ఆరోగ్య తనిఖీలు
- `performance-test.sh` - ఆటోమేటెడ్ పనితీరు పరీక్షలు
- `log-analyzer.py` - అధునాతన లాగ్ పార్సింగ్ మరియు విశ్లేషణ
- `resource-validator.sh` - ఇన్‌ఫ్రాస్ట్రక్చర్ ధృవీకరణ

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

## ఉత్తమ విధానాలు

1. **నాన్-ప్రొడక్షన్ వాతావరణాలలో ఎల్లప్పుడూ డీబగ్ లాగింగ్‌ను ఎనేబుల్ చేయండి**
2. **సమస్యల కొరకు పునరుత్పాదక టెస్ట్ కేసులను సృష్టించండి**
3. **మీ బృందం కోసం డీబగ్గింగ్ ప్రక్రియలను డాక్యుమెంట్ చేయండి**
4. **ఆరోగ్య తనిఖీలు మరియు మానిటరింగ్‌ను ఆటోమేటు చేయండి**
5. **డీబగ్గింగ్ టూల్స్‌ను మీ అప్లికేషన్ మార్పులతో అప్డేట్ చేయచూసుకోండి**
6. **నాన్-ఇన్సిడెంట్ సమయంలో డీబగ్గింగ్ ప్రక్రియలను ప్రాక్టిస్ చేయండి**

## తదుపరి చర్యలు

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - రిసోర్స్ అవసరాలను ప్లాన్ చేయండి
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - సరైన సర్వీస్ టియర్‌లను ఎంచుకోండి
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - డిప్లాయ్‌మెంట్ ముందు ధ్రువీకరణ
- [Cheat Sheet](../../resources/cheat-sheet.md) - వేగవంతమైన సూచన కమాండ్లు

---

**జ్ఞాపకం పెట్టుకోండి**: మంచి డీబగ్గింగ్ అనేది వ్యవస్థాత్మకంగా, సమగ్రంగా మరియు పనికట్టుగా ఉండటం. ఈ టూల్స్ మరియు సాంకేతికతలు సమస్యలను వేగంగా మరియు ప్రభావవంతంగా గుర్తించడంలో మీకు సహాయపడతాయి.

---

**Navigation**
- **Previous Lesson**: [సామాన్య సమస్యలు](common-issues.md)

- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
అస్పష్టం (Disclaimer):
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మనము ఖచ్చితత్వానికి విలక్షణ శ్రద్ధ చూపించినప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా అసంపూర్ణతలు ఉండే అవకాశం ఉంటుందన్న విషయాన్ని దయచేసి గుర్తుంచుకోండి. మూల పత్రాన్ని దాని స్థానిక భాషలోని ప్రామాణిక వనరుగా పరిగణించాలి. కీలక సమాచారం కోసం వృత్తిపరమైన మానవ అనువాదం అవసరమని సిఫార్సు చేస్తున్నాము. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పు భావనల కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->