# دليل التصحيح لنشرات AZD

**تنقّل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 7 - استكشاف الأخطاء وإصلاحها والتصحيح
- **⬅️ السابق**: [مشكلات شائعة](common-issues.md)
- **➡️ التالي**: [استكشاف أخطاء الذكاء الاصطناعي](ai-troubleshooting.md)
- **🚀 الفصل التالي**: [الفصل 8: أنماط الإنتاج والمؤسسات](../chapter-08-production/production-ai-practices.md)

## مقدمة

يوفر هذا الدليل الشامل استراتيجيات وأدوات وتقنيات تصحيح متقدمة لتشخيص وحل المشكلات المعقدة في نشرات Azure Developer CLI. تعلّم مناهج منظَّمة لاستكشاف المشكلات، وتقنيات تحليل السجلات، وملف تعريف الأداء، وأدوات التشخيص المتقدمة لحل مشكلات النشر وتشغيل الزمن بكفاءة.

## أهداف التعلم

بإكمال هذا الدليل، ستتمكن من:
- إتقان مناهج التصحيح المنهجي لمشكلات Azure Developer CLI
- فهم تكوين التسجيل المتقدم وتقنيات تحليل السجلات
- تنفيذ استراتيجيات ملف تعريف ومراقبة الأداء
- استخدام أدوات وخدمات تشخيص Azure لحل المشكلات المعقدة
- تطبيق تقنيات تصحيح الشبكات والأمن
- تكوين مراقبة وتنبيهات شاملة لاكتشاف المشكلات استباقيًا

## نواتج التعلم

عند الانتهاء، ستكون قادرًا على:
- تطبيق منهجية TRIAGE لتصحيح المشكلات المعقدة بشكل منهجي
- تكوين وتحليل معلومات التسجيل والتتبع الشاملة
- استخدام Azure Monitor وApplication Insights وأدوات التشخيص بفعالية
- تصحيح أخطاء الاتصال بالشبكة والمصادقة والأذونات بشكل مستقل
- تنفيذ مراقبة الأداء واستراتيجيات التحسين
- إنشاء نصوص تصحيح مخصصة وأتمتة للمشكلات المتكررة

## منهجية التصحيح

### منهجية TRIAGE
- **T**ime: متى بدأت المشكلة؟
- **R**eproduce: هل يمكنك إعادة إنتاجها باستمرار؟
- **I**solate: ما المكون الذي يفشل؟
- **A**nalyze: ماذا تخبرنا السجلات؟
- **G**ather: اجمع جميع المعلومات ذات الصلة
- **E**scalate: متى تطلب مساعدة إضافية؟

## تمكين وضع التصحيح

### متغيرات البيئة
```bash
# تمكين التصحيح الشامل
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# تصحيح Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# تعطيل القياس عن بُعد للحصول على مخرجات أنظف
export AZD_DISABLE_TELEMETRY=true
```

### تكوين التصحيح
```bash
# اضبط تكوين التصحيح عالميًا
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# تمكين تسجيل التتبع
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 تقنيات تحليل السجلات

### فهم مستويات السجل
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
# عرض السجلات باستخدام Azure Monitor (عبر azd monitor)
azd monitor --logs

# عرض سجلات التطبيق في الوقت الفعلي
azd monitor --live

# لتحليل مفصل للسجلات، استخدم Azure CLI مع App Service أو Container App:
# سجلات App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# سجلات Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# تصدير سجلات Application Insights للتحليل
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### ربط السجلات
```bash
#!/bin/bash
# correlate-logs.sh - ربط السجلات عبر الخدمات باستخدام Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# البحث في Application Insights عن السجلات المرتبطة
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# البحث في سجلات نشاط Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ أدوات تصحيح متقدمة

### استعلامات Azure Resource Graph
```bash
# استعلام عن الموارد حسب الوسوم
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# البحث عن عمليات النشر الفاشلة
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# التحقق من حالة المورد
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### تصحيح الشبكة
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

### تصحيح الحاويات
```bash
# استكشاف وإصلاح مشكلات تطبيق الحاوية
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

### تصحيح اتصال قاعدة البيانات
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

## 🔬 تصحيح الأداء

