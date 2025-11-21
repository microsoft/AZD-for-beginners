<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-20T22:16:11+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "it"
}
-->
# Guida al Debug per i Deployment AZD

**Navigazione Capitolo:**
- **📚 Corso Home**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 7 - Risoluzione dei Problemi e Debug
- **⬅️ Precedente**: [Problemi Comuni](common-issues.md)
- **➡️ Successivo**: [Risoluzione dei Problemi Specifici per l'AI](ai-troubleshooting.md)
- **🚀 Prossimo Capitolo**: [Capitolo 8: Modelli per la Produzione e l'Impresa](../microsoft-foundry/production-ai-practices.md)

## Introduzione

Questa guida completa fornisce strategie avanzate di debug, strumenti e tecniche per diagnosticare e risolvere problemi complessi con i deployment di Azure Developer CLI. Impara metodologie sistematiche di troubleshooting, tecniche di analisi dei log, profilazione delle prestazioni e strumenti diagnostici avanzati per risolvere in modo efficiente problemi di deployment e runtime.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare metodologie sistematiche di debug per problemi con Azure Developer CLI
- Comprendere configurazioni avanzate di logging e tecniche di analisi dei log
- Implementare strategie di profilazione e monitoraggio delle prestazioni
- Utilizzare strumenti e servizi diagnostici di Azure per risolvere problemi complessi
- Applicare tecniche di debug di rete e risoluzione dei problemi di sicurezza
- Configurare un monitoraggio completo e avvisi per il rilevamento proattivo dei problemi

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Applicare la metodologia TRIAGE per eseguire il debug sistematico di problemi complessi di deployment
- Configurare e analizzare informazioni complete di logging e tracing
- Utilizzare Azure Monitor, Application Insights e strumenti diagnostici in modo efficace
- Risolvere autonomamente problemi di connettività di rete, autenticazione e permessi
- Implementare strategie di monitoraggio e ottimizzazione delle prestazioni
- Creare script di debug personalizzati e automazioni per problemi ricorrenti

## Metodologia di Debug

### L'Approccio TRIAGE
- **T**empo: Quando è iniziato il problema?
- **R**iproduci: Puoi riprodurlo in modo consistente?
- **I**sola: Quale componente sta fallendo?
- **A**nalizza: Cosa ci dicono i log?
- **R**accogli: Raccogli tutte le informazioni rilevanti
- **E**scala: Quando è il momento di chiedere ulteriore aiuto

## Abilitare la Modalità Debug

### Variabili d'Ambiente
```bash
# Abilita il debug completo
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Debugging CLI di Azure
export AZURE_CLI_DIAGNOSTICS=true

# Disabilita la telemetria per un output più pulito
export AZD_DISABLE_TELEMETRY=true
```

### Configurazione Debug
```bash
# Imposta la configurazione di debug globalmente
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Abilita il logging di traccia
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Tecniche di Analisi dei Log

### Comprendere i Livelli di Log
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Analisi Strutturata dei Log
```bash
# Filtra i log per livello
azd logs --level error --since 1h

# Filtra per servizio
azd logs --service api --level debug

# Esporta i log per l'analisi
azd logs --output json > deployment-logs.json

# Analizza i log JSON con jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Correlazione dei Log
```bash
#!/bin/bash
# correlate-logs.sh - Correlare i log tra i servizi

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Cerca tra tutti i servizi
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Cerca i log di Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Strumenti Avanzati di Debug

### Query di Azure Resource Graph
```bash
# Interroga risorse per tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Trova distribuzioni fallite
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Controlla lo stato di salute delle risorse
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Debug di Rete
```bash
# Testare la connettività tra i servizi
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

# Utilizzo
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Debug di Container
```bash
# Risolvi problemi dell'app container
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

### Debug della Connessione al Database
```bash
# Debug connessione al database
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

## 🔬 Debug delle Prestazioni

### Monitoraggio delle Prestazioni dell'Applicazione
```bash
# Abilita il debug di Application Insights
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

# Monitoraggio delle prestazioni personalizzato
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

### Analisi dell'Utilizzo delle Risorse
```bash
# Monitora l'utilizzo delle risorse
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

## 🧪 Test e Validazione

### Debug dei Test di Integrazione
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Imposta l'ambiente di debug
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Ottieni gli endpoint del servizio
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testa gli endpoint di salute
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

# Esegui i test
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Esegui test di integrazione personalizzati
npm run test:integration
```

### Test di Carico per il Debug
```bash
# Test di carico semplice per identificare i colli di bottiglia delle prestazioni
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Utilizzo di Apache Bench (installazione: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Estrarre metriche chiave
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Controllare eventuali errori
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Debug dell'Infrastruttura

### Debug dei Template Bicep
```bash
# Convalida i modelli Bicep con output dettagliato
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Convalida della sintassi
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Convalida del lint
    az bicep lint --file "$template_file"
    
    # Distribuzione "What-if"
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug della distribuzione del modello
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

### Analisi dello Stato delle Risorse
```bash
# Analizzare gli stati delle risorse per incongruenze
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Elencare tutte le risorse con i loro stati
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Controllare le risorse non riuscite
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

## 🔒 Debug della Sicurezza

### Debug del Flusso di Autenticazione
```bash
# Debug autenticazione Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decodifica token JWT (richiede jq e base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug accesso a Key Vault
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

### Debug della Sicurezza di Rete
```bash
# Debugga i gruppi di sicurezza della rete
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Controlla le regole di sicurezza
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Debug Specifico per le Applicazioni

### Debug delle Applicazioni Node.js
```javascript
// debug-middleware.js - Middleware di debug di Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Registra i dettagli della richiesta
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Sovrascrivi res.json per registrare le risposte
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Debug delle Query al Database
```javascript
// database-debug.js - Utilità di debug del database
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

## 🚨 Procedure di Debug d'Emergenza

### Risposta ai Problemi in Produzione
```bash
#!/bin/bash
# emergency-debug.sh - Debugging di emergenza in produzione

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

# Passa all'ambiente corretto
azd env select "$ENVIRONMENT"

# Raccogli informazioni critiche
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

### Procedure di Rollback
```bash
# Script di rollback rapido
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Cambia ambiente
    azd env select "$environment"
    
    # Ripristina applicazione
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verifica rollback
    echo "Verifying rollback..."
    azd show
    
    # Testa endpoint critici
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashboard di Debug

### Dashboard di Monitoraggio Personalizzato
```bash
# Crea query di Application Insights per il debug
create_debug_queries() {
    local app_insights_name=$1
    
    # Query per errori
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query per problemi di prestazioni
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query per guasti delle dipendenze
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Aggregazione dei Log
```bash
# Aggregare i log da più fonti
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

## 🔗 Risorse Avanzate

### Script di Debug Personalizzati
Crea una directory `scripts/debug/` con:
- `health-check.sh` - Controllo completo dello stato di salute
- `performance-test.sh` - Test delle prestazioni automatizzato
- `log-analyzer.py` - Analisi avanzata dei log
- `resource-validator.sh` - Validazione dell'infrastruttura

### Integrazione del Monitoraggio
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

## Migliori Pratiche

1. **Abilita sempre il logging di debug** negli ambienti non di produzione
2. **Crea casi di test riproducibili** per i problemi
3. **Documenta le procedure di debug** per il tuo team
4. **Automatizza i controlli di stato** e il monitoraggio
5. **Mantieni aggiornati gli strumenti di debug** con i cambiamenti dell'applicazione
6. **Esercitati con le procedure di debug** durante i periodi non critici

## Prossimi Passi

- [Pianificazione della Capacità](../pre-deployment/capacity-planning.md) - Pianifica i requisiti delle risorse
- [Selezione degli SKU](../pre-deployment/sku-selection.md) - Scegli i livelli di servizio appropriati
- [Controlli Preliminari](../pre-deployment/preflight-checks.md) - Validazione pre-deployment
- [Cheat Sheet](../../resources/cheat-sheet.md) - Comandi di riferimento rapido

---

**Ricorda**: Un buon debug richiede sistematicità, accuratezza e pazienza. Questi strumenti e tecniche ti aiuteranno a diagnosticare i problemi in modo più rapido ed efficace.

---

**Navigazione**
- **Lezione Precedente**: [Problemi Comuni](common-issues.md)

- **Prossima Lezione**: [Pianificazione della Capacità](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->