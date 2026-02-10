# מדריך לניפוי שגיאות לפריסות AZD

**ניווט פרקים:**
- **📚 בית הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 7 - פתרון בעיות וניפוי שגיאות
- **⬅️ הקודם**: [בעיות נפוצות](common-issues.md)
- **➡️ הבא**: [פתרון בעיות ספציפי ל-AI](ai-troubleshooting.md)
- **🚀 הפרק הבא**: [פרק 8: דפוסי פרודקשן וארגוניים](../chapter-08-production/production-ai-practices.md)

## מבוא

מדריך מקיף זה מספק אסטרטגיות מתקדמות לניפוי שגיאות, כלים וטכניקות לאבחון ופתרון בעיות מורכבות בפריסות באמצעות Azure Developer CLI. למד מתודולוגיות פתרון בעיות שיטתיות, טכניקות לניתוח לוגים, פרופיל ביצועים וכלי אבחון מתקדמים כדי לפתור ביעילות בעיות בזמן פריסה והרצה.

## יעדי למידה

By completing this guide, you will:
- להתמחות במתודולוגיות ניפוי שגיאות שיטתיות לבעיות ב-Azure Developer CLI
- להבין קונפיגורציה מתקדמת של רישום וטכניקות לניתוח לוגים
- להטמיע אסטרטגיות פרופיל ביצועים וניטור
- להשתמש בכלי אבחון ושירותי Azure לפתרון בעיות מורכבות
- ליישם טכניקות ניפוי שגיאות ברשת ובפתרון בעיות אבטחה
- להגדיר ניטור ואיתותים מקיפים לגילוי בעיות באופן יזום

## תוצאות למידה

Upon completion, you will be able to:
- להחיל את מתודולוגיית TRIAGE לניפוי שגיאות שיטתי של בעיות פריסה מורכבות
- להגדיר ולנתח מידע רישום ומעקב מקיף
- להשתמש ב-Azure Monitor, Application Insights וכלי אבחון באופן יעיל
- לפתור באופן עצמאי בעיות חיבור רשת, אימות והרשאות
- להטמיע אסטרטגיות ניטור ביצועים ואופטימיזציה
- ליצור סקריפטים מותאמים לניפוי שגיאות ואוטומציה לבעיות חוזרות

## מתודולוגיית ניפוי שגיאות

### The TRIAGE Approach
- **T**ime: מתי התחילה הבעיה?
- **R**eproduce: האם ניתן לשחזר אותה בעקביות?
- **I**solate: איזה רכיב נכשל?
- **A**nalyze: מה אומרים הלוגים?
- **G**ather: אסוף את כל המידע הרלוונטי
- **E**scalate: מתי לפנות לעזרה נוספת

## הפעלת מצב ניפוי שגיאות

### Environment Variables
```bash
# הפעל ניפוי שגיאות מקיף
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# ניפוי שגיאות של Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# השבת טלמטריה כדי לקבל פלט נקי יותר
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# הגדר את תצורת הדיבוג באופן גלובלי
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# אפשר רישום עקבות
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 טכניקות ניתוח לוגים

### Understanding Log Levels
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Structured Log Analysis
```bash
# הצג לוגים ב-Azure Monitor (באמצעות azd monitor)
azd monitor --logs

# הצג לוגים של היישום בזמן אמת
azd monitor --live

# לניתוח מפורט של לוגים, השתמש ב-Azure CLI עם App Service או Container App שלך:
# לוגים של App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# לוגים של Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ייצא לוגים מ-Application Insights לניתוח
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - התאמת לוגים בין שירותים באמצעות Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# חפש ב-Application Insights לוגים מקושרים
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# חפש ביומני הפעילות של Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ כלים מתקדמים לניפוי שגיאות

### Azure Resource Graph Queries
```bash
# שאילת משאבים לפי תגיות
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# מצא פריסות שנכשלו
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# בדוק את בריאות המשאב
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# בדיקת חיבוריות בין שירותים
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

### Container Debugging
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

### Database Connection Debugging
```bash
# איתור תקלות בחיבור למסד הנתונים
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

### Application Performance Monitoring
```bash
# הפעל דיבוג של Application Insights
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

### Resource Utilization Analysis
```bash
# ניטור שימוש במשאבים
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

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# הגדר סביבת דיבוג
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# קבל נקודות קצה של השירות
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# בדוק נקודות קצה של סטטוס הבריאות
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

