# គោលការណ៍ដោះស្រាយកំហុសសម្រាប់ការវេចខ្ចប់ AZD

**ការរុករកជំពូក៖**
- **📚 ផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 7 - ដោះស្រាយបញ្ហា និងកែកំហុស
- **⬅️ មុននេះ**: [បញ្ហាទូទៅ](common-issues.md)
- **➡️ បន្ទាប់**: [ដោះស្រាយបញ្ហាពិសេស AI](ai-troubleshooting.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូកទី 8: គំរូផលិតកម្ម និងសហគ្រាស](../chapter-08-production/production-ai-practices.md)

## មួយទឹកមុខ

មគ្គុទេសក៍ជ្រៅនេះផ្តល់នូវយុទ្ធសាស្រ្ត កម្មវិធី និងបច្ចេកទេសដោះស្រាយកំហុសទាន់សម័យសម្រាប់ពិនិត្យ និងដោះស្រាយបញ្ហាស្មុគស្មាញជាមួយការវេចខ្ចប់ Azure Developer CLI។ រៀនពីវិធីសាស្រ្តរុករកបញ្ហាទ្រង់ទ្រាយ សំយោគការវិភាគកំណត់ហេតុ ការវាយតម្លៃប្រសិទ្ធភាព និងឧបករណ៍វិភាគទាន់សម័យសម្រាប់ដោះស្រាយបញ្ហាវេចខ្ចប់ និងបញ្ហាកំឡុងពេលដំណើរការ។

## គោលបំណងសិក្សា

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹងអាច៖
- គ្រប់គ្រងវិធីសាស្រ្តដោះស្រាយកំហុសជាប្រព័ន្ធសម្រាប់បញ្ហា Azure Developer CLI
- យល់ដឹងពីការកំណត់តម្លៃកំណត់ហេតុ និងបច្ចេកទេសវិភាគកំណត់ហេតុជម្រៅ
- អនុវត្តការត្រួតពិនិត្យនិងវាយតម្លៃប្រសិទ្ធភាព
- ប្រើឧបករណ៍វិភាគ Azure និងសេវាកម្មសម្រាប់ដោះស្រាយបញ្ហាស្មុគស្មាញ
- អនុវត្តបច្ចេកទេសដោះស្រាយបញ្ហាបណ្ដាញនិងសុវត្ថិភាព
- កំណត់ការត្រួតពិនិត្យ និងរាយការណ៍យ៉ាងទូលំទូលាយសម្រាប់រកឃើញបញ្ហាជាមុន

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- អនុវត្តវិធីសាស្រ្ត TRIAGE សម្រាប់ដោះស្រាយបញ្ហាវេចខ្ចប់ស្មុគស្មាញយ៉ាង ប្រព័ន្ធ
- កំណត់ និងវិភាគព័ត៌មានកំណត់ហេតុ និងការតាមដានយ៉ាងទូលំទូលាយ
- ប្រើ Azure Monitor, Application Insights និងឧបករណ៍វិភាគជាដំណើរការ
- ដោះស្រាយបញ្ហាភ្ជាប់បណ្ដាញ ការផ្ទៀងផ្ទាត់ និងសិទ្ធិដោយឯករាជ្យ
- អនុវត្តការត្រួតពិនិត្យនិងតុល្យភាពប្រសិទ្ធភាព
- បង្កើតស្គ្រីបដោះស្រាយកំហុសផ្ទាល់ខ្លួន និងអូតូម៉ាទិសសម្រាប់បញ្ហាប្រចាំ

## វិធីសាស្រ្តដោះស្រាយកំហុស

### វិធីសាស្រ្ត TRIAGE
- **T**ime: បញ្ហាចាប់ផ្តើមនៅពេលណា?
- **R**eproduce: អ្នកអាចបង្កើតបញ្ហាឡើងវិញបានទៀងទាត់ទេ?
- **I**solate: ធាតុណាកំពុងបរាជ័យ?
- **A**nalyze: កំណត់ហេតុប្រាប់យើងអ្វី?
- **G**ather: សូមប្រមូលព័ត៌មានទាំងអស់ដែលពាក់ព័ន្ធ
- **E**scalate: រកជំនួយបន្ថែមពេលណា

