# AZD ডিপ্লয়মেন্টের জন্য ডিবাগিং গাইড

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - সমস্যা সমাধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী**: [সাধারণ সমস্যা](common-issues.md)
- **➡️ পরবর্তী**: [AI-সম্পর্কিত সমস্যা সমাধান](ai-troubleshooting.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্ন](../microsoft-foundry/production-ai-practices.md)

## ভূমিকা

এই বিস্তৃত গাইডটি Azure Developer CLI ডিপ্লয়মেন্টের জটিল সমস্যাগুলি নির্ণয় ও সমাধানের জন্য উন্নত ডিবাগিং কৌশল, টুল এবং পদ্ধতি প্রদান করে। পদ্ধতিগত সমস্যা সমাধানের পদ্ধতি, লগ বিশ্লেষণ কৌশল, পারফরম্যান্স প্রোফাইলিং এবং উন্নত ডায়াগনস্টিক টুল সম্পর্কে শিখুন যা ডিপ্লয়মেন্ট এবং রানটাইম সমস্যাগুলি দক্ষতার সাথে সমাধান করতে সাহায্য করবে।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI সমস্যার জন্য পদ্ধতিগত ডিবাগিং পদ্ধতি আয়ত্ত করবেন
- উন্নত লগ কনফিগারেশন এবং লগ বিশ্লেষণ কৌশল বুঝবেন
- পারফরম্যান্স প্রোফাইলিং এবং মনিটরিং কৌশল বাস্তবায়ন করবেন
- জটিল সমস্যা সমাধানের জন্য Azure ডায়াগনস্টিক টুল এবং পরিষেবাগুলি ব্যবহার করবেন
- নেটওয়ার্ক ডিবাগিং এবং সিকিউরিটি সমস্যা সমাধানের কৌশল প্রয়োগ করবেন
- সক্রিয় সমস্যা সনাক্তকরণের জন্য ব্যাপক মনিটরিং এবং অ্যালার্টিং কনফিগার করবেন

## শেখার ফলাফল

গাইড সম্পন্ন করার পর আপনি:
- জটিল ডিপ্লয়মেন্ট সমস্যাগুলি পদ্ধতিগতভাবে ডিবাগ করার জন্য TRIAGE পদ্ধতি প্রয়োগ করতে পারবেন
- ব্যাপক লগিং এবং ট্রেসিং তথ্য কনফিগার এবং বিশ্লেষণ করতে পারবেন
- Azure Monitor, Application Insights এবং ডায়াগনস্টিক টুল কার্যকরভাবে ব্যবহার করতে পারবেন
- নেটওয়ার্ক সংযোগ, অথেনটিকেশন এবং অনুমতি সমস্যাগুলি স্বাধীনভাবে ডিবাগ করতে পারবেন
- পারফরম্যান্স মনিটরিং এবং অপ্টিমাইজেশন কৌশল বাস্তবায়ন করতে পারবেন
- পুনরাবৃত্ত সমস্যার জন্য কাস্টম ডিবাগিং স্ক্রিপ্ট এবং অটোমেশন তৈরি করতে পারবেন

## ডিবাগিং পদ্ধতি

### TRIAGE পদ্ধতি
- **T**ime: কখন সমস্যা শুরু হয়েছিল?
- **R**eproduce: আপনি কি এটি নিয়মিতভাবে পুনরুত্পাদন করতে পারেন?
- **I**solate: কোন কম্পোনেন্টটি ব্যর্থ হচ্ছে?
- **A**nalyze: লগগুলি আমাদের কী বলছে?
- **G**ather: সমস্ত প্রাসঙ্গিক তথ্য সংগ্রহ করুন
- **E**scalate: কখন অতিরিক্ত সাহায্য চাইতে হবে

## ডিবাগ মোড সক্রিয় করা

