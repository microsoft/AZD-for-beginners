# Panduan Penyahpepijatan untuk Penyebaran AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Penyahpepijatan
- **⬅️ Sebelumnya**: [Isu Biasa](common-issues.md)
- **➡️ Seterusnya**: [Penyelesaian Masalah Khusus AI](ai-troubleshooting.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Perusahaan](../chapter-08-production/production-ai-practices.md)

## Pengenalan

Panduan komprehensif ini menyediakan strategi penyahpepijatan lanjutan, alat, dan teknik untuk mendiagnosis dan menyelesaikan isu kompleks dengan penyebaran Azure Developer CLI. Pelajari metodologi penyelesaian masalah yang sistematik, teknik analisis log, pemprofilan prestasi, dan alat diagnostik lanjutan untuk menyelesaikan isu penyebaran dan masa larian dengan cekap.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai metodologi penyahpepijatan sistematik untuk isu Azure Developer CLI
- Memahami konfigurasi log lanjutan dan teknik analisis log
- Melaksanakan pemprofilan dan strategi pemantauan prestasi
- Menggunakan alat dan perkhidmatan diagnostik Azure untuk penyelesaian masalah kompleks
- Mengaplikasikan teknik penyahpepijatan rangkaian dan keselamatan
- Mengkonfigurasi pemantauan dan peringatan menyeluruh untuk pengesanan isu proaktif

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Mengaplikasikan metodologi TRIAGE untuk menyahpepijat isu penyebaran kompleks secara sistematik
- Mengkonfigurasi dan menganalisis maklumat log dan jejak secara menyeluruh
- Menggunakan Azure Monitor, Application Insights, dan alat diagnostik dengan berkesan
- Menyahpepijat sambungan rangkaian, pengesahan, dan isu keizinan secara berdikari
- Melaksanakan pemantauan prestasi dan strategi pengoptimuman
- Mencipta skrip penyahpepijatan tersuai dan automasi untuk isu berulang

## Metodologi Penyahpepijatan

### Pendekatan TRIAGE
- **T**ime: Bila isu bermula?
- **R**eproduce: Bolehkah anda mereproduksinya secara konsisten?
- **I**solate: Komponen manakah yang gagal?
- **A**nalyze: Apa yang log beritahu kita?
- **G**ather: Kumpulkan semua maklumat berkaitan
- **E**scalate: Bila untuk mendapatkan bantuan tambahan

## Mengaktifkan Mod Penyahpepijatan

### Pembolehubah Persekitaran
```bash
# Dayakan penyahpepijatan menyeluruh
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Penyahpepijatan Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Lumpuhkan telemetri untuk keluaran yang lebih bersih
export AZD_DISABLE_TELEMETRY=true
```

### Konfigurasi Penyahpepijatan
```bash
# Tetapkan konfigurasi debug secara global
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Dayakan pencatatan jejak
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

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
# Lihat log dengan Azure Monitor (melalui azd monitor)
azd monitor --logs

# Lihat log aplikasi secara masa nyata
azd monitor --live

# Untuk analisis log yang terperinci, gunakan Azure CLI dengan App Service atau Container App anda:
# Log App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Log Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Eksport log Application Insights untuk analisis
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Korelasi Log
```bash
#!/bin/bash
# correlate-logs.sh - Mengkorelasikan log merentasi perkhidmatan menggunakan Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Cari Application Insights untuk log yang berkorelasi
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Cari log aktiviti Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Alat Penyahpepijatan Lanjutan

### Kueri Azure Resource Graph
```bash
# Cari sumber mengikut tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Cari penyebaran yang gagal
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Periksa kesihatan sumber
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Penyahpepijatan Rangkaian
```bash
# Uji sambungan antara perkhidmatan
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

### Penyahpepijatan Kontena
```bash
# Menyahpepijat isu aplikasi kontena
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

### Penyahpepijatan Sambungan Pangkalan Data
```bash
# Menyahpepijat sambungan pangkalan data
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

## 🔬 Penyahpepijatan Prestasi

### Pemantauan Prestasi Aplikasi
```bash
# Dayakan penyahpepijat Application Insights
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

# Pemantauan prestasi tersuai
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

### Analisis Penggunaan Sumber
```bash
# Pantau penggunaan sumber
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

## 🧪 Ujian dan Pengesahan

### Penyahpepijatan Ujian Integrasi
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Tetapkan persekitaran debug
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Dapatkan titik akhir perkhidmatan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Uji titik akhir kesihatan
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

