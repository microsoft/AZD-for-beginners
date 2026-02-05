# Debugging Guide for AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [Common Issues](common-issues.md)
- **➡️ Next**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../microsoft-foundry/production-ai-practices.md)

## Introduction

Dis guide go show you beta way to debug, tools, and techniques wey fit help you find and fix wahala wey dey happen for Azure Developer CLI deployments. You go learn how to troubleshoot step by step, check logs well, do performance profiling, and use advanced tools to solve deployment and runtime wahala.

## Learning Goals

If you finish dis guide, you go sabi:
- How to debug Azure Developer CLI wahala step by step
- How to set up advanced logging and check logs well
- How to do performance profiling and monitoring
- How to use Azure diagnostic tools and services to solve big wahala
- How to debug network and security wahala
- How to set up monitoring and alerting to catch wahala early

## Learning Outcomes

When you don finish, you go fit:
- Use TRIAGE method to debug deployment wahala step by step
- Set up and check logs and tracing info well
- Use Azure Monitor, Application Insights, and other tools well
- Debug network, authentication, and permission wahala by yourself
- Do performance monitoring and optimization well
- Create custom debugging scripts and automation for wahala wey dey repeat

## Debugging Methodology

### The TRIAGE Approach
- **T**ime: When e start?
- **R**eproduce: You fit make am happen again?
- **I**solate: Which part dey fail?
- **A**nalyze: Wetin logs dey talk?
- **G**ather: Collect all info wey dey important
- **E**scalate: When you go need help?

## Enabling Debug Mode

### Environment Variables
```bash
# Make debugging complete well well
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Debug Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Turn off telemetry make output clean
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Set debug configuration for everywhere
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Make trace logging dey work
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Log Analysis Techniques

### Understanding Log Levels
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
# Filter logs by level
azd logs --level error --since 1h

# Filter by service
azd logs --service api --level debug

# Export logs for analysis
azd logs --output json > deployment-logs.json

# Parse JSON logs wit jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Join logs wey dey for different services

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Find for all services
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Find Azure logs
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Advanced Debugging Tools

### Azure Resource Graph Queries
```bash
# Check resources wey get tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find deployments wey no work
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check how resource dey do
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# Test if services dey connect well
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

# How to use am
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# Check wetin dey cause wahala for container app
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
# Check how database dey connect
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

## 🔬 Performance Debugging

### Application Performance Monitoring
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

### Resource Utilization Analysis
```bash
# Dey check how resource dey use
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

## 🧪 Testing and Validation

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Collect service endpoints
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

### Load Testing for Debugging
```bash
# Simple load test to sabi where performance dey get wahala
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Use Apache Bench (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Comot key metrics
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Look for where e fail
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastructure Debugging

### Bicep Template Debugging
```bash
# Check Bicep templates well well wit beta output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Check syntax
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Check lint
    az bicep lint --file "$template_file"
    
    # Wetin go happen if dem deploy am
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

### Resource State Analysis
```bash
# Check how resource dem dey for any wahala
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Show all resource dem with how dem dey
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Look for resource wey no work well
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

## 🔒 Security Debugging

### Authentication Flow Debugging
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT token (e need jq and base64)
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

### Network Security Debugging
```bash
# Debug di network security groups
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Check di security rules
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Application-Specific Debugging

### Node.js Application Debugging
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

### Database Query Debugging
```javascript
// database-debug.js - Tools wey go help debug database
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

## 🚨 Emergency Debugging Procedures

### Production Issue Response
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

# Change to di correct environment
azd env select "$ENVIRONMENT"

# Gather important information
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

### Rollback Procedures
```bash
# Quick script wey go do rollback
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Change environment
    azd env select "$environment"
    
    # Do rollback for application
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Check say rollback work well
    echo "Verifying rollback..."
    azd show
    
    # Test di important endpoints
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboards

### Custom Monitoring Dashboard
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1
    
    # Query for errors
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query for performance wahala
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query for dependency failures
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# Gather logs from plenty sources
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

## 🔗 Advanced Resources

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - Comprehensive health checking
- `performance-test.sh` - Automated performance testing
- `log-analyzer.py` - Advanced log parsing and analysis
- `resource-validator.sh` - Infrastructure validation

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

## Best Practices

1. **Always enable debug logging** for environments wey no be production
2. **Create reproducible test cases** for wahala
3. **Document debugging procedures** for your team
4. **Automate health checks** and monitoring
5. **Keep debug tools updated** with your app changes
6. **Practice debugging procedures** when wahala no dey

## Next Steps

- [Capacity Planning](../pre-deployment/capacity-planning.md) - Plan resource requirements
- [SKU Selection](../pre-deployment/sku-selection.md) - Choose correct service tiers
- [Preflight Checks](../pre-deployment/preflight-checks.md) - Pre-deployment validation
- [Cheat Sheet](../../resources/cheat-sheet.md) - Quick reference commands

---

**Remember**: Good debugging na to dey systematic, thorough, and patient. Dis tools and techniques go help you find wahala fast and solve am well.

---

**Navigation**
- **Previous Lesson**: [Common Issues](common-issues.md)

- **Next Lesson**: [Capacity Planning](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even as we dey try make am accurate, abeg sabi say machine translation fit get mistake or no dey correct well. Di original dokyument for im native language na di main correct source. For important mata, e good make una use professional human translation. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because una use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->