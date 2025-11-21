<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-21T06:45:18+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "el"
}
-->
# Οδηγός Εντοπισμού Σφαλμάτων για Αναπτύξεις AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Εντοπισμός Σφαλμάτων & Διάγνωση
- **⬅️ Προηγούμενο**: [Συνηθισμένα Προβλήματα](common-issues.md)
- **➡️ Επόμενο**: [Εντοπισμός Σφαλμάτων για AI](ai-troubleshooting.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Πρότυπα Παραγωγής & Επιχειρηματικής Κλίμακας](../microsoft-foundry/production-ai-practices.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός παρέχει προηγμένες στρατηγικές εντοπισμού σφαλμάτων, εργαλεία και τεχνικές για τη διάγνωση και την επίλυση σύνθετων προβλημάτων με τις αναπτύξεις του Azure Developer CLI. Μάθετε συστηματικές μεθοδολογίες εντοπισμού σφαλμάτων, τεχνικές ανάλυσης καταγραφών, προφίλ απόδοσης και προηγμένα διαγνωστικά εργαλεία για την αποτελεσματική επίλυση προβλημάτων ανάπτυξης και εκτέλεσης.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατακτήσετε συστηματικές μεθοδολογίες εντοπισμού σφαλμάτων για προβλήματα του Azure Developer CLI
- Κατανοήσετε προηγμένες ρυθμίσεις καταγραφής και τεχνικές ανάλυσης καταγραφών
- Εφαρμόσετε στρατηγικές προφίλ απόδοσης και παρακολούθησης
- Χρησιμοποιήσετε διαγνωστικά εργαλεία και υπηρεσίες του Azure για την επίλυση σύνθετων προβλημάτων
- Εφαρμόσετε τεχνικές εντοπισμού σφαλμάτων δικτύου και ασφάλειας
- Ρυθμίσετε ολοκληρωμένη παρακολούθηση και ειδοποιήσεις για προληπτική ανίχνευση προβλημάτων

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Εφαρμόσετε τη μεθοδολογία TRIAGE για συστηματικό εντοπισμό σύνθετων προβλημάτων ανάπτυξης
- Ρυθμίσετε και αναλύσετε ολοκληρωμένες πληροφορίες καταγραφής και ιχνηλάτησης
- Χρησιμοποιήσετε αποτελεσματικά το Azure Monitor, το Application Insights και διαγνωστικά εργαλεία
- Εντοπίσετε προβλήματα συνδεσιμότητας δικτύου, αυθεντικοποίησης και δικαιωμάτων ανεξάρτητα
- Εφαρμόσετε στρατηγικές παρακολούθησης και βελτιστοποίησης απόδοσης
- Δημιουργήσετε προσαρμοσμένα σενάρια εντοπισμού σφαλμάτων και αυτοματισμούς για επαναλαμβανόμενα προβλήματα

## Μεθοδολογία Εντοπισμού Σφαλμάτων

### Η Προσέγγιση TRIAGE
- **T**ime: Πότε ξεκίνησε το πρόβλημα;
- **R**eproduce: Μπορείτε να το αναπαράγετε σταθερά;
- **I**solate: Ποιο στοιχείο αποτυγχάνει;
- **A**nalyze: Τι μας λένε οι καταγραφές;
- **G**ather: Συλλέξτε όλες τις σχετικές πληροφορίες
- **E**scalate: Πότε να ζητήσετε επιπλέον βοήθεια

## Ενεργοποίηση Λειτουργίας Εντοπισμού Σφαλμάτων

### Μεταβλητές Περιβάλλοντος
```bash
# Ενεργοποίηση εκτεταμένης αποσφαλμάτωσης
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Αποσφαλμάτωση Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Απενεργοποίηση τηλεμετρίας για καθαρότερη έξοδο
export AZD_DISABLE_TELEMETRY=true
```

### Ρύθμιση Εντοπισμού Σφαλμάτων
```bash
# Ορίστε τη διαμόρφωση αποσφαλμάτωσης παγκοσμίως
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Ενεργοποιήστε την καταγραφή ιχνών
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
# Φιλτράρισμα καταγραφών κατά επίπεδο
azd logs --level error --since 1h

# Φιλτράρισμα κατά υπηρεσία
azd logs --service api --level debug

# Εξαγωγή καταγραφών για ανάλυση
azd logs --output json > deployment-logs.json

# Ανάλυση καταγραφών JSON με jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Συσχέτιση Καταγραφών
```bash
#!/bin/bash
# correlate-logs.sh - Συσχέτιση αρχείων καταγραφής μεταξύ υπηρεσιών

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Αναζήτηση σε όλες τις υπηρεσίες
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Αναζήτηση αρχείων καταγραφής Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Προηγμένα Εργαλεία Εντοπισμού Σφαλμάτων

### Ερωτήματα Azure Resource Graph
```bash
# Ερώτημα πόρων ανά ετικέτες
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Εύρεση αποτυχημένων αναπτύξεων
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Έλεγχος υγείας πόρων
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Εντοπισμός Σφαλμάτων Δικτύου
```bash
# Δοκιμή συνδεσιμότητας μεταξύ υπηρεσιών
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

# Χρήση
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Εντοπισμός Σφαλμάτων Κοντέινερ
```bash
# Εντοπισμός σφαλμάτων σε θέματα εφαρμογής κοντέινερ
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
# Εντοπισμός σφαλμάτων στη συνδεσιμότητα της βάσης δεδομένων
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

### Παρακολούθηση Απόδοσης Εφαρμογής
```bash
# Ενεργοποίηση αποσφαλμάτωσης Application Insights
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

# Προσαρμοσμένη παρακολούθηση απόδοσης
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
# Παρακολούθηση της χρήσης πόρων
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

# Ορισμός περιβάλλοντος αποσφαλμάτωσης
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Λήψη τελικών σημείων υπηρεσίας
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Δοκιμή τελικών σημείων υγείας
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

# Εκτέλεση δοκιμών
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Εκτέλεση προσαρμοσμένων δοκιμών ολοκλήρωσης
npm run test:integration
```

### Δοκιμές Φόρτωσης για Εντοπισμό Σφαλμάτων
```bash
# Απλή δοκιμή φόρτωσης για τον εντοπισμό σημείων συμφόρησης απόδοσης
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Χρήση του Apache Bench (εγκατάσταση: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Εξαγωγή βασικών μετρήσεων
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Έλεγχος για αποτυχίες
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Εντοπισμός Σφαλμάτων Υποδομής

### Εντοπισμός Σφαλμάτων Προτύπων Bicep
```bash
# Επικύρωση προτύπων Bicep με λεπτομερή έξοδο
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Επικύρωση σύνταξης
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Επικύρωση lint
    az bicep lint --file "$template_file"
    
    # Τι-αν ανάπτυξη
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Εντοπισμός σφαλμάτων ανάπτυξης προτύπου
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
# Αναλύστε τις καταστάσεις των πόρων για ασυνέπειες
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Καταγράψτε όλους τους πόρους με τις καταστάσεις τους
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Ελέγξτε για αποτυχημένους πόρους
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
# Εντοπισμός σφαλμάτων στην αυθεντικοποίηση Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Αποκωδικοποίηση του JWT token (απαιτεί jq και base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Εντοπισμός σφαλμάτων στην πρόσβαση στο Key Vault
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
# Εντοπισμός σφαλμάτων στις ομάδες ασφαλείας δικτύου
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Έλεγχος κανόνων ασφαλείας
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Εντοπισμός Σφαλμάτων Εφαρμογών

### Εντοπισμός Σφαλμάτων Εφαρμογών Node.js
```javascript
// debug-middleware.js - Express ενδιάμεσο λογισμικό αποσφαλμάτωσης
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Καταγραφή λεπτομερειών αιτήματος
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Παράκαμψη res.json για καταγραφή απαντήσεων
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
// database-debug.js - Εργαλεία αποσφαλμάτωσης βάσης δεδομένων
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
# emergency-debug.sh - Επείγουσα αποσφαλμάτωση παραγωγής

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

# Μετάβαση στο σωστό περιβάλλον
azd env select "$ENVIRONMENT"

# Συλλογή κρίσιμων πληροφοριών
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
# Γρήγορο σενάριο επαναφοράς
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Αλλαγή περιβάλλοντος
    azd env select "$environment"
    
    # Επαναφορά εφαρμογής
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Επαλήθευση επαναφοράς
    echo "Verifying rollback..."
    azd show
    
    # Δοκιμή κρίσιμων σημείων πρόσβασης
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Πίνακες Εντοπισμού Σφαλμάτων

### Προσαρμοσμένος Πίνακας Παρακολούθησης
```bash
# Δημιουργήστε ερωτήματα Application Insights για αποσφαλμάτωση
create_debug_queries() {
    local app_insights_name=$1
    
    # Ερώτημα για σφάλματα
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Ερώτημα για ζητήματα απόδοσης
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Ερώτημα για αποτυχίες εξαρτήσεων
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Συγκέντρωση Καταγραφών
```bash
# Συγκεντρώστε αρχεία καταγραφής από πολλαπλές πηγές
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

## 🔗 Προηγμένοι Πόροι

### Προσαρμοσμένα Σενάρια Εντοπισμού Σφαλμάτων
Δημιουργήστε έναν κατάλογο `scripts/debug/` με:
- `health-check.sh` - Ολοκληρωμένος έλεγχος υγείας
- `performance-test.sh` - Αυτοματοποιημένες δοκιμές απόδοσης
- `log-analyzer.py` - Προηγμένη ανάλυση καταγραφών
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

1. **Ενεργοποιείτε πάντα την καταγραφή εντοπισμού σφαλμάτων** σε περιβάλλοντα εκτός παραγωγής
2. **Δημιουργήστε αναπαραγόμενες περιπτώσεις δοκιμών** για προβλήματα
3. **Τεκμηριώστε τις διαδικασίες εντοπισμού σφαλμάτων** για την ομάδα σας
4. **Αυτοματοποιήστε τους ελέγχους υγείας** και την παρακολούθηση
5. **Διατηρείτε τα εργαλεία εντοπισμού σφαλμάτων ενημερωμένα** με τις αλλαγές της εφαρμογής σας
6. **Εξασκηθείτε στις διαδικασίες εντοπισμού σφαλμάτων** κατά τη διάρκεια μη κρίσιμων περιόδων

## Επόμενα Βήματα

- [Σχεδιασμός Χωρητικότητας](../pre-deployment/capacity-planning.md) - Σχεδιάστε τις απαιτήσεις πόρων
- [Επιλογή SKU](../pre-deployment/sku-selection.md) - Επιλέξτε κατάλληλα επίπεδα υπηρεσιών
- [Έλεγχοι Προετοιμασίας](../pre-deployment/preflight-checks.md) - Επικύρωση πριν την ανάπτυξη
- [Φυλλάδιο Αναφοράς](../../resources/cheat-sheet.md) - Γρήγορες εντολές αναφοράς

---

**Θυμηθείτε**: Ο καλός εντοπισμός σφαλμάτων απαιτεί συστηματικότητα, λεπτομέρεια και υπομονή. Αυτά τα εργαλεία και οι τεχνικές θα σας βοηθήσουν να διαγνώσετε προβλήματα πιο γρήγορα και αποτελεσματικά.

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Συνηθισμένα Προβλήματα](common-issues.md)

- **Επόμενο Μάθημα**: [Σχεδιασμός Χωρητικότητας](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->