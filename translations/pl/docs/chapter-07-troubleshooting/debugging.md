# Przewodnik po debugowaniu wdrożeń AZD

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni**: [Typowe problemy](common-issues.md)
- **➡️ Następny**: [Rozwiązywanie problemów specyficznych dla AI](ai-troubleshooting.md)
- **🚀 Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../chapter-08-production/production-ai-practices.md)

## Wprowadzenie

Ten kompletny przewodnik przedstawia zaawansowane strategie debugowania, narzędzia i techniki diagnozowania oraz rozwiązywania złożonych problemów związanych z wdrożeniami Azure Developer CLI. Poznaj systematyczne metodologie rozwiązywania problemów, techniki analizy logów, profilowania wydajności i zaawansowane narzędzia diagnostyczne, aby efektywnie rozwiązywać problemy z wdrożeniami i w czasie wykonywania.

## Cele nauki

Po ukończeniu tego przewodnika będziesz:
- Mistrzem systematycznych metod debugowania problemów z Azure Developer CLI
- Rozumieć zaawansowaną konfigurację logowania i techniki analizy logów
- Implementować profilowanie wydajności i strategie monitorowania
- Korzystać z narzędzi diagnostycznych i usług Azure do rozwiązywania złożonych problemów
- Stosować techniki debugowania sieci i rozwiązywania problemów z bezpieczeństwem
- Konfigurować kompleksowe monitorowanie i alertowanie dla proaktywnego wykrywania problemów

## Rezultaty nauki

Po ukończeniu będziesz w stanie:
- Zastosować metodologię TRIAGE do systematycznego debugowania złożonych problemów wdrożeniowych
- Konfigurować i analizować kompleksowe informacje o logowaniu i śledzeniu
- Efektywnie korzystać z Azure Monitor, Application Insights i narzędzi diagnostycznych
- Samodzielnie debugować problemy z łącznością sieciową, uwierzytelnianiem i uprawnieniami
- Wdrażać monitorowanie wydajności i strategie optymalizacji
- Tworzyć niestandardowe skrypty debugujące i automatyzację dla powtarzających się problemów

## Metodologia debugowania

### Podejście TRIAGE
- **T**ime: Kiedy problem się rozpoczął?
- **R**eproduce: Czy można go konsekwentnie odtworzyć?
- **I**solate: Który komponent zawodzi?
- **A**nalyze: Co mówią logi?
- **G**ather: Zbierz wszystkie istotne informacje
- **E**scalate: Kiedy szukać dodatkowej pomocy

## Włączanie trybu debugowania

### Environment Variables
```bash
# Włącz kompleksowe debugowanie
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Debugowanie Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Wyłącz telemetrię, aby uzyskać czytelniejsze wyjście
export AZD_DISABLE_TELEMETRY=true
```

### Debug Configuration
```bash
# Ustaw konfigurację debugowania globalnie
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Włącz rejestrowanie śledzenia
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Techniki analizy logów

### Zrozumienie poziomów logów
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturalna analiza logów
```bash
# Wyświetl logi za pomocą Azure Monitor (przez azd monitor)
azd monitor --logs

# Wyświetl logi aplikacji w czasie rzeczywistym
azd monitor --live

# Do szczegółowej analizy logów użyj Azure CLI z App Service lub Container App:
# Logi App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Logi Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Eksportuj logi Application Insights do analizy
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Korelacja logów
```bash
#!/bin/bash
# correlate-logs.sh - Korelacja logów między usługami przy użyciu Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Wyszukaj skorelowane logi w Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Wyszukaj logi aktywności Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Zaawansowane narzędzia do debugowania

### Zapytania Azure Resource Graph
```bash
# Wyszukaj zasoby według tagów
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Znajdź nieudane wdrożenia
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Sprawdź stan zdrowia zasobu
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Debugowanie sieci
```bash
# Test połączenia między usługami
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

# Użycie
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Debugowanie kontenerów
```bash
# Debugowanie problemów z aplikacją w kontenerze
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

### Debugowanie połączeń z bazą danych
```bash
# Debuguj łączność z bazą danych
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

## 🔬 Debugowanie wydajności

### Monitorowanie wydajności aplikacji
```bash
# Włącz debugowanie Application Insights
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

# Niestandardowe monitorowanie wydajności
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

### Analiza wykorzystania zasobów
```bash
# Monitoruj wykorzystanie zasobów
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

## 🧪 Testowanie i walidacja

### Debugowanie testów integracyjnych
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Ustaw środowisko debugowania
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Pobierz punkty końcowe usług
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Przetestuj punkty końcowe sprawdzające stan
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

# Uruchom testy
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Uruchom niestandardowe testy integracyjne
npm run test:integration
```

