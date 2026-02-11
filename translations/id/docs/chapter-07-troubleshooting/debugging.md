# Panduan Debugging untuk Penerapan AZD

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Sebelumnya**: [Masalah Umum](common-issues.md)
- **➡️ Berikutnya**: [Pemecahan Masalah Khusus AI](ai-troubleshooting.md)
- **🚀 Bab Berikutnya**: [Bab 8: Pola Produksi & Perusahaan](../chapter-08-production/production-ai-practices.md)

## Pendahuluan

Panduan komprehensif ini menyediakan strategi debugging tingkat lanjut, alat, dan teknik untuk mendiagnosis serta menyelesaikan masalah kompleks pada penerapan Azure Developer CLI. Pelajari metodologi pemecahan masalah yang sistematis, teknik analisis log, profiling kinerja, dan alat diagnostik lanjutan untuk menyelesaikan masalah penerapan dan runtime dengan efisien.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai metodologi debugging sistematis untuk masalah Azure Developer CLI
- Memahami konfigurasi logging tingkat lanjut dan teknik analisis log
- Menerapkan profil kinerja dan strategi pemantauan
- Menggunakan alat diagnostik dan layanan Azure untuk penyelesaian masalah kompleks
- Menerapkan teknik debugging jaringan dan pemecahan masalah keamanan
- Mengonfigurasi pemantauan dan pemberitahuan yang komprehensif untuk deteksi masalah proaktif

## Hasil Pembelajaran

Setelah selesai, Anda akan mampu:
- Menerapkan metodologi TRIAGE untuk melakukan debugging sistematis terhadap masalah penerapan yang kompleks
- Mengonfigurasi dan menganalisis informasi logging dan tracing yang komprehensif
- Menggunakan Azure Monitor, Application Insights, dan alat diagnostik secara efektif
- Mendiagnosis masalah konektivitas jaringan, otentikasi, dan izin secara mandiri
- Menerapkan strategi pemantauan kinerja dan optimisasi
- Membuat skrip debugging kustom dan otomasi untuk masalah yang berulang

## Metodologi Debugging

### Pendekatan TRIAGE
- **T**ime: Kapan masalah dimulai?
- **R**eproduce: Dapatkah Anda mereproduksinya secara konsisten?
- **I**solate: Komponen apa yang gagal?
- **A**nalyze: Apa yang dikatakan log?
- **G**ather: Kumpulkan semua informasi relevan
- **E**scalate: Kapan mencari bantuan tambahan

## Mengaktifkan Mode Debug

### Environment Variables
```bash
# Aktifkan debugging menyeluruh
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Debugging untuk Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Nonaktifkan telemetri untuk keluaran yang lebih bersih
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Atur konfigurasi debug secara global
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Aktifkan pencatatan jejak
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Teknik Analisis Log

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
# Lihat log dengan Azure Monitor (melalui azd monitor)
azd monitor --logs

# Lihat log aplikasi secara real-time
azd monitor --live

# Untuk analisis log yang lebih rinci, gunakan Azure CLI dengan App Service atau Container App Anda:
# Log App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Log Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ekspor log Application Insights untuk analisis
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Log Correlation
```bash
#!/bin/bash
# correlate-logs.sh - Mengorelasikan log antar layanan menggunakan Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Cari di Application Insights log yang berkorelasi
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Cari log aktivitas Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Alat Debugging Lanjutan

### Azure Resource Graph Queries
```bash
# Cari sumber daya berdasarkan tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Temukan penyebaran yang gagal
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Periksa kesehatan sumber daya
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Network Debugging
```bash
# Uji konektivitas antar layanan
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

# Penggunaan
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container Debugging
```bash
# Men-debug masalah aplikasi kontainer
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
# Debug konektivitas basis data
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

## 🔬 Debugging Kinerja

### Application Performance Monitoring
```bash
# Aktifkan debugging Application Insights
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

# Pemantauan kinerja khusus
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
# Pantau penggunaan sumber daya
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

## 🧪 Pengujian dan Validasi

### Integration Test Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Atur lingkungan debug
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Dapatkan endpoint layanan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Uji endpoint kesehatan
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

