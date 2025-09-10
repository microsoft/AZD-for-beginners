<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a03c268130e67f5c2a707f97f517c55b",
  "translation_date": "2025-09-10T05:29:49+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "bn"
}
-->
# ডিবাগিং গাইড - উন্নত সমস্যার সমাধানের লগ বিশ্লেষণ কৌশল

## ভূমিকা

এই বিস্তৃত গাইডটি উন্নত ডিবাগিং কৌশল, সরঞ্জাম এবং পদ্ধতি প্রদান করে যা Azure Developer CLI ডিপ্লয়মেন্টের জটিল সমস্যাগুলি নির্ণয় এবং সমাধানের জন্য সহায়ক। এখানে আপনি পদ্ধতিগত সমস্যার সমাধানের পদ্ধতি, লগ বিশ্লেষণ কৌশল, পারফরম্যান্স প্রোফাইলিং এবং উন্নত ডায়াগনস্টিক সরঞ্জাম সম্পর্কে শিখবেন যা ডিপ্লয়মেন্ট এবং রানটাইম সমস্যাগুলি দক্ষতার সাথে সমাধান করতে সাহায্য করবে।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI সমস্যার জন্য পদ্ধতিগত ডিবাগিং পদ্ধতি আয়ত্ত করবেন
- উন্নত লগ কনফিগারেশন এবং লগ বিশ্লেষণ কৌশল বুঝতে পারবেন
- পারফরম্যান্স প্রোফাইলিং এবং মনিটরিং কৌশল বাস্তবায়ন করবেন
- জটিল সমস্যার সমাধানের জন্য Azure ডায়াগনস্টিক সরঞ্জাম এবং পরিষেবাগুলি ব্যবহার করবেন
- নেটওয়ার্ক ডিবাগিং এবং নিরাপত্তা সমস্যার সমাধানের কৌশল প্রয়োগ করবেন
- সক্রিয়ভাবে সমস্যা সনাক্ত করার জন্য ব্যাপক মনিটরিং এবং অ্যালার্টিং কনফিগার করবেন

## শেখার ফলাফল

এই গাইড সম্পন্ন করার পর আপনি:
- জটিল ডিপ্লয়মেন্ট সমস্যাগুলি পদ্ধতিগতভাবে ডিবাগ করার জন্য TRIAGE পদ্ধতি প্রয়োগ করতে পারবেন
- ব্যাপক লগিং এবং ট্রেসিং তথ্য কনফিগার এবং বিশ্লেষণ করতে পারবেন
- Azure Monitor, Application Insights এবং ডায়াগনস্টিক সরঞ্জামগুলি কার্যকরভাবে ব্যবহার করতে পারবেন
- নেটওয়ার্ক সংযোগ, প্রমাণীকরণ এবং অনুমতি সমস্যাগুলি স্বাধীনভাবে ডিবাগ করতে পারবেন
- পারফরম্যান্স মনিটরিং এবং অপ্টিমাইজেশন কৌশল বাস্তবায়ন করতে পারবেন
- পুনরাবৃত্ত সমস্যাগুলির জন্য কাস্টম ডিবাগিং স্ক্রিপ্ট এবং অটোমেশন তৈরি করতে পারবেন

## ডিবাগিং পদ্ধতি

### TRIAGE পদ্ধতি
- **T**ime: কখন সমস্যা শুরু হয়েছিল?
- **R**eproduce: আপনি কি এটি ধারাবাহিকভাবে পুনরুত্পাদন করতে পারেন?
- **I**solate: কোন কম্পোনেন্টটি ব্যর্থ হচ্ছে?
- **A**nalyze: লগগুলি আমাদের কী বলছে?
- **G**ather: সমস্ত প্রাসঙ্গিক তথ্য সংগ্রহ করুন
- **E**scalate: কখন অতিরিক্ত সাহায্য চাইতে হবে

## ডিবাগ মোড সক্রিয় করা

### পরিবেশ ভেরিয়েবল
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

