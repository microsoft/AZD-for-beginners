<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5066dbb0b4f24e493697f6430505b115",
  "translation_date": "2025-09-09T19:32:55+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "pa"
}
-->
# ਡਿਬੱਗਿੰਗ ਗਾਈਡ - ਉੱਚ ਪੱਧਰੀ ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ ਦੀਆਂ ਤਕਨੀਕਾਂ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਡਿਪਲੌਇਮੈਂਟਸ ਨਾਲ ਜੁੜੀਆਂ ਜਟਿਲ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਪਛਾਣਨ ਅਤੇ ਹੱਲ ਕਰਨ ਲਈ ਉੱਚ ਪੱਧਰੀ ਡਿਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ, ਸੰਦਾਂ ਅਤੇ ਤਕਨੀਕਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਡਿਪਲੌਇਮੈਂਟ ਅਤੇ ਰਨਟਾਈਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਕੁਸ਼ਲਤਾਪੂਰਵਕ ਹੱਲ ਕਰਨ ਲਈ ਪ੍ਰਣਾਲੀਬੱਧ ਤਰਤੀਬਬੰਦੀ ਤਰੀਕੇ, ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ, ਪ੍ਰਦਰਸ਼ਨ ਪ੍ਰੋਫਾਈਲਿੰਗ ਅਤੇ ਉੱਚ ਪੱਧਰੀ ਡਾਇਗਨੋਸਟਿਕ ਸੰਦਾਂ ਬਾਰੇ ਸਿੱਖੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- Azure Developer CLI ਸਮੱਸਿਆਵਾਂ ਲਈ ਪ੍ਰਣਾਲੀਬੱਧ ਡਿਬੱਗਿੰਗ ਤਰੀਕਿਆਂ ਵਿੱਚ ਮਾਹਰ ਹੋ ਜਾਓਗੇ
- ਉੱਚ ਪੱਧਰੀ ਲੌਗਿੰਗ ਸੰਰਚਨਾ ਅਤੇ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ ਨੂੰ ਸਮਝੋ
- ਪ੍ਰਦਰਸ਼ਨ ਪ੍ਰੋਫਾਈਲਿੰਗ ਅਤੇ ਨਿਗਰਾਨੀ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਜਟਿਲ ਸਮੱਸਿਆ ਹੱਲ ਲਈ Azure ਡਾਇਗਨੋਸਟਿਕ ਸੰਦਾਂ ਅਤੇ ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਨੈਟਵਰਕ ਡਿਬੱਗਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸਮੱਸਿਆ ਹੱਲ ਤਕਨੀਕਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਸਮੱਸਿਆਵਾਂ ਦੀ ਪੂਰਵ-ਪਛਾਣ ਲਈ ਵਿਸਤ੍ਰਿਤ ਨਿਗਰਾਨੀ ਅਤੇ ਚੇਤਾਵਨੀ ਸੰਰਚਨਾ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉਪਰੰਤ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- ਜਟਿਲ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਪ੍ਰਣਾਲੀਬੱਧ ਤਰੀਕੇ ਨਾਲ ਡਿਬੱਗ ਕਰਨ ਲਈ TRIAGE ਤਰੀਕੇ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਵਿਸਤ੍ਰਿਤ ਲੌਗਿੰਗ ਅਤੇ ਟ੍ਰੇਸਿੰਗ ਜਾਣਕਾਰੀ ਨੂੰ ਸੰਰਚਿਤ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ
- Azure Monitor, Application Insights ਅਤੇ ਡਾਇਗਨੋਸਟਿਕ ਸੰਦਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਕਰੋ
- ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ, ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਡਿਬੱਗ ਕਰੋ
- ਪ੍ਰਦਰਸ਼ਨ ਨਿਗਰਾਨੀ ਅਤੇ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਮੁੜ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ ਲਈ ਕਸਟਮ ਡਿਬੱਗਿੰਗ ਸਕ੍ਰਿਪਟ ਅਤੇ ਆਟੋਮੇਸ਼ਨ ਬਣਾਓ

## ਡਿਬੱਗਿੰਗ ਤਰੀਕਾ

