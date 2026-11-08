# Οδηγός Αποσφαλμάτωσης για Αναπτύξεις AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Επίλυση Προβλημάτων & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Συνηθισμένα Προβλήματα](common-issues.md)
- **➡️ Επόμενο**: [Επίλυση Προβλημάτων Ειδικών για AI](ai-troubleshooting.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Παραγωγικά & Επιχειρησιακά Πρότυπα](../chapter-08-production/production-ai-practices.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός παρέχει προηγμένες στρατηγικές αποσφαλμάτωσης, εργαλεία και τεχνικές για τη διάγνωση και επίλυση σύνθετων ζητημάτων με αναπτύξεις Azure Developer CLI. Μάθετε συστηματικές μεθοδολογίες επίλυσης προβλημάτων, τεχνικές ανάλυσης καταγραφών, προφίλ επιδόσεων και προχωρημένα διαγνωστικά εργαλεία για να επιλύετε αποδοτικά προβλήματα ανάπτυξης και χρόνου εκτέλεσης.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό, θα:
- Κυριαρχήσετε σε συστηματικές μεθόδους αποσφαλμάτωσης για ζητήματα Azure Developer CLI
- Κατανοήσετε προηγμένη ρύθμιση καταγραφής και τεχνικές ανάλυσης καταγραφών
- Υλοποιήσετε προφίλ επιδόσεων και στρατηγικές παρακολούθησης
- Χρησιμοποιήσετε τα διαγνωστικά εργαλεία και υπηρεσίες Azure για επίλυση σύνθετων προβλημάτων
- Εφαρμόσετε τεχνικές αποσφαλμάτωσης δικτύου και ανάλυσης ασφάλειας
- Ρυθμίσετε ολοκληρωμένη παρακολούθηση και ειδοποιήσεις για προληπτική ανίχνευση προβλημάτων

## Αναμενόμενα Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα είστε σε θέση να:
- Εφαρμόσετε τη μεθοδολογία TRIAGE για συστηματική αποσφαλμάτωση σύνθετων ζητημάτων ανάπτυξης
- Ρυθμίσετε και αναλύσετε ολοκληρωμένες πληροφορίες καταγραφής και ιχνηλάτησης
- Χρησιμοποιήσετε αποτελεσματικά Azure Monitor, Application Insights και διαγνωστικά εργαλεία
- Αποσφαλματώσετε ζητήματα σύνδεσης δικτύου, ταυτοποίησης και αδειών ανεξάρτητα
- Υλοποιήσετε στρατηγικές παρακολούθησης και βελτιστοποίησης επιδόσεων
- Δημιουργήσετε προσαρμοσμένα σενάρια αποσφαλμάτωσης και αυτοματοποίηση για επαναλαμβανόμενα ζητήματα

## Μεθοδολογία Αποσφαλμάτωσης

### Η Προσέγγιση TRIAGE
- **T**ime (Χρόνος): Πότε ξεκίνησε το πρόβλημα;
- **R**eproduce (Αναπαραγωγή): Μπορείτε να το αναπαράγετε σταθερά;
- **I**solate (Απομόνωση): Ποιο στοιχείο αποτυγχάνει;
- **A**nalyze (Ανάλυση): Τι μας λένε οι καταγραφές;
- **G**ather (Συλλογή): Συλλέξτε όλες τις σχετικές πληροφορίες
- **E**scalate (Αναβάθμιση): Πότε να ζητήσετε επιπλέον βοήθεια

## Ενεργοποίηση Λειτουργίας Αποσφαλμάτωσης

> **Πεδίο Εφαρμογής:** Αυτά είναι παραδείγματα διαγνωστικών για να προσαρμόσετε, όχι ένα πακέτο παρεχόμενων σεναρίων. Αντικαταστήστε ονόματα/ID πόρων· χρησιμοποιήστε Bash για μπλοκ κελύφους. Οι έξοδοι `--debug` και οι τιμές περιβάλλοντος μπορεί να περιέχουν ευαίσθητες πληροφορίες—ελέγξτε/απομακρύνετε πριν μοιραστείτε. Παραδείγματα που αναπτύσσουν, επιστρέφουν ή αλλάζουν ρυθμίσεις απαιτούν ρητή έγκριση χειριστή.

### Μεταβλητές Περιβάλλοντος
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### Ρύθμιση Αποσφαλμάτωσης
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` μπορεί να αποθηκεύσει αυθαίρετα κλειδιά· αυτό δεν καθιστά τις `debug.enabled`, `debug.logLevel`, ή `trace.outputPath` υποστηριζόμενες ρυθμίσεις. Χρησιμοποιήστε τη σημαία `--debug` της κυκλοφορημένης εντολής.

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
# View logs with Azure Monitor (via azd monitor)
azd monitor --logs

# Open Application Insights Live Metrics (not a terminal log stream)
azd monitor --live

# For detailed log analysis, use Azure CLI with your App Service or Container App:
# App Service logs
az webapp log tail --name "$APP_NAME" --resource-group "$RG_NAME"

# Container App logs
az containerapp logs show --name "$APP_NAME" --resource-group "$RG_NAME" --follow

# Export Application Insights logs for analysis
az monitor app-insights query \
    --app "$APPI_NAME" \
    --resource-group "$RG_NAME" \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Συσχέτιση Καταγραφών
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services using Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_ID=$2 # Application ID (GUID), not an ambiguous component name

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_ID" ]; then
    echo "Usage: $0 <trace-id> <application-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search Application Insights for correlated logs
az monitor app-insights query \
    --app "$APP_INSIGHTS_ID" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Activity Log correlation IDs describe management operations and are not the
# same as application trace IDs. Obtain them from the failed ARM operation.
```

## 🛠️ Προχωρημένα Εργαλεία Αποσφαλμάτωσης

### Ερωτήματα Azure Resource Graph
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Αποσφαλμάτωση Δικτύου
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
# Source must be a supported Network Watcher source, e.g. a configured VM ID.
test_connectivity "/subscriptions/.../providers/Microsoft.Compute/virtualMachines/myvm" "myapp-api.azurewebsites.net" 443
```

### Αποσφαλμάτωση Κοντέινερ
```bash
# Debug container app issues
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningStatus:runningStatus}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### Αποσφαλμάτωση Σύνδεσης Βάσης Δεδομένων
```bash
# Debug database connectivity
debug_database() {
    local db_server=$1
    local resource_group=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 Αποσφαλμάτωση Επιδόσεων

### Παρακολούθηση Απόδοσης Εφαρμογής
```bash
# SDK settings are language-specific. For Python OpenTelemetry role naming,
# set before configuring the Azure Monitor distro:
export OTEL_SERVICE_NAME=myapp-debug

