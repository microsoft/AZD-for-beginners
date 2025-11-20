<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-20T13:06:10+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "mr"
}
-->
# AZD डिप्लॉयमेंटसाठी डिबगिंग मार्गदर्शक

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 चालू अध्याय**: अध्याय 7 - समस्या निराकरण आणि डिबगिंग
- **⬅️ मागील**: [सामान्य समस्या](common-issues.md)
- **➡️ पुढील**: [AI-संबंधित समस्या निराकरण](ai-troubleshooting.md)
- **🚀 पुढील अध्याय**: [अध्याय 8: उत्पादन आणि एंटरप्राइझ पॅटर्न्स](../microsoft-foundry/production-ai-practices.md)

## परिचय

ही सविस्तर मार्गदर्शिका Azure Developer CLI डिप्लॉयमेंटसाठी जटिल समस्या ओळखणे आणि सोडवण्यासाठी प्रगत डिबगिंग धोरणे, साधने आणि तंत्रे प्रदान करते. प्रणालीबद्ध समस्या निराकरण पद्धती, लॉग विश्लेषण तंत्र, कार्यक्षमता प्रोफाइलिंग आणि प्रगत निदान साधने शिकून डिप्लॉयमेंट आणि रनटाइम समस्यांचे कार्यक्षमतेने निराकरण करा.

## शिकण्याची उद्दिष्टे

ही मार्गदर्शिका पूर्ण केल्यावर, तुम्ही:
- Azure Developer CLI समस्यांसाठी प्रणालीबद्ध डिबगिंग पद्धती आत्मसात कराल
- प्रगत लॉगिंग कॉन्फिगरेशन आणि लॉग विश्लेषण तंत्र समजून घ्याल
- कार्यक्षमता प्रोफाइलिंग आणि मॉनिटरिंग धोरणे अंमलात आणाल
- जटिल समस्या निराकरणासाठी Azure निदान साधने आणि सेवा वापराल
- नेटवर्क डिबगिंग आणि सुरक्षा समस्या निराकरण तंत्रे लागू कराल
- सक्रिय समस्या शोधण्यासाठी व्यापक मॉनिटरिंग आणि अलर्टिंग कॉन्फिगर कराल

## शिकण्याचे परिणाम

पूर्ण केल्यावर, तुम्ही:
- जटिल डिप्लॉयमेंट समस्यांचे प्रणालीबद्ध डिबगिंग करण्यासाठी TRIAGE पद्धत लागू करू शकाल
- व्यापक लॉगिंग आणि ट्रेसिंग माहिती कॉन्फिगर आणि विश्लेषित करू शकाल
- Azure Monitor, Application Insights आणि निदान साधने प्रभावीपणे वापरू शकाल
- नेटवर्क कनेक्टिव्हिटी, प्रमाणीकरण आणि परवानगी समस्या स्वतंत्रपणे डिबग करू शकाल
- कार्यक्षमता मॉनिटरिंग आणि ऑप्टिमायझेशन धोरणे अंमलात आणू शकाल
- पुनरावृत्ती होणाऱ्या समस्यांसाठी सानुकूल डिबगिंग स्क्रिप्ट्स आणि ऑटोमेशन तयार करू शकाल

## डिबगिंग पद्धती

### TRIAGE पद्धत
- **T**ime: समस्या कधी सुरू झाली?
- **R**eproduce: तुम्ही ती सातत्याने पुनरुत्पादित करू शकता का?
- **I**solate: कोणता घटक अयशस्वी होत आहे?
- **A**nalyze: लॉग्स आपल्याला काय सांगतात?
- **G**ather: सर्व संबंधित माहिती गोळा करा
- **E**scalate: अतिरिक्त मदतीसाठी कधी विचारावे

## डिबग मोड सक्षम करणे

### पर्यावरणीय व्हेरिएबल्स
```bash
# व्यापक डीबगिंग सक्षम करा
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI डीबगिंग
export AZURE_CLI_DIAGNOSTICS=true

# स्वच्छ आउटपुटसाठी टेलिमेट्री अक्षम करा
export AZD_DISABLE_TELEMETRY=true
```

