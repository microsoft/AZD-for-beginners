# AZD ডেপ্লয়মেন্টগুলির জন্য ডিবাগিং গাইড

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 7 - সমস্যা সমাধান ও ডিবাগিং
- **⬅️ পূর্বের**: [Common Issues](common-issues.md)
- **➡️ পরের**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## পরিচিতি

এই বিস্তৃত গাইডটি Azure Developer CLI ডেপ্লয়মেন্টগুলির জটিল সমস্যা নির্ণয় ও সমাধানের জন্য উন্নত ডিবাগিং কৌশল, টুল এবং প্রযুক্তি প্রদান করে। সিস্টেম্যাটিক ট্রাবলশুটিং পদ্ধতি, লগ বিশ্লেষণ কৌশল, পারফরম্যান্স প্রোফাইলিং এবং উন্নত ডায়াগনস্টিক টুল শিখে ডেপ্লয়মেন্ট ও রানটাইম সমস্যাগুলি দক্ষতার সাথে সমাধান করুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI সমস্যাগুলির জন্য সিস্টেম্যাটিক ডিবাগিং পদ্ধতি আয়ত্ত করবেন
- উন্নত লগ কনফিগারেশন এবং লগ বিশ্লেষণ কৌশল বুঝতে পারবেন
- পারফরম্যান্স প্রোফাইলিং এবং মনিটরিং কৌশল বাস্তবায়ন করতে পারবেন
- জটিল সমস্যা সমাধানের জন্য Azure ডায়াগনস্টিক টুল ও পরিষেবা ব্যবহার করতে পারবেন
- নেটওয়ার্ক ডিবাগিং এবং নিরাপত্তা ট্রাবলশুটিং কৌশল প্রয়োগ করতে পারবেন
- প্রাথমিক সমস্যা সনাক্তকরণের জন্য ব্যাপক মনিটরিং ও এলার্টিং কনফিগার করবেন

## শেখার ফলাফল

শেষে, আপনি সক্ষম হবেন:
- জটিল ডেপ্লয়মেন্ট সমস্যাগুলি সিস্টেম্যাটিকভাবে ডিবাগ করার জন্য TRIAGE পদ্ধতি প্রয়োগ করতে
- ব্যাপক লগিং এবং ট্রেসিং তথ্য কনফিগার ও বিশ্লেষণ করতে
- Azure Monitor, Application Insights, এবং ডায়াগনস্টিক টুল কার্যকরভাবে ব্যবহার করতে
- নেটওয়ার্ক সংযোগ, প্রমাণীকরণ এবং অনুমতি সমস্যা স্বাধীনভাবে ডিবাগ করতে
- পারফরম্যান্স মনিটরিং এবং অপ্টিমাইজেশন কৌশল বাস্তবায়ন করতে
- পুনরাবৃত্ত সমস্যাগুলির জন্য কাস্টম ডিবাগিং স্ক্রিপ্ট এবং অটোমেশন তৈরি করতে

## ডিবাগিং পদ্ধতি

### The TRIAGE Approach
- **T**সময়: সমস্যা কখন শুরু হয়েছিল?
- **R**পুনরুৎপাদন: আপনি কি এটি ধারাবাহিকভাবে পুনরায় উত্পাদন করতে পারেন?
- **I**আলোচনা করা: কোন উপাদানটি ব্যর্থ হচ্ছে?
- **A**বিশ্লেষণ: লগগুলো আমাদের কী বলছে?
- **G**সংগৃহীত করুন: সমস্ত প্রাসঙ্গিক তথ্য সংগ্রহ করুন
- **E**উর্ধ্বগামী করুন: কখন অতিরিক্ত সহায়তা চাইবেন

## ডিবাগ মোড সক্ষম করা

### পরিবেশ পরিবর্তনশীল
```bash
# বিস্তৃত ডিবাগিং সক্ষম করুন
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI ডিবাগিং
export AZURE_CLI_DIAGNOSTICS=true

# পরিষ্কার আউটপুটের জন্য টেলিমেট্রি নিষ্ক্রিয় করুন
export AZD_DISABLE_TELEMETRY=true
```

