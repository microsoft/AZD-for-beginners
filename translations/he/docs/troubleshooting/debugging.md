# מדריך ניפוי שגיאות לפריסות AZD

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ קודם**: [בעיות נפוצות](common-issues.md)
- **➡️ הבא**: [פתרון בעיות ספציפיות ל-AI](ai-troubleshooting.md)
- **🚀 פרק הבא**: [פרק 8: דפוסי ייצור וארגונים](../microsoft-foundry/production-ai-practices.md)

## מבוא

מדריך מקיף זה מספק אסטרטגיות מתקדמות לניפוי שגיאות, כלים וטכניקות לאבחון ופתרון בעיות מורכבות בפריסות Azure Developer CLI. תלמדו שיטות ניפוי שגיאות שיטתיות, טכניקות לניתוח לוגים, פרופיל ביצועים וכלים אבחוניים מתקדמים כדי לפתור בעיות בפריסה ובזמן ריצה בצורה יעילה.

## מטרות למידה

עם סיום המדריך, תוכלו:
- לשלוט בשיטות ניפוי שגיאות שיטתיות לבעיות Azure Developer CLI
- להבין תצורת לוגים מתקדמת וטכניקות לניתוח לוגים
- ליישם אסטרטגיות פרופיל ביצועים וניטור
- להשתמש בכלי אבחון ושירותי Azure לפתרון בעיות מורכבות
- ליישם ניפוי שגיאות רשת וטכניקות פתרון בעיות אבטחה
- להגדיר ניטור והתראות מקיפות לזיהוי בעיות באופן יזום

## תוצאות למידה

עם סיום המדריך, תוכלו:
- ליישם את מתודולוגיית TRIAGE לניפוי שגיאות שיטתי של בעיות פריסה מורכבות
- להגדיר ולנתח מידע לוגים ומעקב מקיף
- להשתמש ב-Azure Monitor, Application Insights וכלי אבחון בצורה יעילה
- לנפות בעיות חיבור רשת, אימות והרשאות באופן עצמאי
- ליישם אסטרטגיות לניטור ביצועים ואופטימיזציה
- ליצור סקריפטים מותאמים אישית לניפוי שגיאות ואוטומציה לבעיות חוזרות

## מתודולוגיית ניפוי שגיאות

### גישת TRIAGE
- **T**ime: מתי התחילה הבעיה?
- **R**eproduce: האם ניתן לשחזר אותה באופן עקבי?
- **I**solate: איזה רכיב נכשל?
- **A**nalyze: מה הלוגים מספרים לנו?
- **G**ather: אספו את כל המידע הרלוונטי
- **E**scalate: מתי לפנות לעזרה נוספת

## הפעלת מצב ניפוי שגיאות

### משתני סביבה
```bash
# הפעלת ניפוי שגיאות מקיף
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# ניפוי שגיאות של Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# השבתת טלמטריה לתוצאה נקייה יותר
export AZD_DISABLE_TELEMETRY=true
```

### תצורת ניפוי שגיאות
```bash
# הגדר תצורת ניפוי שגיאות באופן גלובלי
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# הפעל רישום מעקב
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 טכניקות לניתוח לוגים

### הבנת רמות לוגים
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### ניתוח לוגים מובנה
```bash
# סנן יומנים לפי רמה
azd logs --level error --since 1h

# סנן לפי שירות
azd logs --service api --level debug

# ייצא יומנים לניתוח
azd logs --output json > deployment-logs.json

# נתח יומני JSON עם jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### התאמת לוגים
```bash
#!/bin/bash
# correlate-logs.sh - קישור יומנים בין שירותים

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# חיפוש בכל השירותים
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# חיפוש יומנים של Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ כלים מתקדמים לניפוי שגיאות

### שאילתות Azure Resource Graph
```bash
# שאילתא משאבים לפי תגיות
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# מצא פריסות שנכשלו
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# בדוק את בריאות המשאב
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### ניפוי שגיאות רשת
```bash
# בדוק את הקישוריות בין השירותים
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

# שימוש
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### ניפוי שגיאות מכולות
```bash
# ניפוי בעיות באפליקציית מכולה
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

### ניפוי שגיאות חיבור למסד נתונים
```bash
# ניפוי שגיאות בחיבור למסד הנתונים
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

## 🔬 ניפוי שגיאות ביצועים

### ניטור ביצועי אפליקציה
```bash
# הפעלת ניפוי שגיאות של Application Insights
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

# ניטור ביצועים מותאם אישית
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

### ניתוח ניצול משאבים
```bash
# לנטר את השימוש במשאבים
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

## 🧪 בדיקות ואימות

### ניפוי שגיאות בבדיקות אינטגרציה
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# הגדר סביבה לניפוי שגיאות
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# קבל נקודות קצה של שירות
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# בדוק נקודות קצה של בריאות
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

# הפעל בדיקות
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# הפעל בדיקות אינטגרציה מותאמות אישית
npm run test:integration
```

