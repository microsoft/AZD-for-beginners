# AZD डिप्लोयमेन्टका लागि डिबगिङ मार्गदर्शिका

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम गृह**: [AZD प्रारम्भकर्ताहरूका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 7 - समस्या समाधान र डिबगिङ
- **⬅️ अघिल्लो**: [सामान्य समस्याहरू](common-issues.md)
- **➡️ अर्को**: [AI-विशिष्ट समस्या समाधान](ai-troubleshooting.md)
- **🚀 अर्को अध्याय**: [अध्याय 8: उत्पादन र एंटरप्राइज ढाँचाहरू](../chapter-08-production/production-ai-practices.md)

## परिचय

यो व्यापक मार्गदर्शिकाले Azure Developer CLI डिप्लोयमेन्टहरूसँग सम्बन्धित जटिल समस्याहरू पहिचान गर्न र समाधान गर्नका लागि उन्नत डिबगिङ रणनीतिहरू, उपकरणहरू, र प्रविधिहरू प्रदान गर्दछ। व्यवस्थित समस्या निवारण विधिहरू, लग विश्लेषण प्रविधिहरू, प्रदर्शन प्रोफाइलिङ, र डिप्लोयमेन्ट तथा रनटाइम समस्याहरूलाई छिटो र प्रभावकारी ढंगले समाधान गर्नका लागि उन्नत डायग्नोस्टिक उपकरणहरू सिक्नुहोस्।

## सिक्ने लक्ष्यहरू

यो मार्गदर्शिका सम्पन्न गरेपछि तपाइँले:
- Azure Developer CLI सम्बन्धी समस्याहरूका लागि प्रणालीगत डिबगिङ विधिहरूमा निपुण हुन
- उन्नत लग कन्फिगरेसन र लग विश्लेषण प्रविधिहरू बुझ्न
- प्रदर्शन प्रोफाइलिङ र अनुगमन रणनीतिहरू लागू गर्न
- जटिल समस्या समाधानका लागि Azure डायग्नोस्टिक उपकरण र सेवाहरू प्रयोग गर्न
- नेटवर्क डिबगिङ र सुरक्षा समस्या समाधान प्रविधिहरू लागू गर्न
- पूर्व-सक्रिय समस्या पत्ता लगाउन व्यापक अनुगमन र सतर्कता कन्फिगर गर्न

## सिकाइ परिणामहरू

साम्पन्न भएपछि, तपाइँ निम्न काम गर्न सक्षम हुनुहुनेछ:
- TRIAGE विधिलाई लागू गरी जटिल डिप्लोयमेन्ट समस्याहरूलाई प्रणालीगत रूपमा डिबग गर्न
- व्यापक लग र ट्रेसिङ जानकारी कन्फिगर र विश्लेषण गर्न
- Azure Monitor, Application Insights, र डायग्नोस्टिक उपकरणहरू प्रभावकारी रूपमा प्रयोग गर्न
- नेटवर्क कनेक्सन, प्रमाणीकरण, र अनुमति सम्बन्धी समस्याहरूलाई स्वतन्त्र रूपमा डिबग गर्न
- प्रदर्शन अनुगमन र अनुकूलन रणनीतिहरू लागू गर्न
- पुनरावर्ती समस्याहरूको लागि कस्टम डिबगिङ स्क्रिप्ट र अटोमेसन सिर्जना गर्न

## डिबगिङ पद्धति

### TRIAGE उपाय
- **T**ime: समस्या कहिले सुरु भयो?
- **R**eproduce: के तपाइँ यसलाई निरन्तर रूपमा पुन:उत्पादन गर्न सक्नुहुन्छ?
- **I**solate: कुन कम्पोनेन्ट असफल भइरहेको छ?
- **A**nalyze: लगहरूले के बताउँछन्?
- **G**ather: सम्बन्धित सबै जानकारी सङ्कलन गर्नुहोस्
- **E**scalate: थप सहयोग कहिले खोज्ने

## डिबग मोड सक्रिय पार्नु

### वातावरण चरहरू
```bash
# व्यापक डिबगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI डिबगिङ
export AZURE_CLI_DIAGNOSTICS=true

# स्वच्छ आउटपुटका लागि टेलिमेट्री अक्षम गर्नुहोस्
export AZD_DISABLE_TELEMETRY=true
```

### डिबग कन्फिगरेसन
```bash
# डेबग कन्फिगरेसनलाई विश्वव्यापी रूपमा सेट गर्नुहोस्
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ट्रेस लगिङ सक्षम गर्नुहोस्
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 लग विश्लेषण प्रविधिहरू

### लग स्तरहरू बुझ्नुहोस्
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
# Azure Monitor मार्फत लगहरू हेर्नुहोस् (azd monitor मार्फत)
azd monitor --logs

# एप्लिकेशन लगहरू वास्तविक समयमा हेर्नुहोस्
azd monitor --live

# विस्तृत लग विश्लेषणका लागि, आफ्नो App Service वा Container App सँग Azure CLI प्रयोग गर्नुहोस्:
# App Service लगहरू
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App लगहरू
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# विश्लेषणका लागि Application Insights लगहरू निर्यात गर्नुहोस्
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### लग सम्बन्ध
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor प्रयोग गरी सेवाहरू बीच लॉगहरू सम्बन्धित गर्नुहोस्

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# सम्बन्धित लॉगहरूको लागि Application Insights मा खोज्नुहोस्
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure गतिविधि लॉगहरू खोज्नुहोस्
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ उन्नत डिबगिङ उपकरणहरू

### Azure Resource Graph क्वेरीहरू
```bash
# ट्यागहरूद्वारा स्रोतहरू सोध्नुहोस्
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# असफल परिनियोजनहरू फेला पार्नुहोस्
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# स्रोतको स्वास्थ्य जाँच गर्नुहोस्
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### नेटवर्क डिबगिङ
```bash
# सेवाहरूबीच कनेक्टिविटी परीक्षण
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

# प्रयोग
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### कन्टेनर डिबगिङ
```bash
# कन्टेनर अनुप्रयोगका समस्याहरू डिबग गर्नुहोस्
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

### डाटाबेस कनेक्सन डिबगिङ
```bash
# डेटाबेस कनेक्टिविटी डिबग गर्नुहोस्
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

## 🔬 प्रदर्शन डिबगिङ

### एप्लिकेशन प्रदर्शन अनुगमन
```bash
# Application Insights डिबगिङ सक्षम गर्नुहोस्
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

# अनुकूलित प्रदर्शन अनुगमन
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

### स्रोत उपयोग विश्लेषण
```bash
# संसाधन प्रयोग अनुगमन गर्नुहोस्
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

## 🧪 परीक्षण र प्रमाणीकरण

### एकीकरण परीक्षण डिबगिङ
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# डिबग वातावरण सेट गर्नुहोस्
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# सेवा एन्डपोइन्टहरू प्राप्त गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# स्वास्थ्य एन्डपोइन्टहरू परीक्षण गर्नुहोस्
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

# परीक्षणहरू चलाउनुहोस्
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# अनुकूलित एकीकरण परीक्षणहरू चलाउनुहोस्
npm run test:integration
```

### डिबगिङका लागि लोड टेस्टिङ
```bash
# प्रदर्शनका बाधाहरू पहिचान गर्नको लागि साधारण लोड परीक्षण
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench प्रयोग गर्दै (स्थापना: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # प्रमुख मेट्रिक्स निकाल्नुहोस्
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # त्रुटिहरूको लागि जाँच गर्नुहोस्
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 पूर्वाधार डिबगिङ

### Bicep टेम्पलेट डिबगिङ
```bash
# विस्तृत आउटपुटसहित Bicep टेम्पलेटहरू मान्य गर्नुहोस्
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # सिन्ट्याक्स मान्यकरण
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # लिन्ट मान्यकरण
    az bicep lint --file "$template_file"
    
    # के-यदि परिनियोजन
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# टेम्पलेट परिनियोजन डिबग गर्नुहोस्
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
# संसाधन अवस्थाहरूमा असंगतिहरूको विश्लेषण गर्नुहोस्
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # सबै संसाधनहरू उनीहरूको अवस्थासहित सूचीबद्ध गर्नुहोस्
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # असफल भएका संसाधनहरूको जाँच गर्नुहोस्
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

## 🔒 सुरक्षा डिबगिङ

### प्रमाणीकरण प्रवाह डिबगिङ
```bash
# Azure प्रमाणीकरण डिबग गर्नुहोस्
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT टोकन डिकोड गर्नुहोस् (jq र base64 आवश्यक छन्)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault पहुँच डिबग गर्नुहोस्
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
# नेटवर्क सुरक्षा समूहहरू डिबग गर्नुहोस्
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # सुरक्षा नियमहरू जाँच गर्नुहोस्
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 एप्लिकेशन-विशेष डिबगिङ

### Node.js एप्लिकेशन डिबगिङ
```javascript
// debug-middleware.js - Express डिबगिङ मिडलवेयर
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // अनुरोधका विवरणहरू लग गर्नुहोस्
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // प्रतिक्रियाहरू लग गर्न res.json लाई ओभरराइड गर्नुहोस्
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### डाटाबेस क्वेरी डिबगिङ
```javascript
// database-debug.js - डाटाबेस डिबगिङ उपकरणहरू
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

## 🚨 आपतकालीन डिबगिङ प्रक्रिया

### उत्पादन समस्या प्रतिक्रिया
```bash
#!/bin/bash
# emergency-debug.sh - आपतकालीन उत्पादन डिबगिङ

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

# सही वातावरणमा स्विच गर्नुहोस्
azd env select "$ENVIRONMENT"

# महत्त्वपूर्ण जानकारी सङ्कलन गर्नुहोस्
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# त्रुटि लगहरूको लागि Azure Monitor प्रयोग गर्नुहोस्
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

### रोलब्याक प्रक्रिया
```bash
# छिटो रोलब्याक स्क्रिप्ट
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # पर्यावरण परिवर्तन गर्नुहोस्
    azd env select "$environment"
    
    # Git प्रयोग गरेर रोलब्याक (AZD मा अन्तर्निर्मित रोलब्याक छैन)
    git checkout "$previous_commit"
    azd deploy
    
    # रोलब्याक जाँच गर्नुहोस्
    echo "Verifying rollback..."
    azd show
    
    # महत्वपूर्ण एन्डपोइन्टहरू परीक्षण गर्नुहोस्
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 डिबगिङ ड्यासबोर्डहरू

### कस्टम अनुगमन ड्यासबोर्ड
```bash
# डिबगिङका लागि Application Insights क्वेरीहरू सिर्जना गर्नुहोस्
create_debug_queries() {
    local app_insights_name=$1
    
    # त्रुटिहरूका लागि क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # प्रदर्शन समस्याहरूका लागि क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # निर्भरता विफलताहरूका लागि क्वेरी
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### लग समेकन
```bash
# एकाधिक Azure स्रोतहरूबाट लगहरू समेकन गर्नु
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

## 🔗 उन्नत स्रोतहरू

### कस्टम डिबग स्क्रिप्टहरू
यी फाइलहरू सहित `scripts/debug/` डाइरेक्टरी सिर्जना गर्नुहोस्:
- `health-check.sh` - व्यापक स्वास्थ्य जाँच
- `performance-test.sh` - स्वचालित प्रदर्शन परीक्षण
- `log-analyzer.py` - उन्नत लग पार्सिङ र विश्लेषण
- `resource-validator.sh` - पूर्वाधार मान्यकरण

### मनिटरिङ एकीकरण
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

## उत्तम अभ्यासहरू

1. **डिबग लग सधैं सक्षम गर्नुहोस्** गैर-उत्पादन वातावरणहरूमा
2. **समस्या हरूका लागि पुन:उत्पादनयोग्य परीक्षण केसहरू सिर्जना गर्नुहोस्**
3. **टिमका लागि डिबगिङ प्रक्रियाहरू दस्तावेज गर्नुहोस्**
4. **हेल्थ चेकहरू स्वचालित गर्नुहोस्** र अनुगमन
5. **डिबग उपकरणहरूलाई अद्यावधिक राख्नुहोस्** तपाइँको अनुप्रयोग परिवर्तनहरूसँग
6. **डिबगिङ प्रक्रियाहरू अभ्यास गर्नुहोस्** गैर-घटनाका समयमा

## आगामी कदमहरू

- [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत आवश्यकताहरू योजना गर्नुहोस्
- [SKU चयन](../chapter-06-pre-deployment/sku-selection.md) - उपयुक्त सेवा टियरहरू छनौट गर्नुहोस्
- [प्रीफ्लाइट चेकहरू](../chapter-06-pre-deployment/preflight-checks.md) - पूर्व-डिप्लोयमेन्ट मान्यकरण
- [चीट शीट](../../resources/cheat-sheet.md) - छिटो सन्दर्भ आदेशहरू

---

**Remember**: राम्रो डिबगिङ प्रणालीगत, विस्तृत, र धैर्यशील हुनमा आधारित हुन्छ। यी उपकरणहरू र प्रविधिहरूले तपाइँलाई समस्याहरू छिटो र प्रभावकारी रूपमा पहिचान गर्न मद्दत गर्नेछन्।

---

**नेविगेशन**
- **अघिल्लो पाठ**: [सामान्य समस्याहरू](common-issues.md)

- **अर्को पाठ**: [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज कृत्रिम बुद्धिमत्ता (AI) अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा अधिकारप्राप्त स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याहरूका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->