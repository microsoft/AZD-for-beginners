# AZD डिप्लोयमेन्टहरूका लागि डिबगिङ मार्गदर्शन

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [शुरुआतीहरूका लागि AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्या समाधान र डिबगिङ
- **⬅️ अघिल्लो**: [सामान्य समस्याहरू](common-issues.md)
- **➡️ अर्को**: [AI-विशिष्ट समस्या समाधान](ai-troubleshooting.md)
- **🚀 अर्को अध्याय**: [अध्याय ८: उत्पादन र उद्यम ढाँचाहरू](../chapter-08-production/production-ai-practices.md)

## परिचय

यो व्यापक मार्गदर्शनले Azure Developer CLI डिप्लोयमेन्टहरूसँग सम्बन्धित जटिल समस्याहरूको निदान र समाधानका लागि उन्नत डिबगिङ रणनीतिहरू, उपकरणहरू र प्रविधिहरू प्रदान गर्दछ। व्यवस्थित समस्या समाधान प्रविधिहरू, लग विश्लेषण तरिकाहरू, प्रदर्शन प्रोफाइलिङ, र उन्नत निदान उपकरणहरू सिक्नुहोस् जसले डिप्लोयमेन्ट र रनटाइम समस्या छिटो समाधान गर्न मद्दत गर्छ।

## सिकाइ लक्ष्यहरू

यो मार्गदर्शन पूरा गर्दा, तपाईंले:
- Azure Developer CLI समस्याहरूका लागि व्यवस्थित डिबगिङ प्रविधिहरूमा दक्षता हासिल गर्न
- उन्नत लग कन्फिगरेशन र लग विश्लेषण प्रविधिहरूलाई बुझ्न
- प्रदर्शन प्रोफाइलिङ र अनुगमन रणनीतिहरू लागू गर्न
- जटिल समस्याहरू समाधानका लागि Azure डायग्नोष्टिक उपकरणहरू र सेवाहरू प्रयोग गर्न
- नेटवर्क डिबगिङ र सुरक्षा समस्या समाधान प्रविधिहरू लागू गर्न
- सक्रिय समस्याको पहिचानका लागि व्यापक अनुगमन र सतर्कता कन्फिगर गर्न

## सिकाइ नतिजा

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- जटिल डिप्लोयमेन्ट समस्याहरू व्यवस्थित रूपमा डिबग गर्न TRIAGE विधि लागू गर्न
- व्यापक लग र ट्रेसिङ जानकारी कन्फिगर र विश्लेषण गर्न
- Azure Monitor, Application Insights, र डायग्नोष्टिक उपकरणहरू प्रभावकारी रूपमा प्रयोग गर्न
- नेटवर्क कनेक्टिभिटी, प्रमाणीकरण, र अनुमति समस्याहरू स्वतन्त्र रूपमा डिबग गर्न
- प्रदर्शन अनुगमन र अनुकूलन रणनीतिहरू लागू गर्न
- पुनरावृत्ति हुने समस्याहरूका लागि अनुकूलित डिबगिङ स्क्रिप्टहरू र स्वचालन सिर्जना गर्न

## डिबगिङ विधि

### TRIAGE दृष्टिकोण
- **T**ime: समस्या कहिले सुरु भयो?
- **R**eproduce: के तपाईंले यसलाई लगातार पुन: उत्पादन गर्न सक्नुहुन्छ?
- **I**solate: कुन कम्पोनेन्ट असफल भैरहेको छ?
- **A**nalyze: लगहरूले के भन्छन्?
- **G**ather: सबै सम्बन्धित जानकारी सङ्कलन गर्नुहोस्
- **E**scalate: थप सहयोग कहिले खोज्ने

## डिबग मोड सक्षम पार्ने

> **दायरा:** यी निदानका उदाहरणहरू अनुकूलनका लागि छन्, कुनै पूर्वनिर्धारित स्क्रिप्टहरू होइन। स्रोत नामहरू/IDs परिवर्तन गर्नुहोस्; shell block का लागि Bash प्रयोग गर्नुहोस्। `--debug` आउटपुट र वातावरण मानहरू संवेदनशील जानकारी समावेश गर्न सक्छन्—शेयर गर्नु अघि समीक्षा/लुकेको गर्नुहोस्। डिप्लोय, रोलब्याक, वा कन्फिगरेसन परिवर्तन गर्ने उदाहरणहरूले स्पष्ट अपरेटर स्वीकृति आवश्यक पर्दछ।

### वातावरण चरहरू
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### डिबग कन्फिगरेसन
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` ले मनमाना कुञ्जीहरू भण्डारण गर्न सक्छ; त्यसले `debug.enabled`, `debug.logLevel`, वा `trace.outputPath` लाई समर्थित सेटिङ्हरू नमुनिन्छ। रिलिज गरिएको कमाण्डको `--debug` झण्डा प्रयोग गर्नुहोस्।

## 📊 लग विश्लेषण प्रविधिहरू

### लग स्तरहरू बुझ्न
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### संरचित लग विश्लेषण
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

### लग सम्बन्ध
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

## 🛠️ उन्नत डिबगिङ उपकरणहरू

### Azure स्रोत ग्राफ प्रश्नहरू
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### नेटवर्क डिबगिङ
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

### कन्टेनर डिबगिङ
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

### डाटाबेस कनेक्शन डिबगिङ
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

## 🔬 प्रदर्शन डिबगिङ

### अनुप्रयोग प्रदर्शन अनुगमन
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

### स्रोत उपयोग विश्लेषण
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

## 🧪 परीक्षण र प्रमाणीकरण

### एकीकरण परीक्षण डिबगिङ
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

### डिबगिङका लागि लोड परीक्षण
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

## 🔧 पूर्वाधार डिबगिङ

### Bicep टेम्प्लेट डिबगिङ
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

### स्रोत स्थिति विश्लेषण
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

## 🔒 सुरक्षा डिबगिङ

### प्रमाणीकरण प्रवाह डिबगिङ
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

### नेटवर्क सुरक्षा डिबगिङ
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

## 📱 अनुप्रयोग-विशेष डिबगिङ

### Node.js अनुप्रयोग डिबगिङ
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

### डाटाबेस क्वेरी डिबगिङ
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

## 🚨 आपतकालीन डिबगिङ प्रक्रियाहरू

### उत्पादन समस्या प्रतिक्रिया
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

### रोलब्याक प्रक्रिया
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

यो कोड-मात्र रोलब्याकले पूर्वाधार, डाटाबेस माइग्रेशनहरू, वा गोप्य जानकारी फर्काउँदैन। सफा वर्कट्री प्रयोग गर्नुहोस्, सुरुमा कमिट रेकर्ड गर्नुहोस् र पछि पुनर्स्थापना गर्नुहोस्; कमाण्ड वर्तमान रिपोजिटरीमा चयनित कमिटलाई चेक आउट गर्छ।

## 📊 डिबगिङ ड्यासबोर्डहरू

### अनुकूलित अनुगमन ड्यासबोर्ड
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

### लग सङ्कलन
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

## 🔗 उन्नत स्रोतहरू

### अनुकूलित डिबग स्क्रिप्टहरू
मा एउटा `scripts/debug/` निर्देशिका बनाउनुहोस्:
- `health-check.sh` - व्यापक स्वास्थ्य जाँच
- `performance-test.sh` - स्वचालित प्रदर्शन परीक्षण
- `log-analyzer.py` - उन्नत लग पार्सिङ र विश्लेषण
- `resource-validator.sh` - पूर्वाधार प्रमाणीकरण

### अनुगमन एकीकरण
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

## उत्कृष्ट अभ्यासहरू

१. **सधैं डिबग लगिङ सक्षम पार्नुहोस्** गैर-उत्पादन वातावरणहरूमा
२. **समस्याहरूका लागि पुन: उत्पन्न गर्न सकिने परीक्षण केसहरू सिर्जना गर्नुहोस्**
३. **तपाईंको टोलीका लागि डिबगिङ प्रक्रियाहरू दस्तावेज गर्नुहोस्**
४. **स्वचालित स्वास्थ्य जाँच र अनुगमन गर्नुहोस्**
५. **तपाईंको अनुप्रयोगका परिवर्तनहरूसँग डिबग उपकरण अपडेट राख्नुहोस्**
६. **गैर-घटना समयमा डिबगिङ प्रक्रियाहरू अभ्यास गर्नुहोस्**

## अर्को कदमहरू

- [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत आवश्यकताहरू योजना बनाउने
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सेवा तहहरू छनोट गर्ने
- [पूर्व-उडान जाँचहरू](../chapter-06-pre-deployment/preflight-checks.md) - डिप्लोयमेन्ट पूर्व प्रमाणीकरण
- [चिट शीट](../../resources/cheat-sheet.md) - छिटो सन्दर्भ आदेशहरू

---

**सम्झनुहोस्**: राम्रो डिबगिङ भनेको व्यवस्थित, सावधानीपूर्वक, र धैर्यपूर्वक हुनु हो। यी उपकरण र प्रविधिहरूले तपाईंलाई छिटो र प्रभावकारी रूपमा समस्याको निदान गर्न मद्दत गर्नेछ।

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [सामान्य समस्याहरू](common-issues.md)

- **अर्को पाठ**: [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->