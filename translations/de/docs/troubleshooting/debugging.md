# Leitfaden zur Fehlerbehebung bei AZD-Bereitstellungen

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges**: [Häufige Probleme](common-issues.md)
- **➡️ Nächstes**: [AI-spezifische Fehlerbehebung](ai-troubleshooting.md)
- **🚀 Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../microsoft-foundry/production-ai-practices.md)

## Einführung

Dieser umfassende Leitfaden bietet fortgeschrittene Strategien, Tools und Techniken zur Diagnose und Lösung komplexer Probleme bei Bereitstellungen mit Azure Developer CLI. Lernen Sie systematische Fehlerbehebungsmethoden, Log-Analyse-Techniken, Leistungsprofilierung und fortgeschrittene Diagnosetools, um Bereitstellungs- und Laufzeitprobleme effizient zu lösen.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Systematische Debugging-Methoden für Probleme mit Azure Developer CLI beherrschen
- Fortgeschrittene Konfiguration und Analyse von Logs verstehen
- Strategien zur Leistungsprofilierung und -überwachung umsetzen
- Azure-Diagnosetools und -dienste für komplexe Problemlösungen nutzen
- Netzwerk-Debugging und Sicherheits-Fehlerbehebung anwenden
- Umfassende Überwachung und Alarmierung für proaktive Problemerkennung konfigurieren

## Lernergebnisse

Nach Abschluss können Sie:
- Die TRIAGE-Methode anwenden, um komplexe Bereitstellungsprobleme systematisch zu debuggen
- Umfassende Logging- und Tracing-Informationen konfigurieren und analysieren
- Azure Monitor, Application Insights und Diagnosetools effektiv nutzen
- Netzwerkverbindungs-, Authentifizierungs- und Berechtigungsprobleme eigenständig debuggen
- Strategien zur Leistungsüberwachung und -optimierung implementieren
- Eigene Debugging-Skripte und Automatisierungen für wiederkehrende Probleme erstellen

## Debugging-Methodik

### Der TRIAGE-Ansatz
- **T**ime: Wann hat das Problem begonnen?
- **R**eproduce: Kann das Problem konsistent reproduziert werden?
- **I**solate: Welche Komponente funktioniert nicht?
- **A**nalyze: Was sagen die Logs aus?
- **G**ather: Alle relevanten Informationen sammeln
- **E**scalate: Wann sollte zusätzliche Hilfe gesucht werden?

## Debug-Modus aktivieren

### Umgebungsvariablen
```bash
# Umfassendes Debugging aktivieren
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI-Debugging
export AZURE_CLI_DIAGNOSTICS=true

# Telemetrie für sauberere Ausgabe deaktivieren
export AZD_DISABLE_TELEMETRY=true
```

### Debug-Konfiguration
```bash
# Globale Debug-Konfiguration festlegen
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Trace-Logging aktivieren
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Log-Analyse-Techniken

### Verständnis der Log-Level
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturierte Log-Analyse
```bash
# Protokolle nach Ebene filtern
azd logs --level error --since 1h

# Nach Dienst filtern
azd logs --service api --level debug

# Protokolle für die Analyse exportieren
azd logs --output json > deployment-logs.json

# JSON-Protokolle mit jq analysieren
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Log-Korrelation
```bash
#!/bin/bash
# correlate-logs.sh - Korrelation von Protokollen über Dienste hinweg

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Suche über alle Dienste
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure-Protokolle durchsuchen
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Fortgeschrittene Debugging-Tools

### Azure Resource Graph-Abfragen
```bash
# Ressourcen nach Tags abfragen
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Fehlgeschlagene Bereitstellungen finden
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Ressourcenstatus überprüfen
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Netzwerk-Debugging
```bash
# Testen Sie die Konnektivität zwischen Diensten
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

# Nutzung
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container-Debugging
```bash
# Fehlerbehebung bei Container-App-Problemen
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

### Datenbankverbindungs-Debugging
```bash
# Datenbankverbindung debuggen
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

## 🔬 Leistungs-Debugging

### Überwachung der Anwendungsleistung
```bash
# Aktivieren Sie das Debugging von Application Insights
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

# Benutzerdefinierte Leistungsüberwachung
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

### Analyse der Ressourcennutzung
```bash
# Überwachen Sie die Ressourcennutzung
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

## 🧪 Tests und Validierung

### Debugging von Integrationstests
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Debug-Umgebung festlegen
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Service-Endpunkte abrufen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Gesundheitsendpunkte testen
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

# Tests ausführen
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Benutzerdefinierte Integrationstests ausführen
npm run test:integration
```