### ডিবাগ কনফিগারেশন
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 লগ বিশ্লেষণ কৌশল

### লগ স্তরগুলি বোঝা
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### কাঠামোগত লগ বিশ্লেষণ
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

### লগ করেলেশন
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

## 🛠️ উন্নত ডিবাগিং সরঞ্জাম

### Azure Resource Graph Queries
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
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
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### কন্টেইনার ডিবাগিং
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

### ডাটাবেস সংযোগ ডিবাগিং
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

## 🔬 পারফরম্যান্স ডিবাগিং

### অ্যাপ্লিকেশন পারফরম্যান্স মনিটরিং
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

### রিসোর্স ব্যবহার বিশ্লেষণ
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

## 🧪 পরীক্ষা এবং যাচাই

### ইন্টিগ্রেশন টেস্ট ডিবাগিং
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

### লোড টেস্টিং ডিবাগিংয়ের জন্য
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

## 🔒 নিরাপত্তা ডিবাগিং

### প্রমাণীকরণ প্রবাহ ডিবাগিং
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

### নেটওয়ার্ক নিরাপত্তা ডিবাগিং
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

### ডাটাবেস কোয়েরি ডিবাগিং
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

## 🚨 জরুরি ডিবাগিং পদ্ধতি

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

### রোলব্যাক পদ্ধতি
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

## 📊 ডিবাগিং ড্যাশবোর্ড

### কাস্টম মনিটরিং ড্যাশবোর্ড
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

### লগ অ্যাগ্রিগেশন
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

## 🔗 উন্নত সম্পদ

### কাস্টম ডিবাগ স্ক্রিপ্ট
`scripts/debug/` ডিরেক্টরি তৈরি করুন:
- `health-check.sh` - ব্যাপক স্বাস্থ্য পরীক্ষা
- `performance-test.sh` - স্বয়ংক্রিয় পারফরম্যান্স পরীক্ষা
- `log-analyzer.py` - উন্নত লগ পার্সিং এবং বিশ্লেষণ
- `resource-validator.sh` - অবকাঠামো যাচাই

### মনিটরিং ইন্টিগ্রেশন
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

## সেরা অনুশীলন

1. **ডিবাগ লগিং সর্বদা সক্রিয় করুন** প্রোডাকশন পরিবেশের বাইরে
2. **সমস্যার জন্য পুনরুত্পাদনযোগ্য টেস্ট কেস তৈরি করুন**
3. **আপনার টিমের জন্য ডিবাগিং পদ্ধতি নথিভুক্ত করুন**
4. **স্বয়ংক্রিয় স্বাস্থ্য পরীক্ষা এবং মনিটরিং বাস্তবায়ন করুন**
5. **আপনার অ্যাপ্লিকেশন পরিবর্তনের সাথে ডিবাগ সরঞ্জাম আপডেট রাখুন**
6. **অঘটন সময়ে ডিবাগিং পদ্ধতি অনুশীলন করুন**

## পরবর্তী পদক্ষেপ

- [Capacity Planning](../pre-deployment/capacity-planning.md) - রিসোর্স প্রয়োজনীয়তা পরিকল্পনা করুন
- [SKU Selection](../pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস টিয়ার নির্বাচন করুন
- [Preflight Checks](../pre-deployment/preflight-checks.md) - প্রি-ডিপ্লয়মেন্ট যাচাই
- [Cheat Sheet](../../resources/cheat-sheet.md) - দ্রুত রেফারেন্স কমান্ড

---

**মনে রাখবেন**: ভালো ডিবাগিং মানে পদ্ধতিগত, বিস্তারিত এবং ধৈর্যশীল হওয়া। এই সরঞ্জাম এবং কৌশলগুলি আপনাকে দ্রুত এবং কার্যকরভাবে সমস্যাগুলি নির্ণয় করতে সাহায্য করবে।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Common Issues](common-issues.md)

- **পরবর্তী পাঠ**: [Capacity Planning](../pre-deployment/capacity-planning.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।