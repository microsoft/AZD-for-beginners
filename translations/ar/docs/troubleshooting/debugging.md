# دليل تصحيح الأخطاء لتوزيعات AZD

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل السابع - استكشاف الأخطاء وإصلاحها
- **⬅️ السابق**: [المشاكل الشائعة](common-issues.md)
- **➡️ التالي**: [استكشاف الأخطاء المتعلقة بالذكاء الاصطناعي](ai-troubleshooting.md)
- **🚀 الفصل التالي**: [الفصل الثامن: أنماط الإنتاج والمؤسسات](../microsoft-foundry/production-ai-practices.md)

## المقدمة

يوفر هذا الدليل الشامل استراتيجيات تصحيح الأخطاء المتقدمة، الأدوات، والتقنيات لتشخيص وحل المشكلات المعقدة المتعلقة بتوزيعات Azure Developer CLI. تعلم منهجيات استكشاف الأخطاء بشكل منهجي، تقنيات تحليل السجلات، تحليل الأداء، وأدوات التشخيص المتقدمة لحل مشكلات التوزيع والتشغيل بكفاءة.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- إتقان منهجيات تصحيح الأخطاء المنهجية لمشاكل Azure Developer CLI
- فهم تكوين السجلات المتقدمة وتقنيات تحليل السجلات
- تنفيذ استراتيجيات تحليل الأداء والمراقبة
- استخدام أدوات وخدمات التشخيص في Azure لحل المشكلات المعقدة
- تطبيق تقنيات استكشاف الأخطاء المتعلقة بالشبكات والأمان
- تكوين مراقبة شاملة وتنبيهات للكشف المبكر عن المشكلات

## نتائج التعلم

عند الانتهاء، ستكون قادرًا على:
- تطبيق منهجية TRIAGE لاستكشاف الأخطاء المعقدة في التوزيعات بشكل منهجي
- تكوين وتحليل معلومات السجلات والتتبع الشاملة
- استخدام Azure Monitor، Application Insights، وأدوات التشخيص بفعالية
- استكشاف مشكلات الاتصال بالشبكة، المصادقة، والأذونات بشكل مستقل
- تنفيذ استراتيجيات مراقبة الأداء وتحسينه
- إنشاء نصوص تصحيح الأخطاء المخصصة وأتمتة لحل المشكلات المتكررة

## منهجية تصحيح الأخطاء

### نهج TRIAGE
- **T**ime: متى بدأت المشكلة؟
- **R**eproduce: هل يمكنك إعادة إنتاجها بشكل مستمر؟
- **I**solate: ما هو المكون الذي يفشل؟
- **A**nalyze: ماذا تخبرنا السجلات؟
- **G**ather: جمع كل المعلومات ذات الصلة
- **E**scalate: متى يجب طلب المساعدة الإضافية؟

## تمكين وضع التصحيح

### متغيرات البيئة
```bash
# تمكين التصحيح الشامل
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# تصحيح واجهة سطر أوامر Azure
export AZURE_CLI_DIAGNOSTICS=true

# تعطيل القياس عن بعد للحصول على إخراج أنظف
export AZD_DISABLE_TELEMETRY=true
```

### تكوين التصحيح
```bash
# ضبط تكوين التصحيح عالميًا
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# تمكين تسجيل التتبع
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 تقنيات تحليل السجلات

### فهم مستويات السجلات
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### تحليل السجلات المهيكلة
```bash
# تصفية السجلات حسب المستوى
azd logs --level error --since 1h

# تصفية حسب الخدمة
azd logs --service api --level debug

# تصدير السجلات للتحليل
azd logs --output json > deployment-logs.json

# تحليل سجلات JSON باستخدام jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### ارتباط السجلات
```bash
#!/bin/bash
# correlate-logs.sh - ربط السجلات عبر الخدمات

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# البحث عبر جميع الخدمات
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# البحث في سجلات Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ أدوات تصحيح الأخطاء المتقدمة

### استعلامات Azure Resource Graph
```bash
# استعلام عن الموارد حسب العلامات
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# العثور على عمليات النشر الفاشلة
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# التحقق من صحة الموارد
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### استكشاف أخطاء الشبكة
```bash
# اختبار الاتصال بين الخدمات
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

# الاستخدام
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### تصحيح أخطاء الحاويات
```bash
# تصحيح مشاكل تطبيق الحاوية
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

### تصحيح أخطاء اتصال قواعد البيانات
```bash
# تصحيح اتصال قاعدة البيانات
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

## 🔬 تصحيح أخطاء الأداء

### مراقبة أداء التطبيقات
```bash
# تمكين تصحيح أخطاء تطبيق Insights
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

# مراقبة الأداء المخصصة
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

