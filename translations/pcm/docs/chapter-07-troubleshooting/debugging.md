# Debugging Guide for AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [Common Issues](common-issues.md)
- **➡️ Next**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Introduction

This complete guide dey show advanced ways to debug, tools, and techniques wey go help you diagnose and fix complex wahala wey relate to Azure Developer CLI deployments. You go learn systematic troubleshooting methods, how to analyze logs, performance profiling, and advanced diagnostic tools to quickly resolve deployment and runtime problems.

## Learning Goals

If you finish this guide, you go:
- Master systematic debugging methods for Azure Developer CLI issues
- Understand advanced logging configuration and log analysis techniques
- Implement performance profiling and monitoring strategies
- Use Azure diagnostic tools and services for complex problem resolution
- Apply network debugging and security troubleshooting techniques
- Configure comprehensive monitoring and alerting to catch issues early

## Learning Outcomes

After you complete am, you go fit:
- Use the TRIAGE methodology to systematically debug complex deployment issues
- Configure and analyze full logging and tracing information
- Use Azure Monitor, Application Insights, and diagnostic tools well
- Debug network connectivity, authentication, and permission wahala on your own
- Implement performance monitoring and optimization strategies
- Build custom debugging scripts and automation for things wey repeat

## Debugging Methodology

### The TRIAGE Approach
- **T**ime: When the issue start?
- **R**eproduce: You fit reproduce am steady?
- **I**solate: Which component dey fail?
- **A**nalyze: Wetin the logs dey talk?
- **G**ather: Collect all the relevant information
- **E**scalate: When you suppose call for additional help

## Enabling Debug Mode

### Environment Variables
```bash
# Make debugging dey show everything
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Debug wey dey for Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Turn off telemetry so output go clean
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Make debug configuration dey for whole system
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Make trace logging dey on
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
# Check logs wit Azure Monitor (via azd monitor)
azd monitor --logs

# Check application logs as e dey happen
azd monitor --live

# If you wan analyze logs well-well, use Azure CLI with your App Service or Container App:
# App Service logs
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App logs
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Export Application Insights logs so you fit analyze dem
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Join logs dem wey relate from different services using Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Look for logs dem wey relate inside Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Look for Azure activity logs dem
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Advanced Debugging Tools

### Azure Resource Graph Queries
```bash
# Find resource dem by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find deployment dem wey don fail
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check how resource dem dey
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# Check if services dey connect to each oda
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
# Find and fix wahala wey dey for container app
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
# Debug how database dey connect
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
# Make Application Insights debugging dey on
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

# Monitoring wey you set for performance
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
# Dey monitor how resources dey used
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

# Make di debug environment ready
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Find di service endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test di health endpoints
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

# Run di tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run di custom integration tests
npm run test:integration
```

### Load Testing for Debugging
```bash
# Simple load test wey go show where system dey choke
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # We dey use Apache Bench (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Comot important metrics
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Check if any failure dey
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastructure Debugging

### Bicep Template Debugging
```bash
# Check Bicep templates an show full details
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Check syntax
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Check lint rules
    az bicep lint --file "$template_file"
    
    # Deploy wey show wetin go change
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug how template dey deploy
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
# Check resource states, see if dem dey inconsistent
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources and dem status
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Check for resources wey don fail
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
# Make we check Azure login
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT token (you go need jq and base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Make we check Key Vault access
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
# Find and fix wahala for di network security groups
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
// debug-middleware.js - Express middleware wey dey debug
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Dey log request details
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Override res.json make e dey log responses
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
// Tools wey dey help debug database
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
# emergency-debug.sh - Na emergency debug for production

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

# Switch to di correct environment
azd env select "$ENVIRONMENT"

# Collect di critical info
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Use Azure Monitor to see di error logs
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
# Small script wey go roll back sharp-sharp
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Change di environment
    azd env select "$environment"
    
    # Roll back with Git (AZD no get rollback wey dey inside)
    git checkout "$previous_commit"
    azd deploy
    
    # Make sure say rollback work
    echo "Verifying rollback..."
    azd show
    
    # Test di critical endpoints
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging Dashboards

### Custom Monitoring Dashboard
```bash
# Make Application Insights queries to find and fix wahala
create_debug_queries() {
    local app_insights_name=$1
    
    # Query to find error dem
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query to find performance wahala
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query to find when dependency dem fail
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# Gather log dem from different Azure sources
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

## 🔗 Advanced Resources

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - Full health check script
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

1. **Always enable debug logging** in non-production environments
2. **Create reproducible test cases** for issues
3. **Document debugging procedures** for your team
4. **Automate health checks** and monitoring
5. **Keep debug tools updated** with your application changes
6. **Practice debugging procedures** during non-incident times

## Next Steps

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Plan resource requirements
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Choose appropriate service tiers
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Pre-deployment validation
- [Cheat Sheet](../../resources/cheat-sheet.md) - Quick reference commands

---

**Remember**: Good debugging na to dey systematic, thorough, and patient. These tools and techniques go help you diagnose issues faster and more effectively.

---

**Navigation**
- **Previous Lesson**: [Common Issues](common-issues.md)

- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis document na wetin we translate with AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make everything correct, abeg sabi say automatic/machine translation fit get mistakes or no too accurate. The original document for im original language suppose be di official/authoritative source. If na important info, make you use professional human translator. We no dey responsible for any misunderstanding or wrong interpretation wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->