### ডিবাগ কনফিগারেশন
```bash
# ডিবাগ কনফিগারেশন গ্লোবালি সেট করুন
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ট্রেস লগিং সক্রিয় করুন
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 লগ বিশ্লেষণ কৌশল

### লগ স্তর বুঝা
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
# Azure Monitor দিয়ে লগ দেখুন (azd monitor এর মাধ্যমে)
azd monitor --logs

# রিয়েল-টাইমে অ্যাপ্লিকেশন লগ দেখুন
azd monitor --live

# বিস্তারিত লগ বিশ্লেষণের জন্য, আপনার App Service বা Container App-এর সাথে Azure CLI ব্যবহার করুন:
# App Service লগ
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App লগ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# বিশ্লেষণের জন্য Application Insights লগ রপ্তানি করুন
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### লগ করিলেশন
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ব্যবহার করে সেবাগুলোর মধ্যে লগগুলো সম্পর্কিত করা

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# সম্পর্কযুক্ত লগগুলির জন্য Application Insights-এ সন্ধান করুন
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure activity logs-এ সন্ধান করুন
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ উন্নত ডিবাগিং টুল

### Azure Resource Graph প্রশ্ন
```bash
# ট্যাগ অনুযায়ী রিসোর্স অনুসন্ধান করুন
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ব্যর্থ ডিপ্লয়মেন্ট খুঁজুন
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# রিসোর্সের স্বাস্থ্য পরীক্ষা করুন
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### নেটওয়ার্ক ডিবাগিং
```bash
# সেবাগুলির মধ্যে সংযোগ পরীক্ষা করুন
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

# ব্যবহার
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### কনটেইনার ডিবাগিং
```bash
# কনটেইনার অ্যাপ সমস্যাগুলি ডিবাগ করুন
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
# ডাটাবেস সংযোগ ডিবাগ করুন
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
# Application Insights ডিবাগিং সক্ষম করুন
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

# কাস্টম পারফরম্যান্স মনিটরিং
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
# রিসোর্স ব্যবহার পর্যবেক্ষণ করুন
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

## 🧪 টেস্টিং এবং যাচাই

### ইন্টিগ্রেশন টেস্ট ডিবাগিং
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# ডিবাগ পরিবেশ সেট করুন
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# সার্ভিস এন্ডপয়েন্টগুলি নিন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# হেলথ এন্ডপয়েন্ট পরীক্ষা করুন
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

