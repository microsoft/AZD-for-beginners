<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-25T08:22:45+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "te"
}
-->
# AZD డిప్లాయ్‌మెంట్‌ల కోసం డీబగింగ్ గైడ్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ఫర్ బిగినర్స్](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 7 - సమస్యల పరిష్కారం & డీబగింగ్
- **⬅️ ముందు**: [సాధారణ సమస్యలు](common-issues.md)
- **➡️ తదుపరి**: [AI-స్పెసిఫిక్ సమస్యల పరిష్కారం](ai-troubleshooting.md)
- **🚀 తదుపరి చాప్టర్**: [చాప్టర్ 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ ప్యాటర్న్స్](../microsoft-foundry/production-ai-practices.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI డిప్లాయ్‌మెంట్‌లలో కాంప్లెక్స్ సమస్యలను గుర్తించడం మరియు పరిష్కరించడానికి అధునాతన డీబగింగ్ వ్యూహాలు, టూల్స్, మరియు సాంకేతికతలను అందిస్తుంది. వ్యవస్థీకృత సమస్యల పరిష్కారం పద్ధతులు, లాగ్ విశ్లేషణ సాంకేతికతలు, పనితీరు ప్రొఫైలింగ్, మరియు అధునాతన డయాగ్నస్టిక్ టూల్స్ గురించి నేర్చుకోండి.

## నేర్చుకునే లక్ష్యాలు

ఈ గైడ్‌ను పూర్తి చేయడం ద్వారా, మీరు:
- Azure Developer CLI సమస్యల కోసం వ్యవస్థీకృత డీబగింగ్ పద్ధతులను నేర్చుకుంటారు
- అధునాతన లాగింగ్ కాన్ఫిగరేషన్ మరియు లాగ్ విశ్లేషణ సాంకేతికతలను అర్థం చేసుకుంటారు
- పనితీరు ప్రొఫైలింగ్ మరియు మానిటరింగ్ వ్యూహాలను అమలు చేస్తారు
- కాంప్లెక్స్ సమస్యల పరిష్కారానికి Azure డయాగ్నస్టిక్ టూల్స్ మరియు సేవలను ఉపయోగిస్తారు
- నెట్‌వర్క్ డీబగింగ్ మరియు భద్రతా సమస్యల పరిష్కార పద్ధతులను అనుసరిస్తారు
- ప్రొయాక్టివ్ సమస్య గుర్తింపుకు సమగ్ర మానిటరింగ్ మరియు అలర్టింగ్‌ను కాన్ఫిగర్ చేస్తారు

## నేర్చుకున్న ఫలితాలు

ఈ గైడ్‌ను పూర్తి చేసిన తర్వాత, మీరు:
- కాంప్లెక్స్ డిప్లాయ్‌మెంట్ సమస్యలను వ్యవస్థీకృతంగా డీబగ్ చేయడానికి TRIAGE పద్ధతిని అనుసరిస్తారు
- సమగ్ర లాగింగ్ మరియు ట్రేసింగ్ సమాచారాన్ని కాన్ఫిగర్ చేసి విశ్లేషిస్తారు
- Azure Monitor, Application Insights, మరియు డయాగ్నస్టిక్ టూల్స్‌ను సమర్థవంతంగా ఉపయోగిస్తారు
- నెట్‌వర్క్ కనెక్టివిటీ, ఆథెంటికేషన్, మరియు అనుమతి సమస్యలను స్వతంత్రంగా డీబగ్ చేస్తారు
- పనితీరు మానిటరింగ్ మరియు ఆప్టిమైజేషన్ వ్యూహాలను అమలు చేస్తారు
- పునరావృత సమస్యల కోసం కస్టమ్ డీబగింగ్ స్క్రిప్ట్‌లు మరియు ఆటోమేషన్‌ను సృష్టిస్తారు

## డీబగింగ్ పద్ధతి

### TRIAGE పద్ధతి
- **T**ime: సమస్య ఎప్పుడు ప్రారంభమైంది?
- **R**eproduce: మీరు దీన్ని స్థిరంగా పునరుత్పత్తి చేయగలరా?
- **I**solate: ఏ భాగం విఫలమవుతోంది?
- **A**nalyze: లాగ్‌లు ఏమి చెబుతున్నాయి?
- **G**ather: సంబంధిత సమాచారం మొత్తం సేకరించండి
- **E**scalate: అదనపు సహాయం ఎప్పుడు కోరాలి

## డీబగ్ మోడ్ ప్రారంభించడం

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్
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

### డీబగ్ కాన్ఫిగరేషన్
```bash
# డీబగ్ కాన్ఫిగరేషన్‌ను గ్లోబల్‌గా సెట్ చేయండి
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ట్రేస్ లాగింగ్‌ను ప్రారంభించండి
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 లాగ్ విశ్లేషణ సాంకేతికతలు

### లాగ్ లెవల్స్ అర్థం చేసుకోవడం
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
# స్థాయి ద్వారా లాగ్‌లను ఫిల్టర్ చేయండి
azd logs --level error --since 1h

# సేవ ద్వారా ఫిల్టర్ చేయండి
azd logs --service api --level debug

# విశ్లేషణ కోసం లాగ్‌లను ఎగుమతి చేయండి
azd logs --output json > deployment-logs.json

# jq తో JSON లాగ్‌లను పార్స్ చేయండి
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### లాగ్ కారెలేషన్
```bash
#!/bin/bash
# correlate-logs.sh - సేవల మధ్య లాగ్‌లను సంబంధం కల్పించండి

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# అన్ని సేవలలో శోధించండి
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure లాగ్‌లను శోధించండి
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ అధునాతన డీబగింగ్ టూల్స్

### Azure Resource Graph Queries
```bash
# ట్యాగ్‌ల ద్వారా వనరులను ప్రశ్నించండి
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# విఫలమైన డిప్లాయ్‌మెంట్‌లను కనుగొనండి
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# వనరుల ఆరోగ్యాన్ని తనిఖీ చేయండి
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### నెట్‌వర్క్ డీబగింగ్
```bash
# సేవల మధ్య కనెక్టివిటీని పరీక్షించండి
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

# వినియోగం
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### కంటైనర్ డీబగింగ్
```bash
# కంటైనర్ యాప్ సమస్యలను డీబగ్ చేయండి
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

### డేటాబేస్ కనెక్షన్ డీబగింగ్
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

## 🔬 పనితీరు డీబగింగ్

### అప్లికేషన్ పనితీరు మానిటరింగ్
```bash
# అప్లికేషన్ ఇన్‌సైట్స్ డీబగ్గింగ్‌ను ప్రారంభించండి
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

# అనుకూల పనితీరు మానిటరింగ్
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

### రిసోర్స్ వినియోగ విశ్లేషణ
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

### ఇంటిగ్రేషన్ టెస్ట్ డీబగింగ్
```bash
#!/bin/bash
# డీబగ్-ఇంటిగ్రేషన్-టెస్ట్స్.sh

set -e

echo "Running integration tests with debugging..."

# డీబగ్ వాతావరణాన్ని సెట్ చేయండి
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# సేవ ఎండ్‌పాయింట్లను పొందండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# హెల్త్ ఎండ్‌పాయింట్లను పరీక్షించండి
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

# పరీక్షలను నిర్వహించండి
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# కస్టమ్ ఇంటిగ్రేషన్ పరీక్షలను నిర్వహించండి
npm run test:integration
```

### డీబగింగ్ కోసం లోడ్ టెస్టింగ్
```bash
# పనితీరు bottlenecks గుర్తించడానికి సాదారణ లోడ్ పరీక్ష
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ఉపయోగించడం (ఇన్‌స్టాల్: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ముఖ్యమైన మెట్రిక్స్‌ను తీసుకోండి
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # విఫలతలను తనిఖీ చేయండి
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ఇన్‌ఫ్రాస్ట్రక్చర్ డీబగింగ్

### Bicep టెంప్లేట్ డీబగింగ్
```bash
# బైసెప్ టెంప్లేట్లను వివరమైన అవుట్‌పుట్‌తో ధృవీకరించండి
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # వాక్యనిర్మాణ ధృవీకరణ
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # లింట్ ధృవీకరణ
    az bicep lint --file "$template_file"
    
    # ఏమి-ఐతే మోహరింపు
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# టెంప్లేట్ మోహరింపును డీబగ్ చేయండి
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

### రిసోర్స్ స్టేట్ విశ్లేషణ
```bash
# వనరుల స్థితులను అసమంజసతల కోసం విశ్లేషించండి
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # వాటి స్థితులతో అన్ని వనరులను జాబితా చేయండి
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # విఫలమైన వనరులను తనిఖీ చేయండి
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

## 🔒 భద్రతా డీబగింగ్

### ఆథెంటికేషన్ ఫ్లో డీబగింగ్
```bash
# ఆజూర్ ప్రామాణీకరణను డీబగ్ చేయండి
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

# కీ వాల్ట్ యాక్సెస్‌ను డీబగ్ చేయండి
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

### నెట్‌వర్క్ భద్రతా డీబగింగ్
```bash
# నెట్‌వర్క్ భద్రతా సమూహాలను డీబగ్ చేయండి
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

## 📱 అప్లికేషన్-స్పెసిఫిక్ డీబగింగ్

### Node.js అప్లికేషన్ డీబగింగ్
```javascript
// డీబగ్-మిడిల్‌వేర్.js - ఎక్స్‌ప్రెస్ డీబగింగ్ మిడిల్‌వేర్
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
    
    // ప్రతిస్పందనలను లాగ్ చేయడానికి res.json ను ఓవర్‌రైడ్ చేయండి
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### డేటాబేస్ క్వెరీ డీబగింగ్
```javascript
// డేటాబేస్-డీబగ్.js - డేటాబేస్ డీబగింగ్ ఉపకరణాలు
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

## 🚨 అత్యవసర డీబగింగ్ విధానాలు

### ప్రొడక్షన్ సమస్యల ప్రతిస్పందన
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

# సరైన వాతావరణానికి మారండి
azd env select "$ENVIRONMENT"

# కీలకమైన సమాచారం సేకరించండి
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

### రోల్‌బ్యాక్ విధానాలు
```bash
# త్వరిత రోల్బ్యాక్ స్క్రిప్ట్
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # పర్యావరణాన్ని మార్చండి
    azd env select "$environment"
    
    # అప్లికేషన్ రోల్బ్యాక్ చేయండి
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # రోల్బ్యాక్‌ను ధృవీకరించండి
    echo "Verifying rollback..."
    azd show
    
    # కీలక ఎండ్‌పాయింట్లను పరీక్షించండి
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 డీబగింగ్ డాష్‌బోర్డులు

### కస్టమ్ మానిటరింగ్ డాష్‌బోర్డ్
```bash
# డీబగింగ్ కోసం అప్లికేషన్ ఇన్‌సైట్స్ క్వెరీలను సృష్టించండి
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
    
    # ఆధారిత వైఫల్యాల కోసం క్వెరీ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### లాగ్ అగ్రిగేషన్
```bash
# బహుళ మూలాల నుండి లాగ్‌లను సమీకరించండి
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

## 🔗 అధునాతన వనరులు

### కస్టమ్ డీబగ్ స్క్రిప్ట్‌లు
`scripts/debug/` డైరెక్టరీని క్రియేట్ చేయండి:
- `health-check.sh` - సమగ్ర ఆరోగ్య తనిఖీ
- `performance-test.sh` - ఆటోమేటెడ్ పనితీరు పరీక్ష
- `log-analyzer.py` - అధునాతన లాగ్ విశ్లేషణ
- `resource-validator.sh` - ఇన్‌ఫ్రాస్ట్రక్చర్ ధృవీకరణ

### మానిటరింగ్ ఇంటిగ్రేషన్
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

## ఉత్తమ పద్ధతులు

1. **ప్రొడక్షన్ కాని ఎన్విరాన్‌మెంట్‌లలో ఎల్లప్పుడూ డీబగ్ లాగింగ్ ప్రారంభించండి**
2. **సమస్యల కోసం పునరుత్పత్తి చేయగల పరీక్ష కేసులు సృష్టించండి**
3. **మీ టీమ్ కోసం డీబగింగ్ విధానాలను డాక్యుమెంట్ చేయండి**
4. **ఆరోగ్య తనిఖీలు మరియు మానిటరింగ్‌ను ఆటోమేట్ చేయండి**
5. **మీ అప్లికేషన్ మార్పులతో డీబగ్ టూల్స్‌ను నవీకరించండి**
6. **సమస్యలేని సమయంలో డీబగింగ్ విధానాలను ప్రాక్టీస్ చేయండి**

## తదుపరి దశలు

- [కెపాసిటీ ప్లానింగ్](../pre-deployment/capacity-planning.md) - రిసోర్స్ అవసరాలను ప్లాన్ చేయండి
- [SKU సెలెక్షన్](../pre-deployment/sku-selection.md) - సరైన సర్వీస్ టియర్స్‌ను ఎంచుకోండి
- [ప్రీఫ్లైట్ చెక్స్](../pre-deployment/preflight-checks.md) - ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ
- [చీట్ షీట్](../../resources/cheat-sheet.md) - త్వరిత సూచన ఆదేశాలు

---

**గమనించండి**: మంచి డీబగింగ్ అనేది వ్యవస్థీకృతంగా, సమగ్రంగా, మరియు ఓర్పుతో ఉండటమే. ఈ టూల్స్ మరియు సాంకేతికతలు మీకు సమస్యలను వేగంగా మరియు సమర్థవంతంగా గుర్తించడంలో సహాయపడతాయి.

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [సాధారణ సమస్యలు](common-issues.md)

- **తదుపరి పాఠం**: [కెపాసిటీ ప్లానింగ్](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దయచేసి, దాని స్వస్థల భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించండి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->