### Lasttests für Debugging
```bash
# Einfache Lastprüfung zur Identifizierung von Leistungsengpässen
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Verwendung von Apache Bench (Installation: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Wichtige Kennzahlen extrahieren
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Auf Fehler überprüfen
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktur-Debugging

### Debugging von Bicep-Vorlagen
```bash
# Bicep-Vorlagen mit detaillierter Ausgabe validieren
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaxvalidierung
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-Validierung
    az bicep lint --file "$template_file"
    
    # Was-wäre-wenn-Bereitstellung
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Vorlagenbereitstellung debuggen
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

### Analyse des Ressourcenstatus
```bash
# Analysiere Ressourcenstatus auf Inkonsistenzen
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Liste alle Ressourcen mit ihren Zuständen auf
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Überprüfe auf fehlgeschlagene Ressourcen
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

## 🔒 Sicherheits-Debugging

### Debugging des Authentifizierungsflusses
```bash
# Debuggen der Azure-Authentifizierung
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT-Token dekodieren (erfordert jq und base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debuggen des Zugriffs auf Key Vault
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

### Debugging der Netzwerksicherheit
```bash
# Debuggen Sie Netzwerksicherheitsgruppen
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Sicherheitsregeln überprüfen
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Anwendungsspezifisches Debugging

### Debugging von Node.js-Anwendungen
```javascript
// debug-middleware.js - Express-Debugging-Middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Anfragedetails protokollieren
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // res.json überschreiben, um Antworten zu protokollieren
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Debugging von Datenbankabfragen
```javascript
// Datenbank-Debugging-Dienstprogramme
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

## 🚨 Notfall-Debugging-Verfahren

### Reaktion auf Produktionsprobleme
```bash
#!/bin/bash
# emergency-debug.sh - Notfall-Produktions-Debugging

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

# Wechseln Sie zur richtigen Umgebung
azd env select "$ENVIRONMENT"

# Kritische Informationen sammeln
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

### Rollback-Verfahren
```bash
# Schnelles Rollback-Skript
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Umgebung wechseln
    azd env select "$environment"
    
    # Anwendung zurücksetzen
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Rollback überprüfen
    echo "Verifying rollback..."
    azd show
    
    # Kritische Endpunkte testen
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging-Dashboards

### Benutzerdefiniertes Überwachungs-Dashboard
```bash
# Erstellen Sie Application Insights-Abfragen zur Fehlerbehebung
create_debug_queries() {
    local app_insights_name=$1
    
    # Abfrage nach Fehlern
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Abfrage nach Leistungsproblemen
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Abfrage nach Abhängigkeitsfehlern
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Log-Aggregation
```bash
# Protokolle aus mehreren Quellen zusammenführen
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

## 🔗 Fortgeschrittene Ressourcen

### Benutzerdefinierte Debugging-Skripte
Erstellen Sie ein Verzeichnis `scripts/debug/` mit:
- `health-check.sh` - Umfassende Gesundheitsprüfung
- `performance-test.sh` - Automatisierte Leistungstests
- `log-analyzer.py` - Erweiterte Log-Analyse
- `resource-validator.sh` - Validierung der Infrastruktur

### Überwachungsintegration
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

## Best Practices

1. **Aktivieren Sie immer Debug-Logging** in Nicht-Produktionsumgebungen
2. **Erstellen Sie reproduzierbare Testfälle** für Probleme
3. **Dokumentieren Sie Debugging-Verfahren** für Ihr Team
4. **Automatisieren Sie Gesundheitsprüfungen** und Überwachung
5. **Halten Sie Debugging-Tools aktuell** mit Ihren Anwendungsänderungen
6. **Üben Sie Debugging-Verfahren** außerhalb von Vorfallzeiten

## Nächste Schritte

- [Kapazitätsplanung](../pre-deployment/capacity-planning.md) - Ressourcenanforderungen planen
- [SKU-Auswahl](../pre-deployment/sku-selection.md) - Geeignete Servicestufen auswählen
- [Preflight-Checks](../pre-deployment/preflight-checks.md) - Validierung vor der Bereitstellung
- [Spickzettel](../../resources/cheat-sheet.md) - Schnellreferenz-Befehle

---

**Denken Sie daran**: Gutes Debugging erfordert Systematik, Gründlichkeit und Geduld. Diese Tools und Techniken helfen Ihnen, Probleme schneller und effektiver zu diagnostizieren.

---

**Navigation**
- **Vorherige Lektion**: [Häufige Probleme](common-issues.md)

- **Nächste Lektion**: [Kapazitätsplanung](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->