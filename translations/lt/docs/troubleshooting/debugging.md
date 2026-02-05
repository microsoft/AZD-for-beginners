# Derinimo vadovas AZD diegimams

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Dažnos problemos](common-issues.md)
- **➡️ Kitas**: [AI specifinis trikčių šalinimas](ai-troubleshooting.md)
- **🚀 Kitas skyrius**: [8 skyrius: Produkcija ir įmonių modeliai](../microsoft-foundry/production-ai-practices.md)

## Įvadas

Šis išsamus vadovas pateikia pažangias derinimo strategijas, įrankius ir technikas, skirtas diagnozuoti ir spręsti sudėtingas problemas, susijusias su Azure Developer CLI diegimais. Sužinokite sistemingus trikčių šalinimo metodus, žurnalų analizės technikas, našumo profiliavimą ir pažangius diagnostikos įrankius, kad efektyviai spręstumėte diegimo ir veikimo problemas.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite sistemingus derinimo metodus, skirtus Azure Developer CLI problemoms
- Suprasite pažangų žurnalų konfigūravimą ir analizės technikas
- Įgyvendinsite našumo profiliavimo ir stebėjimo strategijas
- Naudosite Azure diagnostikos įrankius ir paslaugas sudėtingoms problemoms spręsti
- Taikysite tinklo derinimo ir saugumo trikčių šalinimo technikas
- Konfigūruosite išsamų stebėjimą ir įspėjimus, kad proaktyviai aptiktumėte problemas

## Mokymosi rezultatai

Baigę, galėsite:
- Taikyti TRIAGE metodiką sistemingai spręsti sudėtingas diegimo problemas
- Konfigūruoti ir analizuoti išsamią žurnalų ir sekimo informaciją
- Efektyviai naudoti Azure Monitor, Application Insights ir diagnostikos įrankius
- Savarankiškai šalinti tinklo ryšio, autentifikavimo ir leidimų problemas
- Įgyvendinti našumo stebėjimo ir optimizavimo strategijas
- Kurti pasirinktinius derinimo scenarijus ir automatizavimą pasikartojančioms problemoms

## Derinimo metodika

### TRIAGE metodas
- **T**ime: Kada problema prasidėjo?
- **R**eproduce: Ar galite ją nuolat atkurti?
- **I**solate: Kuris komponentas neveikia?
- **A**nalyze: Ką rodo žurnalai?
- **G**ather: Surinkite visą svarbią informaciją
- **E**scalate: Kada kreiptis pagalbos?

## Derinimo režimo įjungimas

### Aplinkos kintamieji
```bash
# Įgalinti išsamų derinimą
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI derinimas
export AZURE_CLI_DIAGNOSTICS=true

# Išjungti telemetriją švaresniam rezultatui
export AZD_DISABLE_TELEMETRY=true
```

### Derinimo konfigūracija
```bash
# Nustatyti derinimo konfigūraciją globaliai
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Įjungti sekimo žurnalavimą
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Žurnalų analizės technikos

### Žurnalų lygių supratimas
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Struktūrinė žurnalų analizė
```bash
# Filtruoti žurnalus pagal lygį
azd logs --level error --since 1h

# Filtruoti pagal paslaugą
azd logs --service api --level debug

# Eksportuoti žurnalus analizei
azd logs --output json > deployment-logs.json

# Analizuoti JSON žurnalus su jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Žurnalų koreliacija
```bash
#!/bin/bash
# correlate-logs.sh - Koreliuoti žurnalus tarp paslaugų

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Ieškoti visose paslaugose
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Ieškoti Azure žurnaluose
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Pažangūs derinimo įrankiai

### Azure Resource Graph užklausos
```bash
# Užklausa išteklių pagal žymes
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Rasti nepavykusius diegimus
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Patikrinti išteklių būklę
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Tinklo derinimas
```bash
# Patikrinti ryšį tarp paslaugų
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

# Naudojimas
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Konteinerių derinimas
```bash
# Derinti konteinerio programos problemas
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

### Duomenų bazės ryšio derinimas
```bash
# Derinti duomenų bazės ryšį
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

## 🔬 Našumo derinimas

### Programos našumo stebėjimas
```bash
# Įjungti „Application Insights“ derinimą
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

# Pasirinktinis našumo stebėjimas
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

### Išteklių naudojimo analizė
```bash
# Stebėkite išteklių naudojimą
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

## 🧪 Testavimas ir validacija

### Integracijos testų derinimas
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Nustatyti derinimo aplinką
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Gauti paslaugų galinius taškus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Testuoti sveikatos galinius taškus
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

# Paleisti testus
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Paleisti pasirinktinius integracijos testus
npm run test:integration
```

