# AZD ڈپلائمنٹس کے لیے ڈی بگنگ گائیڈ

**باب نیویگیشن:**
- **📚 کورس ہوم**: [ابتدائیوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 7 - مسائل کا حل اور ڈی بگنگ
- **⬅️ پچھلا**: [عام مسائل](common-issues.md)
- **➡️ اگلا**: [AI مخصوص خرابیوں کا ازالہ](ai-troubleshooting.md)
- **🚀 اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../chapter-08-production/production-ai-practices.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI ڈپلائمنٹس کے ساتھ پیچیدہ مسائل کی تشخیص اور حل کے لیے جدید ڈی بگنگ حکمت عملیاں، ٹولز اور تکنیکیں فراہم کرتی ہے۔ نظاماتی ٹربل شوٹنگ طریقہ کار، لاگ تجزیہ کی تکنیکیں، پرفارمنس پروفائلنگ، اور پیچیدہ مسائل کے مؤثر حل کے لیے جدید تشخیصی ٹولز سیکھیں۔

## سیکھنے کے مقاصد

اس گائیڈ کو مکمل کرنے کے بعد، آپ:
- Azure Developer CLI کے مسائل کے لیے منظم ڈی بگنگ طریقہ کار میں مہارت حاصل کریں
- جدید لاگ کنفیگریشن اور لاگ تجزیہ کی تکنیکوں کو سمجھیں
- کارکردگی کی پروفائلنگ اور مانیٹرنگ حکمت عملیاں نافذ کریں
- پیچیدہ مسائل کے حل کے لیے Azure کے تشخیصی ٹولز اور سروسز استعمال کریں
- نیٹ ورک ڈی بگنگ اور سیکیورٹی ٹربل شوٹنگ تکنیکیں لاگو کریں
- مسائل کی پیشگی نشاندہی کے لیے جامع مانیٹرنگ اور الارٹنگ ترتیب دیں

## سیکھنے کے نتائج

مکمل کرنے پر، آپ قابل ہوں گے:
- پیچیدہ ڈپلائمنٹ مسائل کو منظم انداز میں ڈی بگ کرنے کے لیے TRIAGE طریقہ کار لاگو کریں
- جامع لاگنگ اور ٹریسنگ معلومات کو کنفیگر اور تجزیہ کریں
- Azure Monitor، Application Insights، اور تشخیصی ٹولز کو مؤثر طریقے سے استعمال کریں
- نیٹ ورک کنیکٹیویٹی، توثیق، اور اجازت کے مسائل کو خود مختار طریقے سے ڈی بگ کریں
- کارکردگی کی مانیٹرنگ اور بہتر بنانے کی حکمت عملیاں نافذ کریں
- دہرائے جانے والے مسائل کے لیے کسٹم ڈی بگنگ اسکرپٹس اور آٹومیشن بنائیں

## ڈی بگنگ طریقہ کار

### TRIAGE طریقۂ کار
- **T**ime: مسئلہ کب شروع ہوا؟
- **R**eproduce: کیا آپ اسے مستقل طور پر دوبارہ پیدا کر سکتے ہیں؟
- **I**solate: کون سا جز ناکام ہو رہا ہے؟
- **A**nalyze: لاگز ہمیں کیا بتاتے ہیں؟
- **G**ather: تمام متعلقہ معلومات جمع کریں
- **E**scalate: اضافی مدد طلب کرنے کا وقت کب ہے؟

## ڈیبگ موڈ کو فعال کرنا

### ماحولی متغیرات
```bash
# جامع ڈیبگنگ کو فعال کریں
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI کے لیے ڈیبگنگ
export AZURE_CLI_DIAGNOSTICS=true

# صاف تر آؤٹ پٹ کے لیے ٹیلی میٹری کو غیر فعال کریں
export AZD_DISABLE_TELEMETRY=true
```

### ڈی بگ کنفیگریشن
```bash
# ڈی بگ کنفیگریشن کو عالمی طور پر سیٹ کریں
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ٹریس لاگنگ کو فعال کریں
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 لاگ تجزیہ کی تکنیکیں

### لاگ لیولز کو سمجھنا
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### منظم لاگ تجزیہ
```bash
# Azure Monitor کے ساتھ لاگز دیکھیں (azd monitor کے ذریعے)
azd monitor --logs

# ایپلیکیشن کے لاگز حقیقی وقت میں دیکھیں
azd monitor --live

# تفصیلی لاگ تجزیے کے لیے، اپنی App Service یا Container App کے ساتھ Azure CLI استعمال کریں:
# App Service کے لاگز
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App کے لاگز
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# تجزیے کے لیے Application Insights کے لاگز برآمد کریں
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### لاگ کوریلیشن
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor استعمال کرتے ہوئے مختلف سروسز کے درمیان لاگز کو مربوط کریں

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights میں مربوط لاگز تلاش کریں
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure کی سرگرمی لاگز تلاش کریں
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ جدید ڈی بگنگ ٹولز

### Azure Resource Graph استفسارات
```bash
# ٹیگز کے ذریعے وسائل تلاش کریں
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ناکام تعیناتیاں تلاش کریں
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# وسائل کی صحت چیک کریں
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### نیٹ ورک ڈی بگنگ
```bash
# سروسز کے درمیان کنیکٹوٹی کی جانچ
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

# استعمال
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### کنٹینر ڈی بگنگ
```bash
# کنٹینر ایپ کے مسائل کی تشخیص کریں
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

### ڈیٹا بیس کنکشن ڈی بگنگ
```bash
# ڈیٹا بیس کی کنیکٹیویٹی کو ڈیبگ کریں
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

## 🔬 کارکردگی کی ڈی بگنگ

### ایپلیکیشن کارکردگی مانیٹرنگ
```bash
# اپلیکیشن انسائٹس کی ڈیبگنگ کو فعال کریں
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

# حسبِ ضرورت کارکردگی کی نگرانی
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

### وسائل کے استعمال کا تجزیہ
```bash
# وسائل کے استعمال کی نگرانی کریں
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

## 🧪 ٹیسٹنگ اور تصدیق

### انٹیگریشن ٹیسٹ ڈی بگنگ
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# ڈیبگ ماحول مرتب کریں
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# سروس کے اینڈ پوائنٹس حاصل کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ہیلتھ اینڈ پوائنٹس کی جانچ کریں
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

# ٹیسٹ چلائیں
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# کسٹم انٹیگریشن ٹیسٹس چلائیں
npm run test:integration
```

### ڈی بگنگ کے لیے لوڈ ٹیسٹنگ
```bash
# پرفارمنس کی رکاوٹوں کی نشاندہی کے لیے سادہ لوڈ ٹیسٹ
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench استعمال کیا جا رہا ہے (انسٹال: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # اہم میٹرکس نکالیں
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ناکامیوں کے لیے چیک کریں
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 انفراسٹرکچر ڈی بگنگ

### Bicep ٹیمپلیٹ ڈی بگنگ
```bash
# تفصیلی آؤٹ پٹ کے ساتھ Bicep ٹیمپلیٹس کی توثیق کریں
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # نحو کی توثیق
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # لنٹ کی توثیق
    az bicep lint --file "$template_file"
    
    # What-if کی تعیناتی
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ٹیمپلیٹ کی تعیناتی کو ڈیبگ کریں
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

### وسائل کی حالت کا تجزیہ
```bash
# وسائل کی حالتوں میں عدم مطابقت کے لیے تجزیہ کریں
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # تمام وسائل کو ان کی حالتوں کے ساتھ فہرست کریں
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ناکام وسائل کی جانچ کریں
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

## 🔒 سیکیورٹی ڈی بگنگ

### تصدیقی فلو ڈی بگنگ
```bash
# Azure کی تصدیق کی خرابی دور کریں
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT ٹوکن کو ڈی کوڈ کریں (jq اور base64 درکار ہیں)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault تک رسائی کی خرابی دور کریں
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

### نیٹ ورک سیکیورٹی ڈی بگنگ
```bash
# نیٹ ورک سیکیورٹی گروپس کو ڈیبگ کریں
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # سیکیورٹی رولز چیک کریں
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ایپلیکیشن مخصوص ڈی بگنگ

### Node.js ایپلیکیشن ڈی بگنگ
```javascript
// debug-middleware.js - Express کے لیے ڈیبگنگ مڈل ویئر
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // درخواست کی تفصیلات لاگ کریں
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json کو اوور رائیڈ کریں تاکہ جوابات لاگ کیے جائیں
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ڈیٹا بیس کوئری ڈی بگنگ
```javascript
// database-debug.js - ڈیٹا بیس ڈیبگنگ کے اوزار
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

## 🚨 ہنگامی ڈی بگنگ طریقہ کار

### پروڈکشن کے مسائل کا جواب
```bash
#!/bin/bash
# emergency-debug.sh - ہنگامی پیداواری ڈیبگنگ

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

# صحیح ماحول میں سوئچ کریں
azd env select "$ENVIRONMENT"

# اہم معلومات جمع کریں
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# غلطیوں کے لاگز کے لیے Azure Monitor استعمال کریں
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

### رول بیک طریقہ کار
```bash
# فوری رول بیک اسکرپٹ
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # ماحول تبدیل کریں
    azd env select "$environment"
    
    # Git کے ذریعے رول بیک (AZD میں بلٹ ان رول بیک موجود نہیں ہے)
    git checkout "$previous_commit"
    azd deploy
    
    # رول بیک کی توثیق کریں
    echo "Verifying rollback..."
    azd show
    
    # اہم اینڈ پوائنٹس کی جانچ کریں
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ڈی بگنگ ڈیش بورڈز

### کسٹم مانیٹرنگ ڈیش بورڈ
```bash
# ڈیبگ کرنے کے لیے Application Insights کے استعلامات بنائیں
create_debug_queries() {
    local app_insights_name=$1
    
    # غلطیوں کے لیے استعلام
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # کارکردگی کے مسائل کے لیے استعلام
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # انحصار کی ناکامیوں کے لیے استعلام
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### لاگ ایگریگیشن
```bash
# متعدد Azure ذرائع سے لاگز کو جمع کریں
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

## 🔗 جدید وسائل

### کسٹم ڈی بگ اسکرپٹس
ایک `scripts/debug/` ڈائریکٹری بنائیں جس میں:
- `health-check.sh` - جامع ہیلتھ چیکنگ
- `performance-test.sh` - خودکار کارکردگی کی جانچ
- `log-analyzer.py` - جدید لاگ پارسنگ اور تجزیہ
- `resource-validator.sh` - انفراسٹرکچر کی توثیق

### مانیٹرنگ انٹیگریشن
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

## بہترین مشقیں

1. **ہمیشہ غیر پروڈکشن ماحول میں ڈی بگ لاگنگ کو فعال کریں**
2. **مسائل کے لیے قابلِ تکرار ٹیسٹ کیسز بنائیں**
3. **اپنی ٹیم کے لیے ڈی بگنگ طریقہ کار دستاویزی بنائیں**
4. **ہیلتھ چیکس اور مانیٹرنگ کو خودکار بنائیں**
5. **اپلیکیشن کی تبدیلیوں کے ساتھ ڈی بگ ٹولز کو اپ ڈیٹ رکھیں**
6. **غیر واقعاتی اوقات میں ڈی بگنگ طریقہ کار کی مشق کریں**

## اگلے اقدامات

- [صلاحیت کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md) - وسائل کی ضروریات کی منصوبہ بندی کریں
- [SKU کا انتخاب](../chapter-06-pre-deployment/sku-selection.md) - مناسب سروس ٹیئرز منتخب کریں
- [پریفلائٹ چیکز](../chapter-06-pre-deployment/preflight-checks.md) - قبل از ڈپلائمنٹ کی تصدیق
- [چیٹ شیٹ](../../resources/cheat-sheet.md) - فوری حوالہ کمانڈز

---

**یاد رکھیں**: اچھا ڈی بگنگ منظم، مکمل، اور صبر والا ہونا ہے۔ یہ ٹولز اور تکنیکیں آپ کو مسائل کو تیزی اور مؤثر طریقے سے تشخیص کرنے میں مدد دیں گی۔

---

**نیویگیشن**
- **پچھلا سبق**: [عام مسائل](common-issues.md)

- **اگلا سبق**: [صلاحیت کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
دستبرداری:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہِ کرم نوٹ کریں کہ خودکار تراجم میں غلطیاں یا خامیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی مادری زبان میں معتبر ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیر کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->