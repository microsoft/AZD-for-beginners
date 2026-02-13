# Guía de depuración para despliegues de AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 7 - Solución de problemas y depuración
- **⬅️ Anterior**: [Problemas comunes](common-issues.md)
- **➡️ Siguiente**: [Solución de problemas específica de IA](ai-troubleshooting.md)
- **🚀 Siguiente capítulo**: [Capítulo 8: Patrones de producción y empresariales](../chapter-08-production/production-ai-practices.md)

## Introducción

Esta guía integral proporciona estrategias avanzadas de depuración, herramientas y técnicas para diagnosticar y resolver problemas complejos con los despliegues de Azure Developer CLI. Aprenda metodologías sistemáticas de solución de problemas, técnicas de análisis de registros, perfilado de rendimiento y herramientas de diagnóstico avanzadas para resolver de forma eficiente problemas de despliegue y en tiempo de ejecución.

## Objetivos de aprendizaje

Al completar esta guía, usted:
- Dominará metodologías sistemáticas de depuración para problemas con Azure Developer CLI
- Entenderá la configuración avanzada de registro y técnicas de análisis de registros
- Implementará estrategias de perfilado y monitoreo de rendimiento
- Utilizará herramientas y servicios de diagnóstico de Azure para la resolución de problemas complejos
- Aplicará técnicas de depuración de red y solución de problemas de seguridad
- Configurará monitoreo y alertas integrales para la detección proactiva de problemas

## Resultados de aprendizaje

Al finalizar, usted podrá:
- Aplicar la metodología TRIAGE para depurar sistemáticamente problemas complejos de despliegue
- Configurar y analizar información completa de registro y trazas
- Usar Azure Monitor, Application Insights y herramientas de diagnóstico de forma efectiva
- Depurar de manera independiente problemas de conectividad de red, autenticación y permisos
- Implementar estrategias de monitoreo y optimización de rendimiento
- Crear scripts de depuración personalizados y automatización para problemas recurrentes

## Metodología de depuración

### Enfoque TRIAGE
- **T**iempo: ¿Cuándo comenzó el problema?
- **R**eproducir: ¿Puede reproducirlo de forma consistente?
- **I**dentificar: ¿Qué componente está fallando?
- **A**nalizar: ¿Qué nos dicen los registros?
- **G**ather: Recopilar toda la información relevante
- **E**scalar: ¿Cuándo solicitar ayuda adicional?

## Activar el modo de depuración

### Variables de entorno
```bash
# Habilitar depuración exhaustiva
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Depuración de Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Desactivar la telemetría para una salida más limpia
export AZD_DISABLE_TELEMETRY=true
```

### Configuración de depuración
```bash
# Establecer la configuración de depuración globalmente
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Habilitar el registro de trazas
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Técnicas de análisis de registros

### Comprender los niveles de registro
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Análisis de registros estructurados
```bash
# Ver registros con Azure Monitor (vía azd monitor)
azd monitor --logs

# Ver registros de la aplicación en tiempo real
azd monitor --live

# Para un análisis detallado de los registros, use Azure CLI con su App Service o Container App:
# Registros de App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Registros de Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Exportar registros de Application Insights para su análisis
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Correlación de registros
```bash
#!/bin/bash
# correlate-logs.sh - Correlacionar registros entre servicios usando Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Buscar registros correlacionados en Application Insights
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Buscar registros de actividad de Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Herramientas avanzadas de depuración

### Consultas de Azure Resource Graph
```bash
# Consultar recursos por etiquetas
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Encontrar implementaciones fallidas
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Comprobar la salud del recurso
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Depuración de red
```bash
# Probar la conectividad entre servicios
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

# Uso
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Depuración de contenedores
```bash
# Depurar problemas de aplicaciones en contenedores
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

### Depuración de conexión a la base de datos
```bash
# Depurar la conectividad con la base de datos
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

## 🔬 Depuración de rendimiento

### Monitoreo del rendimiento de la aplicación
```bash
# Habilitar la depuración de Application Insights
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

# Monitoreo de rendimiento personalizado
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

### Análisis de utilización de recursos
```bash
# Supervisar el uso de recursos
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

## 🧪 Pruebas y validación

### Depuración de pruebas de integración
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Configurar entorno de depuración
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Obtener endpoints del servicio
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Probar endpoints de salud
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

# Ejecutar pruebas
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Ejecutar pruebas de integración personalizadas
npm run test:integration
```