### Testy obciążeniowe w celu debugowania
```bash
# Prosty test obciążeniowy w celu zidentyfikowania wąskich gardeł wydajności
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Korzystanie z Apache Bench (instalacja: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Wyodrębnij kluczowe metryki
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Sprawdź, czy wystąpiły błędy
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Debugowanie infrastruktury

### Debugowanie szablonów Bicep
```bash
# Waliduj szablony Bicep ze szczegółowymi wynikami
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Walidacja składni
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Walidacja lint
    az bicep lint --file "$template_file"
    
    # Wdrożenie what-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debuguj wdrożenie szablonu
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

### Analiza stanu zasobów
```bash
# Przeanalizuj stany zasobów pod kątem niespójności
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Wypisz wszystkie zasoby wraz z ich stanami
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Sprawdź zasoby, które zakończyły się niepowodzeniem
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

## 🔒 Debugowanie bezpieczeństwa

### Debugowanie przepływu uwierzytelniania
```bash
# Debuguj uwierzytelnianie Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekoduj token JWT (wymaga jq i base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debuguj dostęp do Key Vault
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

### Debugowanie zabezpieczeń sieci
```bash
# Debuguj grupy zabezpieczeń sieciowych
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Sprawdź reguły zabezpieczeń
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Debugowanie specyficzne dla aplikacji

### Debugowanie aplikacji Node.js
```javascript
// debug-middleware.js - middleware debugowania dla Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Loguj szczegóły żądania
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Nadpisz res.json, aby logować odpowiedzi
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Debugowanie zapytań do bazy danych
```javascript
// database-debug.js - Narzędzia do debugowania bazy danych
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

## 🚨 Procedury awaryjnego debugowania

### Reakcja na problemy w produkcji
```bash
#!/bin/bash
# emergency-debug.sh - Awaryjne debugowanie środowiska produkcyjnego

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

# Przełącz na właściwe środowisko
azd env select "$ENVIRONMENT"

# Zbierz krytyczne informacje
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Użyj Azure Monitor do zbierania dzienników błędów
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

### Procedury wycofania
```bash
# Szybki skrypt przywracania
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Przełącz środowisko
    azd env select "$environment"
    
    # Przywracanie za pomocą Git (AZD nie ma wbudowanego mechanizmu przywracania)
    git checkout "$previous_commit"
    azd deploy
    
    # Zweryfikuj przywrócenie
    echo "Verifying rollback..."
    azd show
    
    # Przetestuj krytyczne punkty końcowe
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Pulpity debugowania

### Niestandardowy pulpit monitorowania
```bash
# Utwórz zapytania Application Insights do debugowania
create_debug_queries() {
    local app_insights_name=$1
    
    # Zapytanie o błędy
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Zapytanie o problemy z wydajnością
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Zapytanie o awarie zależności
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregacja logów
```bash
# Agreguj logi z wielu źródeł Azure
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

## 🔗 Zaawansowane zasoby

### Niestandardowe skrypty debugujące
Create a `scripts/debug/` directory with:
- `health-check.sh` - Kompleksowe sprawdzanie stanu
- `performance-test.sh` - Automatyczne testy wydajności
- `log-analyzer.py` - Zaawansowane parsowanie i analiza logów
- `resource-validator.sh` - Weryfikacja infrastruktury

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

## Najlepsze praktyki

1. **Zawsze włączaj logowanie debugujące** w środowiskach nieprodukcyjnych
2. **Twórz odtwarzalne przypadki testowe** dla problemów
3. **Dokumentuj procedury debugowania** dla swojego zespołu
4. **Automatyzuj kontrole stanu i monitorowanie**
5. **Utrzymuj narzędzia debugujące zaktualizowane** wraz ze zmianami w aplikacji
6. **Ćwicz procedury debugowania** poza czasem występowania incydentów

## Kolejne kroki

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Zaplanuj wymagania zasobów
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Wybierz odpowiednie poziomy usług
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Walidacja przed wdrożeniem
- [Cheat Sheet](../../resources/cheat-sheet.md) - Polecenia szybkiego dostępu

---

**Pamiętaj**: Dobre debugowanie polega na byciu systematycznym, dokładnym i cierpliwym. Te narzędzia i techniki pomogą Ci diagnozować problemy szybciej i skuteczniej.

---

**Nawigacja**
- **Poprzednia lekcja**: [Typowe problemy](common-issues.md)

- **Następna lekcja**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dokładamy starań, by tłumaczenie było jak najbardziej precyzyjne, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uważać za źródło wiążące. W przypadku informacji o istotnym znaczeniu zaleca się skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za żadne nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->