### डिबग कॉन्फिगरेशन
```bash
# डीबग कॉन्फिगरेशन जागतिक स्तरावर सेट करा
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ट्रेस लॉगिंग सक्षम करा
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 लॉग विश्लेषण तंत्र

### लॉग स्तर समजून घेणे
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
# स्तरानुसार लॉग फिल्टर करा
azd logs --level error --since 1h

# सेवेनुसार फिल्टर करा
azd logs --service api --level debug

# विश्लेषणासाठी लॉग निर्यात करा
azd logs --output json > deployment-logs.json

# jq सह JSON लॉग पार्स करा
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### लॉग कोरिलेशन
```bash
#!/bin/bash
# correlate-logs.sh - सेवांमध्ये लॉग्स संबंधित करा

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# सर्व सेवांमध्ये शोधा
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure लॉग्स शोधा
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ प्रगत डिबगिंग साधने

### Azure Resource Graph क्वेरी
```bash
# टॅग्सद्वारे संसाधने शोधा
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# अयशस्वी उपयोजन शोधा
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# संसाधनांची आरोग्य स्थिती तपासा
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### नेटवर्क डिबगिंग
```bash
# सेवांमधील कनेक्टिव्हिटी तपासा
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

# वापर
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### कंटेनर डिबगिंग
```bash
# कंटेनर अॅपच्या समस्या डीबग करा
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
# डेटाबेस कनेक्टिव्हिटी डीबग करा
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

## 🔬 कार्यक्षमता डिबगिंग

### अनुप्रयोग कार्यक्षमता मॉनिटरिंग
```bash
# अनुप्रयोग अंतर्दृष्टी डीबगिंग सक्षम करा
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

# सानुकूल कार्यक्षमता निरीक्षण
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

### संसाधन वापर विश्लेषण
```bash
# संसाधन वापरावर लक्ष ठेवा
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

## 🧪 चाचणी आणि प्रमाणीकरण

### इंटिग्रेशन टेस्ट डिबगिंग
```bash
#!/bin/bash
# डिबग-इंटिग्रेशन-टेस्ट्स.sh

set -e

echo "Running integration tests with debugging..."

# डिबग वातावरण सेट करा
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# सेवा एंडपॉइंट्स मिळवा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# हेल्थ एंडपॉइंट्स चाचणी करा
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