# Custom performance monitoring
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        # Capture status and duration from the SAME bounded request.
        measurement=$(curl --max-time 10 -o /dev/null -s -w "%{http_code},%{time_total}" "$endpoint") || return 1
        status_code=${measurement%,*}
        response_time=${measurement#*,}
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### Ανάλυση Χρήσης Πόρων
```bash
# Monitor resource usage
monitor_resources() {
    local plan_id=$1 # Full Microsoft.Web/serverfarms resource ID
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource "$plan_id" \
        --metrics "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource "$plan_id" \
        --metrics "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 Δοκιμές και Επικύρωση

### Αποσφαλμάτωση Δοκιμών Ενσωμάτωσης
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG='app:*'
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl // .services.web.ingresUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl // .services.api.ingresUrl')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl --max-time 10 -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
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

### Δοκιμή Φορτίου για Αποσφαλμάτωση
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

## 🔧 Αποσφαλμάτωση Υποδομής

### Αποσφαλμάτωση Προτύπων Bicep
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # From the initialized project: azd resolves its parameter substitutions
    # and deployment scope. Review hooks before provisioning preview.
    azd provision --preview
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
    
    # Generic list responses often omit properties/provisioningState.
    # Null is unknown, not failure; inspect the service-specific show command
    # and deployment operations for the affected resource.
    az deployment group list --resource-group "$resource_group" \
        --query "[].{name:name,state:properties.provisioningState}" -o table
}
```

## 🔒 Αποσφαλμάτωση Ασφαλείας

### Αποσφαλμάτωση Ροής Ταυτοποίησης
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    # Do not print/decode bearer tokens into logs.
    az account get-access-token --query "{expiresOn:expiresOn,tenant:tenant,subscription:subscription}" -o json
    
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

### Αποσφαλμάτωση Ασφάλειας Δικτύου
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

## 📱 Αποσφαλμάτωση Εφαρμογών Ειδικού Τύπου

### Αποσφαλμάτωση Εφαρμογής Node.js
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        // Do not log authorization headers, bodies, query strings, or client IPs.
        route: req.route?.path || '(unmatched)'
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Αποσφαλμάτωση Ερωτημάτων Βάσης Δεδομένων
```javascript
// database-debug.js - Database debugging utilities
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        // Promise-based query(text, params) demo only; not a drop-in replacement
        // for node-postgres callback/streaming overloads. Avoid query parameters.
        debug('Executing query');
        
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

## 🚨 Διαδικασίες Έκτακτης Αποσφαλμάτωσης

### Ανταπόκριση σε Ζητήματα Παραγωγής
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
cat emergency-status.json | jq '.services[] | .ingressUrl // .ingresUrl'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[] | (.ingressUrl // .ingresUrl // empty)'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Use Azure Monitor for error logs
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

echo "=== 4. Resource Status ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState == 'Failed']" > failed-resources.json

if jq -e 'length > 0' failed-resources.json >/dev/null; then
    echo "❌ Failed group deployments found (inspect subscription deployments too)!"
    cat failed-resources.json
else
    echo "No failed group deployment records found; resource health is not established."
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### Διαδικασίες Επαναφοράς
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback using Git (AZD doesn't have built-in rollback)
    git checkout "$previous_commit"
    azd deploy || return 1
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl // .services.web.ingresUrl') || return 1
    curl --max-time 10 -f "$WEB_URL/health" || { echo "❌ Rollback verification failed"; return 1; }
    
    echo "✅ Rollback completed"
}
```

Αυτή η επαναφορά μόνο κώδικα δεν αναιρεί υποδομή, μεταναστεύσεις βάσης δεδομένων ή μυστικά. Χρησιμοποιήστε ένα καθαρό worktree, καταγράψτε το αρχικό commit και επαναφέρετέ το μετά· η εντολή κάνει checkout το επιλεγμένο commit στο τρέχον αποθετήριο.

## 📊 Πίνακες Ελέγχου Αποσφαλμάτωσης

### Προσαρμοσμένος Πίνακας Παρακολούθησης
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1 # Use the Application ID GUID to avoid name ambiguity
    
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
# Aggregate logs from multiple Azure sources
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1 # Application ID GUID
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '[{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
        echo ']'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Προχωρημένοι Πόροι

### Προσαρμοσμένα Σενάρια Αποσφαλμάτωσης
Δημιουργήστε έναν κατάλογο `scripts/debug/` με:
- `health-check.sh` - Ολοκληρωμένος έλεγχος υγείας
- `performance-test.sh` - Αυτοματοποιημένες δοκιμές επιδόσεων
- `log-analyzer.py` - Προχωρημένη ανάλυση και επεξεργασία καταγραφών
- `resource-validator.sh` - Επικύρωση υποδομής

### Ενσωμάτωση Παρακολούθησης
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      set -e
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## Καλές Πρακτικές

1. **Ενεργοποιείτε πάντα την καταγραφή αποσφαλμάτωσης** σε μη παραγωγικά περιβάλλοντα
2. **Δημιουργείτε αναπαραγώγιμες δοκιμαστικές περιπτώσεις** για προβλήματα
3. **Τεκμηριώνετε τις διαδικασίες αποσφαλμάτωσης** για την ομάδα σας
4. **Αυτοματοποιείτε τους ελέγχους υγείας** και την παρακολούθηση
5. **Κρατάτε ενημερωμένα τα εργαλεία αποσφαλμάτωσης** με τις αλλαγές της εφαρμογής σας
6. **Εξασκείτε τις διαδικασίες αποσφαλμάτωσης** σε περιόδους μη συμβάντων

## Επόμενα Βήματα

- [Σχεδιασμός Χωρητικότητας](../chapter-06-pre-deployment/capacity-planning.md) - Σχεδιάστε τις απαιτήσεις πόρων
- [Επιλογή SKU](../chapter-06-pre-deployment/sku-selection.md) - Επιλέξτε κατάλληλα επίπεδα υπηρεσιών
- [Έλεγχοι Προ-πτήσης](../chapter-06-pre-deployment/preflight-checks.md) - Επικύρωση πριν την ανάπτυξη
- [Φύλλο Αναφοράς](../../resources/cheat-sheet.md) - Γρήγορες εντολές αναφοράς

---

**Να θυμάστε**: Η καλή αποσφαλμάτωση βασίζεται στην συστηματικότητα, την ακρίβεια και την υπομονή. Αυτά τα εργαλεία και τεχνικές θα σας βοηθήσουν να διαγνώσετε ζητήματα πιο γρήγορα και αποτελεσματικά.

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Συνηθισμένα Προβλήματα](common-issues.md)

- **Επόμενο Μάθημα**: [Σχεδιασμός Χωρητικότητας](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->