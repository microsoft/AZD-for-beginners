# راهنمای اشکال‌زدایی برای استقرارهای AZD

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 7 - عیب‌یابی و اشکال‌زدایی
- **⬅️ قبلی**: [Common Issues](common-issues.md)
- **➡️ بعدی**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 فصل بعد**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## مقدمه

این راهنمای جامع استراتژی‌ها، ابزارها و تکنیک‌های پیشرفته اشکال‌زدایی برای تشخیص و حل مسائل پیچیده در استقرارهای Azure Developer CLI را ارائه می‌دهد. روش‌های سیستماتیک عیب‌یابی، تکنیک‌های تحلیل لاگ، پروفایلینگ عملکرد و ابزارهای تشخیصی پیشرفته را بیاموزید تا مسائل استقرار و زمان اجرا را به‌صورت کارآمد حل کنید.

## اهداف آموزشی

با اتمام این راهنما، شما خواهید توانست:
- تسلط بر روش‌های سیستماتیک اشکال‌زدایی برای مسائل Azure Developer CLI
- درک پیکربندی لاگ‌های پیشرفته و تکنیک‌های تحلیل لاگ
- پیاده‌سازی پروفایلینگ عملکرد و استراتژی‌های پایش
- استفاده مؤثر از ابزارها و سرویس‌های تشخیصی Azure برای حل مسائل پیچیده
- به‌کارگیری تکنیک‌های اشکال‌زدایی شبکه و عیب‌یابی امنیتی
- پیکربندی پایش و هشداردهی جامع برای کشف پیشگیرانه مشکلات

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- به‌کارگیری روش TRIAGE برای اشکال‌زدایی سیستماتیک مسائل پیچیده استقرار
- پیکربندی و تحلیل اطلاعات جامع لاگ و ردیابی
- استفاده مؤثر از Azure Monitor، Application Insights و ابزارهای تشخیصی
- اشکال‌زدایی اتصال شبکه، احراز هویت و مشکلات دسترسی به‌صورت مستقل
- پیاده‌سازی پایش عملکرد و استراتژی‌های بهینه‌سازی
- ایجاد اسکریپت‌ها و اتوماسیون‌های اشکال‌زدایی سفارشی برای مسائل تکرارشونده

## روش‌شناسی اشکال‌زدایی

### رویکرد TRIAGE
- **T**ime: مشکل از کی شروع شد؟
- **R**eproduce: آیا می‌توانید آن را به‌طور مداوم بازتولید کنید؟
- **I**solate: کدام مؤلفه دچار خطا شده است؟
- **A**nalyze: لاگ‌ها چه می‌گویند؟
- **G**ather: تمام اطلاعات مربوطه را جمع‌آوری کنید
- **E**scalate: چه زمانی باید کمک بیشتری بخواهید

## فعال کردن حالت اشکال‌زدایی

### متغیرهای محیطی
```bash
# اشکال‌زدایی جامع را فعال کنید
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# اشکال‌زدایی Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# برای خروجی تمیزتر، تله‌متری را غیرفعال کنید
export AZD_DISABLE_TELEMETRY=true
```

### پیکربندی اشکال‌زدایی
```bash
# پیکربندی اشکال‌زدایی را به‌صورت سراسری تنظیم کنید
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# ثبت لاگ ردیابی را فعال کنید
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 تکنیک‌های تحلیل لاگ

### درک سطوح لاگ
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### تحلیل ساختاریافته لاگ
```bash
# مشاهده لاگ‌ها با Azure Monitor (از طریق azd monitor)
azd monitor --logs

# مشاهده لاگ‌های برنامه در زمان واقعی
azd monitor --live

# برای تحلیل دقیق‌تر لاگ‌ها، از Azure CLI همراه با App Service یا Container App خود استفاده کنید:
# لاگ‌های App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# لاگ‌های Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# لاگ‌های Application Insights را برای تحلیل صادر کنید
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### همبسته‌سازی لاگ‌ها
```bash
#!/bin/bash
# correlate-logs.sh - همبسته‌سازی لاگ‌ها بین سرویس‌ها با استفاده از Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# جستجوی لاگ‌های مرتبط در Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# جستجوی لاگ‌های فعالیت Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ابزارهای پیشرفته اشکال‌زدایی

### پرس‌وجوهای Azure Resource Graph
```bash
# جستجوی منابع بر اساس برچسب‌ها
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# یافتن استقرارهای ناموفق
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# بررسی سلامت منابع
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### اشکال‌زدایی شبکه
```bash
# آزمایش اتصال بین سرویس‌ها
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

# نحوه استفاده
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### اشکال‌زدایی کانتینر
```bash
# عیب‌یابی مشکلات برنامهٔ کانتینری
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

### اشکال‌زدایی اتصال پایگاه‌داده
```bash
# اشکال‌زدایی اتصال به پایگاه‌داده
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

## 🔬 اشکال‌زدایی عملکرد

### پایش عملکرد برنامه
```bash
# فعال‌سازی اشکال‌زدایی Application Insights
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

# پایش عملکرد سفارشی
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

### تحلیل استفاده از منابع
```bash
# نظارت بر استفاده از منابع
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

## 🧪 تست و اعتبارسنجی

### اشکال‌زدایی تست‌های یکپارچه‌سازی
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# تنظیم محیط اشکال‌زدایی
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# دریافت نقاط انتهایی سرویس
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# آزمایش نقاط انتهایی سلامت
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

# اجرای تست‌ها
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# اجرای تست‌های یکپارچه‌سازی سفارشی
npm run test:integration
```