### تحليل استخدام الموارد
```bash
# مراقبة استخدام الموارد
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

## 🧪 الاختبار والتحقق

### تصحيح أخطاء اختبارات التكامل
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# إعداد بيئة التصحيح
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# الحصول على نقاط نهاية الخدمة
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# اختبار نقاط نهاية الصحة
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

# تشغيل الاختبارات
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# تشغيل اختبارات التكامل المخصصة
npm run test:integration
```

### اختبار التحميل لتصحيح الأخطاء
```bash
# اختبار تحميل بسيط لتحديد نقاط ضعف الأداء
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # استخدام Apache Bench (التثبيت: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # استخراج المقاييس الرئيسية
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # التحقق من حالات الفشل
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 تصحيح أخطاء البنية التحتية

### تصحيح أخطاء قوالب Bicep
```bash
# تحقق من قوالب Bicep مع إخراج مفصل
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # التحقق من صحة بناء الجملة
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # التحقق من صحة التنسيق
    az bicep lint --file "$template_file"
    
    # ماذا لو تم النشر
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# تصحيح نشر القالب
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

### تحليل حالة الموارد
```bash
# تحليل حالات الموارد للبحث عن التناقضات
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # سرد جميع الموارد مع حالاتها
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # التحقق من الموارد الفاشلة
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

## 🔒 تصحيح أخطاء الأمان

### تصحيح أخطاء تدفق المصادقة
```bash
# تصحيح مصادقة Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # فك تشفير رمز JWT (يتطلب jq و base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# تصحيح الوصول إلى Key Vault
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

### تصحيح أخطاء أمان الشبكة
```bash
# تصحيح مجموعات أمان الشبكة
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # تحقق من قواعد الأمان
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 تصحيح أخطاء التطبيقات المحددة

### تصحيح أخطاء تطبيقات Node.js
```javascript
// ملف debug-middleware.js - وسيط تصحيح Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // تسجيل تفاصيل الطلب
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // تجاوز res.json لتسجيل الردود
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### تصحيح أخطاء استعلامات قواعد البيانات
```javascript
// أدوات تصحيح أخطاء قاعدة البيانات - database-debug.js
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

## 🚨 إجراءات تصحيح الأخطاء الطارئة

### الاستجابة لمشكلات الإنتاج
```bash
#!/bin/bash
# emergency-debug.sh - تصحيح طوارئ الإنتاج

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

# التبديل إلى البيئة الصحيحة
azd env select "$ENVIRONMENT"

# جمع المعلومات الهامة
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

### إجراءات التراجع
```bash
# برنامج نصي سريع للتراجع
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # تبديل البيئة
    azd env select "$environment"
    
    # تراجع عن التطبيق
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # التحقق من التراجع
    echo "Verifying rollback..."
    azd show
    
    # اختبار النقاط النهائية الحرجة
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 لوحات تصحيح الأخطاء

### لوحة مراقبة مخصصة
```bash
# إنشاء استعلامات Application Insights للتصحيح
create_debug_queries() {
    local app_insights_name=$1
    
    # استعلام عن الأخطاء
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # استعلام عن مشاكل الأداء
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # استعلام عن فشل التبعيات
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### تجميع السجلات
```bash
# تجميع السجلات من مصادر متعددة
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

## 🔗 موارد متقدمة

### نصوص تصحيح الأخطاء المخصصة
قم بإنشاء دليل `scripts/debug/` يحتوي على:
- `health-check.sh` - فحص شامل للصحة
- `performance-test.sh` - اختبار الأداء التلقائي
- `log-analyzer.py` - تحليل السجلات المتقدم
- `resource-validator.sh` - التحقق من البنية التحتية

### تكامل المراقبة
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

## أفضل الممارسات

1. **قم دائمًا بتمكين تسجيل التصحيح** في البيئات غير الإنتاجية
2. **قم بإنشاء حالات اختبار قابلة للتكرار** للمشكلات
3. **وثق إجراءات تصحيح الأخطاء** لفريقك
4. **أتمتة فحوصات الصحة** والمراقبة
5. **حافظ على تحديث أدوات التصحيح** مع تغييرات التطبيق
6. **مارس إجراءات تصحيح الأخطاء** خلال الأوقات غير الحرجة

## الخطوات التالية

- [تخطيط السعة](../pre-deployment/capacity-planning.md) - تخطيط متطلبات الموارد
- [اختيار SKU](../pre-deployment/sku-selection.md) - اختيار مستويات الخدمة المناسبة
- [فحوصات ما قبل النشر](../pre-deployment/preflight-checks.md) - التحقق قبل النشر
- [ورقة الغش](../../resources/cheat-sheet.md) - أوامر مرجعية سريعة

---

**تذكر**: التصحيح الجيد يعتمد على أن تكون منهجيًا، دقيقًا، وصبورًا. هذه الأدوات والتقنيات ستساعدك على تشخيص المشكلات بشكل أسرع وأكثر فعالية.

---

**التنقل**
- **الدرس السابق**: [المشاكل الشائعة](common-issues.md)

- **الدرس التالي**: [تخطيط السعة](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->