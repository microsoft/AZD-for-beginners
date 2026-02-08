# Debugging-Leitfaden für AZD-Bereitstellungen

**Kapitelnavigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Zurück**: [Häufige Probleme](common-issues.md)
- **➡️ Weiter**: [KI-spezifische Fehlerbehebung](ai-troubleshooting.md)
- **🚀 Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../chapter-08-production/production-ai-practices.md)

## Einführung

Dieser umfassende Leitfaden bietet fortgeschrittene Debugging-Strategien, Werkzeuge und Techniken zur Diagnose und Behebung komplexer Probleme bei Azure Developer CLI-Bereitstellungen. Erlernen Sie systematische Fehlerbehebungs‑Methoden, Techniken zur Protokollanalyse, Performance‑Profiling und erweiterte Diagnosetools, um Bereitstellungs- und Laufzeitprobleme effizient zu lösen.

## Lernziele

Nach Abschluss dieses Leitfadens werden Sie:
- Systematische Debugging‑Methoden für Azure Developer CLI‑Probleme beherrschen
- Erweiterte Protokollkonfiguration und Techniken zur Protokollanalyse verstehen
- Performance‑Profiling- und Überwachungsstrategien umsetzen
- Azure‑Diagnosetools und -dienste für die Lösung komplexer Probleme nutzen
- Netzwerkanalyse und Sicherheits‑Fehlerbehebung anwenden
- Umfassende Überwachung und Alarmierung für proaktive Problemerkennung konfigurieren

## Lernergebnisse

Nach Abschluss werden Sie in der Lage sein:
- Die TRIAGE‑Methodik anzuwenden, um komplexe Bereitstellungsprobleme systematisch zu debuggen
- Umfassende Protokoll- und Tracing‑Informationen zu konfigurieren und zu analysieren
- Azure Monitor, Application Insights und Diagnosetools effektiv zu nutzen
- Netzwerkverbindungen, Authentifizierung und Berechtigungsprobleme eigenständig zu debuggen
- Performance‑Überwachungs‑ und Optimierungsstrategien umzusetzen
- Eigene Debugging‑Skripte und Automatisierungen für wiederkehrende Probleme zu erstellen

## Debugging‑Methodik

### The TRIAGE Approach
- **T**ime: Wann trat das Problem auf?
- **R**eproduce: Kannst du es konsistent reproduzieren?
- **I**solate: Welche Komponente schlägt fehl?
- **A**nalyze: Was sagen die Protokolle?
- **G**ather: Sammle alle relevanten Informationen
- **E**scalate: Wann sollte zusätzliche Hilfe eingeholt werden?

## Debug‑Modus aktivieren

### Umgebungsvariablen
```bash
# Umfassendes Debugging aktivieren
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI-Debugging
export AZURE_CLI_DIAGNOSTICS=true

# Telemetrie deaktivieren für sauberere Ausgabe
export AZD_DISABLE_TELEMETRY=true
```

### Debug‑Konfiguration
```bash
# Debug-Konfiguration global setzen
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Trace-Protokollierung aktivieren
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Protokollanalyse‑Techniken

### Log‑Level verstehen
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Strukturierte Protokollanalyse
```bash
# Protokolle mit Azure Monitor anzeigen (über azd monitor)
azd monitor --logs

# Anwendungsprotokolle in Echtzeit anzeigen
azd monitor --live

# Für eine detaillierte Protokollanalyse verwenden Sie die Azure CLI mit Ihrem App Service oder Ihrer Container-App:
# App Service-Protokolle
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container-App-Protokolle
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Application Insights-Protokolle zur Analyse exportieren
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Protokollkorrelation
```bash
#!/bin/bash
# correlate-logs.sh - Protokolle über mehrere Dienste hinweg mit Azure Monitor korrelieren

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Application Insights nach korrelierten Protokollen durchsuchen
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Azure-Aktivitätsprotokolle durchsuchen
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Erweiterte Debugging‑Tools

### Azure Resource Graph‑Abfragen
```bash
# Ressourcen nach Tags abfragen
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Fehlgeschlagene Bereitstellungen finden
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Ressourcengesundheit überprüfen
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Netzwerk‑Debugging
```bash
# Verbindung zwischen Diensten testen
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

# Verwendung
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Container‑Debugging
```bash
# Container-App-Probleme debuggen
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

### Datenbankverbindungs‑Debugging
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

## 🔬 Leistungs‑Debugging