### পরিবেশ ভেরিয়েবল
```bash
# ব্যাপক ডিবাগিং সক্ষম করুন
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
# ডিবাগ কনফিগারেশন বিশ্বব্যাপী সেট করুন
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ট্রেস লগিং সক্ষম করুন
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 লগ বিশ্লেষণ কৌশল

### লগ লেভেল বোঝা
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
# লগ স্তর দ্বারা ফিল্টার করুন
azd logs --level error --since 1h

# পরিষেবা দ্বারা ফিল্টার করুন
azd logs --service api --level debug

# বিশ্লেষণের জন্য লগ রপ্তানি করুন
azd logs --output json > deployment-logs.json

# jq দিয়ে JSON লগ পার্স করুন
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### লগ করেলেশন
```bash
#!/bin/bash
# correlate-logs.sh - পরিষেবাগুলির মধ্যে লগগুলি সম্পর্কিত করুন

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# সমস্ত পরিষেবার মধ্যে অনুসন্ধান করুন
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure লগগুলি অনুসন্ধান করুন
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ উন্নত ডিবাগিং টুল

### Azure Resource Graph Queries
```bash
# ট্যাগ দ্বারা রিসোর্স অনুসন্ধান করুন
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ব্যর্থ ডিপ্লয়মেন্টগুলি খুঁজুন
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# রিসোর্সের স্বাস্থ্য পরীক্ষা করুন
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### নেটওয়ার্ক ডিবাগিং
```bash
# পরিষেবাগুলির মধ্যে সংযোগ পরীক্ষা করুন
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

### কন্টেইনার ডিবাগিং
```bash
# কন্টেইনার অ্যাপ সমস্যাগুলি ডিবাগ করুন
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
# অ্যাপ্লিকেশন ইনসাইটস ডিবাগিং সক্ষম করুন
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
# সম্পদের ব্যবহার পর্যবেক্ষণ করুন
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

## 🧪 টেস্টিং এবং যাচাইকরণ

### ইন্টিগ্রেশন টেস্ট ডিবাগিং
```bash
#!/bin/bash
# ডিবাগ-ইন্টিগ্রেশন-টেস্টস.শ

set -e

echo "Running integration tests with debugging..."

# ডিবাগ পরিবেশ সেট করুন
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# পরিষেবা এন্ডপয়েন্টগুলি পান
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# স্বাস্থ্য এন্ডপয়েন্টগুলি পরীক্ষা করুন
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

