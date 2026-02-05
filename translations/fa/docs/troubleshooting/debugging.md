# راهنمای اشکال‌زدایی برای استقرارهای AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۷ - رفع اشکال و اشکال‌زدایی
- **⬅️ قبلی**: [مشکلات رایج](common-issues.md)
- **➡️ بعدی**: [رفع اشکال مخصوص هوش مصنوعی](ai-troubleshooting.md)
- **🚀 فصل بعدی**: [فصل ۸: الگوهای تولید و سازمانی](../microsoft-foundry/production-ai-practices.md)

## مقدمه

این راهنمای جامع، استراتژی‌ها، ابزارها و تکنیک‌های پیشرفته‌ای را برای تشخیص و رفع مشکلات پیچیده در استقرارهای Azure Developer CLI ارائه می‌دهد. با یادگیری روش‌های سیستماتیک رفع اشکال، تحلیل لاگ‌ها، پروفایل‌سازی عملکرد و ابزارهای تشخیصی پیشرفته، می‌توانید مشکلات استقرار و زمان اجرا را به‌طور مؤثر حل کنید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- روش‌های سیستماتیک رفع اشکال برای مشکلات Azure Developer CLI را یاد خواهید گرفت
- پیکربندی پیشرفته لاگ‌ها و تکنیک‌های تحلیل لاگ را درک خواهید کرد
- استراتژی‌های پروفایل‌سازی و نظارت بر عملکرد را پیاده‌سازی خواهید کرد
- از ابزارها و خدمات تشخیصی Azure برای حل مشکلات پیچیده استفاده خواهید کرد
- تکنیک‌های رفع اشکال شبکه و امنیت را اعمال خواهید کرد
- نظارت و هشدارهای جامع را برای شناسایی پیشگیرانه مشکلات پیکربندی خواهید کرد

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- روش TRIAGE را برای رفع سیستماتیک مشکلات پیچیده استقرار اعمال کنید
- اطلاعات جامع لاگ‌ها و ردیابی‌ها را پیکربندی و تحلیل کنید
- از Azure Monitor، Application Insights و ابزارهای تشخیصی به‌طور مؤثر استفاده کنید
- مشکلات اتصال شبکه، احراز هویت و مجوزها را به‌طور مستقل رفع کنید
- استراتژی‌های نظارت و بهینه‌سازی عملکرد را پیاده‌سازی کنید
- اسکریپت‌های سفارشی رفع اشکال و اتوماسیون برای مشکلات تکراری ایجاد کنید

## روش‌شناسی اشکال‌زدایی

### رویکرد TRIAGE
- **T**ime: مشکل از چه زمانی شروع شد؟
- **R**eproduce: آیا می‌توانید مشکل را به‌طور مداوم بازتولید کنید؟
- **I**solate: کدام مؤلفه دچار مشکل شده است؟
- **A**nalyze: لاگ‌ها چه اطلاعاتی به ما می‌دهند؟
- **G**ather: تمام اطلاعات مرتبط را جمع‌آوری کنید
- **E**scalate: چه زمانی باید کمک بیشتری درخواست کنید؟

## فعال‌سازی حالت اشکال‌زدایی

### متغیرهای محیطی
```bash
# فعال کردن اشکال‌زدایی جامع
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# اشکال‌زدایی CLI آزور
export AZURE_CLI_DIAGNOSTICS=true

# غیرفعال کردن تله‌متری برای خروجی تمیزتر
export AZD_DISABLE_TELEMETRY=true
```

### پیکربندی اشکال‌زدایی
```bash
# تنظیم پیکربندی اشکال‌زدایی به صورت جهانی
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# فعال کردن ثبت گزارش ردیابی
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

### تحلیل ساختاری لاگ
```bash
# فیلتر کردن لاگ‌ها بر اساس سطح
azd logs --level error --since 1h

# فیلتر کردن بر اساس سرویس
azd logs --service api --level debug

# صادر کردن لاگ‌ها برای تحلیل
azd logs --output json > deployment-logs.json

# تجزیه لاگ‌های JSON با jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### همبستگی لاگ‌ها
```bash
#!/bin/bash
# correlate-logs.sh - همبستگی لاگ‌ها در میان سرویس‌ها

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# جستجو در میان تمام سرویس‌ها
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# جستجوی لاگ‌های Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ ابزارهای پیشرفته اشکال‌زدایی

### کوئری‌های Azure Resource Graph
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
# تست اتصال بین سرویس‌ها
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

# استفاده
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### اشکال‌زدایی کانتینر
```bash
# اشکال‌زدایی مشکلات برنامه کانتینر
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

### اشکال‌زدایی اتصال به پایگاه داده
```bash
# اشکال‌زدایی اتصال به پایگاه داده
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

### نظارت بر عملکرد برنامه
```bash
# فعال کردن اشکال‌زدایی Application Insights
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