### تست بار برای اشکال‌زدایی
```bash
# تست بار ساده برای شناسایی گلوگاه‌های عملکردی
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # استفاده از Apache Bench (نصب: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # استخراج معیارهای کلیدی
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # بررسی وجود خطاها
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 اشکال‌زدایی زیرساخت

### اشکال‌زدایی قالب‌های Bicep
```bash
# اعتبارسنجی قالب‌های Bicep با خروجی مفصل
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # اعتبارسنجی نحو
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # اعتبارسنجی Lint
    az bicep lint --file "$template_file"
    
    # پیش‌نمایش استقرار (What-If)
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# اشکال‌زدایی استقرار قالب
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

### تحلیل وضعیت منابع
```bash
# وضعیت منابع را برای ناسازگاری‌ها تحلیل کنید
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # تمام منابع را همراه با وضعیت‌شان فهرست کنید
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # وجود منابع شکست‌خورده را بررسی کنید
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

## 🔒 اشکال‌زدایی امنیت

### اشکال‌زدایی جریان احراز هویت
```bash
# اشکال‌زدایی احراز هویت Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # رمزگشایی توکن JWT (نیازمند jq و base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# اشکال‌زدایی دسترسی به Key Vault
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

### اشکال‌زدایی امنیت شبکه
```bash
# عیب‌یابی گروه‌های امنیتی شبکه
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # بررسی قوانین امنیتی
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 اشکال‌زدایی مخصوص برنامه‌ها

### اشکال‌زدایی برنامه‌های Node.js
```javascript
// debug-middleware.js - میان‌افزار اشکال‌زدایی برای Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // ثبت جزئیات درخواست
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json را بازنویسی می‌کند تا پاسخ‌ها را ثبت کند
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### اشکال‌زدایی کوئری‌های پایگاه‌داده
```javascript
// database-debug.js - ابزارهای اشکال‌زدایی پایگاه‌داده
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

## 🚨 رویه‌های اضطراری اشکال‌زدایی

### پاسخ به مسائل تولید
```bash
#!/bin/bash
# emergency-debug.sh - اشکال‌زدایی اضطراری در محیط تولید

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

# به محیط صحیح بروید
azd env select "$ENVIRONMENT"

# اطلاعات حیاتی را جمع‌آوری کنید
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# برای لاگ‌های خطا از Azure Monitor استفاده کنید
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

### رویه‌های بازگردانی (Rollback)
```bash
# اسکریپت بازگردانی سریع
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # تغییر محیط
    azd env select "$environment"
    
    # بازگردانی با استفاده از Git (AZD قابلیت بازگردانی داخلی ندارد)
    git checkout "$previous_commit"
    azd deploy
    
    # تأیید بازگردانی
    echo "Verifying rollback..."
    azd show
    
    # آزمایش نقاط انتهایی حیاتی
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 داشبوردهای اشکال‌زدایی

### داشبورد پایش سفارشی
```bash
# برای اشکال‌زدایی کوئری‌های Application Insights ایجاد کنید
create_debug_queries() {
    local app_insights_name=$1
    
    # کوئری برای خطاها
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # کوئری برای مشکلات عملکرد
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # کوئری برای خطاهای وابستگی
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### تجمیع لاگ‌ها
```bash
# تجمیع لاگ‌ها از چندین منبع آژور
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

## 🔗 منابع پیشرفته

### اسکریپت‌های اشکال‌زدایی سفارشی
Create a `scripts/debug/` directory with:
- `health-check.sh` - بررسی جامع سلامت
- `performance-test.sh` - تست‌های عملکرد خودکار
- `log-analyzer.py` - تجزیه و تحلیل پیشرفته لاگ‌ها
- `resource-validator.sh` - اعتبارسنجی زیرساخت

### یکپارچه‌سازی پایش
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

## بهترین شیوه‌ها

1. **همیشه لاگ‌گیری اشکال‌زدایی را فعال کنید** در محیط‌های غیرتولیدی
2. **نمونه‌های تست قابل بازتولید** برای مسائل ایجاد کنید
3. **روش‌های اشکال‌زدایی را مستندسازی کنید** برای تیم خود
4. **بررسی‌های سلامت و پایش را خودکار کنید**
5. **ابزارهای اشکال‌زدایی را با تغییرات برنامه‌تان به‌روز نگه دارید**
6. **در زمان‌های غیرحادثه‌ای، رویه‌های اشکال‌زدایی را تمرین کنید**

## گام‌های بعدی

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - برنامه‌ریزی نیازهای منابع
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - انتخاب سطح مناسب سرویس
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - اعتبارسنجی پیش از استقرار
- [Cheat Sheet](../../resources/cheat-sheet.md) - دستورات مرجع سریع

---

**به‌خاطر داشته باشید**: اشکال‌زدایی خوب یعنی سیستماتیک، جامع و صبور بودن. این ابزارها و تکنیک‌ها به شما کمک می‌کنند مسائل را سریع‌تر و مؤثرتر تشخیص دهید.

---

**ناوبری**
- **درس قبلی**: [Common Issues](common-issues.md)

- **درس بعدی**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co‑op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند ما در پی دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطا یا نادرستی باشند. نسخهٔ اصلی سند به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس یا حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->