### مراقبة أداء التطبيق
```bash
# تمكين تصحيح الأخطاء في Application Insights
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

# مراقبة أداء مخصصة
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

### تصحيح اختبارات التكامل
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# إعداد بيئة التصحيح
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# الحصول على نقاط النهاية للخدمة
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# اختبار نقاط النهاية الصحية
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

### اختبار التحميل للتصحيح
```bash
# اختبار تحميل بسيط لتحديد اختناقات الأداء
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # باستخدام Apache Bench (التثبيت: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # استخراج المقاييس الرئيسية
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # التحقق من وجود أخطاء
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 تصحيح البنية التحتية

### تصحيح قوالب Bicep
```bash
# التحقق من قوالب Bicep مع إخراج مفصل
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # التحقق من صحة البنية
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # التحقق بواسطة Lint
    az bicep lint --file "$template_file"
    
    # نشر 'ماذا لو'
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
# تحليل حالات الموارد لاكتشاف التناقضات
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # سرد جميع الموارد مع حالاتها
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # التحقق من وجود موارد فاشلة
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

## 🔒 تصحيح الأمان

### تصحيح تدفق المصادقة
```bash
# تصحيح مصادقة أزور
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

### تصحيح أمان الشبكة
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

## 📱 تصحيح الأخطاء الخاص بالتطبيقات

### تصحيح تطبيقات Node.js
```javascript
// debug-middleware.js - وسيط تصحيح أخطاء Express
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
    
    // استبدال res.json لتسجيل الاستجابات
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### تصحيح استعلامات قاعدة البيانات
```javascript
// database-debug.js - أدوات تصحيح أخطاء قاعدة البيانات
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

## 🚨 إجراءات التصحيح الطارئة

### الاستجابة لمشكلة بالإنتاج
```bash
#!/bin/bash
# emergency-debug.sh - تصحيح الطوارئ في بيئة الإنتاج

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

# جمع المعلومات الحرجة
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# استخدام Azure Monitor لسجلات الأخطاء
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

### إجراءات التراجع
```bash
# نص برمجي للاسترجاع السريع
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # تبديل البيئة
    azd env select "$environment"
    
    # الاسترجاع باستخدام Git (لا يحتوي AZD على استرجاع مدمج)
    git checkout "$previous_commit"
    azd deploy
    
    # التحقق من الاسترجاع
    echo "Verifying rollback..."
    azd show
    
    # اختبار نقاط النهاية الحرجة
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
    
    # استعلام عن مشكلات الأداء
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
# تجميع السجلات من مصادر أزور متعددة
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

## 🔗 موارد متقدمة

### نصوص تصحيح مخصصة
أنشئ دليلًا `scripts/debug/` يتضمن:
- `health-check.sh` - فحص حالة شامل
- `performance-test.sh` - اختبار أداء آلي
- `log-analyzer.py` - تحليل وسبر سجلات متقدم
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
2. **أنشئ حالات اختبار قابلة لإعادة الإنتاج** للمشكلات
3. **وثق إجراءات التصحيح** لفريقك
4. **قم بأتمتة فحوصات الصحة والمراقبة**
5. **حافظ على تحديث أدوات التصحيح** مع تغييرات تطبيقك
6. **تدرّب على إجراءات التصحيح** أثناء الأوقات غير الطارئة

## الخطوات التالية

- [تخطيط السعة](../chapter-06-pre-deployment/capacity-planning.md) - خطط متطلبات الموارد
- [اختيار SKU](../chapter-06-pre-deployment/sku-selection.md) - اختر مستويات الخدمة المناسبة
- [فحوصات ما قبل النشر](../chapter-06-pre-deployment/preflight-checks.md) - التحقق قبل النشر
- [مذكرة مرجعية](../../resources/cheat-sheet.md) - أوامر مرجعية سريعة

---

**تذكّر**: التصحيح الجيد يعتمد على أن تكون منهجيًا ودقيقًا وصبورًا. ستساعدك هذه الأدوات والتقنيات على تشخيص المشكلات بشكل أسرع وأكثر فعالية.

---

**التنقّل**
- **الدرس السابق**: [مشكلات شائعة](common-issues.md)

- **الدرس التالي**: [تخطيط السعة](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). وعلى الرغم من سعينا للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المرجعي المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. لسنا مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->