# Jalankan pengujian
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Jalankan pengujian integrasi khusus
npm run test:integration
```

### Load Testing for Debugging
```bash
# Tes beban sederhana untuk mengidentifikasi hambatan kinerja
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Menggunakan Apache Bench (instal: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Ekstrak metrik utama
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Periksa kegagalan
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Debugging Infrastruktur

### Bicep Template Debugging
```bash
# Validasi template Bicep dengan keluaran terperinci
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Validasi sintaks
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Validasi lint
    az bicep lint --file "$template_file"
    
    # Simulasi penerapan
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug penerapan template
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
# Analisis status sumber daya untuk inkonsistensi
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Daftar semua sumber daya beserta statusnya
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Periksa sumber daya yang gagal
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

## 🔒 Debugging Keamanan

### Authentication Flow Debugging
```bash
# Debug autentikasi Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekode token JWT (memerlukan jq dan base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug akses Key Vault
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
# Debug grup keamanan jaringan
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Periksa aturan keamanan
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Debugging Khusus Aplikasi

### Node.js Application Debugging
```javascript
// debug-middleware.js - middleware debugging untuk Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Catat detail permintaan
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Menimpa res.json untuk mencatat respons
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
// database-debug.js - Utilitas debug basis data
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

## 🚨 Prosedur Debugging Darurat

### Production Issue Response
```bash
#!/bin/bash
# emergency-debug.sh - Debugging darurat produksi

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

# Beralih ke lingkungan yang benar
azd env select "$ENVIRONMENT"

# Kumpulkan informasi kritis
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Gunakan Azure Monitor untuk log kesalahan
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
# Skrip rollback cepat
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Beralih lingkungan
    azd env select "$environment"
    
    # Rollback menggunakan Git (AZD tidak memiliki rollback bawaan)
    git checkout "$previous_commit"
    azd deploy
    
    # Verifikasi rollback
    echo "Verifying rollback..."
    azd show
    
    # Uji endpoint kritis
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dasbor Debugging

### Custom Monitoring Dashboard
```bash
# Buat kueri Application Insights untuk debugging
create_debug_queries() {
    local app_insights_name=$1
    
    # Kueri untuk kesalahan
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Kueri untuk masalah kinerja
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Kueri untuk kegagalan dependensi
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log Aggregation
```bash
# Mengumpulkan log dari beberapa sumber Azure
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

## 🔗 Sumber Daya Lanjutan

### Custom Debug Scripts
Create a `scripts/debug/` directory with:
- `health-check.sh` - Pemeriksaan kesehatan menyeluruh
- `performance-test.sh` - Pengujian kinerja otomatis
- `log-analyzer.py` - Parsing dan analisis log tingkat lanjut
- `resource-validator.sh` - Validasi infrastruktur

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

## Praktik Terbaik

1. **Selalu aktifkan logging debug** di lingkungan non-produksi
2. **Buat kasus uji yang dapat direproduksi** untuk masalah
3. **Dokumentasikan prosedur debugging** untuk tim Anda
4. **Otomatiskan pemeriksaan kesehatan** dan pemantauan
5. **Perbarui alat debug** seiring perubahan aplikasi Anda
6. **Latih prosedur debugging** saat tidak ada insiden

## Langkah Selanjutnya

- [Perencanaan Kapasitas](../chapter-06-pre-deployment/capacity-planning.md) - Rencanakan kebutuhan sumber daya
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Pilih tingkat layanan yang sesuai
- [Pemeriksaan Pra-penerapan](../chapter-06-pre-deployment/preflight-checks.md) - Validasi pra-penerapan
- [Ringkasan](../../resources/cheat-sheet.md) - Perintah referensi cepat

---

**Ingat**: Debugging yang baik adalah tentang bersikap sistematis, teliti, dan sabar. Alat dan teknik ini akan membantu Anda mendiagnosis masalah lebih cepat dan lebih efektif.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Masalah Umum](common-issues.md)

- **Pelajaran Berikutnya**: [Perencanaan Kapasitas](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya menjaga akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->