# הרץ בדיקות
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# הרץ בדיקות אינטגרציה מותאמות אישית
npm run test:integration
```

### Load Testing for Debugging
```bash
# בדיקת עומס פשוטה לצורך זיהוי צווארי בקבוק בביצועים
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # שימוש ב-Apache Bench (התקנה: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # חילוץ מדדי מפתח
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # בדוק אם יש כישלונות
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 ניפוי שגיאות תשתיתי

### Bicep Template Debugging
```bash
# אמת תבניות Bicep עם פלט מפורט
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # אימות תחביר
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # אימות Lint
    az bicep lint --file "$template_file"
    
    # פריסת What-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ניפוי שגיאות בפריסת התבנית
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

### Resource State Analysis
```bash
# נתח מצבי משאבים לאיתור אי-התאמות
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # הצג את כל המשאבים ואת מצבם
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

### Authentication Flow Debugging
```bash
# איתור שגיאות באימות של Azure
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

# איתור שגיאות בגישה ל-Key Vault
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

### Network Security Debugging
```bash
# ניפוי שגיאות בקבוצות אבטחת הרשת
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # בדוק את כללי האבטחה
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 ניפוי שגיאות ספציפי לאפליקציה

### Node.js Application Debugging
```javascript
// debug-middleware.js - תוכנת ביניים לניפוי שגיאות של Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // רשום את פרטי הבקשה
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // החלף את res.json כדי לרשום את התגובות
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Database Query Debugging
```javascript
// database-debug.js - כלי ניפוי שגיאות של מסד הנתונים
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

### Production Issue Response
```bash
#!/bin/bash
# emergency-debug.sh - ניפוי באגים חירום בייצור

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

# החלף לסביבה הנכונה
azd env select "$ENVIRONMENT"

# אסוף מידע קריטי
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# השתמש ב-Azure Monitor עבור יומני שגיאות
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

### Rollback Procedures
```bash
# סקריפט החזרה מהירה
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # החלף סביבה
    azd env select "$environment"
    
    # החזרה באמצעות Git (ל-AZD אין מנגנון החזרה מובנה)
    git checkout "$previous_commit"
    azd deploy
    
    # וודא את ההחזרה
    echo "Verifying rollback..."
    azd show
    
    # בדוק נקודות קצה קריטיות
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 לוחות מחוונים לניפוי שגיאות

### Custom Monitoring Dashboard
```bash
# צור שאילתות של Application Insights לניפוי באגים
create_debug_queries() {
    local app_insights_name=$1
    
    # שאילתה עבור שגיאות
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # שאילתה לבעיות ביצועים
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # שאילתה לכשלים בתלויות
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# לאגד יומנים ממספר מקורות ב-Azure
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

## 🔗 משאבים מתקדמים

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - בדיקות בריאות מקיפות
- `performance-test.sh` - בדיקות ביצועים אוטומטיות
- `log-analyzer.py` - ניתוח ופרסינג מתקדם של לוגים
- `resource-validator.sh` - אימות תשתית

### Monitoring Integration
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

1. **הפעל תמיד רישום דיבוג** בסביבות שאינן פרודקשן
2. **צור מקרי בדיקה שניתן לשחזר** לבעיות
3. **תעד נהלי ניפוי שגיאות** לצוות שלך
4. **אוטומט בדיקות בריאות** וניטור
5. **שמור על כלי ניפוי השגיאות מעודכנים** בהתאם לשינויים באפליקציה שלך
6. **תתרגל נהלי ניפוי שגיאות** בזמני שגרה

## השלבים הבאים

- [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md) - תכנן דרישות משאבים
- [בחירת SKU](../chapter-06-pre-deployment/sku-selection.md) - בחר רמות שירות מתאימות
- [בדיקות מקדימות](../chapter-06-pre-deployment/preflight-checks.md) - אימות לפני פריסה
- [גיליון עזר](../../resources/cheat-sheet.md) - פקודות לעיון מהיר

---

**זכור**: ניפוי שגיאות טוב הוא עניין של שיטתיות, יסודיות וסבלנות. כלים וטכניקות אלה יעזרו לך לאבחן בעיות מהר יותר וביעילות רבה יותר.

---

**ניווט**
- **שיעור קודם**: [בעיות נפוצות](common-issues.md)

- **השיעור הבא**: [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אי-אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). אף שאנו שואפים לדיוק, שימו לב שתרגומים אוטומטיים עלולים לכלול שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכות. לצורך מידע קריטי מומלץ להסתייע בתרגום מקצועי שבוצע על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->