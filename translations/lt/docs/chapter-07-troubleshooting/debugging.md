# Derinimo vadovas AZD diegimams

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Common Issues](common-issues.md)
- **➡️ Sekantis**: [AI-Specific Troubleshooting](ai-troubleshooting.md)
- **🚀 Kitas skyrius**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## Įvadas

Šis išsamus vadovas pateikia pažangias derinimo strategijas, įrankius ir technikas Azure Developer CLI diegimų sudėtingoms problemoms diagnozuoti ir spręsti. Išmoksite sistemingas trikčių šalinimo metodikas, žurnalų analizės technikas, našumo profilį ir pažangius diagnostikos įrankius, kad efektyviai išspręstumėte diegimo ir vykdymo problemų.

## Mokymosi tikslai

Baigę šį vadovą jūs:
- Įvaldysite sistemingas derinimo metodikas Azure Developer CLI problemoms spręsti
- Suprasite pažangią žurnaliavimo konfigūraciją ir žurnalų analizės metodikas
- Įgyvendinsite našumo profilį ir stebėjimo strategijas
- Naudosite Azure diagnostikos įrankius ir paslaugas sudėtingoms problemoms spręsti
- Taikysite tinklo derinimo ir saugumo trikčių šalinimo technikas
- Konfigūruosite išsamią stebėseną ir įspėjimus dėl proaktyvaus problemų aptikimo

## Mokymosi rezultatai

Baigę kursą galėsite:
- Taikyti TRIAGE metodiką sistemingai derinant sudėtingas diegimo problemas
- Konfigūruoti ir analizuoti išsamią žurnaliavimo ir sekimo informaciją
- Efektyviai naudoti Azure Monitor, Application Insights ir diagnostikos įrankius
- Savarankiškai derinti tinklo ryšio, autentifikacijos ir leidimų problemas
- Įgyvendinti našumo stebėjimo ir optimizavimo strategijas
- Kurti pasirinktinius derinimo skriptus ir automatizaciją pasikartojančioms problemoms

## Derinimo metodika

### TRIAGE požiūris
- **L**aikas: Kada problema prasidėjo?
- **A**tkūrimas: Ar galite tai nuosekliai atkurti?
- **I**zoliuoti: Kuri komponentė neveikia?
- **A**nalyzė: Ką mums sako žurnalai?
- **S**urinkite: Surinkite visą susijusią informaciją
- **E**skalacija: Kada kreiptis papildomos pagalbos

## Derinimo režimo įgalinimas

### Aplinkos kintamieji
```bash
# Įgalinti išsamų derinimą
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI derinimas
export AZURE_CLI_DIAGNOSTICS=true

# Išjungti telemetriją, kad išvestis būtų švaresnė
export AZD_DISABLE_TELEMETRY=true
```

### Derinimo konfigūracija
```bash
# Nustatyti derinimo konfigūraciją globaliai
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Įjungti detalų žurnalavimą
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

### Struktūruota žurnalų analizė
```bash
# Peržiūrėkite žurnalus naudodami Azure Monitor (per azd monitor)
azd monitor --logs

# Peržiūrėkite programos žurnalus realiu laiku
azd monitor --live

# Išsamiam žurnalų analizei naudokite Azure CLI su savo App Service arba Container App:
# App Service žurnalai
az webapp log tail --name <app-name> --resource-group <rg-name>

# Container App žurnalai
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Eksportuokite Application Insights žurnalus analizei
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Žurnalų koreliacija
```bash
#!/bin/bash
# correlate-logs.sh - Susieti žurnalus tarp paslaugų naudojant Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Ieškoti susietų žurnalų Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Ieškoti Azure veiklos žurnalų
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Išplėstiniai derinimo įrankiai

### Azure Resource Graph užklausos
```bash
# Ieškoti išteklių pagal žymas
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
# Trikčių šalinimas konteinerinėje programoje
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
# Įgalinti Application Insights derinimą
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

# Tinkintas našumo stebėjimas
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
# Stebėti resursų naudojimą
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

## 🧪 Testavimas ir patikra

### Integracinių testų derinimas
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

# Patikrinti sveikatos galinius taškus
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