## ការបើករបៀប Debug

### អថេរបរិស្ថាន
```bash
# បើកកំណត់ត្រាកំហុសលម្អិត
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# កំណត់ត្រាកំហុស Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# បិទការផ្ញើព័ត៌មានដើម្បីលទ្ធផលស្អាត
export AZD_DISABLE_TELEMETRY=true
```

### ការកំណត់រចនាសម្ព័ន្ធ Debug
```bash
# កំណត់ការកំណត់ផ្ទាល់ខ្លួន debug សកល
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# បើកកំណត់ព្រឹត្តិការណ៍តាមដាន
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 បច្ចេកទេសវិភាគកំណត់ហេតុ

### ការយល់ដឹងអំពីកម្រិតកំណត់ហេតុ
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### វិភាគកំណត់ហេតុក្រមសម្ព័ន្ធ
```bash
# មើលកំណត់ហេតុជាមួយ Azure Monitor (តាមរយៈ azd monitor)
azd monitor --logs

# មើលកំណត់ហេតុកម្មវិធីក្នុងពេល​ពិតប្រាកដ
azd monitor --live

# សម្រាប់វិភាគកំណត់ហេតុយ៉ាងលម្អិត សូមប្រើ Azure CLI ជាមួយ App Service របស់អ្នក ឬ Container App:
# កំណត់ហេតុ App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# កំណត់ហេតុ Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# នាំចេញកំណត់ហេតុ Application Insights សម្រាប់ការវិភាគ
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### ការភ្ជាប់កំណត់ហេតុ
```bash
#!/bin/bash
# correlate-logs.sh - ធ្វើការតភ្ជាប់កំណត់ហេតុជាមួយសេវាកម្មជាច្រើនប្រើ Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# រក្សាទុកក្នុង Application Insights សម្រាប់កំណត់ហេតុដែលមានការតភ្ជាប់គ្នា
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# ស្វែងរកកំណត់ហេតុសកម្មភាព Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ឧបករណ៍ដោះស្រាយកំហុសបច្ចេកទេសខ្ពស់

### សំណួរក្រាហ្វធនធាន Azure
```bash
# ស្វែងរកធនធានតាមស្លាក
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ស្វែងរកការចេញផ្សាយដែលបានបរាជ័យ
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# ពិនិត្យសុខភាពធនធាន
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ដោះស្រាយបញ្ហាបណ្តាញ
```bash
# សាកល្បងការតភ្ជាប់រវាងសេវាកម្ម
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

# ការប្រើប្រាស់
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### ដោះស្រាយកំហុសកុងតែន័រ
```bash
# បញ្ហាអប្បបរមាអង្គភាពកម្មវិធី
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

### ដោះស្រាយបញ្ហាការតភ្ជាប់មូលដ្ឋានទិន្នន័យ
```bash
# កែសម្រួលការតភ្ជាប់មូលដ្ឋានទិន្នន័យ
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

## 🔬 ដោះស្រាយកំហុសប្រសិទ្ធភាព

### ត្រួតពិនិត្យប្រសិទ្ធភាពកម្មវិធី
```bash
# អនុញ្ញាតការត្រួតពិនិត្យពន្ធនាគារអង់គ្លេសកម្មវិធី
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

# ការត្រួតពិនិត្យសមត្ថភាពបុគ្គលិក
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

### វិភាគការប្រើប្រាស់ធនធាន
```bash
# ត្រួតពិនិត្យការប្រើប្រាស់ធនធាន
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

## 🧪 ការបញ្ចូលការសាកល្បង និងបញ្ចាក់

### ដោះស្រាយកំហុសក្នុងតេស្តបញ្ចូល
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# កំណត់បរិយាកាសធ្វើតេស្ត
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ទទួល endpoints សេវាកម្ម
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# សាកល្បង endpoints សុខភាព
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

# ប្រតិបត្តិការធ្វើតេស្ត
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# ប្រតិបត្តិការធ្វើតេស្តបញ្ចូលតាមបំណង
npm run test:integration
```

