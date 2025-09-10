<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5066dbb0b4f24e493697f6430505b115",
  "translation_date": "2025-09-09T21:49:34+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "el"
}
-->
# Οδηγός Εντοπισμού Σφαλμάτων - Προχωρημένες Τεχνικές Αντιμετώπισης Προβλημάτων

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός παρέχει προχωρημένες στρατηγικές εντοπισμού σφαλμάτων, εργαλεία και τεχνικές για τη διάγνωση και την επίλυση σύνθετων προβλημάτων με τις αναπτύξεις του Azure Developer CLI. Μάθετε συστηματικές μεθοδολογίες αντιμετώπισης προβλημάτων, τεχνικές ανάλυσης καταγραφών, προφίλ απόδοσης και προχωρημένα εργαλεία διάγνωσης για την αποτελεσματική επίλυση προβλημάτων ανάπτυξης και εκτέλεσης.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατακτήσετε συστηματικές μεθοδολογίες εντοπισμού σφαλμάτων για προβλήματα του Azure Developer CLI
- Κατανοήσετε προχωρημένες ρυθμίσεις καταγραφής και τεχνικές ανάλυσης καταγραφών
- Εφαρμόσετε στρατηγικές προφίλ απόδοσης και παρακολούθησης
- Χρησιμοποιήσετε εργαλεία και υπηρεσίες διάγνωσης του Azure για την επίλυση σύνθετων προβλημάτων
- Εφαρμόσετε τεχνικές εντοπισμού προβλημάτων δικτύου και ασφάλειας
- Ρυθμίσετε ολοκληρωμένη παρακολούθηση και ειδοποιήσεις για την προληπτική ανίχνευση προβλημάτων

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Εφαρμόσετε τη μεθοδολογία TRIAGE για τη συστηματική αντιμετώπιση σύνθετων προβλημάτων ανάπτυξης
- Ρυθμίσετε και αναλύσετε ολοκληρωμένες πληροφορίες καταγραφής και ιχνηλάτησης
- Χρησιμοποιήσετε αποτελεσματικά το Azure Monitor, το Application Insights και εργαλεία διάγνωσης
- Εντοπίσετε προβλήματα συνδεσιμότητας δικτύου, αυθεντικοποίησης και δικαιωμάτων ανεξάρτητα
- Εφαρμόσετε στρατηγικές παρακολούθησης και βελτιστοποίησης απόδοσης
- Δημιουργήσετε προσαρμοσμένα σενάρια εντοπισμού σφαλμάτων και αυτοματισμούς για επαναλαμβανόμενα προβλήματα

## Μεθοδολογία Εντοπισμού Σφαλμάτων

### Η Προσέγγιση TRIAGE
- **T**ime: Πότε ξεκίνησε το πρόβλημα;
- **R**eproduce: Μπορείτε να το αναπαράγετε με συνέπεια;
- **I**solate: Ποιο στοιχείο αποτυγχάνει;
- **A**nalyze: Τι μας λένε οι καταγραφές;
- **G**ather: Συλλέξτε όλες τις σχετικές πληροφορίες
- **E**scalate: Πότε να ζητήσετε επιπλέον βοήθεια

## Ενεργοποίηση Λειτουργίας Εντοπισμού Σφαλμάτων

### Μεταβλητές Περιβάλλοντος
```bash
# Enable comprehensive debugging
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI debugging
export AZURE_CLI_DIAGNOSTICS=true

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### Ρύθμιση Εντοπισμού Σφαλμάτων
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Τεχνικές Ανάλυσης Καταγραφών

### Κατανόηση Επιπέδων Καταγραφής
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Δομημένη Ανάλυση Καταγραφών
```bash
# Filter logs by level
azd logs --level error --since 1h

# Filter by service
azd logs --service api --level debug

# Export logs for analysis
azd logs --output json > deployment-logs.json

# Parse JSON logs with jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Συσχέτιση Καταγραφών
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search across all services
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Search Azure logs
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Προχωρημένα Εργαλεία Εντοπισμού Σφαλμάτων

### Ερωτήματα Azure Resource Graph
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Εντοπισμός Σφαλμάτων Δικτύου
```bash
# Test connectivity between services
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

# Usage
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Εντοπισμός Σφαλμάτων Containers
```bash
# Debug container app issues
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

### Εντοπισμός Σφαλμάτων Σύνδεσης Βάσης Δεδομένων
```bash
# Debug database connectivity
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

## 🔬 Εντοπισμός Σφαλμάτων Απόδοσης

### Παρακολούθηση Απόδοσης Εφαρμογών
```bash
# Enable Application Insights debugging
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

# Custom performance monitoring
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