# Jalankan ujian
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Jalankan ujian integrasi tersuai
npm run test:integration
```

### Ujian Beban untuk Penyahpepijatan
```bash
# Ujian beban ringkas untuk mengenal pasti titik sempit prestasi
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Menggunakan Apache Bench (pasang: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Ekstrak metrik utama
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Periksa kegagalan
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Penyahpepijatan Infrastruktur

### Penyahpepijatan Templat Bicep
```bash
# Sahkan templat Bicep dengan output terperinci
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Pengesahan sintaks
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Pengesahan lint
    az bicep lint --file "$template_file"
    
    # Penerapan what-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Nyahpepijat penerapan templat
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
# Analisis keadaan sumber untuk ketidakkonsistenan
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Senaraikan semua sumber beserta keadaan mereka
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Periksa sumber yang gagal
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

## 🔒 Penyahpepijatan Keselamatan

### Penyahpepijatan Aliran Pengesahan
```bash
# Mendiagnosis pengesahan Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Nyahkod token JWT (memerlukan jq dan base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Mendiagnosis akses Key Vault
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

### Penyahpepijatan Keselamatan Rangkaian
```bash
# Nyahpepijat kumpulan keselamatan rangkaian
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Periksa peraturan keselamatan
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Penyahpepijatan Khusus Aplikasi

### Penyahpepijatan Aplikasi Node.js
```javascript
// debug-middleware.js - middleware penyahpepijat untuk Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Catat butiran permintaan
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Gantikan res.json untuk mencatat respons
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Penyahpepijatan Pertanyaan Pangkalan Data
```javascript
// database-debug.js - Utiliti penyahpepijatan pangkalan data
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

## 🚨 Prosedur Penyahpepijatan Kecemasan

### Respons Isu Pengeluaran
```bash
#!/bin/bash
# emergency-debug.sh - Penyahpepijatan kecemasan untuk pengeluaran

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

# Beralih ke persekitaran yang betul
azd env select "$ENVIRONMENT"

# Kumpulkan maklumat kritikal
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Gunakan Azure Monitor untuk log ralat
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

### Prosedur Rollback
```bash
# Skrip rollback pantas
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Tukar persekitaran
    azd env select "$environment"
    
    # Rollback menggunakan Git (AZD tidak mempunyai rollback terbina dalam)
    git checkout "$previous_commit"
    azd deploy
    
    # Sahkan rollback
    echo "Verifying rollback..."
    azd show
    
    # Uji titik akhir kritikal
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Papan Pemuka Penyahpepijatan

### Papan Pemuka Pemantauan Khusus
```bash
# Cipta pertanyaan Application Insights untuk penyahpepijat
create_debug_queries() {
    local app_insights_name=$1
    
    # Pertanyaan untuk ralat
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Pertanyaan untuk masalah prestasi
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Pertanyaan untuk kegagalan kebergantungan
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Pengagregatan Log
```bash
# Mengumpulkan log daripada pelbagai sumber Azure
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

## 🔗 Sumber Lanjutan

### Skrip Nyahpepijat Tersuai
Buat direktori `scripts/debug/` dengan:
- `health-check.sh` - Pemeriksaan kesihatan menyeluruh
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
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## Amalan Terbaik

1. **Sentiasa aktifkan log penyahpepijatan** dalam persekitaran bukan pengeluaran
2. **Cipta kes ujian yang boleh direproduksi** untuk isu
3. **Dokumentasikan prosedur penyahpepijatan** untuk pasukan anda
4. **Automatikkan pemeriksaan kesihatan** dan pemantauan
5. **Pastikan alat penyahpepijatan dikemas kini** dengan perubahan aplikasi anda
6. **Amalkan prosedur penyahpepijatan** semasa bukan waktu insiden

## Langkah Seterusnya

- [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md) - Rancang keperluan sumber
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Pilih tahap perkhidmatan yang sesuai
- [Pemeriksaan Pra-penerbangan](../chapter-06-pre-deployment/preflight-checks.md) - Pengesahan sebelum penyebaran
- [Lembaran Rujukan](../../resources/cheat-sheet.md) - Arahan rujukan pantas

---

**Ingat**: Penyahpepijatan yang baik ialah tentang bersikap sistematik, teliti, dan sabar. Alat dan teknik ini akan membantu anda mendiagnosis isu dengan lebih cepat dan berkesan.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Isu Biasa](common-issues.md)

- **Pelajaran Seterusnya**: [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Walaupun kami berusaha sedaya upaya untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa aslinya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, disyorkan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->