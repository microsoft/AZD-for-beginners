# AZD Dağıtımları için Hata Ayıklama Rehberi

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki**: [Yaygın Sorunlar](common-issues.md)
- **➡️ Sonraki**: [Yapay Zekâya Özel Sorun Giderme](ai-troubleshooting.md)
- **🚀 Sonraki Bölüm**: [Bölüm 8: Üretim ve Kurumsal Desenler](../chapter-08-production/production-ai-practices.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI dağıtımlarıyla ilgili karmaşık sorunları teşhis etmek ve çözmek için gelişmiş hata ayıklama stratejileri, araçlar ve teknikler sunar. Sistematik sorun giderme metodolojilerini, günlük analiz tekniklerini, performans profilini ve gelişmiş tanılama araçlarını öğrenerek dağıtım ve çalışma zamanı sorunlarını verimli şekilde çözün.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak:
- Azure Developer CLI sorunları için sistematik hata ayıklama metodolojilerini ustalıkla uygulayacaksınız
- Gelişmiş günlük yapılandırması ve günlük analiz tekniklerini anlayacaksınız
- Performans profil oluşturma ve izleme stratejilerini uygulayacaksınız
- Karmaşık sorun çözümü için Azure tanılama araçlarını ve hizmetlerini kullanacaksınız
- Ağ hata ayıklama ve güvenlik sorun giderme tekniklerini uygulayacaksınız
- Proaktif sorun tespiti için kapsamlı izleme ve uyarı yapılandıracaksınız

## Öğrenme Çıktıları

Tamamladıktan sonra şunları yapabileceksiniz:
- Karmaşık dağıtım sorunlarını sistematik olarak hata ayıklamak için TRIAGE metodolojisini uygulamak
- Kapsamlı günlükleme ve izleme bilgilerini yapılandırmak ve analiz etmek
- Azure Monitor, Application Insights ve tanılama araçlarını etkili kullanmak
- Ağ bağlantısı, kimlik doğrulama ve izin sorunlarını bağımsız olarak hata ayıklamak
- Performans izleme ve optimizasyon stratejilerini uygulamak
- Tekrarlayan sorunlar için özel hata ayıklama betikleri ve otomasyon oluşturmak

## Hata Ayıklama Metodolojisi

### TRIAGE Yaklaşımı
- **T**ime: Sorun ne zaman başladı?
- **R**eproduce: Bunu tutarlı şekilde yeniden üretebiliyor musunuz?
- **I**solate: Hangi bileşen başarısız oluyor?
- **A**nalyze: Günlükler bize ne söylüyor?
- **G**ather: Tüm ilgili bilgileri toplayın
- **E**scalate: Ne zaman ek yardım aramalısınız

## Hata Ayıklama Modunu Etkinleştirme

### Ortam Değişkenleri
```bash
# Kapsamlı hata ayıklamayı etkinleştir
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI hata ayıklaması
export AZURE_CLI_DIAGNOSTICS=true

# Daha temiz çıktı için telemetriyi devre dışı bırak
export AZD_DISABLE_TELEMETRY=true
```

### Hata Ayıklama Yapılandırması
```bash
# Hata ayıklama yapılandırmasını küresel olarak ayarla
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# İzleme günlük kaydını etkinleştir
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Günlük Analizi Teknikleri

### Günlük Seviyelerini Anlama
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Yapısal Günlük Analizi
```bash
# Azure Monitor ile günlükleri görüntüleyin (azd monitor aracılığıyla)
azd monitor --logs

# Uygulama günlüklerini gerçek zamanlı olarak görüntüleyin
azd monitor --live

# Ayrıntılı günlük analizi için App Service'iniz veya Container App'iniz ile Azure CLI'yi kullanın:
# App Service günlükleri
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App günlükleri
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Analiz için Application Insights günlüklerini dışa aktarın
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Günlük İlişkilendirmesi
```bash
#!/bin/bash
# correlate-logs.sh - Azure Monitor kullanarak hizmetler arasındaki günlükleri ilişkilendir

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# İlişkili günlükleri Application Insights'ta ara
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure etkinlik günlüklerini ara
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Gelişmiş Hata Ayıklama Araçları

### Azure Kaynak Grafiği Sorguları
```bash
# Etiketlere göre kaynakları sorgula
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Başarısız dağıtımları bul
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kaynak sağlığını kontrol et
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Ağ Hata Ayıklama
```bash
# Hizmetler arasındaki bağlantıyı test et
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

# Kullanım
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Konteyner Hata Ayıklama
```bash
# Konteyner uygulama sorunlarını hata ayıkla
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

### Veritabanı Bağlantı Hata Ayıklama
```bash
# Veritabanı bağlantısını hata ayıkla
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

## 🔬 Performans Hata Ayıklama

### Uygulama Performansı İzleme
```bash
# Application Insights için hata ayıklamayı etkinleştir
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

# Özel performans izleme
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

### Kaynak Kullanımı Analizi
```bash
# Kaynak kullanımını izleyin
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

## 🧪 Test ve Doğrulama

### Entegrasyon Testi Hata Ayıklama
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Hata ayıklama ortamını ayarla
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Servis uç noktalarını al
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Sağlık uç noktalarını test et
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

# Testleri çalıştır
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Özel entegrasyon testlerini çalıştır
npm run test:integration
```

### Hata Ayıklama İçin Yük Testi
```bash
# Performans darboğazlarını belirlemek için basit yük testi
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench kullanımı (kurulum: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Anahtar metrikleri çıkar
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Hataları kontrol et
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Altyapı Hata Ayıklama

### Bicep Şablon Hata Ayıklama
```bash
# Ayrıntılı çıktı ile Bicep şablonlarını doğrula
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Sözdizimi doğrulaması
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint doğrulaması
    az bicep lint --file "$template_file"
    
    # What-if dağıtımı
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Şablon dağıtımını hata ayıkla
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

### Kaynak Durumu Analizi
```bash
# Kaynak durumlarını tutarsızlıklar için analiz et
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Tüm kaynakları durumlarıyla birlikte listele
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Başarısız kaynakları kontrol et
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

## 🔒 Güvenlik Hata Ayıklama

### Kimlik Doğrulama Akışı Hata Ayıklama
```bash
# Azure kimlik doğrulamasını hata ayıkla
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT belirtecini çöz (jq ve base64 gerektirir)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault erişimini hata ayıkla
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

### Ağ Güvenliği Hata Ayıklama
```bash
# Ağ güvenlik gruplarını hata ayıkla
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Güvenlik kurallarını kontrol et
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Uygulamaya Özgü Hata Ayıklama

### Node.js Uygulama Hata Ayıklama
```javascript
// debug-middleware.js - Express hata ayıklama ara yazılımı
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // İstek ayrıntılarını günlüğe kaydet
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Yanıtları günlüğe kaydetmek için res.json'i geçersiz kıl
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Veritabanı Sorgusu Hata Ayıklama
```javascript
// database-debug.js - Veritabanı hata ayıklama araçları
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

## 🚨 Acil Hata Ayıklama Prosedürleri

### Prodüksiyon Sorunlarına Müdahale
```bash
#!/bin/bash
# emergency-debug.sh - Acil üretim hata ayıklama

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

# Doğru ortama geç
azd env select "$ENVIRONMENT"

# Kritik bilgileri topla
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Hata günlükleri için Azure Monitor'ü kullan
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

### Geri Alma (Rollback) Prosedürleri
```bash
# Hızlı geri alma betiği
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Ortamı değiştir
    azd env select "$environment"
    
    # Git kullanarak geri alma (AZD'nin yerleşik geri alma özelliği yok)
    git checkout "$previous_commit"
    azd deploy
    
    # Geri almayı doğrula
    echo "Verifying rollback..."
    azd show
    
    # Kritik uç noktaları test et
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Hata Ayıklama Panoları

### Özel İzleme Panosu
```bash
# Hata ayıklama için Application Insights sorguları oluşturun
create_debug_queries() {
    local app_insights_name=$1
    
    # Hatalar için sorgu
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Performans sorunları için sorgu
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Bağımlılık hataları için sorgu
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Günlük Toplama
```bash
# Birden çok Azure kaynağından günlükleri topla
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

## 🔗 Gelişmiş Kaynaklar

### Özel Hata Ayıklama Betikleri
Aşağıdakilerle birlikte `scripts/debug/` dizini oluşturun:
- `health-check.sh` - Kapsamlı sağlık kontrolleri
- `performance-test.sh` - Otomatik performans testi
- `log-analyzer.py` - Gelişmiş günlük ayrıştırma ve analiz
- `resource-validator.sh` - Altyapı doğrulama

### İzleme Entegrasyonu
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

## En İyi Uygulamalar

1. **Her zaman hata ayıklama günlüklemesini etkinleştirin** üretim dışı ortamlarda
2. **Sorunlar için yeniden üretilebilir test durumları oluşturun**
3. **Ekip için hata ayıklama prosedürlerini belgelendirin**
4. **Sağlık kontrollerini otomatikleştirin** ve izlemeyi uygulayın
5. **Hata ayıklama araçlarını güncel tutun** uygulama değişiklikleriyle
6. **Hata ayıklama prosedürlerini uygulayın** olay olmayan zamanlarda

## Sonraki Adımlar

- [Kapasite Planlaması](../chapter-06-pre-deployment/capacity-planning.md) - Kaynak gereksinimlerini planlayın
- [SKU Seçimi](../chapter-06-pre-deployment/sku-selection.md) - Uygun hizmet katmanlarını seçin
- [Hazırlık Kontrolleri](../chapter-06-pre-deployment/preflight-checks.md) - Dağıtımdan önce doğrulama
- [Hızlı Başvuru](../../resources/cheat-sheet.md) - Hızlı başvuru komutları

---

**Unutmayın**: İyi hata ayıklama sistematik, titiz ve sabırlıdır. Bu araçlar ve teknikler sorunları daha hızlı ve daha etkili bir şekilde tanımanıza yardımcı olacaktır.

---

**Gezinme**
- **Önceki Ders**: [Yaygın Sorunlar](common-issues.md)

- **Sonraki Ders**: [Kapasite Planlaması](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, AI çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için özen göstermemize rağmen otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge kendi diliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucu oluşabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->