# चाचण्या चालवा
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# सानुकूल इंटिग्रेशन चाचण्या चालवा
npm run test:integration
```

### डिबगिंगसाठी लोड चाचणी
```bash
# कार्यक्षमता अडथळे ओळखण्यासाठी साधा लोड चाचणी
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench वापरणे (इंस्टॉल: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # मुख्य मेट्रिक्स काढा
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # अपयशांसाठी तपासा
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 पायाभूत सुविधा डिबगिंग

### Bicep टेम्पलेट डिबगिंग
```bash
# बायसेप टेम्पलेट्स तपशीलवार आउटपुटसह सत्यापित करा
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # सिंटॅक्स सत्यापन
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # लिंट सत्यापन
    az bicep lint --file "$template_file"
    
    # काय होईल तैनाती
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# टेम्पलेट तैनाती डीबग करा
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

### संसाधन स्थिती विश्लेषण
```bash
# संसाधनांच्या स्थितीतील विसंगतींचे विश्लेषण करा
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # सर्व संसाधने त्यांच्या स्थितीसह सूचीबद्ध करा
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # अयशस्वी संसाधने तपासा
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
# Azure प्रमाणीकरण डीबग करा
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT टोकन डिकोड करा (jq आणि base64 आवश्यक आहे)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# की व्हॉल्ट प्रवेश डीबग करा
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
# नेटवर्क सुरक्षा गट डीबग करा
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # सुरक्षा नियम तपासा
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 अनुप्रयोग-विशिष्ट डिबगिंग

### Node.js अनुप्रयोग डिबगिंग
```javascript
// डिबग-मिडलवेअर.js - एक्सप्रेस डिबगिंग मिडलवेअर
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // विनंती तपशील लॉग करा
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // प्रतिसाद लॉग करण्यासाठी res.json ओव्हरराइड करा
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
// डेटाबेस-डिबग.js - डेटाबेस डिबगिंग उपयोगिता
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

## 🚨 आपत्कालीन डिबगिंग प्रक्रिया

### उत्पादन समस्या प्रतिसाद
```bash
#!/bin/bash
# emergency-debug.sh - आपत्कालीन उत्पादन डीबगिंग

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

# योग्य वातावरणावर स्विच करा
azd env select "$ENVIRONMENT"

# महत्त्वाची माहिती गोळा करा
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

### रोलबॅक प्रक्रिया
```bash
# जलद रोलबॅक स्क्रिप्ट
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # वातावरण बदला
    azd env select "$environment"
    
    # अनुप्रयोग रोलबॅक करा
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # रोलबॅक सत्यापित करा
    echo "Verifying rollback..."
    azd show
    
    # महत्त्वाच्या एंडपॉइंट्सची चाचणी करा
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 डिबगिंग डॅशबोर्ड

### सानुकूल मॉनिटरिंग डॅशबोर्ड
```bash
# डिबगिंगसाठी अॅप्लिकेशन इनसाइट्स क्वेरी तयार करा
create_debug_queries() {
    local app_insights_name=$1
    
    # त्रुटींसाठी क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # कार्यक्षमता समस्यांसाठी क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # अवलंबित्व अपयशांसाठी क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### लॉग एकत्रीकरण
```bash
# अनेक स्रोतांमधून लॉग्स एकत्र करा
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

## 🔗 प्रगत संसाधने

### सानुकूल डिबग स्क्रिप्ट्स
`scripts/debug/` डिरेक्टरी तयार करा:
- `health-check.sh` - सर्वसमावेशक आरोग्य तपासणी
- `performance-test.sh` - स्वयंचलित कार्यक्षमता चाचणी
- `log-analyzer.py` - प्रगत लॉग पार्सिंग आणि विश्लेषण
- `resource-validator.sh` - पायाभूत सुविधा प्रमाणीकरण

### मॉनिटरिंग इंटिग्रेशन
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

## सर्वोत्तम पद्धती

1. **नेहमी डिबग लॉगिंग सक्षम करा** उत्पादन नसलेल्या वातावरणात
2. **समस्यांसाठी पुनरुत्पादनीय चाचणी प्रकरणे तयार करा**
3. **तुमच्या टीमसाठी डिबगिंग प्रक्रिया दस्तऐवजीकरण करा**
4. **आरोग्य तपासणी आणि मॉनिटरिंग स्वयंचलित करा**
5. **तुमच्या अनुप्रयोग बदलांसह डिबग साधने अद्ययावत ठेवा**
6. **गैर-घटना काळात डिबगिंग प्रक्रिया सराव करा**

## पुढील पावले

- [क्षमता नियोजन](../pre-deployment/capacity-planning.md) - संसाधन आवश्यकता नियोजन
- [SKU निवड](../pre-deployment/sku-selection.md) - योग्य सेवा स्तर निवडा
- [प्रीफ्लाइट तपासणी](../pre-deployment/preflight-checks.md) - प्री-डिप्लॉयमेंट प्रमाणीकरण
- [चीट शीट](../../resources/cheat-sheet.md) - जलद संदर्भ आदेश

---

**लक्षात ठेवा**: चांगले डिबगिंग म्हणजे प्रणालीबद्ध, सखोल आणि संयमी असणे. ही साधने आणि तंत्रे तुम्हाला समस्या जलद आणि अधिक प्रभावीपणे ओळखण्यास मदत करतील.

---

**नेव्हिगेशन**
- **मागील धडा**: [सामान्य समस्या](common-issues.md)

- **पुढील धडा**: [क्षमता नियोजन](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->