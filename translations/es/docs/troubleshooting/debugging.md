<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5066dbb0b4f24e493697f6430505b115",
  "translation_date": "2025-09-09T17:12:05+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "es"
}
-->
# Guía de Depuración - Técnicas Avanzadas de Resolución de Problemas

## Introducción

Esta guía completa proporciona estrategias avanzadas de depuración, herramientas y técnicas para diagnosticar y resolver problemas complejos en los despliegues de Azure Developer CLI. Aprende metodologías sistemáticas de resolución de problemas, técnicas de análisis de registros, perfiles de rendimiento y herramientas de diagnóstico avanzadas para resolver eficientemente problemas de despliegue y ejecución.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar metodologías sistemáticas de depuración para problemas de Azure Developer CLI
- Comprender configuraciones avanzadas de registro y técnicas de análisis de registros
- Implementar estrategias de monitoreo y perfilado de rendimiento
- Utilizar herramientas y servicios de diagnóstico de Azure para resolver problemas complejos
- Aplicar técnicas de depuración de red y resolución de problemas de seguridad
- Configurar monitoreo integral y alertas para la detección proactiva de problemas

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Aplicar la metodología TRIAGE para depurar sistemáticamente problemas complejos de despliegue
- Configurar y analizar información completa de registros y trazas
- Utilizar Azure Monitor, Application Insights y herramientas de diagnóstico de manera efectiva
- Depurar problemas de conectividad de red, autenticación y permisos de forma independiente
- Implementar estrategias de monitoreo y optimización de rendimiento
- Crear scripts personalizados de depuración y automatización para problemas recurrentes

## Metodología de Depuración

### El Enfoque TRIAGE
- **T**iempo: ¿Cuándo comenzó el problema?
- **R**eproducir: ¿Puedes reproducirlo consistentemente?
- **I**solar: ¿Qué componente está fallando?
- **A**nalizar: ¿Qué nos dicen los registros?
- **R**ecopilar: Reúne toda la información relevante
- **E**scalar: ¿Cuándo buscar ayuda adicional?

## Activar el Modo de Depuración

### Variables de Entorno
```bash
# Enable comprehensive debugging
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI debugging
export AZURE_CLI_DIAGNOSTICS=true

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### Configuración de Depuración
```bash
# Set debug configuration globally
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Enable trace logging
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Técnicas de Análisis de Registros

### Comprender los Niveles de Registro
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Análisis Estructurado de Registros
```bash
# Filter logs by level
azd logs --level error --since 1h

# Filter by service
azd logs --service api --level debug

# Export logs for analysis
azd logs --output json > deployment-logs.json

# Parse JSON logs with jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Correlación de Registros
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search across all services
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Search Azure logs
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Herramientas Avanzadas de Depuración

### Consultas de Azure Resource Graph
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find failed deployments
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Depuración de Red
```bash
# Test connectivity between services
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

# Usage
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Depuración de Contenedores
```bash
# Debug container app issues
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

### Depuración de Conexiones a Bases de Datos
```bash
# Debug database connectivity
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

## 🔬 Depuración de Rendimiento

### Monitoreo de Rendimiento de Aplicaciones
```bash
# Enable Application Insights debugging
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

# Custom performance monitoring
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

### Análisis de Utilización de Recursos
```bash
# Monitor resource usage
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

## 🧪 Pruebas y Validación

### Depuración de Pruebas de Integración
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
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

# Run tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run custom integration tests
npm run test:integration
```

### Pruebas de Carga para Depuración
```bash
# Simple load test to identify performance bottlenecks
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Using Apache Bench (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extract key metrics
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Check for failures
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Depuración de Infraestructura

### Depuración de Plantillas Bicep
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # What-if deployment
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Debug template deployment
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

### Análisis del Estado de Recursos
```bash
# Analyze resource states for inconsistencies
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources with their states
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Check for failed resources
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

## 🔒 Depuración de Seguridad

### Depuración de Flujos de Autenticación
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decode JWT token (requires jq and base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug Key Vault access
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

### Depuración de Seguridad de Red
```bash
# Debug network security groups
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Check security rules
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Depuración Específica de Aplicaciones

### Depuración de Aplicaciones Node.js
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Depuración de Consultas a Bases de Datos
```javascript
// database-debug.js - Database debugging utilities
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

## 🚨 Procedimientos de Depuración de Emergencia

### Respuesta a Problemas en Producción
```bash
#!/bin/bash
# emergency-debug.sh - Emergency production debugging

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

# Switch to correct environment
azd env select "$ENVIRONMENT"

# Collect critical information
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

### Procedimientos de Reversión
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback application
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Tableros de Depuración

### Tablero de Monitoreo Personalizado
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1
    
    # Query for errors
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query for performance issues
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query for dependency failures
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregación de Registros
```bash
# Aggregate logs from multiple sources
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

## 🔗 Recursos Avanzados

### Scripts Personalizados de Depuración
Crea un directorio `scripts/debug/` con:
- `health-check.sh` - Verificación integral de salud
- `performance-test.sh` - Pruebas automatizadas de rendimiento
- `log-analyzer.py` - Análisis avanzado de registros
- `resource-validator.sh` - Validación de infraestructura

### Integración de Monitoreo
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

## Mejores Prácticas

1. **Siempre habilita el registro de depuración** en entornos no productivos
2. **Crea casos de prueba reproducibles** para los problemas
3. **Documenta los procedimientos de depuración** para tu equipo
4. **Automatiza las verificaciones de salud** y el monitoreo
5. **Mantén las herramientas de depuración actualizadas** con los cambios de tu aplicación
6. **Practica los procedimientos de depuración** durante tiempos sin incidentes

## Próximos Pasos

- [Planificación de Capacidad](../pre-deployment/capacity-planning.md) - Planifica los requisitos de recursos
- [Selección de SKU](../pre-deployment/sku-selection.md) - Elige niveles de servicio adecuados
- [Verificaciones Preliminares](../pre-deployment/preflight-checks.md) - Validación previa al despliegue
- [Hoja de Referencia](../../resources/cheat-sheet.md) - Comandos de referencia rápida

---

**Recuerda**: Una buena depuración se trata de ser sistemático, minucioso y paciente. Estas herramientas y técnicas te ayudarán a diagnosticar problemas de manera más rápida y efectiva.

---

**Navegación**
- **Lección Anterior**: [Problemas Comunes](common-issues.md)
- **Próxima Lección**: [Planificación de Capacidad](../pre-deployment/capacity-planning.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.