### តេស្តបន្ទុកសម្រាប់ដោះស្រាយកំហុស
```bash
# ការធ្វើតេស្តផ្ទុកសាមញ្ញដើម្បីបញ្ចេញបញ្ហាការសម្របសម្រួលប្រសិទ្ធភាព
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # ប្រើ Apache Bench (ដំឡើងៈ apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ជម្រោះម៉ែត្រឃីសំខាន់ៗ
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # စាកមើលមានការបរាជ័យឬអត់
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ដោះស្រាយបញ្ហាឧស្ម័នរចនាសម្ព័ន្ធ

### ដោះស្រាយកំហុសគំរូ Bicep
```bash
# ពិនិត្យតំបន់ទំព័រជាមួយលទ្ធផលលម្អិត
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # ការផ្ទៀងផ្ទាត់វេយ្យាករណ៍
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # ការផ្ទៀងផ្ទាត់ការត្រួតពិនិត្យ
    az bicep lint --file "$template_file"
    
    # ការចេញផ្សាយ What-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ដោះស្រាយការចេញផ្សាយទំព័រ
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

### វិភាគស្ថានភាពធនធាន
```bash
# វិភាគស្ថានភាពធនធានសម្រាប់ការមិនស្របគ្នា
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # បញ្ជីធនធានទាំងអស់ជាមួយស្ថានភាពរបស់ពួកវា
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ពិនិត្យសម្រាប់ធនធានដែលបានបរាជ័យ
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

## 🔒 ដោះស្រាយបញ្ហាសុវត្ថិភាព

### ដោះស្រាយបញ្ហាផ្លូ Authentication
```bash
# ដ័ត៌មានកំហុសការផ្ទៀងផ្ទាត់ Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # បម្លែងខ្សែ JWT (ត្រូវការកម្មវិធី jq និង base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# ដត់ត្រាការចូលប្រើ Key Vault
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

### ដោះស្រាយបញ្ហាសុវត្ថិភាពបណ្ដាញ
```bash
# ពិនិត្យក្រុមសន្តិសុខបណ្តាញ
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # ពិនិត្យច្បាប់សន្តិសុខ
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ដោះស្រាយកំហុសពិសេសកម្មវិធី

### ដោះស្រាយកំហុសកម្មវិធី Node.js
```javascript
// debug-middleware.js - មធ្យោបាយធ្វើការត្រួតពិនិត្យកំហុសក្នុង Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // កំណត់ហេតុលម្អិតសំណើ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // ជំនួស res.json ដើម្បីកំណត់ហេតុការឆ្លើយតប
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ដោះស្រាយសំនួរព័ត៌មានមូលដ្ឋានទិន្នន័យ
```javascript
// database-debug.js - ឧបករណ៍ជំនួយសម្រាប់បញ្ឆែកមូលដ្ឋានទិន្នន័យ
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

## 🚨 គោលការណ៍ដោះស្រាយបញ្ហាបន្ទាន់

### ចុះបទបញ្ជាលើបញ្ហាផលិតកម្ម
```bash
#!/bin/bash
# emergency-debug.sh - ការសម្ភាសន៍បន្ទាន់ផ្នែកផលិតកម្ម

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

# ប្ដូរទៅបរិយាកាសត្រឹមត្រូវ
azd env select "$ENVIRONMENT"

# ប្រមូលព័ត៌មានសំខាន់
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# ប្រើ Azure Monitor សម្រាប់កំណត់ត្រាខុសឆ្គង
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

