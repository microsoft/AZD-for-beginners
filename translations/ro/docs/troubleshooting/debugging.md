<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-23T16:55:39+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "ro"
}
-->
# Ghid de depanare pentru implementările AZD

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Precedent**: [Probleme Comune](common-issues.md)
- **➡️ Următor**: [Depanare Specifică AI](ai-troubleshooting.md)
- **🚀 Capitol Următor**: [Capitolul 8: Modele de Producție și Enterprise](../microsoft-foundry/production-ai-practices.md)

## Introducere

Acest ghid cuprinzător oferă strategii avansate de depanare, instrumente și tehnici pentru diagnosticarea și rezolvarea problemelor complexe legate de implementările Azure Developer CLI. Învață metodologii sistematice de depanare, tehnici de analiză a jurnalelor, profilarea performanței și instrumente avansate de diagnostic pentru a rezolva eficient problemele de implementare și runtime.

## Obiective de învățare

După parcurgerea acestui ghid, vei:
- Stăpâni metodologii sistematice de depanare pentru problemele Azure Developer CLI
- Înțelege configurarea avansată a jurnalelor și tehnicile de analiză a acestora
- Implementa strategii de profilare și monitorizare a performanței
- Utiliza instrumentele și serviciile de diagnostic Azure pentru rezolvarea problemelor complexe
- Aplica tehnici de depanare a rețelei și securității
- Configura monitorizare și alertare cuprinzătoare pentru detectarea proactivă a problemelor

## Rezultate de învățare

După finalizare, vei putea:
- Aplica metodologia TRIAGE pentru a depana sistematic probleme complexe de implementare
- Configura și analiza informații detaliate de jurnalizare și trasare
- Utiliza Azure Monitor, Application Insights și instrumentele de diagnostic în mod eficient
- Depana probleme de conectivitate rețea, autentificare și permisiuni în mod independent
- Implementa strategii de monitorizare și optimizare a performanței
- Crea scripturi personalizate de depanare și automatizare pentru probleme recurente

## Metodologia de depanare

### Abordarea TRIAGE
- **T**imp: Când a început problema?
- **R**eproducere: Poți reproduce problema în mod constant?
- **I**zolare: Ce componentă eșuează?
- **A**naliză: Ce ne spun jurnalele?
- **C**olecție: Adună toate informațiile relevante
- **E**scalare: Când să ceri ajutor suplimentar

## Activarea modului de depanare

### Variabile de mediu
```bash
# Activați depanarea cuprinzătoare
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Depanare CLI Azure
export AZURE_CLI_DIAGNOSTICS=true

# Dezactivați telemetria pentru un output mai curat
export AZD_DISABLE_TELEMETRY=true
```

### Configurare Debug
```bash
# Setează configurația de depanare global
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Activează jurnalizarea de urmărire
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Tehnici de analiză a jurnalelor

### Înțelegerea nivelurilor de jurnalizare
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Analiza structurată a jurnalelor
```bash
# Filtrează jurnalele după nivel
azd logs --level error --since 1h

# Filtrează după serviciu
azd logs --service api --level debug

# Exportă jurnalele pentru analiză
azd logs --output json > deployment-logs.json

# Analizează jurnalele JSON cu jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Corelarea jurnalelor
```bash
#!/bin/bash
# correlate-logs.sh - Corelează jurnalele între servicii

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Caută în toate serviciile
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Caută jurnalele Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Instrumente avansate de depanare

### Interogări Azure Resource Graph
```bash
# Interoghează resursele după etichete
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Găsește implementările eșuate
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Verifică sănătatea resurselor
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Depanare rețea
```bash
# Testați conectivitatea între servicii
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

# Utilizare
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Depanare containere
```bash
# Depanare probleme aplicație container
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

### Depanare conexiuni baze de date
```bash
# Depanare conectivitatea bazei de date
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

## 🔬 Depanare performanță

### Monitorizarea performanței aplicațiilor
```bash
# Activați depanarea Application Insights
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

# Monitorizare personalizată a performanței
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

