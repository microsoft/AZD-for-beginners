# AZD ஒதுக்கீடுகளுக்கான பிழைத் தொலைபார்க்கும் வழிகாட்டி

**அத்தியாயத் வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பிகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைத் தீர்வு மற்றும் பிழை ஆய்வு
- **⬅️ முந்தையது**: [பொதுவான பிரச்சினைகள்](common-issues.md)
- **➡️ அடுத்தது**: [AI-சார்ந்த பிழைத் தீர்வு](ai-troubleshooting.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவமைப்புகள்](../chapter-08-production/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI ஒதுக்கீடுகளோடு தொடர்புடைய சிக்கலான பிரச்சினைகளை கண்டறிந்து தீர்க்க மேம்பட்ட பிழைத் தொலைபார்ப்பு நுணுக்கங்கள், கருவிகள் மற்றும் தொழில்நுட்பங்களை வழங்குகிறது. ஒழுங்கமைக்கப்பட்ட பிழைத் தீர்வு முறைமைகள், பதிவு பகுப்பாய்வு முறைகள், செயல்திறன் சுயவிவரிப்பு, மற்றும் மேம்பட்ட கண்டறிதல் கருவிகளை கற்று ஒதுக்கீடு மற்றும் ரன்டைம் பிரச்சினைகளை திறமையாக தீர்க்க உதவுங்கள்.

## கற்பதன் இலக்குகள்

By completing this guide, you will:
- Azure Developer CLI பிரச்சினைகளுக்கான ஒழுங்கமைக்கப்பட்ட பிழைத் தொலைபார்ப்பு முறைமைகளில் நிபுணராக வேண்டும்
- மேம்பட்ட பதிவு தொடர்பான கட்டமைப்பு மற்றும் பதிவு பகுப்பாய்வு தொழில்நுட்பங்களை புரிந்துகொள்வது
- செயல்திறன் சுயவிவரிப்பு மற்றும் கண்காணிப்பு முறைமைகளை செயல்படுத்துவது
- சிக்கலான பிரச்சினை தீர்விற்காக Azure கண்டறிதல் கருவிகள் மற்றும் சேவைகளை பயன்படுத்துவது
- நெட்வொர்க் பிழைத் தொலைபார்ப்பு மற்றும் பாதுகாப்பு பிரச்சினை தீர்வு தொழில்நுட்பங்களை பயன்படுத்துவது
- முன்னறிவிப்பு பிரச்சினைகள் கண்டறிதலிற்கான விரிவான கண்காணிப்பு மற்றும் அலெர்ட்டிங் உருவாக்குவது

## கற்றலின் முடிவுகள்

Upon completion, you will be able to:
- TRIAGE முறைமையைப் பயன்படுத்தி சிக்கலான ஒதுக்கீடு பிரச்சினைகளைக் ஒழுங்குபடுத்திக் கையாள்வது
- விரிவான பதிவு மற்றும் ட்ரேசிங் தகவல்களை கட்டமைத்து பகுப்பாய்வு செய்வது
- Azure Monitor, Application Insights மற்றும் கண்டறிதல் கருவிகளை பயனுள்ள முறையில் பயன்படுத்துவது
- நெட்வொர்க் இணைப்பு, அங்கீகாரம் மற்றும் அனுமதி பிரச்சினைகளை தனிப்பட்ட முறையில் பிழைத் தொலைபார்ப்பு செய்வது
- செயல்திறன் கண்காணிப்பு மற்றும் ஒప్టிமைசேஷன் நுணுக்கங்களை அமல்படுத்துவது
- முறையாக திரும்ப வாழ்க்கைக்கு வரக்கூடிய பிரச்சினைகளுக்கான தனிப்பயன் பிழைத் ஸ்கிரிப்ட்கள் மற்றும் தானியக்கத்தை உருவாக்குவது

## Debugging Methodology

### The TRIAGE Approach
- **T**காலம்: பிரச்சனை எப்போது தொடங்கியது?
- **R**மீண்டும் உருவாக்கம்: நீங்கள் அதை தொடர்ச்சியாக மீண்டும் உருவாக்க முடிக்கிறீர்களா?
- **I**ஒதுக்குதல்: எந்த கூறு தோல்வியடைந்துள்ளது?
- **A**பகுப்பாய்வு: பதிவுகள் எதை கூறுகின்றன?
- **G**சேர்க்க: தொடர்புடைய அனைத்து தகவல்களையும் சேகரிக்கவும்
- **E**மேலோக்கி: எப்போது கூடுதல் உதவி கேட்க வேண்டும்

## Enabling Debug Mode

### சூழல் மாறிகள்
```bash
# விரிவான பிழைத்திருத்தத்தை செயல்படுத்தவும்
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI பிழைத்திருத்தம்
export AZURE_CLI_DIAGNOSTICS=true

# வெளியீடு சுத்தமாக இருக்க டெலிமெட்ரியை முடக்கவும்
export AZD_DISABLE_TELEMETRY=true
```

### பிழை அமைப்புகள்
```bash
# டீபக் கட்டமைப்பை உலகளாவியமாக அமைக்கவும்
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ட்ரேஸ் பதிவை செயல்படுத்தவும்
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 பதிவு பகுப்பாய்வு தொழில்நுட்பங்கள்

### பதிவு நிலைகளின் புரிதல்
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### கட்டமைக்கப்பட்ட பதிவு பகுப்பாய்வு
```bash
# azd monitor மூலம் Azure Monitor இல் பதிவுகளைப் பார்க்கவும்
azd monitor --logs

# பயன்பாட்டு பதிவுகளை நேரடியாகப் பார்க்கவும்
azd monitor --live

# விரிவான பதிவு பகுப்பாய்விற்காக, உங்கள் App Service அல்லது Container App உடன் Azure CLI-ஐ பயன்படுத்தவும்:
# App Service பதிவுகள்
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App பதிவுகள்
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# பகுப்பாய்விற்காக Application Insights பதிவுகளை ஏற்றுமதி செய்யவும்
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### பதிவுகளின் தொடர்பு
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor ஐப் பயன்படுத்தி சேவைகள் இடையே பதிவுகளை தொடர்புபடுத்துதல்

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights இல் தொடர்புடைய பதிவுகளைத் தேடுதல்
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure செயல்பாட்டு பதிவுகளைத் தேடுதல்
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ மேம்பட்ட பிழைத் தொலைபார்ப்பு கருவிகள்

### Azure Resource Graph விசாரணைகள்
```bash
# குறிச்சொற்களின்படி வளங்களை விசாரிக்கவும்
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# தோல்வியடைந்த டெப்ளாய்மெண்ட்களை கண்டறியவும்
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# வளத்தின் நிலையைச் சரிபார்க்கவும்
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### பிணைய பிழைத் தொலைபார்ப்பு
```bash
# சேவைகள் இடையிலான இணைப்பை சோதிக்கவும்
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

# பயன்பாடு
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### கன்டெய்னர் பிழைத் தொலைபார்ப்பு
```bash
# கண்டெய்னர் பயன்பாட்டில் தோன்றும் பிழைகளை பிழைதிருத்துதல்
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

### தரவுத்தளம் இணைப்பு பிழைத் தொலைபார்ப்பு
```bash
# தரவுத்தள இணைப்பை பிழைதிருத்துதல்
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

## 🔬 செயல்திறன் பிழைத் தொலைபார்ப்பு

### பயன்பாட்டு செயல்திறன் கண்காணிப்பு
```bash
# Application Insights பிழைதிருத்தத்தை செயல்படுத்தவும்
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

# தனிப்பயன் செயல்திறன் கண்காணிப்பு
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

### வள பயன்பாடு பகுப்பாய்வு
```bash
# வள பயன்பாட்டை கண்காணி
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

## 🧪 சோதனை மற்றும் சரிபார்த்தல்

### ஒருங்கிணைப்பு சோதனை பிழைத் தொலைபார்ப்பு
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# டீபக் சூழலை அமைக்க
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# சேவையின் எண்ட்பாயின்டுகளை பெற
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ஹெல்த் எண்ட்பாயின்டுகளை சோதிக்க
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

# டெஸ்டுகளை இயக்க
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# தனிப்பயன் ஒருங்கிணைப்பு சோதனைகளை இயக்க
npm run test:integration
```

### பிழைத் தொலைபார்ப்புக்கான சுமை சோதனை
```bash
# எளிய சுமை சோதனை மூலம் செயல்திறன் தடைப் பகுதிகளை கண்டறிதல்
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench ஐப் பயன்படுத்துதல் (நிறுவ: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # முக்கிய அளவுகோல்களைப் பெற்றெடுக்கவும்
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # தோல்விகளைச் சரிபார்க்கவும்
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 அடித்தடை பிழைத் தொலைபார்ப்பு

### Bicep வார்ப்புரு பிழைத் தொலைபார்ப்பு
```bash
# விரிவான வெளியீட்டுடன் Bicep வார்ப்புருக்களைச் சரிபார்க்க
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # வாக்கியவியல் சரிபார்த்தல்
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint சரிபார்த்தல்
    az bicep lint --file "$template_file"
    
    # என்ன என்றால் (What-if) விநியோகம்
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# வார்ப்புரு விநியோகத்தின் பிழைச் சோதனை
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

### வள நிலை பகுப்பாய்வு
```bash
# வள நிலைகளில் முரண்பாடுகள் உள்ளதா என்று பகுப்பாய்வு செய்
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # அனைத்து வளங்களையும் அவற்றின் நிலைகளுடன் பட்டியலிடு
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # தோல்வியடைந்த வளங்களை சரிபார்
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

## 🔒 பாதுகாப்பு பிழைத் தொலைபார்ப்பு

### அங்கீகார ஓட்டம் பிழைத் தொலைபார்ப்பு
```bash
# Azure அங்கீகாரத்தை பிழைதிருத்து
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT டோக்கனை டிகோடு செய் (jq மற்றும் base64 தேவை)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault அணுகலை பிழைதிருத்து
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

### பிணைய பாதுகாப்பு பிழைத் தொலைபார்ப்பு
```bash
# நெட்வொர்க் பாதுகாப்பு குழுக்களை பிழைதிருத்தவும்
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # பாதுகாப்பு விதிகளை சரிபார்க்கவும்
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 பயன்பாட்டு-சார்ந்த பிழைத் தொலைபார்ப்பு

### Node.js பயன்பாட்டு பிழைத் தொலைபார்ப்பு
```javascript
// debug-middleware.js - Express பிழைதிருத்தும் மிடில்வேர்
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // கோரிக்கை விவரங்களை பதிவு செய்
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json ஐ மீறி பதில்களை பதிவு செய்
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### தரவுத்தள வினவல் பிழைத் தொலைபார்ப்பு
```javascript
// database-debug.js - தரவுத்தள பிழை பரிசோதனை உதவித் கருவிகள்
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

## 🚨 அவசர பிழைத் தொலைபார்ப்பு செயல்முறை

### உற்பத்தி பிரச்சனை பதில்
```bash
#!/bin/bash
# emergency-debug.sh - அவசர உற்பத்தி பிழைத்திருத்தம்

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

# சரியான சூழலுக்கு மாறவும்
azd env select "$ENVIRONMENT"

# முக்கிய தகவல்களை சேகரிக்கவும்
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# பிழை பதிவுகளுக்கு Azure Monitor ஐப் பயன்படுத்தவும்
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

### மீள்நிர்வாக (Rollback) செயல்முறைகள்
```bash
# விரைவு பின்தள்ளல் ஸ்கிரிப்ட்
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # சூழலை மாற்று
    azd env select "$environment"
    
    # Git-ஐ பயன்படுத்தி பின்தள்ளல் (AZD-இல் உள்ளடக்கப்பட்ட பின்தள்ளல் இல்லை)
    git checkout "$previous_commit"
    azd deploy
    
    # பின்தள்ளலை சரிபார்க்க
    echo "Verifying rollback..."
    azd show
    
    # முக்கிய எண்ட்பாயின்ட்களை சோதிக்க
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 பிழைத் தொலைபார்ப்பு டாஷ்போர்ட்கள்

### தனிப்பயன் கண்காணிப்பு டாஷ்போர்டு
```bash
# பிழைத்திருத்தத்திற்கான Application Insights கேள்விகளை உருவாக்கவும்
create_debug_queries() {
    local app_insights_name=$1
    
    # பிழைகளுக்கான கேள்வி
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # செயல்திறன் பிரச்சினைகளுக்கான கேள்வி
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # இணைப்பு தோல்விகளுக்கான கேள்வி
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### பதிவுகள் ஒருங்கிணைப்பு
```bash
# பல Azure மூலங்களிலிருந்து பதிவுகளை ஒருங்கிணைத்தல்
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

## 🔗 மேம்பட்ட வளங்கள்

### தனிப்பயன் பிழைத் ஸ்கிரிப்ட்கள்
பின்வரும் கோப்புகளை கொண்ட `scripts/debug/` அடைவைக் உருவாக்கவும்:
- `health-check.sh` - முழுமையான நலன் சோதனை
- `performance-test.sh` - தானியங்கி செயல்திறன் சோதனை
- `log-analyzer.py` - மேம்பட்ட பதிவு பார்சிங் மற்றும் பகுப்பாய்வு
- `resource-validator.sh` - அடித்தடை சரிபார்த்தல்

### கண்காணிப்பு ஒருங்கிணைப்பு
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

## சிறந்த நடைமுறைகள்

1. **உற்பத்தியாகாத சூழல்களில் எப்போதும் டெபக் பதிவு (debug logging) ஐ இயக்கவும்**
2. **பிரச்சினைகளுக்கு மறுபடியே உருவாக்கத்தக்க சோதனை வழக்குகளைக் உருவாக்கவும்**
3. **உங்கள் குழுவிற்கான பிழைத் தொலைபார்ப்பு செயல்முறைகளை ஆவணப்படுத்தவும்**
4. **நலன் சோதனைகள் மற்றும் கண்காணிப்புகளை தானியக்கமாக்கவும்**
5. **பயன்பாட்டு மாற்றங்களுடன் உங்கள் பிழைத் கருவிகளை புதுப்பித்து வைத்திருங்கள்**
6. **சம்பவமற்ற நேரங்களில் பிழைத் தொலைபார்ப்பு செயல்முறைகளை பயிற்சி செய்யுங்கள்**

## அடுத்த படிகள்

- [திறன் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - வள தேவைகளை திட்டமிடவும்
- [SKU தேர்வு](../chapter-06-pre-deployment/sku-selection.md) - சரியான சேவை நிலைகளை தேர்வு செய்க
- [முன்-ஒதுக்கீடு சோதனைகள்](../chapter-06-pre-deployment/preflight-checks.md) - ஒதுக்கீடு முன் சரிபார்த்தல்
- [சுருக்கக் குறிப்புகள்](../../resources/cheat-sheet.md) - விரைவு குறிப்பு கட்டளைகள்

---

**நினைவில் வைக்கவும்**: சிறந்த பிழைத் தொலைபார்ப்பு என்பது முறையாக, விரிவாகவும், பொறுமையாகவும் செயல்படுவது பற்றியது. இந்த கருவிகள் மற்றும் தொழில்நுட்பங்கள் உங்கள் பிரச்சினைகளை வேகமாகவும் குறைந்த முயற்சியுடன் கண்டறிய உதவும்.

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [பொதுவான பிரச்சினைகள்](common-issues.md)

- **அடுத்த பாடம்**: [திறன் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை Co-op Translator (https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள்படுத்தல்கள் இருக்கக்கூடும் என்று தயவுசெய்து கவனிக்கவும். மூல ஆவணம் அதன் சொந்த மொழியிலேயே அதிகாரப்பூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இம்மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்படும் எந்தப் புரிதல்களுக்கோ அல்லது தவறான பொருள் விளக்கங்களுக்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->