### Anwendungsleistungsüberwachung
```bash
# Application Insights-Debugging aktivieren
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

### Analyse der Ressourcenauslastung
```bash
# Ressourcennutzung überwachen
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

### Integrationstest‑Debugging
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Debug-Umgebung einrichten
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Service-Endpunkte abrufen
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Health-Endpunkte testen
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

### Lasttests zur Fehlerbehebung
```bash
# Ein einfacher Lasttest, um Leistungsengpässe zu identifizieren
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Verwendet Apache Bench (Installation: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Wichtige Kennzahlen extrahieren
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Auf Fehler prüfen
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktur‑Debugging

### Bicep‑Template‑Debugging
```bash
# Bicep-Vorlagen mit detaillierter Ausgabe validieren
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntaxüberprüfung
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint-Überprüfung
    az bicep lint --file "$template_file"
    
    # What-if-Bereitstellung
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
# Ressourcenzustände auf Inkonsistenzen analysieren
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Alle Ressourcen mit ihren Zuständen auflisten
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Auf fehlgeschlagene Ressourcen prüfen
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

## 🔒 Sicherheits‑Debugging

### Debugging des Authentifizierungsflusses
```bash
# Azure-Authentifizierung debuggen
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT-Token dekodieren (benötigt jq und base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault-Zugriff debuggen
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

### Netzwerksicherheits‑Debugging
```bash
# Netzwerk-Sicherheitsgruppen debuggen
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Sicherheitsregeln prüfen
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Anwendungsspezifisches Debugging

### Node.js‑Anwendungs‑Debugging
```javascript
// debug-middleware.js - Debugging-Middleware für Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Anforderungsdetails protokollieren
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

### Datenbankabfrage‑Debugging
```javascript
// database-debug.js - Datenbank-Debugging-Dienstprogramme
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

## 🚨 Notfall‑Debugging‑Verfahren

### Reaktion bei Produktionsproblemen
```bash
#!/bin/bash
# emergency-debug.sh - Notfall-Debugging in der Produktion

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

# Zur richtigen Umgebung wechseln
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
# Azure Monitor für Fehlerprotokolle verwenden
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

### Rollback‑Verfahren
```bash
# Schnelles Rollback-Skript
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Umgebung wechseln
    azd env select "$environment"
    
    # Rollback mit Git (AZD hat kein integriertes Rollback)
    git checkout "$previous_commit"
    azd deploy
    
    # Rollback überprüfen
    echo "Verifying rollback..."
    azd show
    
    # Kritische Endpunkte testen
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Debugging‑Dashboards

### Benutzerdefiniertes Überwachungs‑Dashboard
```bash
# Application Insights-Abfragen zur Fehlerbehebung erstellen
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

### Protokollaggregation
```bash
# Protokolle aus mehreren Azure-Quellen aggregieren
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

## 🔗 Erweiterte Ressourcen

### Benutzerdefinierte Debug‑Skripte
Erstellen Sie ein Verzeichnis `scripts/debug/` mit:
- `health-check.sh` - Umfassende Gesundheitsprüfung
- `performance-test.sh` - Automatisierte Performance‑Tests
- `log-analyzer.py` - Erweiterte Protokollauswertung und -analyse
- `resource-validator.sh` - Infrastrukturvalidierung

### Monitoring‑Integration
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

## Beste Vorgehensweisen

1. **Aktivieren Sie stets die Debug‑Protokollierung** in Nicht‑Produktionsumgebungen
2. **Erstellen Sie reproduzierbare Testfälle** für Probleme
3. **Dokumentieren Sie Debugging‑Verfahren** für Ihr Team
4. **Automatisieren Sie Gesundheitsprüfungen** und Überwachung
5. **Halten Sie Debug‑Tools auf dem neuesten Stand** im Einklang mit Ihren Anwendungsänderungen
6. **Üben Sie Debugging‑Verfahren** außerhalb von Vorfallszeiten

## Nächste Schritte

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Ressourcenanforderungen planen
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Geeignete Service‑Tiers auswählen
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Vorabprüfungen vor der Bereitstellung
- [Cheat Sheet](../../resources/cheat-sheet.md) - Schnellreferenz Befehle

---

**Denken Sie daran**: Gutes Debugging bedeutet, systematisch, gründlich und geduldig zu sein. Diese Werkzeuge und Techniken helfen Ihnen, Probleme schneller und effektiver zu diagnostizieren.

---

**Navigation**
- **Vorherige Lektion**: [Häufige Probleme](common-issues.md)

- **Nächste Lektion**: [Kapazitätsplanung](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->