# টেস্ট চালান
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# কাস্টম ইন্টিগ্রেশন টেস্ট চালান
npm run test:integration
```

### লোড টেস্টিং ডিবাগিং
```bash
# কর্মক্ষমতার সীমাবদ্ধতা সনাক্ত করার জন্য সহজ লোড পরীক্ষা
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ব্যবহার করা হচ্ছে (ইনস্টল: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # প্রধান মেট্রিক্স বের করুন
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ব্যর্থতার জন্য পরীক্ষা করুন
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 অবকাঠামো ডিবাগিং

### Bicep টেমপ্লেট ডিবাগিং
```bash
# বিস্তারিত আউটপুট সহ Bicep টেমপ্লেট যাচাই করুন
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # সিনট্যাক্স যাচাই
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # লিন্ট যাচাই
    az bicep lint --file "$template_file"
    
    # কী হবে ডিপ্লয়মেন্ট
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
# অসঙ্গতির জন্য সম্পদের অবস্থাগুলি বিশ্লেষণ করুন
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # সমস্ত সম্পদ এবং তাদের অবস্থাগুলি তালিকাভুক্ত করুন
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ব্যর্থ সম্পদগুলির জন্য পরীক্ষা করুন
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

## 🔒 সিকিউরিটি ডিবাগিং

### অথেনটিকেশন ফ্লো ডিবাগিং
```bash
# আজুর প্রমাণীকরণ ডিবাগ করুন
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

# কী ভল্ট অ্যাক্সেস ডিবাগ করুন
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

### নেটওয়ার্ক সিকিউরিটি ডিবাগিং
```bash
# নেটওয়ার্ক সিকিউরিটি গ্রুপ ডিবাগ করুন
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # সিকিউরিটি নিয়মগুলি পরীক্ষা করুন
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
// ডিবাগ-মিডলওয়্যার.js - এক্সপ্রেস ডিবাগিং মিডলওয়্যার
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
    
    // res.json ওভাররাইড করুন প্রতিক্রিয়া লগ করার জন্য
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
// ডাটাবেস-ডিবাগ.জেএস - ডাটাবেস ডিবাগিং ইউটিলিটি
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

### প্রোডাকশন সমস্যা প্রতিক্রিয়া
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

# সঠিক পরিবেশে স্যুইচ করুন
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
# দ্রুত রোলব্যাক স্ক্রিপ্ট
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # পরিবেশ পরিবর্তন করুন
    azd env select "$environment"
    
    # অ্যাপ্লিকেশন রোলব্যাক করুন
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # রোলব্যাক যাচাই করুন
    echo "Verifying rollback..."
    azd show
    
    # গুরুত্বপূর্ণ এন্ডপয়েন্ট পরীক্ষা করুন
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ডিবাগিং ড্যাশবোর্ড

### কাস্টম মনিটরিং ড্যাশবোর্ড
```bash
# ডিবাগিংয়ের জন্য অ্যাপ্লিকেশন ইনসাইটস প্রশ্ন তৈরি করুন
create_debug_queries() {
    local app_insights_name=$1
    
    # ত্রুটির জন্য প্রশ্ন করুন
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # কর্মক্ষমতার সমস্যার জন্য প্রশ্ন করুন
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # নির্ভরতার ব্যর্থতার জন্য প্রশ্ন করুন
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### লগ অ্যাগ্রিগেশন
```bash
# একাধিক উৎস থেকে লগগুলি সংগ্রহ করুন
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

## 🔗 উন্নত রিসোর্স

### কাস্টম ডিবাগ স্ক্রিপ্ট
একটি `scripts/debug/` ডিরেক্টরি তৈরি করুন:
- `health-check.sh` - ব্যাপক স্বাস্থ্য পরীক্ষা
- `performance-test.sh` - স্বয়ংক্রিয় পারফরম্যান্স টেস্টিং
- `log-analyzer.py` - উন্নত লগ পার্সিং এবং বিশ্লেষণ
- `resource-validator.sh` - অবকাঠামো যাচাইকরণ

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

1. **ডিবাগ লগিং সর্বদা সক্রিয় করুন** নন-প্রোডাকশন পরিবেশে
2. **সমস্যার জন্য পুনরুত্পাদনযোগ্য টেস্ট কেস তৈরি করুন**
3. **আপনার টিমের জন্য ডিবাগিং পদ্ধতি ডকুমেন্ট করুন**
4. **স্বয়ংক্রিয় স্বাস্থ্য পরীক্ষা এবং মনিটরিং করুন**
5. **আপনার অ্যাপ্লিকেশন পরিবর্তনের সাথে ডিবাগ টুল আপডেট রাখুন**
6. **অঘটন সময়ে ডিবাগিং পদ্ধতি অনুশীলন করুন**

## পরবর্তী পদক্ষেপ

- [ক্ষমতা পরিকল্পনা](../pre-deployment/capacity-planning.md) - রিসোর্স প্রয়োজনীয়তা পরিকল্পনা করুন
- [SKU নির্বাচন](../pre-deployment/sku-selection.md) - উপযুক্ত সার্ভিস টিয়ার নির্বাচন করুন
- [প্রিফ্লাইট চেক](../pre-deployment/preflight-checks.md) - প্রি-ডিপ্লয়মেন্ট যাচাইকরণ
- [চিট শিট](../../resources/cheat-sheet.md) - দ্রুত রেফারেন্স কমান্ড

---

**মনে রাখবেন**: ভালো ডিবাগিং মানে পদ্ধতিগত, বিস্তারিত এবং ধৈর্যশীল হওয়া। এই টুল এবং কৌশলগুলি আপনাকে দ্রুত এবং আরও কার্যকরভাবে সমস্যাগুলি নির্ণয় করতে সাহায্য করবে।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [সাধারণ সমস্যা](common-issues.md)

- **পরবর্তী পাঠ**: [ক্ষমতা পরিকল্পনা](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->