### בדיקות עומס לניפוי שגיאות
```bash
# בדיקת עומס פשוטה לזיהוי צווארי בקבוק בביצועים
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # שימוש ב-Apache Bench (התקנה: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # חילוץ מדדים מרכזיים
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # בדיקת כשלים
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ניפוי שגיאות בתשתית

### ניפוי שגיאות בתבניות Bicep
```bash
# אמת תבניות Bicep עם פלט מפורט
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # אימות תחביר
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # אימות Lint
    az bicep lint --file "$template_file"
    
    # מה-אם פריסה
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ניפוי שגיאות פריסת תבנית
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

### ניתוח מצב משאבים
```bash
# נתח מצבי משאבים לחוסר עקביות
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # רשום את כל המשאבים עם מצביהם
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # בדוק משאבים שנכשלו
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

## 🔒 ניפוי שגיאות אבטחה

### ניפוי שגיאות בזרימת אימות
```bash
# ניפוי שגיאות באימות Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # פענוח אסימון JWT (דורש jq ו-base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# ניפוי שגיאות בגישה ל-Key Vault
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

### ניפוי שגיאות אבטחת רשת
```bash
# ניפוי באגים בקבוצות אבטחת רשת
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # בדיקת חוקי אבטחה
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ניפוי שגיאות ספציפיות לאפליקציה

### ניפוי שגיאות באפליקציות Node.js
```javascript
// debug-middleware.js - אמצעי ביניים לדיבוג ב-Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // רישום פרטי הבקשה
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // החלפת res.json כדי לרשום תגובות
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### ניפוי שגיאות בשאילתות מסד נתונים
```javascript
// כלי ניפוי שגיאות למסד נתונים
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

## 🚨 נהלי ניפוי שגיאות חירום

### תגובה לבעיות בייצור
```bash
#!/bin/bash
# emergency-debug.sh - דיבוג חירום בסביבת ייצור

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

# מעבר לסביבה הנכונה
azd env select "$ENVIRONMENT"

# איסוף מידע קריטי
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

### נהלי החזרה לאחור
```bash
# סקריפט החזרה מהירה
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # החלף סביבה
    azd env select "$environment"
    
    # החזר את היישום
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # אמת את ההחזרה
    echo "Verifying rollback..."
    azd show
    
    # בדוק נקודות קצה קריטיות
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 לוחות מחוונים לניפוי שגיאות

### לוח ניטור מותאם אישית
```bash
# צור שאילתות Application Insights לצורך ניפוי שגיאות
create_debug_queries() {
    local app_insights_name=$1
    
    # שאילתה לשגיאות
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # שאילתה לבעיות ביצועים
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # שאילתה לכשלי תלות
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### איגוד לוגים
```bash
# לאסוף יומנים ממקורות מרובים
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

## 🔗 משאבים מתקדמים

### סקריפטים מותאמים אישית לניפוי שגיאות
צרו תיקיית `scripts/debug/` עם:
- `health-check.sh` - בדיקת בריאות מקיפה
- `performance-test.sh` - בדיקות ביצועים אוטומטיות
- `log-analyzer.py` - ניתוח לוגים מתקדם
- `resource-validator.sh` - אימות תשתית

### אינטגרציית ניטור
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

## שיטות עבודה מומלצות

1. **תמיד הפעילו לוגים לניפוי שגיאות** בסביבות שאינן ייצור
2. **צרו מקרי בדיקה שניתן לשחזר** לבעיות
3. **תעדו נהלי ניפוי שגיאות** עבור הצוות שלכם
4. **אוטומטו בדיקות בריאות** וניטור
5. **שמרו על כלים לניפוי שגיאות מעודכנים** עם שינויים באפליקציה שלכם
6. **תרגלו נהלי ניפוי שגיאות** בזמנים שאינם אירועי חירום

## צעדים הבאים

- [תכנון קיבולת](../pre-deployment/capacity-planning.md) - תכננו דרישות משאבים
- [בחירת SKU](../pre-deployment/sku-selection.md) - בחרו רמות שירות מתאימות
- [בדיקות מקדימות](../pre-deployment/preflight-checks.md) - אימות לפני פריסה
- [דף עזר](../../resources/cheat-sheet.md) - פקודות עזר מהירות

---

**זכרו**: ניפוי שגיאות טוב הוא להיות שיטתי, יסודי וסבלני. הכלים והטכניקות הללו יעזרו לכם לאבחן בעיות מהר וביעילות רבה יותר.

---

**ניווט**
- **שיעור קודם**: [בעיות נפוצות](common-issues.md)

- **שיעור הבא**: [תכנון קיבולת](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו נושאים באחריות לאי הבנות או פירושים שגויים הנובעים משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->