### Apkrovos testavimas derinimui
```bash
# Paprastas apkrovos testas našumo trūkumams nustatyti
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Naudojant Apache Bench (įdiegimas: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Išgauti pagrindinius rodiklius
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Patikrinti gedimus
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktūros derinimas

### Bicep šablonų derinimas
```bash
# Patvirtinkite Bicep šablonus su detalia išvestimi
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Sintaksės patvirtinimas
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint patvirtinimas
    az bicep lint --file "$template_file"
    
    # Kas-jei diegimas
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Derinkite šablono diegimą
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

### Išteklių būsenos analizė
```bash
# Analizuoti išteklių būsenas dėl neatitikimų
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Išvardyti visus išteklius su jų būsenomis
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Patikrinti nepavykusius išteklius
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

## 🔒 Saugumo derinimas

### Autentifikavimo srauto derinimas
```bash
# Derinti Azure autentifikaciją
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Dekoduoti JWT žetoną (reikalingi jq ir base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Derinti Key Vault prieigą
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

### Tinklo saugumo derinimas
```bash
# Derinti tinklo saugos grupes
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Patikrinti saugos taisykles
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Programoms specifinis derinimas

### Node.js programos derinimas
```javascript
// debug-middleware.js - „Express“ derinimo tarpinė programinė įranga
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Registruoti užklausos detales
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Pakeisti res.json, kad būtų registruojami atsakymai
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Duomenų bazės užklausų derinimas
```javascript
// database-debug.js - Duomenų bazės derinimo įrankiai
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

## 🚨 Skubios derinimo procedūros

### Problemos gamyboje sprendimas
```bash
#!/bin/bash
# emergency-debug.sh - Skubus gamybos derinimas

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

# Perjungti į tinkamą aplinką
azd env select "$ENVIRONMENT"

# Surinkti svarbią informaciją
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

### Atšaukimo procedūros
```bash
# Greito atstatymo scenarijus
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Perjungti aplinką
    azd env select "$environment"
    
    # Atstatyti programą
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Patikrinti atstatymą
    echo "Verifying rollback..."
    azd show
    
    # Testuoti kritinius galinius taškus
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Derinimo skydeliai

### Pasirinktinis stebėjimo skydelis
```bash
# Sukurkite „Application Insights“ užklausas derinimui
create_debug_queries() {
    local app_insights_name=$1
    
    # Užklausa klaidoms
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Užklausa našumo problemoms
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Užklausa priklausomybių gedimams
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Žurnalų agregavimas
```bash
# Surinkti žurnalus iš kelių šaltinių
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

## 🔗 Pažangūs ištekliai

### Pasirinktiniai derinimo scenarijai
Sukurkite `scripts/debug/` katalogą su:
- `health-check.sh` - Išsamus sveikatos patikrinimas
- `performance-test.sh` - Automatinis našumo testavimas
- `log-analyzer.py` - Pažangi žurnalų analizė
- `resource-validator.sh` - Infrastruktūros validacija

### Stebėjimo integracija
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

## Geriausios praktikos

1. **Visada įjunkite derinimo žurnalus** ne gamybos aplinkose
2. **Sukurkite atkuriamus testavimo atvejus** problemoms
3. **Dokumentuokite derinimo procedūras** savo komandai
4. **Automatizuokite sveikatos patikrinimus** ir stebėjimą
5. **Atnaujinkite derinimo įrankius** kartu su programos pakeitimais
6. **Praktikuokite derinimo procedūras** ne incidentų metu

## Kiti žingsniai

- [Talpos planavimas](../pre-deployment/capacity-planning.md) - Išteklių poreikių planavimas
- [SKU pasirinkimas](../pre-deployment/sku-selection.md) - Tinkamų paslaugų lygių pasirinkimas
- [Priešskrydžio patikrinimai](../pre-deployment/preflight-checks.md) - Prieš diegimą atliekama validacija
- [Trumpa atmintinė](../../resources/cheat-sheet.md) - Greitos nuorodos komandos

---

**Atminkite**: Geras derinimas yra sistemingas, kruopštus ir kantrus procesas. Šie įrankiai ir technikos padės greičiau ir efektyviau diagnozuoti problemas.

---

**Navigacija**
- **Ankstesnė pamoka**: [Dažnos problemos](common-issues.md)

- **Kita pamoka**: [Talpos planavimas](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->