### Analiza utilizării resurselor
```bash
# Monitorizați utilizarea resurselor
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

## 🧪 Testare și validare

### Depanare teste de integrare
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Setează mediul de depanare
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Obține punctele de acces ale serviciului
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testează punctele de acces pentru sănătate
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

# Rulează testele
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Rulează teste de integrare personalizate
npm run test:integration
```

### Testare de încărcare pentru depanare
```bash
# Test de încărcare simplu pentru identificarea blocajelor de performanță
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Utilizarea Apache Bench (instalare: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extrageți metricile cheie
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Verificați erorile
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Depanare infrastructură

### Depanare șabloane Bicep
```bash
# Validați șabloanele Bicep cu ieșire detaliată
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Validarea sintaxei
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Validarea lint
    az bicep lint --file "$template_file"
    
    # Ce-ar fi dacă implementarea
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Depanarea implementării șablonului
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

### Analiza stării resurselor
```bash
# Analizați stările resurselor pentru inconsecvențe
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Listați toate resursele cu stările lor
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Verificați resursele eșuate
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

## 🔒 Depanare securitate

### Depanare fluxuri de autentificare
```bash
# Depanare autentificare Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decodificare token JWT (necesită jq și base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Depanare acces Key Vault
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

### Depanare securitate rețea
```bash
# Depanați grupurile de securitate ale rețelei
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Verificați regulile de securitate
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Depanare specifică aplicațiilor

### Depanare aplicații Node.js
```javascript
// debug-middleware.js - Middleware de depanare Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Înregistrează detaliile cererii
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Suprascrie res.json pentru a înregistra răspunsurile
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Depanare interogări baze de date
```javascript
// database-debug.js - Utilitare de depanare a bazei de date
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

## 🚨 Proceduri de depanare de urgență

### Răspuns la probleme în producție
```bash
#!/bin/bash
# emergency-debug.sh - Debugging de urgență în producție

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

# Comută la mediul corect
azd env select "$ENVIRONMENT"

# Colectează informații critice
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

### Proceduri de rollback
```bash
# Script de revenire rapidă
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Schimbă mediul
    azd env select "$environment"
    
    # Revino la aplicație
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verifică revenirea
    echo "Verifying rollback..."
    azd show
    
    # Testează punctele critice
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashboard-uri de depanare

### Dashboard personalizat de monitorizare
```bash
# Creați interogări Application Insights pentru depanare
create_debug_queries() {
    local app_insights_name=$1
    
    # Interogare pentru erori
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Interogare pentru probleme de performanță
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Interogare pentru eșecuri de dependență
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregarea jurnalelor
```bash
# Agregarea jurnalelor din surse multiple
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

## 🔗 Resurse avansate

### Scripturi personalizate de depanare
Creează un director `scripts/debug/` cu:
- `health-check.sh` - Verificare completă a sănătății
- `performance-test.sh` - Testare automată a performanței
- `log-analyzer.py` - Parsare și analiză avansată a jurnalelor
- `resource-validator.sh` - Validare infrastructură

### Integrare monitorizare
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

## Cele mai bune practici

1. **Activează întotdeauna jurnalizarea de depanare** în medii non-producție
2. **Creează cazuri de test reproducibile** pentru probleme
3. **Documentează procedurile de depanare** pentru echipa ta
4. **Automatizează verificările de sănătate** și monitorizarea
5. **Menține instrumentele de depanare actualizate** cu modificările aplicației tale
6. **Exersează procedurile de depanare** în perioade fără incidente

## Pași următori

- [Planificarea Capacității](../pre-deployment/capacity-planning.md) - Planifică cerințele de resurse
- [Selecția SKU](../pre-deployment/sku-selection.md) - Alege nivelurile de servicii potrivite
- [Verificări Preflight](../pre-deployment/preflight-checks.md) - Validare înainte de implementare
- [Fișă de Referință](../../resources/cheat-sheet.md) - Comenzi de referință rapidă

---

**Reține**: O depanare bună înseamnă să fii sistematic, meticulos și răbdător. Aceste instrumente și tehnici te vor ajuta să diagnostichezi problemele mai rapid și mai eficient.

---

**Navigare**
- **Lecția Anterioară**: [Probleme Comune](common-issues.md)

- **Lecția Următoare**: [Planificarea Capacității](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->