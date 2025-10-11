<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d02a4ed24d16a82e651a7d3e8c618e8",
  "translation_date": "2025-10-11T16:01:08+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "ta"
}
-->
# AZD பிரயோகங்களை சரிசெய்யும் வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பத்திற்கான வழிகாட்டி](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 7 - பிழைத்திருத்தம் மற்றும் சரிசெய்தல்
- **⬅️ முந்தையது**: [சாதாரண பிரச்சினைகள்](common-issues.md)
- **➡️ அடுத்தது**: [AI-சார்ந்த பிழைத்திருத்தம்](ai-troubleshooting.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன முறைகள்](../ai-foundry/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி, Azure Developer CLI பிரயோகங்களில் ஏற்படும் சிக்கல்களை கண்டறிந்து சரிசெய்யும் மேம்பட்ட பிழைத்திருத்த உத்திகள், கருவிகள் மற்றும் நுட்பங்களை வழங்குகிறது. பிரச்சினைகளை முறையாக அணுகும் முறைமைகள், பதிவு பகுப்பாய்வு நுட்பங்கள், செயல்திறன் சுயவிவரமிடல் மற்றும் மேம்பட்ட கண்டறிதல் கருவிகளைப் பயன்படுத்தி பிரச்சினைகளை விரைவாக தீர்க்க கற்றுக்கொள்ளுங்கள்.

## கற்றல் நோக்கங்கள்

இந்த வழிகாட்டியை முடிக்கும்போது, நீங்கள்:
- Azure Developer CLI பிரச்சினைகளுக்கான முறையான பிழைத்திருத்த உத்திகளை கற்றுக்கொள்வீர்கள்
- மேம்பட்ட பதிவு அமைப்புகள் மற்றும் பதிவு பகுப்பாய்வு நுட்பங்களைப் புரிந்துகொள்வீர்கள்
- செயல்திறன் சுயவிவரமிடல் மற்றும் கண்காணிப்பு உத்திகளை செயல்படுத்துவீர்கள்
- சிக்கலான பிரச்சினைகளை தீர்க்க Azure கண்டறிதல் கருவிகள் மற்றும் சேவைகளைப் பயன்படுத்துவீர்கள்
- நெட்வொர்க் பிழைத்திருத்தம் மற்றும் பாதுகாப்பு பிரச்சினைகளை சரிசெய்வீர்கள்
- முன்னோக்கிய பிரச்சினை கண்டறிதலுக்கான முழுமையான கண்காணிப்பு மற்றும் எச்சரிக்கை அமைப்புகளை உள்ளமைக்குவீர்கள்

## கற்றல் முடிவுகள்

இதை முடித்த பிறகு, நீங்கள்:
- TRIAGE முறைமையைப் பயன்படுத்தி சிக்கலான பிரயோக பிரச்சினைகளை முறையாக சரிசெய்வீர்கள்
- முழுமையான பதிவு மற்றும் தடய தகவல்களை அமைத்து பகுப்பாய்வு செய்வீர்கள்
- Azure Monitor, Application Insights மற்றும் கண்டறிதல் கருவிகளை திறம்படப் பயன்படுத்துவீர்கள்
- நெட்வொர்க் இணைப்பு, அங்கீகாரம் மற்றும் அனுமதி பிரச்சினைகளை சுயமாக சரிசெய்வீர்கள்
- செயல்திறன் கண்காணிப்பு மற்றும் மேம்படுத்தல் உத்திகளை செயல்படுத்துவீர்கள்
- மீண்டும் மீண்டும் ஏற்படும் பிரச்சினைகளுக்கான தனிப்பயன் பிழைத்திருத்த ஸ்கிரிப்ட்கள் மற்றும் தானியங்கி முறைகளை உருவாக்குவீர்கள்

## பிழைத்திருத்த முறைமைகள்

### TRIAGE அணுகுமுறை
- **T**ime: பிரச்சினை எப்போது தொடங்கியது?
- **R**eproduce: அதை தொடர்ந்து மீண்டும் உருவாக்க முடியுமா?
- **I**solate: எந்த கூறு தோல்வியடைகிறது?
- **A**nalyze: பதிவுகள் என்ன சொல்கின்றன?
- **G**ather: தொடர்புடைய அனைத்து தகவல்களையும் சேகரிக்கவும்
- **E**scalate: கூடுதல் உதவியை எப்போது தேட வேண்டும்

## பிழைத்திருத்த முறையை இயக்குதல்

### சூழல் மாறிகள்
```bash
# Enable comprehensive debugging
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI debugging
export AZURE_CLI_DIAGNOSTICS=true

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### பிழைத்திருத்த அமைப்பு
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 பதிவு பகுப்பாய்வு நுட்பங்கள்

### பதிவு நிலைகளைப் புரிந்துகொள்வது
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
# Filter logs by level
azd logs --level error --since 1h

# Filter by service
azd logs --service api --level debug

# Export logs for analysis
azd logs --output json > deployment-logs.json

# Parse JSON logs with jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### பதிவு தொடர்பு
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search across all services
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Search Azure logs
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ மேம்பட்ட பிழைத்திருத்த கருவிகள்

### Azure Resource Graph கேள்விகள்
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### நெட்வொர்க் பிழைத்திருத்தம்
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
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### கண்டெய்னர் பிழைத்திருத்தம்
```bash
# Debug container app issues
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

### தரவுத்தொகுப்பு இணைப்பு பிழைத்திருத்தம்
```bash
# Debug database connectivity
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

## 🔬 செயல்திறன் பிழைத்திருத்தம்

### பயன்பாட்டு செயல்திறன் கண்காணிப்பு
```bash
# Enable Application Insights debugging
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

# Custom performance monitoring
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

### வள பயன்பாட்டு பகுப்பாய்வு
```bash
# Monitor resource usage
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

## 🧪 சோதனை மற்றும் சரிபார்ப்பு

### ஒருங்கிணைப்பு சோதனை பிழைத்திருத்தம்
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
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

# Run tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run custom integration tests
npm run test:integration
```

### சுமை சோதனை பிழைத்திருத்தம்
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

## 🔧 உள்கட்டமைப்பு பிழைத்திருத்தம்

### Bicep டெம்ப்ளேட் பிழைத்திருத்தம்
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # What-if deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
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

### வள நிலை பகுப்பாய்வு
```bash
# Analyze resource states for inconsistencies
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources with their states
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Check for failed resources
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

## 🔒 பாதுகாப்பு பிழைத்திருத்தம்

### அங்கீகார ஓட்டம் பிழைத்திருத்தம்
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT token (requires jq and base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
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

### நெட்வொர்க் பாதுகாப்பு பிழைத்திருத்தம்
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

## 📱 பயன்பாட்டுக்கேற்ப பிழைத்திருத்தம்

### Node.js பயன்பாட்டு பிழைத்திருத்தம்
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### தரவுத்தொகுப்பு கேள்வி பிழைத்திருத்தம்
```javascript
// database-debug.js - Database debugging utilities
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

## 🚨 அவசர பிழைத்திருத்த நடைமுறைகள்

### உற்பத்தி பிரச்சினை பதில்
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

### ரோல்பேக் நடைமுறைகள்
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback application
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 பிழைத்திருத்த டாஷ்போர்டுகள்

### தனிப்பயன் கண்காணிப்பு டாஷ்போர்டு
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1
    
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

### பதிவு ஒருங்கிணைப்பு
```bash
# Aggregate logs from multiple sources
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

## 🔗 மேம்பட்ட வளங்கள்

### தனிப்பயன் பிழைத்திருத்த ஸ்கிரிப்ட்கள்
`scripts/debug/` கோப்புறையை உருவாக்கவும்:
- `health-check.sh` - விரிவான ஆரோக்கிய சோதனை
- `performance-test.sh` - தானியங்கி செயல்திறன் சோதனை
- `log-analyzer.py` - மேம்பட்ட பதிவு பகுப்பாய்வு
- `resource-validator.sh` - உள்கட்டமைப்பு சரிபார்ப்பு

### கண்காணிப்பு ஒருங்கிணைப்பு
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

## சிறந்த நடைமுறைகள்

1. **பதிவு பிழைத்திருத்தத்தை எப்போதும் இயக்கவும்** உற்பத்தி அல்லாத சூழல்களில்
2. **பிரச்சினைகளுக்கான மீண்டும் உருவாக்கக்கூடிய சோதனை வழக்குகளை உருவாக்கவும்**
3. **உங்கள் குழுவுக்கான பிழைத்திருத்த நடைமுறைகளை ஆவணப்படுத்தவும்**
4. **ஆரோக்கிய சோதனைகள் மற்றும் கண்காணிப்பை தானியக்கமாக்கவும்**
5. **உங்கள் பயன்பாட்டில் மாற்றங்களுடன் பிழைத்திருத்த கருவிகளை புதுப்பிக்கவும்**
6. **பிரச்சினை இல்லாத நேரங்களில் பிழைத்திருத்த நடைமுறைகளைப் பயிற்சி செய்யவும்**

## அடுத்த படிகள்

- [திறன் திட்டமிடல்](../pre-deployment/capacity-planning.md) - வள தேவைகளைத் திட்டமிடுங்கள்
- [SKU தேர்வு](../pre-deployment/sku-selection.md) - பொருத்தமான சேவை நிலைகளைத் தேர்ந்தெடுக்கவும்
- [முன்னோட்ட சோதனைகள்](../pre-deployment/preflight-checks.md) - முன்-பிரயோக சரிபார்ப்பு
- [சுருக்கப்பட்ட பட்டியல்](../../resources/cheat-sheet.md) - விரைவான குறிப்புகள்

---

**நினைவில் கொள்ளுங்கள்**: நல்ல பிழைத்திருத்தம் என்பது முறையாக, முழுமையாக மற்றும் பொறுமையாக செயல்படுவதில் உள்ளது. இந்த கருவிகள் மற்றும் நுட்பங்கள் பிரச்சினைகளை விரைவாகவும் திறம்படவும் கண்டறிய உதவும்.

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [சாதாரண பிரச்சினைகள்](common-issues.md)

- **அடுத்த பாடம்**: [திறன் திட்டமிடல்](../pre-deployment/capacity-planning.md)

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.