### TRIAGE ਤਰੀਕਾ
- **T** ਸਮਾਂ: ਸਮੱਸਿਆ ਕਦੋਂ ਸ਼ੁਰੂ ਹੋਈ?
- **R** ਦੁਹਰਾਓ: ਕੀ ਤੁਸੀਂ ਇਸਨੂੰ ਲਗਾਤਾਰ ਦੁਹਰਾ ਸਕਦੇ ਹੋ?
- **I** ਅਲੱਗ ਕਰੋ: ਕਿਹੜਾ ਕੰਪੋਨੈਂਟ ਫੇਲ ਹੋ ਰਿਹਾ ਹੈ?
- **A** ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ: ਲੌਗਸ ਸਾਨੂੰ ਕੀ ਦੱਸਦੇ ਹਨ?
- **G** ਇਕੱਠਾ ਕਰੋ: ਸਾਰੀਆਂ ਸੰਬੰਧਿਤ ਜਾਣਕਾਰੀਆਂ ਇਕੱਠੀਆਂ ਕਰੋ
- **E** ਵਧਾਓ: ਕਦੋਂ ਵਾਧੂ ਮਦਦ ਲੈਣੀ ਹੈ

## ਡਿਬੱਗ ਮੋਡ ਚਾਲੂ ਕਰਨਾ

### ਵਾਤਾਵਰਣ ਚਰ
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

### ਡਿਬੱਗ ਸੰਰਚਨਾ
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ ਤਕਨੀਕਾਂ

### ਲੌਗ ਪੱਧਰਾਂ ਨੂੰ ਸਮਝਣਾ
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ਸੰਰਚਿਤ ਲੌਗ ਵਿਸ਼ਲੇਸ਼ਣ
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

### ਲੌਗ ਸੰਬੰਧਨ
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

## 🛠️ ਉੱਚ ਪੱਧਰੀ ਡਿਬੱਗਿੰਗ ਸੰਦ

### Azure Resource Graph ਪ੍ਰਸ਼ਨ
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ਨੈਟਵਰਕ ਡਿਬੱਗਿੰਗ
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

### ਕੰਟੇਨਰ ਡਿਬੱਗਿੰਗ
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

### ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਡਿਬੱਗਿੰਗ
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

## 🔬 ਪ੍ਰਦਰਸ਼ਨ ਡਿਬੱਗਿੰਗ

### ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਨਿਗਰਾਨੀ
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

### ਸਰੋਤ ਦੀ ਵਰਤੋਂ ਵਿਸ਼ਲੇਸ਼ਣ
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

## 🧪 ਟੈਸਟਿੰਗ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ

### ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਟੈਸਟ ਡਿਬੱਗਿੰਗ
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

### ਲੋਡ ਟੈਸਟਿੰਗ ਲਈ ਡਿਬੱਗਿੰਗ
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

## 🔧 ਢਾਂਚਾ ਡਿਬੱਗਿੰਗ

### Bicep ਟੈਂਪਲੇਟ ਡਿਬੱਗਿੰਗ
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

### ਸਰੋਤ ਦੀ ਸਥਿਤੀ ਵਿਸ਼ਲੇਸ਼ਣ
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

## 🔒 ਸੁਰੱਖਿਆ ਡਿਬੱਗਿੰਗ

### ਪ੍ਰਮਾਣਿਕਤਾ ਪ੍ਰਵਾਹ ਡਿਬੱਗਿੰਗ
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

### ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ ਡਿਬੱਗਿੰਗ
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

## 📱 ਐਪਲੀਕੇਸ਼ਨ-ਵਿਸ਼ੇਸ਼ ਡਿਬੱਗਿੰਗ

### Node.js ਐਪਲੀਕੇਸ਼ਨ ਡਿਬੱਗਿੰਗ
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

### ਡਾਟਾਬੇਸ ਪ੍ਰਸ਼ਨ ਡਿਬੱਗਿੰਗ
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

## 🚨 ਐਮਰਜੈਂਸੀ ਡਿਬੱਗਿੰਗ ਪ੍ਰਕਿਰਿਆਵਾਂ

### ਉਤਪਾਦਨ ਸਮੱਸਿਆ ਪ੍ਰਤੀਕ੍ਰਿਆ
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