### ដំណើរការវិលត្រឡប់
```bash
# ស្គ្រីបចុះក្រោយយ៉ាងរហ័ស
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # ប្ដូរសង្ខេបបរិយាកាស
    azd env select "$environment"
    
    # ចុះក្រោយដោយប្រើ Git (AZD មិនមានការចុះក្រោយបង្កើតរួច)
    git checkout "$previous_commit"
    azd deploy
    
    # ពិនិត្យបញ្ជាក់ការចុះក្រោយ
    echo "Verifying rollback..."
    azd show
    
    # សាកល្បងចំណុចចម្រុះសំខាន់ៗ
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ផ្ទាំងគ្រប់គ្រងដោះស្រាយកំហុស

### ផ្ទាំងត្រួតពិនិត្យផ្ទាល់ខ្លួន
```bash
# បង្កើតការស្វែងរក Application Insights សម្រាប់ដោះស្រាយបញ្ហា
create_debug_queries() {
    local app_insights_name=$1
    
    # ស្វែងរកកំហុស
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # ស្វែងរកបញ្ហាពិនិត្យប្រតិបត្តិការ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # ស្វែងរកការបរាជ័យក្នុងការអ្នកពឹងផ្អែក
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### ការប្រមូលកំណត់ហេតុ
```bash
# សម្រង់កំណត់ហេតុពីប្រភព Azure ច្រើនដែលផ្សំគ្នា
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

## 🔗 ឯកសារគន្លងខ្ពស់

### ស្គ្រីបដោះស្រាយកំហុសផ្ទាល់ខ្លួន
បង្កើតថត `scripts/debug/` មាន៖
- `health-check.sh` - ការត្រួតពិនិត្យសុខភាពទូទៅ
- `performance-test.sh` - ការសាកល្បងប្រសិទ្ធភាពដោយស្វ័យប្រវត្តិ
- `log-analyzer.py` - ការវិភាគកំណត់ហេតុជ្រៅ
- `resource-validator.sh` - ការបញ្ជាក់ធនធាន

### បញ្ចូលការត្រួតពិនិត្យ
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

## គំនិតល្អនៅក្នុងការអនុវត្ត

1. **តែងតែបើកកំណត់ហេតុ debug** នៅបរិស្ថានមិនមែនផលិតកម្ម
2. **បង្កើតករណីសាកល្បងបង្កើតឡើងវិញបាន** សម្រាប់បញ្ហា
3. **ចុះបញ្ជីនីតិវិធីដោះស្រាយកំហុស** សម្រាប់ក្រុមរបស់អ្នក
4. **អូតូម៉ាទិសការត្រួតពិនិត្យ និងសុខភាព**
5. **រក្សាគ្រឿងមួយចំនួនសម្រាប់debugជាថ្មីតាមការផ្លាស់ប្តូរគម្រោង**
6. **ហ្វឹកហាត់នីតិវិធីដោះស្រាយកំហុស** នៅពេលមិនមានគ្រោះថ្នាក់

## ជំហានបន្ទាប់

- [គម្រោងផែនការ](../chapter-06-pre-deployment/capacity-planning.md) - គម្រោងចំណងធនធាន
- [ជ្រើសរើស SKU](../chapter-06-pre-deployment/sku-selection.md) - ជ្រើសជាន់សេវា
- [ត្រួតពិនិត្យមុនបើក](../chapter-06-pre-deployment/preflight-checks.md) - បញ្ចាក់មុនវេចខ្ចប់
- [សន្លឹកជំនួយ](../../resources/cheat-sheet.md) - ពាក្យបញ្ជារហ័ស

---

**ចងចាំ**៖ ការដោះស្រាយកំហុសល្អគឺអំពីការត្រឹមត្រូវ សូមអនុវត្តយ៉ាងហ្មត់ចត់ និងអត់ធ្មត់។ ឧបករណ៍និងបច្ចេកទេសទាំងនេះនឹងជួយអ្នកសម្គាល់បញ្ហាបានយ៉ាងឆាប់រហ័ស និងមានប្រសិទ្ធភាពជាងមុន។

---

**ការរុករក**
- **មេរៀនមុន**: [បញ្ហាទូទៅ](common-issues.md)

- **មេរៀនបន្ទាប់**: [គម្រោងផែនការ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះត្រូវបានបកប្រែក្នុងការប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលយើងខិតខំប្រឹងប្រែងដើម្បីភាពត្រឹមត្រូវ សូមយកចិត្តទុកដាក់ថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាដើមគួរត្រូវបានគេយកជាផ្លូវការជាផ្នែកចម្បង។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យបកប្រែដោយអ្នកជំនាញមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសពីការប្រើប្រាស់នៃការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->