### Pruebas de carga para depuración
```bash
# Prueba de carga simple para identificar cuellos de botella en el rendimiento
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Usando Apache Bench (instalar: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extraer métricas clave
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Comprobar si hay fallos
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Depuración de infraestructura

### Depuración de plantillas Bicep
```bash
# Validar plantillas Bicep con salida detallada
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Validación de sintaxis
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Validación de lint
    az bicep lint --file "$template_file"
    
    # Despliegue What-If
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Depurar despliegue de plantillas
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

### Análisis del estado de recursos
```bash
# Analizar los estados de los recursos en busca de inconsistencias
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Listar todos los recursos con sus estados
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Comprobar recursos fallidos
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

## 🔒 Depuración de seguridad

### Depuración del flujo de autenticación
```bash
# Depurar la autenticación de Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Decodificar el token JWT (requiere jq y base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Depurar el acceso a Key Vault
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

### Depuración de seguridad de red
```bash
# Depurar grupos de seguridad de red
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Comprobar reglas de seguridad
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Depuración específica de la aplicación

### Depuración de aplicaciones Node.js
```javascript
// debug-middleware.js - middleware de depuración de Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Registrar detalles de la solicitud
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Sobrescribir res.json para registrar las respuestas
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Depuración de consultas de bases de datos
```javascript
// database-debug.js - Utilidades de depuración de la base de datos
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

## 🚨 Procedimientos de depuración de emergencia

### Respuesta ante incidentes en producción
```bash
#!/bin/bash
# emergency-debug.sh - Depuración de emergencia en producción

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

# Cambiar al entorno correcto
azd env select "$ENVIRONMENT"

# Recopilar información crítica
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Usar Azure Monitor para los registros de errores
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

### Procedimientos de reversión
```bash
# Script de reversión rápida
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Cambiar entorno
    azd env select "$environment"
    
    # Reversión usando Git (AZD no tiene reversión incorporada)
    git checkout "$previous_commit"
    azd deploy
    
    # Verificar la reversión
    echo "Verifying rollback..."
    azd show
    
    # Probar endpoints críticos
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Paneles de depuración

### Panel de monitorización personalizado
```bash
# Crear consultas de Application Insights para depuración
create_debug_queries() {
    local app_insights_name=$1
    
    # Consulta de errores
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Consulta para problemas de rendimiento
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Consulta para fallos de dependencias
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Agregación de registros
```bash
# Agregar registros de múltiples fuentes de Azure
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

## 🔗 Recursos avanzados

### Scripts de depuración personalizados
Cree un directorio `scripts/debug/` con:
- `health-check.sh` - Comprobación integral de estado
- `performance-test.sh` - Pruebas de rendimiento automatizadas
- `log-analyzer.py` - Análisis avanzado y procesamiento de registros
- `resource-validator.sh` - Validación de infraestructura

### Integración de monitorización
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

## Mejores prácticas

1. **Habilite siempre el registro de depuración** en entornos que no sean de producción
2. **Cree casos de prueba reproducibles** para los problemas
3. **Documente los procedimientos de depuración** para su equipo
4. **Automatice las comprobaciones de estado** y la monitorización
5. **Mantenga las herramientas de depuración actualizadas** con los cambios de su aplicación
6. **Practique los procedimientos de depuración** en momentos sin incidentes

## Próximos pasos

- [Planificación de capacidad](../chapter-06-pre-deployment/capacity-planning.md) - Planificar los requisitos de recursos
- [Selección de SKU](../chapter-06-pre-deployment/sku-selection.md) - Elegir los niveles de servicio apropiados
- [Comprobaciones previas](../chapter-06-pre-deployment/preflight-checks.md) - Validación previa al despliegue
- [Hoja de referencia](../../resources/cheat-sheet.md) - Comandos de referencia rápida

---

**Recuerde**: Una buena depuración consiste en ser sistemático, minucioso y paciente. Estas herramientas y técnicas le ayudarán a diagnosticar problemas de forma más rápida y eficaz.

---

**Navegación**
- **Lección anterior**: [Problemas comunes](common-issues.md)

- **Próxima lección**: [Planificación de capacidad](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->