### Ανάλυση Χρήσης Πόρων
```bash
# Monitor resource usage
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

## 🧪 Δοκιμές και Επικύρωση

### Εντοπισμός Σφαλμάτων Δοκιμών Ενσωμάτωσης
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
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

# Run tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run custom integration tests
npm run test:integration
```

### Δοκιμές Φόρτωσης για Εντοπισμό Σφαλμάτων
```bash
# Simple load test to identify performance bottlenecks
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Using Apache Bench (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extract key metrics
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Check for failures
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Εντοπισμός Σφαλμάτων Υποδομής

### Εντοπισμός Σφαλμάτων Προτύπων Bicep
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # What-if deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug template deployment
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

### Ανάλυση Κατάστασης Πόρων
```bash
# Analyze resource states for inconsistencies
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources with their states
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Check for failed resources
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

## 🔒 Εντοπισμός Σφαλμάτων Ασφάλειας

### Εντοπισμός Σφαλμάτων Ροής Αυθεντικοποίησης
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT token (requires jq and base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug Key Vault access
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

### Εντοπισμός Σφαλμάτων Ασφάλειας Δικτύου
```bash
# Debug network security groups
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Check security rules
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Εντοπισμός Σφαλμάτων Ειδικών Εφαρμογών

### Εντοπισμός Σφαλμάτων Εφαρμογών Node.js
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Εντοπισμός Σφαλμάτων Ερωτημάτων Βάσης Δεδομένων
```javascript
// database-debug.js - Database debugging utilities
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

## 🚨 Διαδικασίες Εντοπισμού Σφαλμάτων Έκτακτης Ανάγκης

### Αντιμετώπιση Προβλημάτων Παραγωγής
```bash
#!/bin/bash
# emergency-debug.sh - Emergency production debugging

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

# Switch to correct environment
azd env select "$ENVIRONMENT"

# Collect critical information
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

### Διαδικασίες Επαναφοράς
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback application
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Πίνακες Εντοπισμού Σφαλμάτων

### Προσαρμοσμένος Πίνακας Παρακολούθησης
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1
    
    # Query for errors
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query for performance issues
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query for dependency failures
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Συγκέντρωση Καταγραφών
```bash
# Aggregate logs from multiple sources
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

## 🔗 Προχωρημένοι Πόροι

### Προσαρμοσμένα Σενάρια Εντοπισμού Σφαλμάτων
Δημιουργήστε έναν κατάλογο `scripts/debug/` με:
- `health-check.sh` - Ολοκληρωμένος έλεγχος υγείας
- `performance-test.sh` - Αυτοματοποιημένες δοκιμές απόδοσης
- `log-analyzer.py` - Προχωρημένη ανάλυση καταγραφών
- `resource-validator.sh` - Επικύρωση υποδομής

### Ενσωμάτωση Παρακολούθησης
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

## Βέλτιστες Πρακτικές

1. **Ενεργοποιήστε πάντα την καταγραφή εντοπισμού σφαλμάτων** σε περιβάλλοντα εκτός παραγωγής
2. **Δημιουργήστε αναπαραγόμενες περιπτώσεις δοκιμών** για προβλήματα
3. **Τεκμηριώστε τις διαδικασίες εντοπισμού σφαλμάτων** για την ομάδα σας
4. **Αυτοματοποιήστε τους ελέγχους υγείας** και την παρακολούθηση
5. **Διατηρήστε τα εργαλεία εντοπισμού σφαλμάτων ενημερωμένα** με τις αλλαγές της εφαρμογής σας
6. **Εξασκηθείτε στις διαδικασίες εντοπισμού σφαλμάτων** κατά τη διάρκεια μη κρίσιμων περιόδων

## Επόμενα Βήματα

- [Σχεδιασμός Χωρητικότητας](../pre-deployment/capacity-planning.md) - Σχεδιάστε τις απαιτήσεις πόρων
- [Επιλογή SKU](../pre-deployment/sku-selection.md) - Επιλέξτε κατάλληλα επίπεδα υπηρεσιών
- [Έλεγχοι Προετοιμασίας](../pre-deployment/preflight-checks.md) - Επικύρωση πριν την ανάπτυξη
- [Σύντομος Οδηγός](../../resources/cheat-sheet.md) - Γρήγορες εντολές αναφοράς

---

**Θυμηθείτε**: Ο καλός εντοπισμός σφαλμάτων απαιτεί συστηματικότητα, λεπτομέρεια και υπομονή. Αυτά τα εργαλεία και οι τεχνικές θα σας βοηθήσουν να διαγνώσετε προβλήματα πιο γρήγορα και αποτελεσματικά.

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Συνηθισμένα Προβλήματα](common-issues.md)
- **Επόμενο Μάθημα**: [Σχεδιασμός Χωρητικότητας](../pre-deployment/capacity-planning.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.