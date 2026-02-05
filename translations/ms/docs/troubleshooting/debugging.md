# Panduan Debugging untuk Penerapan AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Debugging
- **⬅️ Sebelumnya**: [Isu Biasa](common-issues.md)
- **➡️ Seterusnya**: [Penyelesaian Masalah Khusus AI](ai-troubleshooting.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Enterprise](../microsoft-foundry/production-ai-practices.md)

## Pengenalan

Panduan lengkap ini menyediakan strategi debugging lanjutan, alat, dan teknik untuk mendiagnosis dan menyelesaikan isu-isu kompleks dengan penerapan Azure Developer CLI. Pelajari metodologi penyelesaian masalah secara sistematik, teknik analisis log, profil prestasi, dan alat diagnostik lanjutan untuk menyelesaikan isu penerapan dan runtime dengan cekap.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Menguasai metodologi debugging sistematik untuk isu Azure Developer CLI
- Memahami konfigurasi log lanjutan dan teknik analisis log
- Melaksanakan strategi pemprofilan prestasi dan pemantauan
- Menggunakan alat dan perkhidmatan diagnostik Azure untuk menyelesaikan masalah kompleks
- Menerapkan teknik debugging rangkaian dan penyelesaian masalah keselamatan
- Mengkonfigurasi pemantauan dan amaran yang komprehensif untuk pengesanan isu secara proaktif

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Menggunakan metodologi TRIAGE untuk debugging isu penerapan yang kompleks secara sistematik
- Mengkonfigurasi dan menganalisis maklumat log dan penjejakan yang komprehensif
- Menggunakan Azure Monitor, Application Insights, dan alat diagnostik dengan berkesan
- Debug isu sambungan rangkaian, pengesahan, dan kebenaran secara berdikari
- Melaksanakan strategi pemantauan dan pengoptimuman prestasi
- Mencipta skrip debugging tersuai dan automasi untuk isu berulang

## Metodologi Debugging

### Pendekatan TRIAGE
- **T**ime: Bila isu bermula?
- **R**eproduce: Bolehkah anda sentiasa menghasilkan semula isu tersebut?
- **I**solate: Komponen mana yang gagal?
- **A**nalyze: Apa yang log beritahu kita?
- **G**ather: Kumpulkan semua maklumat yang relevan
- **E**scalate: Bila perlu mendapatkan bantuan tambahan

## Mengaktifkan Mod Debug

### Pembolehubah Persekitaran
```bash
# Aktifkan penyahpepijatan menyeluruh
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Penyahpepijatan Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Lumpuhkan telemetri untuk output yang lebih bersih
export AZD_DISABLE_TELEMETRY=true
```

### Konfigurasi Debug
```bash
# Tetapkan konfigurasi debug secara global
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Aktifkan log penjejakan
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
# Tapis log mengikut tahap
azd logs --level error --since 1h

# Tapis mengikut perkhidmatan
azd logs --service api --level debug

# Eksport log untuk analisis
azd logs --output json > deployment-logs.json

# Huraikan log JSON dengan jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Korelasi Log
```bash
#!/bin/bash
# correlate-logs.sh - Menghubungkan log merentasi perkhidmatan

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Cari merentasi semua perkhidmatan
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Cari log Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Alat Debugging Lanjutan

### Pertanyaan Azure Resource Graph
```bash
# Tanyakan sumber berdasarkan tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Cari penyebaran yang gagal
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Periksa kesihatan sumber
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Debugging Rangkaian
```bash
# Uji kesambungan antara perkhidmatan
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

### Debugging Kontena
```bash
# Nyahpepijat isu aplikasi kontena
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

### Debugging Sambungan Pangkalan Data
```bash
# Nyahpepijat sambungan pangkalan data
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

## 🔬 Debugging Prestasi

### Pemantauan Prestasi Aplikasi
```bash
# Aktifkan penyahpepijatan Application Insights
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

### Debugging Ujian Integrasi
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

### Ujian Beban untuk Debugging
```bash
# Ujian beban mudah untuk mengenal pasti halangan prestasi
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

## 🔧 Debugging Infrastruktur

### Debugging Templat Bicep
```bash
# Sahkan templat Bicep dengan output terperinci
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Pengesahan sintaks
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Pengesahan lint
    az bicep lint --file "$template_file"
    
    # Apa-jika penyebaran
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Nyahpepijat penyebaran templat
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
    
    # Senaraikan semua sumber dengan keadaan mereka
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

## 🔒 Debugging Keselamatan

### Debugging Aliran Pengesahan
```bash
# Nyahpepijat pengesahan Azure
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

# Nyahpepijat akses Key Vault
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

### Debugging Keselamatan Rangkaian
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

## 📱 Debugging Khusus Aplikasi

### Debugging Aplikasi Node.js
```javascript
// debug-middleware.js - Middleware debugging Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log butiran permintaan
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Gantikan res.json untuk log respons
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Debugging Pertanyaan Pangkalan Data
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

## 🚨 Prosedur Debugging Kecemasan

### Tindak Balas Isu Pengeluaran
```bash
#!/bin/bash
# emergency-debug.sh - Debugging kecemasan pengeluaran

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

# Tukar ke persekitaran yang betul
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

### Prosedur Rollback
```bash
# Skrip pengunduran cepat
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Tukar persekitaran
    azd env select "$environment"
    
    # Undurkan aplikasi
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Sahkan pengunduran
    echo "Verifying rollback..."
    azd show
    
    # Uji titik akhir kritikal
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Papan Pemuka Debugging

### Papan Pemantauan Tersuai
```bash
# Cipta pertanyaan Application Insights untuk penyahpepijatan
create_debug_queries() {
    local app_insights_name=$1
    
    # Pertanyaan untuk ralat
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Pertanyaan untuk isu prestasi
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
# Gabungkan log dari pelbagai sumber
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

## 🔗 Sumber Lanjutan

### Skrip Debug Tersuai
Cipta direktori `scripts/debug/` dengan:
- `health-check.sh` - Pemeriksaan kesihatan yang komprehensif
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

1. **Sentiasa aktifkan log debug** dalam persekitaran bukan pengeluaran
2. **Cipta kes ujian yang boleh dihasilkan semula** untuk isu
3. **Dokumentasikan prosedur debugging** untuk pasukan anda
4. **Automasi pemeriksaan kesihatan** dan pemantauan
5. **Pastikan alat debug sentiasa dikemas kini** dengan perubahan aplikasi anda
6. **Amalkan prosedur debugging** semasa waktu bukan insiden

## Langkah Seterusnya

- [Perancangan Kapasiti](../pre-deployment/capacity-planning.md) - Rancang keperluan sumber
- [Pemilihan SKU](../pre-deployment/sku-selection.md) - Pilih tahap perkhidmatan yang sesuai
- [Pemeriksaan Awal](../pre-deployment/preflight-checks.md) - Pengesahan sebelum penerapan
- [Lembaran Ringkasan](../../resources/cheat-sheet.md) - Rujukan pantas untuk arahan

---

**Ingat**: Debugging yang baik adalah tentang menjadi sistematik, teliti, dan sabar. Alat dan teknik ini akan membantu anda mendiagnosis isu dengan lebih cepat dan berkesan.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Isu Biasa](common-issues.md)

- **Pelajaran Seterusnya**: [Perancangan Kapasiti](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->