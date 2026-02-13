# Debugging Guide for AZD Deployments

**Chapter Navigation:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 7 - Risoluzione dei problemi e debugging
- **⬅️ Precedente**: [Common Issues](common-issues.md)
- **➡️ Successivo**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 Capitolo successivo**: [Capitolo 8: Modelli di produzione e aziendali](../chapter-08-production/production-ai-practices.md)

## Introduzione

Questa guida completa fornisce strategie avanzate di debug, strumenti e tecniche per diagnosticare e risolvere problemi complessi con le distribuzioni tramite Azure Developer CLI. Impara metodologie sistematiche di risoluzione dei problemi, tecniche di analisi dei log, profilazione delle prestazioni e strumenti diagnostici avanzati per risolvere in modo efficiente problemi di distribuzione e di runtime.

## Obiettivi di apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare metodologie sistematiche di debug per problemi con Azure Developer CLI
- Comprendere la configurazione avanzata dei log e le tecniche di analisi dei log
- Implementare strategie di profilazione delle prestazioni e monitoraggio
- Utilizzare efficacemente gli strumenti diagnostici e i servizi di Azure per la risoluzione di problemi complessi
- Applicare tecniche di debug della rete e risoluzione dei problemi di sicurezza
- Configurare monitoraggio e avvisi completi per il rilevamento proattivo dei problemi

## Risultati di apprendimento

Al termine, sarai in grado di:
- Applicare la metodologia TRIAGE per eseguire il debug sistematico di problemi di distribuzione complessi
- Configurare e analizzare informazioni complete di logging e tracing
- Utilizzare Azure Monitor, Application Insights e strumenti diagnostici in modo efficace
- Eseguire il debug della connettività di rete, dell'autenticazione e dei problemi di autorizzazione in autonomia
- Implementare strategie di monitoraggio e ottimizzazione delle prestazioni
- Creare script di debug personalizzati e automazioni per problemi ricorrenti

## Metodologia di debug

### L'approccio TRIAGE
- **T**empo: Quando è iniziato il problema?
- **R**iproduci: È possibile riprodurlo in modo coerente?
- **I**sola: Quale componente sta fallendo?
- **A**nalizza: Cosa dicono i log?
- **R**accogli: Raccogli tutte le informazioni rilevanti
- **E**scalare: Quando cercare aiuto aggiuntivo

## Abilitare la modalità di debug

### Variabili d'ambiente
```bash
# Abilita il debug completo
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Debug della CLI di Azure
export AZURE_CLI_DIAGNOSTICS=true

# Disabilita la telemetria per un output più pulito
export AZD_DISABLE_TELEMETRY=true
```

### Configurazione di debug
```bash
# Imposta la configurazione di debug a livello globale
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Abilita il tracciamento dei log
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Tecniche di analisi dei log

### Comprendere i livelli di log
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Analisi dei log strutturati
```bash
# Visualizza i log con Azure Monitor (tramite azd monitor)
azd monitor --logs

# Visualizza i log dell'applicazione in tempo reale
azd monitor --live

# Per un'analisi dettagliata dei log, usa Azure CLI con il tuo App Service o Container App:
# Log di App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Log di Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Esporta i log di Application Insights per l'analisi
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Correlazione dei log
```bash
#!/bin/bash
# correlate-logs.sh - Correlare i log tra i servizi tramite Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Cerca in Application Insights i log correlati
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Cerca i log attività di Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Strumenti di debug avanzati

### Query di Azure Resource Graph
```bash
# Interrogare risorse per tag
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Trovare distribuzioni non riuscite
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Verificare lo stato di salute delle risorse
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Debug della rete
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

### Debug dei container
```bash
# Esegui il debug dei problemi dell'app in container
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

### Debug della connessione al database
```bash
# Eseguire il debug della connettività al database
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

## 🔬 Debug delle prestazioni

### Monitoraggio delle prestazioni dell'applicazione
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

### Analisi dell'utilizzo delle risorse
```bash
# Monitorare l'utilizzo delle risorse
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

## 🧪 Test e convalida

### Debug dei test di integrazione
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

# Verifica gli endpoint di integrità
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

# Esegui i test di integrazione personalizzati
npm run test:integration
```

