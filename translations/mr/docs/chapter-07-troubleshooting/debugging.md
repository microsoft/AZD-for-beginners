# AZD डिप्लॉयमेंटसाठी डीबगिंग मार्गदर्शक

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 7 - समस्यांचे निवारण व डीबगिंग
- **⬅️ मागील**: [सामान्य समस्या](common-issues.md)
- **➡️ पुढील**: [एआय-विशिष्ट समस्या निवारण](ai-troubleshooting.md)
- **🚀 पुढचा अध्याय**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI डिप्लॉयमेंट्ससह जटिल समस्या निदान आणि निराकरण करण्यासाठी प्रगत डीबगिंग धोरणे, साधने आणि तंत्रे प्रदान करतो. प्रणालीबद्ध समस्यांचे निवारण पद्धती, लॉग विश्लेषण तंत्र, कामगिरी प्रोफायलींग आणि प्रगत निदान साधने शिकून आपण डिप्लॉयमेंट आणि रनटाइम समस्या कार्यक्षमपणे सोडवू शकता.

## शिकण्याची उद्दिष्टे

हे मार्गदर्शक पूर्ण केल्यानंतर, आपण:
- Azure Developer CLI समस्यांसाठी प्रणालीबद्ध डीबगिंग पद्धती आत्मसात कराल
- प्रगत लॉगिंग कॉन्फिगरेशन आणि लॉग विश्लेषण तंत्र समजून घ्याल
- कामगिरी प्रोफायलींग आणि मॉनिटरिंग रणनीती अंमलात आणाल
- जटिल समस्यांचे निराकरण करण्यासाठी Azure निदान साधने आणि सेवा वापराल
- नेटवर्क डीबगिंग आणि सुरक्षा समस्या निवारण तंत्र लागू कराल
- आगाऊ समस्या शोधण्यासाठी सर्वसमावेशक मॉनिटरिंग आणि अलर्टिंग कॉन्फिगर कराल

## शिकण्याचे परिणाम

पूर्ण केल्यानंतर, आपण सक्षम असाल:
- प्रणालीबद्धपणे जटिल डिप्लॉयमेंट समस्या डीबग करण्यासाठी TRIAGE पद्धतीचा वापर करा
- सर्वसमावेशक लॉगिंग आणि ट्रेसिंग माहिती कॉन्फिगर व विश्लेषित करा
- Azure Monitor, Application Insights, आणि निदान साधने प्रभावीपणे वापरा
- नेटवर्क कनेक्टिव्हिटी, प्रमाणीकरण, आणि परवानगीच्या समस्या स्वतंत्रपणे डीबग करा
- कामगिरी मॉनिटरिंग आणि ऑप्टिमायझेशन रणनीती अंमलात आणा
- वारंवार येणाऱ्या समस्यांसाठी सानुकूल डीबगिंग स्क्रिप्ट्स आणि ऑटोमेशन तयार करा

## डीबगिंग पद्धती

### The TRIAGE Approach
- **T**ime: समस्या कधी सुरू झाली?
- **R**eproduce: आपण ते सातत्याने पुनरुत्पादन करू शकता का?
- **I**solate: कोणता घटक अयशस्वी होत आहे?
- **A**nalyze: लॉग्स काय सांगतात?
- **G**ather: सर्व संबंधित माहिती जमा करा
- **E**scalate: अतिरिक्त मदत कधी मागावी

## Enabling Debug Mode

### Environment Variables
```bash
# सर्वसमावेशक डीबगिंग सक्षम करा
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI डीबगिंग
export AZURE_CLI_DIAGNOSTICS=true

# स्वच्छ आउटपुटसाठी टेलिमीट्री अक्षम करा
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# डीबग कॉन्फिगरेशन जागतिक पातळीवर सेट करा
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
# azd monitor द्वारे Azure Monitor वापरून लॉग पहा
azd monitor --logs

# वास्तविक-वेळेत अॅप्लिकेशन लॉग पहा
azd monitor --live

# सविस्तर लॉग विश्लेषणासाठी, आपल्या App Service किंवा Container App सह Azure CLI वापरा:
# App Service लॉग
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App लॉग
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# विश्लेषणासाठी Application Insights लॉग निर्यात करा
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### लॉग सहसंबंधन
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor वापरून सेवांमधील लॉग्स संबंधित करा

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# संबंधित लॉगसाठी Application Insights शोधा
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure क्रिया नोंदी शोधा
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ उन्नत डीबगिंग साधने

### Azure Resource Graph क्वेरीज
```bash
# टॅग्सनुसार संसाधने शोधा
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# अयशस्वी तैनाती शोधा
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# संसाधनांची स्थिती तपासा
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### नेटवर्क डीबगिंग
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

### कंटेनर डीबगिंग
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

### डेटाबेस कनेक्शन डीबगिंग
```bash
# डेटाबेस कनेक्टिव्हिटी डिबग करा
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

## 🔬 कामगिरी डीबगिंग

### अॅप्लिकेशन कामगिरी मॉनिटरिंग
```bash
# Application Insights डीबगिंग सक्षम करा
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

# सानुकूल कामगिरी निरीक्षण
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
# संसाधन वापराचे निरीक्षण करा
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

## 🧪 चाचणी व पडताळणी

### इंटिग्रेशन टेस्ट डीबगिंग
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# डीबग वातावरण सेट करा
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# सेवा एंडपॉइंट्स मिळवा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# हेल्थ एंडपॉइंट्सची चाचणी करा
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

