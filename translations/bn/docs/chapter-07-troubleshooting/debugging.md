# AZD ডিপ্লয়মেন্টের জন্য ডিবাগিং গাইড

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [শুরুদের জন্য AZD](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - সমস্যার সমাধান ও ডিবাগিং
- **⬅️ আগে**: [সাধারণ সমস্যাসমূহ](common-issues.md)
- **➡️ পরবর্তী**: [এআই-নির্দিষ্ট সমস্যার সমাধান](ai-troubleshooting.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)

## পরিচিতি

এই বিস্তৃত গাইডটি উন্নত ডিবাগিং কৌশল, টুলস এবং কৌশল সরবরাহ করে যা Azure Developer CLI ডিপ্লয়মেন্ট সংক্রান্ত জটিল সমস্যাগুলি নির্ণয় ও সমাধানের জন্য ব্যবহৃত হয়। পদ্ধতিগত সমস্যা সমাধান পদ্ধতি, লগ বিশ্লেষণ কৌশল, পারফরম্যান্স প্রোফাইলিং, এবং উন্নত ডায়াগনস্টিক টুলস শিখুন যাতে ডিপ্লয়মেন্ট ও রানটাইম সমস্যাগুলি দক্ষতার সাথে সমাধান করতে পারেন।

## শেখার লক্ষ্যসমূহ

এই গাইডটি সম্পন্ন করে আপনি:
- Azure Developer CLI সমস্যার জন্য পদ্ধতিগত ডিবাগিং পদ্ধতি আয়ত্ত করবেন
- উন্নত লগিং কনফিগারেশন এবং লগ বিশ্লেষণ কৌশল বুঝতে সক্ষম হবেন
- পারফরম্যান্স প্রোফাইলিং ও মনিটরিং কৌশল প্রয়োগ করবেন
- জটিল সমস্যা সমাধানের জন্য Azure ডায়াগনস্টিক টুলস ও সেবা ব্যবহার করবেন
- নেটওয়ার্ক ডিবাগিং এবং নিরাপত্তা সমস্যা সমাধান কৌশল প্রয়োগ করবেন
- সমস্যা শনাক্তকরণের জন্য ব্যাপক মনিটরিং ও সতর্কতা কনফিগার করবেন

## শেখার ফলাফল

সম্পন্ন করার পর, আপনি সক্ষম হবেন:
- জটিল ডিপ্লয়মেন্ট সমস্যাগুলো পদ্ধতিগতভাবে ডিবাগ করার জন্য TRIAGE পদ্ধতি প্রয়োগ করতে
- ব্যাপক লগিং এবং ট্রেসিং তথ্য কনফিগার এবং বিশ্লেষণ করতে
- Azure Monitor, Application Insights এবং ডায়াগনস্টিক টুলস কার্যকরভাবে ব্যবহার করতে
- নেটওয়ার্ক সংযোগ, প্রমাণীকরণ এবং অনুমতি সমস্যাগুলো স্বাধীনভাবে ডিবাগ করতে
- পারফরম্যান্স মনিটরিং এবং অপটিমাইজেশন কৌশল প্রয়োগ করতে
- পুনরাবৃত্ত সমস্যা সমাধানের জন্য কাস্টম ডিবাগিং স্ক্রিপ্ট এবং অটোমেশন তৈরি করতে

## ডিবাগিং পদ্ধতি

### TRIAGE পদ্ধতি
- **T**ime: সমস্যা কখন শুরু হয়েছিল?
- **R**eproduce: আপনি কি ধারাবাহিকভাবে এটি পুনরুত্পাদন করতে পারেন?
- **I**solate: কোন উপাদানটি ব্যর্থ হচ্ছে?
- **A**nalyze: লগগুলি আমাদেরকে কী বলছে?
- **G**ather: সমস্ত প্রাসঙ্গিক তথ্য সংগ্রহ করুন
- **E**scalate: কখন অতিরিক্ত সহায়তা নিতে হবে

## ডিবাগ মোড সক্রিয়করণ

> **সীমা:** এগুলো অভিযোজনযোগ্য ডায়াগনস্টিক উদাহরণ, সরবরাহকৃত স্ক্রিপ্ট নয়। রিসোর্স নাম/আইডি পরিবর্তন করুন; শেল ব্লকের জন্য Bash ব্যবহার করুন। `--debug` আউটপুট এবং পরিবেশের মান সংবেদনশীল তথ্য থাকতে পারে — শেয়ার করার আগে পর্যালোচনা/গোপনীয়তা বজায় রাখুন। ডিপ্লয়, রোলব্যাক বা কনফিগারেশন পরিবর্তনের উদাহরণ সরাসরি অপারেটরের অনুমোদন ছাড়া করবেন না।

### পরিবেশ ভেরিয়েবলসমূহ
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### ডিবাগ কনফিগারেশন
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` ক্ষেত্রে যেকোনো কী সংরক্ষণ করতে পারেন; তবে এটি `debug.enabled`, `debug.logLevel` বা `trace.outputPath` সমর্থিত সেটিংস নয়। মুক্তি পাওয়া কমান্ডের `--debug` ফ্ল্যাগ ব্যবহার করুন।

## 📊 লগ বিশ্লেষণ কৌশলসমূহ

### লগ স্তর বোঝা
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### কাঠামোবদ্ধ লগ বিশ্লেষণ
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

### লগ সম্পর্কিততা
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

## 🛠️ উন্নত ডিবাগিং টুলস

### Azure রিসোর্স গ্রাফ প্রশ্ন
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### নেটওয়ার্ক ডিবাগিং
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

### কনটেইনার ডিবাগিং
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

### ডাটাবেস কানেকশন ডিবাগিং
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

## 🔬 পারফরম্যান্স ডিবাগিং

### অ্যাপ্লিকেশন পারফরম্যান্স মনিটরিং
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

### রিসোর্স ব্যবহারের বিশ্লেষণ
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

## 🧪 পরীক্ষা ও যাচাইকরণ

### ইন্টিগ্রেশন টেস্ট ডিবাগিং
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

### লোড টেস্টিং ডিবাগিং-এর জন্য
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

## 🔧 অবকাঠামো ডিবাগিং

### Bicep টেমপ্লেট ডিবাগিং
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

### রিসোর্স স্টেট বিশ্লেষণ
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

## 🔒 নিরাপত্তা ডিবাগিং

### প্রমাণীকরণ ফ্লো ডিবাগিং
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

### নেটওয়ার্ক সুরক্ষা ডিবাগিং
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

## 📱 অ্যাপ্লিকেশন-নির্দিষ্ট ডিবাগিং

### Node.js অ্যাপ্লিকেশন ডিবাগিং
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

### ডাটাবেস কোয়েরি ডিবাগিং
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

## 🚨 জরুরি ডিবাগিং প্রক্রিয়া

### প্রোডাকশন সমস্যার প্রতিক্রিয়া
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

### রোলব্যাক প্রক্রিয়াসমূহ
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

এই কোড-সমস্যা মাত্র রোলব্যাক অবকাঠামো, ডাটাবেস মাইগ্রেশন বা গোপনীয়তা ফেরত নেয় না। একটি পরিষ্কার ওয়ার্কট্রি ব্যবহার করুন, প্রারম্ভিক কমিট রেকর্ড করুন এবং পরে পুনরুদ্ধার করুন; কমান্ডটি বর্তমান রিপোজিটরিতে নির্বাচিত কমিট চেক আউট করে।

## 📊 ডিবাগিং ড্যাশবোর্ডসমূহ

### কাস্টম মনিটরিং ড্যাশবোর্ড
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

### লগ একত্রকরণ
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

## 🔗 উন্নত রিসোর্সসমূহ

### কাস্টম ডিবাগ স্ক্রিপ্টসমূহ
একটি `scripts/debug/` ডিরেক্টরি তৈরি করুন যার মধ্যে থাকবে:
- `health-check.sh` - বিস্তৃত স্বাস্থ্য পরীক্ষা
- `performance-test.sh` - স্বয়ংক্রিয় পারফরম্যান্স পরীক্ষা
- `log-analyzer.py` - উন্নত লগ পার্সিং ও বিশ্লেষণ
- `resource-validator.sh` - অবকাঠামোর যাচাইকরণ

### মনিটরিং ইন্টিগ্রেশন
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

## সেরা অনুশীলনসমূহ

1. **অপ্রোডাকশন পরিবেশে সবসময় ডিবাগ লগিং সক্রিয় রাখুন**
2. **সমস্যার জন্য পুনরুত্পাদনযোগ্য টেস্ট কেস তৈরি করুন**
3. **আপনার দলের জন্য ডিবাগিং প্রক্রিয়া ডকুমেন্ট করুন**
4. **স্বাস্থ্য পরীক্ষা ও মনিটরিং অটোমেট করুন**
5. **আপনার অ্যাপ্লিকেশন পরিবর্তনের সাথে ডিবাগ টুলস আপডেট রাখুন**
6. **অপ্রত্যাশিত সময়ে ডিবাগিং প্রক্রিয়া অভ্যাস করুন**

## পরবর্তী পদক্ষেপ

- [ক্ষমতা পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স প্রয়োজন নির্ধারণ
- [SKU নির্বাচন](../chapter-06-pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস স্তর নির্বাচন
- [প্রিফ্লাইট পরীক্ষা](../chapter-06-pre-deployment/preflight-checks.md) - পূর্ব-ডিপ্লয়মেন্ট যাচাইকরণ
- [চিটশিট](../../resources/cheat-sheet.md) - দ্রুত রেফারেন্স কমান্ডসমূহ

---

**মনে রাখবেন**: ভালো ডিবাগিং মানে পদ্ধতিগত, সুনির্দিষ্ট এবং ধৈর্যশীল হওয়া। এই টুলস এবং কৌশলগুলি আপনাকে দ্রুত ও কার্যকরভাবে সমস্যা নির্ণয়ে সাহায্য করবে।

---

**নেভিগেশন**
- **আগের পাঠ**: [সাধারণ সমস্যা](common-issues.md)

- **পরের পাঠ**: [ক্ষমতা পরিকল্পনা](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->