# نظارت سفارشی بر عملکرد
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

## 🧪 آزمایش و اعتبارسنجی

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

# دریافت نقاط پایانی سرویس
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# آزمایش نقاط پایانی سلامت
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

# اجرای آزمایش‌ها
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# اجرای آزمایش‌های یکپارچه‌سازی سفارشی
npm run test:integration
```

### تست بار برای اشکال‌زدایی
```bash
# تست بار ساده برای شناسایی گلوگاه‌های عملکرد
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
    
    # بررسی خطاها
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 اشکال‌زدایی زیرساخت

### اشکال‌زدایی قالب‌های Bicep
```bash
# اعتبارسنجی قالب‌های Bicep با خروجی دقیق
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # اعتبارسنجی نحو
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # اعتبارسنجی Lint
    az bicep lint --file "$template_file"
    
    # استقرار چه-اگر
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
# تحلیل وضعیت منابع برای ناسازگاری‌ها
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # فهرست کردن تمام منابع با وضعیت‌هایشان
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # بررسی منابعی که شکست خورده‌اند
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
    
    # رمزگشایی توکن JWT (نیاز به jq و base64 دارد)
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
# اشکال‌زدایی گروه‌های امنیتی شبکه
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
// دیباگ-میان‌افزار.js - میان‌افزار دیباگ اکسپرس
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // جزئیات درخواست را ثبت کن
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json را بازنویسی کن تا پاسخ‌ها را ثبت کند
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### اشکال‌زدایی کوئری‌های پایگاه داده
```javascript
// پایگاه‌داده-debug.js - ابزارهای اشکال‌زدایی پایگاه‌داده
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

### پاسخ به مشکلات تولید
```bash
#!/bin/bash
# emergency-debug.sh - اشکال‌زدایی اضطراری تولید

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

# به محیط صحیح تغییر دهید
azd env select "$ENVIRONMENT"

# جمع‌آوری اطلاعات حیاتی
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

### رویه‌های بازگشت به حالت قبل
```bash
# اسکریپت بازگشت سریع
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # تغییر محیط
    azd env select "$environment"
    
    # بازگشت برنامه
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # تأیید بازگشت
    echo "Verifying rollback..."
    azd show
    
    # تست نقاط پایانی حیاتی
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 داشبوردهای اشکال‌زدایی

### داشبورد نظارت سفارشی
```bash
# ایجاد پرس‌وجوهای Application Insights برای اشکال‌زدایی
create_debug_queries() {
    local app_insights_name=$1
    
    # پرس‌وجو برای خطاها
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # پرس‌وجو برای مشکلات عملکرد
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # پرس‌وجو برای شکست‌های وابستگی
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### تجمیع لاگ‌ها
```bash
# جمع‌آوری لاگ‌ها از منابع متعدد
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

## 🔗 منابع پیشرفته

### اسکریپت‌های سفارشی اشکال‌زدایی
یک دایرکتوری `scripts/debug/` با موارد زیر ایجاد کنید:
- `health-check.sh` - بررسی جامع سلامت
- `performance-test.sh` - تست خودکار عملکرد
- `log-analyzer.py` - تجزیه و تحلیل پیشرفته لاگ‌ها
- `resource-validator.sh` - اعتبارسنجی زیرساخت

### یکپارچه‌سازی نظارت
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

1. **همیشه لاگ‌های اشکال‌زدایی را فعال کنید** در محیط‌های غیرتولیدی
2. **موارد تست قابل بازتولید ایجاد کنید** برای مشکلات
3. **رویه‌های اشکال‌زدایی را مستند کنید** برای تیم خود
4. **بررسی‌های سلامت و نظارت را خودکار کنید**
5. **ابزارهای اشکال‌زدایی را به‌روز نگه دارید** با تغییرات برنامه
6. **رویه‌های اشکال‌زدایی را تمرین کنید** در زمان‌های غیرحادثه

## گام‌های بعدی

- [برنامه‌ریزی ظرفیت](../pre-deployment/capacity-planning.md) - برنامه‌ریزی نیازهای منابع
- [انتخاب SKU](../pre-deployment/sku-selection.md) - انتخاب سطوح خدمات مناسب
- [بررسی‌های پیش از استقرار](../pre-deployment/preflight-checks.md) - اعتبارسنجی پیش از استقرار
- [برگه تقلب](../../resources/cheat-sheet.md) - دستورات مرجع سریع

---

**به یاد داشته باشید**: اشکال‌زدایی خوب به معنای سیستماتیک، دقیق و صبور بودن است. این ابزارها و تکنیک‌ها به شما کمک می‌کنند تا مشکلات را سریع‌تر و مؤثرتر تشخیص دهید.

---

**ناوبری**
- **درس قبلی**: [مشکلات رایج](common-issues.md)

- **درس بعدی**: [برنامه‌ریزی ظرفیت](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->