### ਰੋਲਬੈਕ ਪ੍ਰਕਿਰਿਆਵਾਂ
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

## 📊 ਡਿਬੱਗਿੰਗ ਡੈਸ਼ਬੋਰਡ

### ਕਸਟਮ ਨਿਗਰਾਨੀ ਡੈਸ਼ਬੋਰਡ
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

### ਲੌਗ ਏਗਰੀਗੇਸ਼ਨ
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

## 🔗 ਉੱਚ ਪੱਧਰੀ ਸਰੋਤ

### ਕਸਟਮ ਡਿਬੱਗ ਸਕ੍ਰਿਪਟ
`scripts/debug/` ਡਾਇਰੈਕਟਰੀ ਬਣਾਓ:
- `health-check.sh` - ਵਿਸਤ੍ਰਿਤ ਸਿਹਤ ਜਾਂਚ
- `performance-test.sh` - ਆਟੋਮੈਟਿਕ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ
- `log-analyzer.py` - ਉੱਚ ਪੱਧਰੀ ਲੌਗ ਪਾਰਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ
- `resource-validator.sh` - ਢਾਂਚਾ ਪ੍ਰਮਾਣਿਕਤਾ

### ਨਿਗਰਾਨੀ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

## ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ

1. **ਹਮੇਸ਼ਾ ਡਿਬੱਗ ਲੌਗਿੰਗ ਚਾਲੂ ਕਰੋ** ਗੈਰ-ਉਤਪਾਦਨ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ
2. **ਸਮੱਸਿਆਵਾਂ ਲਈ ਦੁਹਰਾਏ ਜਾਣ ਵਾਲੇ ਟੈਸਟ ਕੇਸ ਬਣਾਓ**
3. **ਆਪਣੀ ਟੀਮ ਲਈ ਡਿਬੱਗਿੰਗ ਪ੍ਰਕਿਰਿਆਵਾਂ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ**
4. **ਸਿਹਤ ਜਾਂਚ ਅਤੇ ਨਿਗਰਾਨੀ ਨੂੰ ਆਟੋਮੈਟ ਕਰੋ**
5. **ਡਿਬੱਗ ਸੰਦਾਂ ਨੂੰ ਆਪਣੇ ਐਪਲੀਕੇਸ਼ਨ ਬਦਲਾਵਾਂ ਨਾਲ ਅਪਡੇਟ ਰੱਖੋ**
6. **ਗੈਰ-ਘਟਨਾ ਸਮੇਂ ਡਿਬੱਗਿੰਗ ਪ੍ਰਕਿਰਿਆਵਾਂ ਦਾ ਅਭਿਆਸ ਕਰੋ**

## ਅਗਲੇ ਕਦਮ

- [ਸਮਰੱਥਾ ਯੋਜਨਾ](../pre-deployment/capacity-planning.md) - ਸਰੋਤ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [SKU ਚੋਣ](../pre-deployment/sku-selection.md) - ਉਚਿਤ ਸੇਵਾ ਪੱਧਰ ਚੁਣੋ
- [ਪ੍ਰੀਫਲਾਈਟ ਜਾਂਚ](../pre-deployment/preflight-checks.md) - ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਪ੍ਰਮਾਣਿਕਤਾ
- [ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md) - ਤੇਜ਼ ਸੰਦਰਭ ਕਮਾਂਡ

---

**ਯਾਦ ਰੱਖੋ**: ਚੰਗੀ ਡਿਬੱਗਿੰਗ ਪ੍ਰਣਾਲੀਬੱਧ, ਵਿਸਤ੍ਰਿਤ ਅਤੇ ਧੀਰਜਵਾਨ ਹੋਣ ਬਾਰੇ ਹੈ। ਇਹ ਸੰਦ ਅਤੇ ਤਕਨੀਕਾਂ ਤੁਹਾਨੂੰ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਅਤੇ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਪਛਾਣਨ ਵਿੱਚ ਮਦਦ ਕਰਨਗੀਆਂ।

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸਮਰੱਥਾ ਯੋਜਨਾ](../pre-deployment/capacity-planning.md)

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਣੀਕਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।