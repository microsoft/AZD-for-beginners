# AZD ڈیپلائمنٹ کے لیے ڈیبگنگ گائیڈ

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 7 - مسائل کا حل اور ڈیبگنگ
- **⬅️ پچھلا**: [عام مسائل](common-issues.md)
- **➡️ اگلا**: [AI کے مخصوص مسائل کا حل](ai-troubleshooting.md)
- **🚀 اگلا باب**: [باب 8: پروڈکشن اور انٹرپرائز پیٹرنز](../microsoft-foundry/production-ai-practices.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI ڈیپلائمنٹ کے پیچیدہ مسائل کی تشخیص اور حل کے لیے جدید ڈیبگنگ حکمت عملی، ٹولز، اور تکنیک فراہم کرتی ہے۔ منظم مسائل کے حل کے طریقے، لاگ تجزیہ کی تکنیک، کارکردگی پروفائلنگ، اور جدید تشخیصی ٹولز سیکھیں تاکہ ڈیپلائمنٹ اور رن ٹائم کے مسائل کو مؤثر طریقے سے حل کیا جا سکے۔

## سیکھنے کے اہداف

اس گائیڈ کو مکمل کرنے کے بعد، آپ:
- Azure Developer CLI کے مسائل کے لیے منظم ڈیبگنگ طریقے سیکھیں گے
- جدید لاگنگ کنفیگریشن اور لاگ تجزیہ کی تکنیک کو سمجھیں گے
- کارکردگی پروفائلنگ اور مانیٹرنگ حکمت عملی نافذ کریں گے
- Azure کے تشخیصی ٹولز اور سروسز کو پیچیدہ مسائل کے حل کے لیے استعمال کریں گے
- نیٹ ورک ڈیبگنگ اور سیکیورٹی مسائل کے حل کی تکنیک اپنائیں گے
- مسائل کی پیشگی تشخیص کے لیے جامع مانیٹرنگ اور الرٹنگ کو ترتیب دیں گے

## سیکھنے کے نتائج

گائیڈ مکمل کرنے کے بعد، آپ:
- پیچیدہ ڈیپلائمنٹ مسائل کو منظم طریقے سے ڈیبگ کرنے کے لیے TRIAGE طریقہ کار اپنائیں گے
- جامع لاگنگ اور ٹریسنگ معلومات کو ترتیب دیں اور تجزیہ کریں گے
- Azure Monitor، Application Insights، اور تشخیصی ٹولز کو مؤثر طریقے سے استعمال کریں گے
- نیٹ ورک کنیکٹیویٹی، تصدیق، اور اجازت کے مسائل کو خود سے ڈیبگ کریں گے
- کارکردگی مانیٹرنگ اور اصلاح کی حکمت عملی نافذ کریں گے
- بار بار پیش آنے والے مسائل کے لیے کسٹم ڈیبگنگ اسکرپٹس اور آٹومیشن بنائیں گے

## ڈیبگنگ کا طریقہ کار

### TRIAGE طریقہ
- **T**ائم: مسئلہ کب شروع ہوا؟
- **R**یپروڈیوس: کیا آپ اسے مستقل طور پر دوبارہ پیدا کر سکتے ہیں؟
- **I**سولیٹ: کون سا جزو ناکام ہو رہا ہے؟
- **A**نیلائز: لاگز ہمیں کیا بتاتے ہیں؟
- **G**یدر: تمام متعلقہ معلومات جمع کریں
- **E**سکلیٹ: کب اضافی مدد طلب کرنی ہے؟

## ڈیبگ موڈ کو فعال کرنا

### ماحول کے متغیرات
```bash
# جامع ڈیبگنگ کو فعال کریں
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# ایزور CLI ڈیبگنگ
export AZURE_CLI_DIAGNOSTICS=true

# صاف آؤٹ پٹ کے لیے ٹیلیمیٹری کو غیر فعال کریں
export AZD_DISABLE_TELEMETRY=true
```

### ڈیبگ کنفیگریشن
```bash
# عالمی طور پر ڈیبگ کنفیگریشن سیٹ کریں
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ٹریس لاگنگ کو فعال کریں
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 لاگ تجزیہ کی تکنیک

### لاگ لیولز کو سمجھنا
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ساختی لاگ تجزیہ
```bash
# لاگز کو سطح کے مطابق فلٹر کریں
azd logs --level error --since 1h

# سروس کے مطابق فلٹر کریں
azd logs --service api --level debug

# تجزیہ کے لیے لاگز برآمد کریں
azd logs --output json > deployment-logs.json

# jq کے ساتھ JSON لاگز کو پارس کریں
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### لاگ کورلیشن
```bash
#!/bin/bash
# correlate-logs.sh - خدمات کے درمیان لاگز کو ہم آہنگ کریں

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# تمام خدمات میں تلاش کریں
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure لاگز میں تلاش کریں
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ جدید ڈیبگنگ ٹولز

### Azure Resource Graph Queries
```bash
# ٹیگز کے ذریعے وسائل کی تلاش کریں
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ناکام تعیناتیوں کو تلاش کریں
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# وسائل کی صحت چیک کریں
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### نیٹ ورک ڈیبگنگ
```bash
# خدمات کے درمیان رابطے کی جانچ کریں
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

### کنٹینر ڈیبگنگ
```bash
# کنٹینر ایپ کے مسائل کو ڈیبگ کریں
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

### ڈیٹا بیس کنکشن ڈیبگنگ
```bash
# ڈیٹا بیس کنیکٹیویٹی کو ڈیبگ کریں
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

## 🔬 کارکردگی ڈیبگنگ

### ایپلیکیشن کارکردگی مانیٹرنگ
```bash
# ایپلیکیشن انسائٹس ڈیبگنگ کو فعال کریں
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

# حسب ضرورت کارکردگی کی نگرانی
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

## 🧪 ٹیسٹنگ اور ویلیڈیشن

### انٹیگریشن ٹیسٹ ڈیبگنگ
```bash
#!/bin/bash
# ڈیبگ انٹیگریشن ٹیسٹس.sh

set -e

echo "Running integration tests with debugging..."

# ڈیبگ ماحول سیٹ کریں
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# سروس کے اینڈپوائنٹس حاصل کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# صحت کے اینڈپوائنٹس ٹیسٹ کریں
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

# ٹیسٹس چلائیں
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# حسب ضرورت انٹیگریشن ٹیسٹس چلائیں
npm run test:integration
```

### لوڈ ٹیسٹنگ کے لیے ڈیبگنگ
```bash
# سادہ لوڈ ٹیسٹ تاکہ کارکردگی کی رکاوٹوں کی نشاندہی کی جا سکے
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # اپاچی بینچ کا استعمال کریں (انسٹال کریں: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # اہم میٹرکس نکالیں
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ناکامیوں کی جانچ کریں
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 انفراسٹرکچر ڈیبگنگ

### Bicep ٹیمپلیٹ ڈیبگنگ
```bash
# تفصیلی آؤٹ پٹ کے ساتھ بائسپس ٹیمپلیٹس کی تصدیق کریں
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # نحو کی تصدیق
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # لنٹ کی تصدیق
    az bicep lint --file "$template_file"
    
    # کیا ہوگا اگر تعیناتی
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ٹیمپلیٹ تعیناتی کو ڈیبگ کریں
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
# وسائل کی حالتوں کا تجزیہ کریں تاکہ تضادات کا پتہ چل سکے
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

## 🔒 سیکیورٹی ڈیبگنگ

### تصدیق کے عمل کا ڈیبگنگ
```bash
# Azure کی توثیق کو ڈیبگ کریں
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT ٹوکن کو ڈی کوڈ کریں (jq اور base64 کی ضرورت ہے)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault تک رسائی کو ڈیبگ کریں
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

### نیٹ ورک سیکیورٹی ڈیبگنگ
```bash
# نیٹ ورک سیکیورٹی گروپس کو ڈیبگ کریں
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # سیکیورٹی قواعد چیک کریں
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ایپلیکیشن کے مخصوص ڈیبگنگ

### Node.js ایپلیکیشن ڈیبگنگ
```javascript
// ڈیبگ-مڈل ویئر.جے ایس - ایکسپریس ڈیبگنگ مڈل ویئر
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
    
    // res.json کو اووررائیڈ کریں تاکہ جوابات لاگ کیے جا سکیں
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ڈیٹا بیس کوئری ڈیبگنگ
```javascript
// ڈیٹا بیس ڈیبگنگ کے آلات
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

## 🚨 ایمرجنسی ڈیبگنگ کے طریقے

### پروڈکشن مسئلے کا جواب
```bash
#!/bin/bash
# ایمرجنسی-ڈیبگ.sh - ایمرجنسی پروڈکشن ڈیبگنگ

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

# درست ماحول میں سوئچ کریں
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

### رول بیک کے طریقے
```bash
# فوری رول بیک اسکرپٹ
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # ماحول تبدیل کریں
    azd env select "$environment"
    
    # ایپلیکیشن کو رول بیک کریں
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # رول بیک کی تصدیق کریں
    echo "Verifying rollback..."
    azd show
    
    # اہم اینڈپوائنٹس کا ٹیسٹ کریں
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 ڈیبگنگ ڈیش بورڈز

### کسٹم مانیٹرنگ ڈیش بورڈ
```bash
# ایپلیکیشن انسائٹس کے سوالات ڈیبگنگ کے لئے بنائیں
create_debug_queries() {
    local app_insights_name=$1
    
    # غلطیوں کے لئے سوال کریں
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # کارکردگی کے مسائل کے لئے سوال کریں
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # انحصار کی ناکامیوں کے لئے سوال کریں
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### لاگ ایگریگیشن
```bash
# متعدد ذرائع سے لاگز کو جمع کریں
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

## 🔗 جدید وسائل

### کسٹم ڈیبگ اسکرپٹس
ایک `scripts/debug/` ڈائریکٹری بنائیں جس میں شامل ہوں:
- `health-check.sh` - جامع صحت کی جانچ
- `performance-test.sh` - خودکار کارکردگی کی جانچ
- `log-analyzer.py` - جدید لاگ پارسنگ اور تجزیہ
- `resource-validator.sh` - انفراسٹرکچر کی تصدیق

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

## بہترین طریقے

1. **ہمیشہ ڈیبگ لاگنگ کو فعال کریں** غیر پروڈکشن ماحول میں
2. **مسائل کے لیے قابل تکرار ٹیسٹ کیسز بنائیں**
3. **اپنی ٹیم کے لیے ڈیبگنگ کے طریقے دستاویز کریں**
4. **صحت کی جانچ اور مانیٹرنگ کو خودکار بنائیں**
5. **ڈیبگ ٹولز کو ایپلیکیشن کی تبدیلیوں کے ساتھ اپ ڈیٹ رکھیں**
6. **غیر واقعہ کے وقت ڈیبگنگ کے طریقے کی مشق کریں**

## اگلے مراحل

- [صلاحیت کی منصوبہ بندی](../pre-deployment/capacity-planning.md) - وسائل کی ضروریات کی منصوبہ بندی کریں
- [SKU کا انتخاب](../pre-deployment/sku-selection.md) - مناسب سروس ٹائرز کا انتخاب کریں
- [پری فلائٹ چیکس](../pre-deployment/preflight-checks.md) - پری ڈیپلائمنٹ کی توثیق
- [چیٹ شیٹ](../../resources/cheat-sheet.md) - فوری حوالہ کمانڈز

---

**یاد رکھیں**: اچھی ڈیبگنگ منظم، مکمل، اور صبر سے کام لینے کا نام ہے۔ یہ ٹولز اور تکنیک آپ کو مسائل کی تشخیص کو تیز اور مؤثر بنانے میں مدد کریں گے۔

---

**نیویگیشن**
- **پچھلا سبق**: [عام مسائل](common-issues.md)

- **اگلا سبق**: [صلاحیت کی منصوبہ بندی](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کی بھرپور کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->