# कस्टम इंटिग्रेशन चाचण्या चालवा
npm run test:integration
```

### डीबगिंगसाठी लोड टेस्टिंग
```bash
# कार्यक्षमतेतील अडचणी ओळखण्यासाठी साधी लोड चाचणी
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench वापरून (स्थापित करा: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # महत्वाचे मेट्रिक्स काढा
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # त्रुटींसाठी तपासा
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 इन्फ्रास्ट्रक्चर डीबगिंग

### Bicep टेम्पलेट डीबगिंग
```bash
# सविस्तर आउटपुटसह Bicep टेम्पलेट्स सत्यापित करा
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # वाक्यरचना सत्यापन
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # लिंट सत्यापन
    az bicep lint --file "$template_file"
    
    # What-if तैनाती
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# टेम्पलेट तैनातीचे डीबगिंग
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
# असंगतता शोधण्यासाठी संसाधनांची स्थिती विश्लेषित करा
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # त्यांच्या स्थितीसह सर्व संसाधनांची यादी करा
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # अपयशी संसाधने तपासा
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

## 🔒 सुरक्षा डीबगिंग

### ऑथेंटिकेशन फ्लो डीबगिंग
```bash
# Azure प्रमाणीकरण डीबग करा
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT टोकन डीकोड करा (यासाठी jq आणि base64 आवश्यक आहेत)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault प्रवेश डीबग करा
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

### नेटवर्क सुरक्षा डीबगिंग
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

## 📱 अॅप्लिकेशन-विशिष्ट डीबगिंग

### Node.js अॅप्लिकेशन डीबगिंग
```javascript
// debug-middleware.js - Express डिबगिंग मिडलवेअर
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // विनंतीचे तपशील नोंदवा
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json ला ओव्हरराइड करून प्रतिसाद नोंदवा
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### डेटाबेस क्वेरी डीबगिंग
```javascript
// database-debug.js - डेटाबेस डीबगिंग साधने
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

## 🚨 आपत्कालीन डीबगिंग प्रक्रिया

### प्रॉडक्शन समस्या प्रतिसाद
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

# महत्वाची माहिती गोळा करा
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# त्रुटी लॉगसाठी Azure Monitor वापरा
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

### रोलबॅक प्रक्रिया
```bash
# त्वरीत रोलबॅक स्क्रिप्ट
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # पर्यावरण बदला
    azd env select "$environment"
    
    # Git वापरून रोलबॅक (AZD मध्ये अंगभूत रोलबॅक नाही)
    git checkout "$previous_commit"
    azd deploy
    
    # रोलबॅक सत्यापित करा
    echo "Verifying rollback..."
    azd show
    
    # महत्वाच्या एंडपॉइंट्सची चाचणी करा
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 डीबगिंग डॅशबोर्ड्स

### कस्टम मॉनिटरिंग डॅशबोर्ड
```bash
# डिबगिंगसाठी Application Insights क्वेरी तयार करा
create_debug_queries() {
    local app_insights_name=$1
    
    # त्रुटींसाठी क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # कार्यक्षमतेच्या समस्यांसाठी क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # निर्भरता अपयशांसाठी क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### लॉग संकलन
```bash
# अनेक Azure स्रोतांमधून लॉग एकत्र करा
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

## 🔗 उन्नत संसाधने

### सानुकूल डीबग स्क्रिप्ट्स
खालील फायलींसह `scripts/debug/` निर्देशिका तयार करा:
- `health-check.sh` - सर्वसमावेशक हेल्थ तपासणी
- `performance-test.sh` - स्वयंचलित कामगिरी चाचणी
- `log-analyzer.py` - प्रगत लॉग पार्सिंग आणि विश्लेषण
- `resource-validator.sh` - इन्फ्रास्ट्रक्चर पडताळणी

### मॉनिटरिंग एकीकरण
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

1. **नेहमी डीबग लॉगिंग सक्षम करा** गैर-प्रॉडक्शन वातावरणात
2. **समस्यांसाठी पुनरुत्पादनक्षम टेस्ट केस तयार करा**
3. **आपल्या टीमसाठी डीबगिंग प्रक्रिया दस्तऐवजीकरण करा**
4. **हेल्थ चेक्स स्वयंचलित करा** आणि मॉनिटरिंग
5. **डीबग साधने अद्ययावत ठेवा** आपल्या अॅप्लिकेशन बदलांसह
6. **डीबगिंग प्रक्रिया सराव करा** गैर-घडामोडीच्या वेळी

## पुढील पावले

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन आवश्यकता नियोजित करा
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - योग्य सेवा स्तर निवडा
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - पूर्व-तैनाती पडताळणी
- [Cheat Sheet](../../resources/cheat-sheet.md) - त्वरित संदर्भ आदेश

---

**लक्षात ठेवा**: चांगले डीबगिंग म्हणजे पद्धतशीर, सखोल आणि संयमी असणे. ही साधने आणि तंत्रे आपल्याला समस्या वेगाने आणि अधिक प्रभावीपणे निदान करण्यात मदत करतील.

---

**नेव्हिगेशन**
- **मागील धडा**: [सामान्य समस्या](common-issues.md)

- **पुढील धडा**: [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
ही कागदपत्र AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केलेली आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानले जावे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानव अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थामुळे आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->