### Test di carico per il debugging
```bash
# Semplice test di carico per identificare i colli di bottiglia delle prestazioni
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Usando Apache Bench (installazione: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Estrarre le metriche chiave
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Verificare la presenza di errori
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Debug dell'infrastruttura

### Debug dei template Bicep
```bash
# Convalidare i template Bicep con output dettagliato
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Validazione della sintassi
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Validazione lint
    az bicep lint --file "$template_file"
    
    # Simulazione di distribuzione
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug della distribuzione del template
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

### Analisi dello stato delle risorse
```bash
# Analizzare gli stati delle risorse per incoerenze
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Elencare tutte le risorse con i loro stati
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Controllare risorse fallite
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

## 🔒 Debug della sicurezza

### Debug del flusso di autenticazione
```bash
# Debug dell'autenticazione di Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decodifica del token JWT (richiede jq e base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug dell'accesso a Key Vault
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

### Debug della sicurezza di rete
```bash
# Esegui il debug dei gruppi di sicurezza della rete
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Verifica le regole di sicurezza
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Debug specifico per applicazione

### Debug delle applicazioni Node.js
```javascript
// debug-middleware.js - middleware di debug per Express
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
    
    // Sovrascrive res.json per registrare le risposte
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Debug delle query del database
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

## 🚨 Procedure di debug di emergenza

### Risposta a problemi in produzione
```bash
#!/bin/bash
# emergency-debug.sh - Debug di emergenza in produzione

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
# Usa Azure Monitor per i log degli errori
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

### Procedure di rollback
```bash
# Script di rollback rapido
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Cambia ambiente
    azd env select "$environment"
    
    # Rollback tramite Git (AZD non dispone di rollback integrato)
    git checkout "$previous_commit"
    azd deploy
    
    # Verificare il rollback
    echo "Verifying rollback..."
    azd show
    
    # Testare gli endpoint critici
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Dashboard di debug

### Dashboard di monitoraggio personalizzata
```bash
# Crea query di Application Insights per il debug
create_debug_queries() {
    local app_insights_name=$1
    
    # Query per gli errori
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query per problemi di prestazioni
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query per i guasti delle dipendenze
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Aggregazione dei log
```bash
# Aggrega i log da più sorgenti Azure
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

## 🔗 Risorse avanzate

### Script di debug personalizzati
Crea una directory `scripts/debug/` con:
- `health-check.sh` - Verifica di integrità completa
- `performance-test.sh` - Test automatici delle prestazioni
- `log-analyzer.py` - Parsing e analisi avanzata dei log
- `resource-validator.sh` - Validazione dell'infrastruttura

### Integrazione del monitoraggio
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

## Migliori pratiche

1. **Abilitare sempre il logging di debug** negli ambienti non di produzione
2. **Creare casi di test riproducibili** per i problemi
3. **Documentare le procedure di debugging** per il tuo team
4. **Automatizzare i controlli di integrità** e il monitoraggio
5. **Mantenere aggiornati gli strumenti di debug** con le modifiche dell'applicazione
6. **Esercitarsi nelle procedure di debugging** durante i periodi senza incidenti

## Prossimi passi

- [Pianificazione della capacità](../chapter-06-pre-deployment/capacity-planning.md) - Pianificare i requisiti delle risorse
- [Selezione SKU](../chapter-06-pre-deployment/sku-selection.md) - Scegliere livelli di servizio appropriati
- [Controlli preliminari](../chapter-06-pre-deployment/preflight-checks.md) - Validazione pre-distribuzione
- [Riepilogo rapido](../../resources/cheat-sheet.md) - Comandi di riferimento rapido

---

**Ricorda**: Un buon debugging consiste nell'essere sistematici, approfonditi e pazienti. Questi strumenti e tecniche ti aiuteranno a diagnosticare i problemi più rapidamente e in modo più efficace.

---

**Navigazione**
- **Lezione precedente**: [Problemi comuni](common-issues.md)

- **Lezione successiva**: [Pianificazione della capacità](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto mediante il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di tenere presente che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella lingua di origine deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale eseguita da un traduttore umano. Non ci riteniamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->