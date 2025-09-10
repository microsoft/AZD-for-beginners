<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a03c268130e67f5c2a707f97f517c55b",
  "translation_date": "2025-09-10T05:29:30+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "hi"
}
-->
# डिबगिंग गाइड - उन्नत समस्या निवारण और लॉग विश्लेषण तकनीकें

## परिचय

यह व्यापक गाइड Azure Developer CLI डिप्लॉयमेंट्स में जटिल समस्याओं का निदान और समाधान करने के लिए उन्नत डिबगिंग रणनीतियाँ, उपकरण और तकनीकें प्रदान करता है। व्यवस्थित समस्या निवारण पद्धतियों, लॉग विश्लेषण तकनीकों, प्रदर्शन प्रोफाइलिंग, और उन्नत डायग्नोस्टिक टूल्स के बारे में जानें ताकि डिप्लॉयमेंट और रनटाइम समस्याओं को कुशलतापूर्वक हल किया जा सके।

## सीखने के लक्ष्य

इस गाइड को पूरा करने के बाद, आप:
- Azure Developer CLI समस्याओं के लिए व्यवस्थित डिबगिंग पद्धतियों में महारत हासिल करेंगे
- उन्नत लॉगिंग कॉन्फ़िगरेशन और लॉग विश्लेषण तकनीकों को समझेंगे
- प्रदर्शन प्रोफाइलिंग और मॉनिटरिंग रणनीतियों को लागू करेंगे
- जटिल समस्या समाधान के लिए Azure डायग्नोस्टिक टूल्स और सेवाओं का उपयोग करेंगे
- नेटवर्क डिबगिंग और सुरक्षा समस्या निवारण तकनीकों को लागू करेंगे
- सक्रिय समस्या पहचान के लिए व्यापक मॉनिटरिंग और अलर्टिंग को कॉन्फ़िगर करेंगे

## सीखने के परिणाम

गाइड पूरा करने के बाद, आप सक्षम होंगे:
- जटिल डिप्लॉयमेंट समस्याओं को व्यवस्थित रूप से डिबग करने के लिए TRIAGE पद्धति लागू करें
- व्यापक लॉगिंग और ट्रेसिंग जानकारी को कॉन्फ़िगर और विश्लेषण करें
- Azure Monitor, Application Insights, और डायग्नोस्टिक टूल्स का प्रभावी ढंग से उपयोग करें
- नेटवर्क कनेक्टिविटी, प्रमाणीकरण, और अनुमति समस्याओं को स्वतंत्र रूप से डिबग करें
- प्रदर्शन मॉनिटरिंग और अनुकूलन रणनीतियों को लागू करें
- आवर्ती समस्याओं के लिए कस्टम डिबगिंग स्क्रिप्ट और ऑटोमेशन बनाएं

## डिबगिंग पद्धति

### TRIAGE दृष्टिकोण
- **T**ime: समस्या कब शुरू हुई?
- **R**eproduce: क्या आप इसे लगातार पुन: उत्पन्न कर सकते हैं?
- **I**solate: कौन सा घटक विफल हो रहा है?
- **A**nalyze: लॉग्स हमें क्या बताते हैं?
- **G**ather: सभी प्रासंगिक जानकारी एकत्र करें
- **E**scalate: अतिरिक्त मदद कब लेनी चाहिए

## डिबग मोड सक्षम करना

### एनवायरनमेंट वेरिएबल्स
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

### डिबग कॉन्फ़िगरेशन
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 लॉग विश्लेषण तकनीकें

### लॉग स्तरों को समझना
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### संरचित लॉग विश्लेषण
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

### लॉग कोरिलेशन
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

## 🛠️ उन्नत डिबगिंग टूल्स

### Azure Resource Graph Queries
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### नेटवर्क डिबगिंग
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

### कंटेनर डिबगिंग
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

### डेटाबेस कनेक्शन डिबगिंग
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

## 🔬 प्रदर्शन डिबगिंग

### एप्लिकेशन प्रदर्शन मॉनिटरिंग
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

### संसाधन उपयोग विश्लेषण
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

## 🧪 परीक्षण और सत्यापन

### इंटीग्रेशन टेस्ट डिबगिंग
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

### डिबगिंग के लिए लोड टेस्टिंग
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

## 🔧 इंफ्रास्ट्रक्चर डिबगिंग

### Bicep टेम्पलेट डिबगिंग
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

### संसाधन स्थिति विश्लेषण
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

## 🔒 सुरक्षा डिबगिंग

### प्रमाणीकरण प्रवाह डिबगिंग
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

### नेटवर्क सुरक्षा डिबगिंग
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

## 📱 एप्लिकेशन-विशिष्ट डिबगिंग

### Node.js एप्लिकेशन डिबगिंग
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

### डेटाबेस क्वेरी डिबगिंग
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

## 🚨 आपातकालीन डिबगिंग प्रक्रियाएँ

### प्रोडक्शन समस्या प्रतिक्रिया
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

### रोलबैक प्रक्रियाएँ
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

## 📊 डिबगिंग डैशबोर्ड्स

### कस्टम मॉनिटरिंग डैशबोर्ड
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

### लॉग एग्रीगेशन
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

## 🔗 उन्नत संसाधन

### कस्टम डिबग स्क्रिप्ट्स
`scripts/debug/` डायरेक्टरी बनाएं जिसमें:
- `health-check.sh` - व्यापक स्वास्थ्य जांच
- `performance-test.sh` - स्वचालित प्रदर्शन परीक्षण
- `log-analyzer.py` - उन्नत लॉग पार्सिंग और विश्लेषण
- `resource-validator.sh` - इंफ्रास्ट्रक्चर सत्यापन

### मॉनिटरिंग इंटीग्रेशन
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

## सर्वोत्तम प्रथाएँ

1. **हमेशा डिबग लॉगिंग सक्षम करें** गैर-प्रोडक्शन वातावरण में
2. **समस्याओं के लिए पुन: उत्पन्न करने योग्य टेस्ट केस बनाएं**
3. **अपनी टीम के लिए डिबगिंग प्रक्रियाओं का दस्तावेजीकरण करें**
4. **स्वास्थ्य जांच और मॉनिटरिंग को स्वचालित करें**
5. **डिबग टूल्स को अपने एप्लिकेशन परिवर्तनों के साथ अपडेट रखें**
6. **गैर-घटना समय के दौरान डिबगिंग प्रक्रियाओं का अभ्यास करें**

## अगले कदम

- [क्षमता योजना](../pre-deployment/capacity-planning.md) - संसाधन आवश्यकताओं की योजना बनाएं
- [SKU चयन](../pre-deployment/sku-selection.md) - उपयुक्त सेवा स्तर चुनें
- [प्रीफ्लाइट जांच](../pre-deployment/preflight-checks.md) - पूर्व-डिप्लॉयमेंट सत्यापन
- [चीट शीट](../../resources/cheat-sheet.md) - त्वरित संदर्भ कमांड्स

---

**याद रखें**: अच्छा डिबगिंग व्यवस्थित, गहन और धैर्यवान होने के बारे में है। ये उपकरण और तकनीकें आपको समस्याओं का तेजी से और प्रभावी ढंग से निदान करने में मदद करेंगी।

---

**नेविगेशन**
- **पिछला पाठ**: [सामान्य समस्याएँ](common-issues.md)

- **अगला पाठ**: [क्षमता योजना](../pre-deployment/capacity-planning.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।