# Paleisti pasirinktinius integracinius testus
npm run test:integration
```

### Krovos testavimas derinimui
```bash
# Paprastas apkrovos testas, skirtas nustatyti našumo butelio kaklelius
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Naudojant Apache Bench (įdiegti: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Išgauti pagrindinius rodiklius
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Patikrinti klaidas
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Infrastruktūros derinimas

### Bicep šablonų derinimas
```bash
# Išsami Bicep šablonų patikra
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Sintaksės patikra
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint patikra
    az bicep lint --file "$template_file"
    
    # What-if diegimas
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Šablono diegimo derinimas
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

### Išteklų būklės analizė
```bash
# Analizuoti resursų būsenas dėl neatitikimų
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Išvardinti visus resursus su jų būsenomis
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Patikrinti, ar yra nepavykusių resursų
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

### Autentifikacijos srauto derinimas
```bash
# Azure autentifikacijos derinimas
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

# Key Vault prieigos derinimas
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
# Derinti tinklo saugumo grupes
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Patikrinti saugumo taisykles
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Programos specifinis derinimas

### Node.js programos derinimas
```javascript
// debug-middleware.js - Express derinimo tarpinis sluoksnis
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
    
    // Perrašyti res.json, kad žurnaluotų atsakymus
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

## 🚨 Avarinės derinimo procedūros

### Reagavimas į problemas produkcijoje
```bash
#!/bin/bash
# emergency-debug.sh - Avarinis gamybos derinimas

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

# Perjungti į teisingą aplinką
azd env select "$ENVIRONMENT"

# Surinkti kritinę informaciją
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Naudoti Azure Monitor klaidų žurnalams
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

### Atsukimo procedūros
```bash
# Greitas atšaukimo skriptas
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Perjungti aplinką
    azd env select "$environment"
    
    # Atšaukimas naudojant Git (AZD neturi integruoto atšaukimo)
    git checkout "$previous_commit"
    azd deploy
    
    # Patikrinti atšaukimą
    echo "Verifying rollback..."
    azd show
    
    # Išbandyti kritinius galinius taškus
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Derinimo prietaisų skydai

### Tinkintas stebėjimo skydas
```bash
# Sukurti Application Insights užklausas derinimui
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

### Žurnalų agregacija
```bash
# Sujungti žurnalus iš kelių Azure šaltinių
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

## 🔗 Išplėstiniai ištekliai

### Vartotojo derinimo skriptai
Sukurkite katalogą `scripts/debug/` su:
- `health-check.sh` - Išsamus sveikatos tikrinimas
- `performance-test.sh` - Automatizuoti našumo testai
- `log-analyzer.py` - Pažangus žurnalų analizavimas ir apdorojimas
- `resource-validator.sh` - Infrastruktūros patikra

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

1. **Visada įjunkite derinimo žurnaliavimą** neprodukcinėse aplinkose
2. **Sukurkite atkuriamus testinius atvejus** problemoms
3. **Dokumentuokite derinimo procedūras** savo komandai
4. **Automatizuokite sveikatos tikrinimus** ir stebėjimą
5. **Laikykite derinimo įrankius atnaujintus** kartu su programos pakeitimais
6. **Praktikuokite derinimo procedūras** neincidentiniais laikais

## Tolimesni žingsniai

- [Kapaciteto planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Planuokite išteklių reikalavimus
- [SKU pasirinkimas](../chapter-06-pre-deployment/sku-selection.md) - Pasirinkite tinkamus paslaugų lygius
- [Išankstiniai patikrinimai](../chapter-06-pre-deployment/preflight-checks.md) - Išankstinė diegimo validacija
- [Atmintinė](../../resources/cheat-sheet.md) - Greitos komandos

---

**Prisiminkite**: Geras derinimas yra sistemingas, kruopštus ir kantrus. Šie įrankiai ir technikos padės greičiau ir veiksmingiau diagnozuoti problemas.

---

**Naršymas**
- **Ankstesnė pamoka**: [Common Issues](common-issues.md)

- **Kita pamoka**: [Kapaciteto planavimas](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės pareiškimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Esant kritinei informacijai rekomenduojama pasitelkti profesionalų vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->