# টেস্টগুলো চালান
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# কাস্টম ইন্টিগ্রেশন টেস্ট চালান
npm run test:integration
```

### লোড টেস্টিং ফর ডিবাগিং
```bash
# পারফরম্যান্সের বটলনেক সনাক্ত করার জন্য একটি সহজ লোড টেস্ট
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ব্যবহার করা হচ্ছে (ইনস্টল: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # প্রধান মেট্রিকগুলো বের করুন
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ব্যর্থতা পরীক্ষা করুন
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ইনফ্রাস্ট্রাকচার ডিবাগিং

### Bicep টেমপ্লেট ডিবাগিং
```bash
# Bicep টেমপ্লেটগুলি বিস্তারিত আউটপুট সহ যাচাই করুন
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # সিনট্যাক্স যাচাই
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # লিন্ট যাচাই
    az bicep lint --file "$template_file"
    
    # What-if ডিপ্লয়মেন্ট
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# টেমপ্লেট ডিপ্লয়মেন্ট ডিবাগ করুন
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
# রিসোর্সের অবস্থা অসামঞ্জস্যের জন্য বিশ্লেষণ করুন
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # সমস্ত রিসোর্স তাদের অবস্থাসহ তালিকাভুক্ত করুন
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ব্যর্থ রিসোর্স আছে কি না পরীক্ষা করুন
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

### প্রমাণীকরণ ফ্লো ডিবাগিং
```bash
# Azure প্রমাণীকরণ ডিবাগ করুন
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT টোকেন ডিকোড করুন (jq এবং base64 প্রয়োজন)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault অ্যাক্সেস ডিবাগ করুন
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
# নেটওয়ার্ক নিরাপত্তা গ্রুপগুলো ডিবাগ করুন
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # নিরাপত্তা নিয়মগুলো পরীক্ষা করুন
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
// debug-middleware.js - Express ডিবাগিং মিডলওয়্যার
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // অনুরোধের বিবরণ লগ করুন
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json ওভাররাইড করে প্রতিক্রিয়াগুলো লগ করুন
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ডাটাবেস কুয়েরি ডিবাগিং
```javascript
// database-debug.js - ডাটাবেস ডিবাগিং সরঞ্জামসমূহ
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

### প্রোডাকশন ইস্যু রেসপন্স
```bash
#!/bin/bash
# emergency-debug.sh - জরুরি প্রোডাকশন ডিবাগিং

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

# সঠিক পরিবেশে পরিবর্তন করুন
azd env select "$ENVIRONMENT"

# গুরুত্বপূর্ণ তথ্য সংগ্রহ করুন
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# ত্রুটি লগের জন্য Azure Monitor ব্যবহার করুন
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

### রোলব্যাক পদ্ধতি
```bash
# দ্রুত রোলব্যাক স্ক্রিপ্ট
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # পরিবেশ পরিবর্তন
    azd env select "$environment"
    
    # Git ব্যবহার করে রোলব্যাক (AZD-এ বিল্ট-ইন রোলব্যাক নেই)
    git checkout "$previous_commit"
    azd deploy
    
    # রোলব্যাক যাচাই করুন
    echo "Verifying rollback..."
    azd show
    
    # গুরুত্বপূর্ণ এন্ডপয়েন্টগুলি পরীক্ষা করুন
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ডিবাগিং ড্যাশবোর্ড

### কাস্টম মনিটরিং ড্যাশবোর্ড
```bash
# ডিবাগিংয়ের জন্য Application Insights কোয়েরি তৈরি করুন
create_debug_queries() {
    local app_insights_name=$1
    
    # ত্রুটির জন্য কোয়েরি
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # পারফরম্যান্স সমস্যার জন্য কোয়েরি
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # নির্ভরশীলতা ব্যর্থতার জন্য কোয়েরি
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### লগ এটাগ্রেশন
```bash
# একাধিক Azure উৎস থেকে লগসমূহ একত্রিত করুন
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

## 🔗 উন্নত রিসোর্স

### কাস্টম ডিবাগ স্ক্রিপ্ট
Create a `scripts/debug/` directory with:
- `health-check.sh` - সার্বিক স্বাস্থ্যের চেকিং
- `performance-test.sh` - স্বয়ংক্রিয় পারফরম্যান্স টেস্টিং
- `log-analyzer.py` - উন্নত লগ পার্সিং ও বিশ্লেষণ
- `resource-validator.sh` - ইনফ্রাস্ট্রাকচার ভ্যালিডেশন

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

1. **প্রোডাকশন ব্যতীত পরিবেশে সর্বদা ডিবাগ লগিং সক্রিয় করুন**
2. **সমস্যার জন্য পুনরুত্পাদক টেস্ট কেস তৈরি করুন**
3. **আপনার দলের জন্য ডিবাগিং পদ্ধতি দলিলভুক্ত করুন**
4. **হেলথ চেক এবং মনিটরিং অটোমেট করুন**
5. **ডিবাগ টুলগুলি আপনার অ্যাপ্লিকেশন পরিবর্তনের সাথে আপডেট রাখুন**
6. **অঘটনের সময় নয় এমন সময়ে ডিবাগিং পদ্ধতিগুলো অনুশীলন করুন**

## পরবর্তী ধাপ

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্সের চাহিদা পরিকল্পনা করুন
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস টিয়ার নির্বাচন করুন
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - প্রি-ডেপ্লয়মেন্ট যাচাই
- [Cheat Sheet](../../resources/cheat-sheet.md) - দ্রুত রেফারেন্স কমান্ড

---

**মনে রাখবেন**: ভাল ডিবাগিং হচ্ছে পদ্ধতিগত, পরিপূর্ণ এবং ধৈর্যশীল হওয়া। এই টুল ও কৌশলগুলো আপনাকে দ্রুত এবং কার্যকরভাবে সমস্যার নির্ণয়ে সহায়তা করবে।

---

**নেভিগেশন**
- **পূর্বের লেসন**: [Common Issues](common-issues.md)

- **পরের লেসন**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা যথাসাধ্য সঠিকতা বজায় রাখার চেষ্টা করি, তবু অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষার ডকুমেন্টটিকেই কর্তৃত্বপূর্ণ উৎস হিসেবে ধরা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ ব্যবহার করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুলবোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->