# Panduan Pengesan Ralat untuk Pelaksanaan AZD

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Pengesan Ralat
- **⬅️ Sebelumnya**: [Masalah Biasa](common-issues.md)
- **➡️ Seterusnya**: [Penyelesaian Masalah Khusus AI](ai-troubleshooting.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Produksi & Korporat](../chapter-08-production/production-ai-practices.md)

## Pengenalan

Panduan komprehensif ini menyediakan strategi, alat, dan teknik pengesan ralat lanjutan untuk mendiagnosis dan menyelesaikan isu kompleks dengan pelaksanaan Azure Developer CLI. Pelajari metodologi penyelesaian masalah sistematik, teknik analisis log, profil prestasi, dan alat diagnostik lanjutan untuk menyelesaikan isu pelaksanaan dan waktu jalan dengan berkesan.

## Matlamat Pembelajaran

Dengan menamatkan panduan ini, anda akan:
- Menguasai metodologi pengesan ralat sistematik untuk isu Azure Developer CLI
- Memahami konfigurasi log lanjutan dan teknik analisis log
- Melaksanakan strategi profil dan pemantauan prestasi
- Menggunakan alat dan perkhidmatan diagnostik Azure untuk penyelesaian masalah kompleks
- Mengaplikasikan teknik pengesan ralat rangkaian dan penyelesaian masalah keselamatan
- Menyediakan pemantauan dan amaran komprehensif untuk pengesanan isu secara proaktif

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Mengaplikasikan metodologi TRIAGE untuk mengesan ralat isu pelaksanaan kompleks secara sistematik
- Mengkonfigur dan menganalisis maklumat log dan penjejakan komprehensif
- Menggunakan Azure Monitor, Application Insights, dan alat diagnostik dengan berkesan
- Mengesan ralat sambungan rangkaian, pengesahan, dan kebenaran secara berdikari
- Melaksanakan strategi pemantauan dan pengoptimuman prestasi
- Mewujudkan skrip pengesan ralat dan automasi khusus untuk isu berulang

## Metodologi Pengesan Ralat

### Pendekatan TRIAGE
- **T**ime: Bila isu bermula?
- **R**eproduce: Bolehkah anda hasilkannya secara konsisten?
- **I**solate: Komponen mana yang gagal?
- **A**nalyze: Apa yang dimaklumkan oleh log?
- **G**ather: Kumpulkan semua maklumat berkaitan
- **E**scalate: Bila untuk mendapatkan bantuan tambahan

## Mengaktifkan Mod Debug

> **Lingkup:** Ini adalah contoh diagnostik untuk diubah suai, bukan satu set skrip yang dibekalkan. Gantikan nama/ID sumber; gunakan Bash untuk blok shell. Output `--debug` dan nilai persekitaran boleh mengandungi maklumat sensitif—semak/sunting sebelum berkongsi. Contoh yang melaksanakan, rollback, atau mengubah konfigurasi memerlukan kelulusan operasi secara eksplisit.

### Pembolehubah Persekitaran
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### Konfigurasi Debug
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` boleh menyimpan kekunci sewenang-wenangnya; itu tidak menjadikan `debug.enabled`, `debug.logLevel`, atau `trace.outputPath` tetapan yang disokong. Gunakan bendera `--debug` pada arahan yang dikeluarkan.

## 📊 Teknik Analisis Log

### Memahami Tahap Log
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Analisis Log Berstruktur
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

### Korelasi Log
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

## 🛠️ Alat Pengesan Ralat Lanjutan

### Pertanyaan Azure Resource Graph
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Pengesan Ralat Rangkaian
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

### Pengesan Ralat Kontena
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

### Pengesan Ralat Sambungan Pangkalan Data
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

## 🔬 Pengesan Ralat Prestasi

### Pemantauan Prestasi Aplikasi
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

### Analisis Penggunaan Sumber
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

## 🧪 Ujian dan Pengesahan

### Pengesan Ralat Ujian Integrasi
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

### Ujian Beban untuk Pengesan Ralat
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

## 🔧 Pengesan Ralat Infrastruktur

### Pengesan Ralat Templat Bicep
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

### Analisis Keadaan Sumber
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

## 🔒 Pengesan Ralat Keselamatan

### Pengesan Ralat Aliran Pengesahan
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

### Pengesan Ralat Keselamatan Rangkaian
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

## 📱 Pengesan Ralat Khusus Aplikasi

### Pengesan Ralat Aplikasi Node.js
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

### Pengesan Ralat Pertanyaan Pangkalan Data
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

## 🚨 Prosedur Pengesan Ralat Kecemasan

### Tindak Balas Isu Produksi
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

### Prosedur Rollback
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

Rollback hanya kod ini tidak mengembalikan infrastruktur, migrasi pangkalan data, atau rahsia. Gunakan worktree bersih, rekod commit permulaan, dan pulihkan selepasnya; arahan ini akan checkout commit yang dipilih dalam repositori semasa.

## 📊 Papan Pemuka Pengesan Ralat

### Papan Pemuka Pemantauan Tersuai
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

### Pengumpulan Log
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

## 🔗 Sumber Lanjutan

### Skrip Debug Tersuai
Cipta direktori `scripts/debug/` dengan:
- `health-check.sh` - Pemeriksaan kesihatan komprehensif
- `performance-test.sh` - Ujian prestasi automatik
- `log-analyzer.py` - Penguraian dan analisis log lanjutan
- `resource-validator.sh` - Pengesahan infrastruktur

### Integrasi Pemantauan
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

## Amalan Terbaik

1. **Sentiasa aktifkan logging debug** dalam persekitaran bukan produksi
2. **Cipta kes ujian yang boleh dihasilkan semula** untuk isu
3. **Dokumentasikan prosedur pengesan ralat** untuk pasukan anda
4. **Automatiskan pemeriksaan kesihatan** dan pemantauan
5. **Kekalkan alat debug dikemas kini** seiring perubahan aplikasi anda
6. **Amalkan prosedur pengesan ralat** semasa waktu bukan insiden

## Langkah Seterusnya

- [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md) - Rancang keperluan sumber
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Pilih tier perkhidmatan yang sesuai
- [Pemeriksaan Preflight](../chapter-06-pre-deployment/preflight-checks.md) - Pengesahan pra-pelaksanaan
- [Lembaran Cheat](../../resources/cheat-sheet.md) - Perintah rujukan cepat

---

**Ingat**: Pengesan ralat yang baik adalah sistematik, teliti, dan sabar. Alat dan teknik ini akan membantu anda mendiagnosis isu dengan lebih cepat dan berkesan.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Masalah Biasa](common-issues.md)

- **Pelajaran Seterusnya**: [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->