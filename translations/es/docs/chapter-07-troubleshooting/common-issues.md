# Problemas Comunes y Soluciones

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Capítulo Anterior**: [Capítulo 6: Revisiones Previas](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Siguiente**: [Guía de Depuración](debugging.md)
- **🚀 Siguiente Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../chapter-08-production/production-ai-practices.md)

## Introducción

Esta guía integral de solución de problemas cubre los problemas más frecuentes al usar Azure Developer CLI. Aprende a diagnosticar, solucionar y resolver problemas comunes con autenticación, implementación, provisión de infraestructura y configuración de aplicaciones. Cada problema incluye síntomas detallados, causas raíz y procedimientos de resolución paso a paso.

## Objetivos de Aprendizaje

Al completar esta guía, usted:
- Dominará técnicas de diagnóstico para problemas con Azure Developer CLI
- Entenderá problemas comunes de autenticación y permisos y sus soluciones
- Resolverá fallos de implementación, errores de provisión de infraestructura y problemas de configuración
- Implementará estrategias proactivas de monitoreo y depuración
- Aplicará metodologías sistemáticas para solucionar problemas complejos
- Configurará el registro y monitoreo adecuados para prevenir problemas futuros

## Resultados de Aprendizaje

Al finalizar, usted podrá:
- Diagnosticar problemas de Azure Developer CLI usando herramientas diagnósticas integradas
- Resolver por sí mismo problemas relacionados con autenticación, suscripción y permisos
- Solucionar eficazmente fallas en la implementación y errores de provisión de infraestructura
- Depurar problemas de configuración de aplicaciones y problemas específicos del entorno
- Implementar monitoreo y alertas para identificar proactivamente posibles problemas
- Aplicar mejores prácticas para registro, depuración y flujos de trabajo de resolución de problemas

## Diagnósticos Rápidos

> Reemplace nombres/IDs de ejemplo con los valores de su entorno. Fragmentos de Bash, Bicep, JavaScript y archivos de parámetros están etiquetados por separado abajo; no son un script ejecutable único. Revise operaciones destructivas y oculte secretos antes de compartir diagnósticos. `azd monitor --logs` abre un navegador; no transmite registros del terminal.

Antes de profundizar en problemas específicos, ejecute estos comandos para recopilar información diagnóstica:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Problemas de Autenticación

### Problema: "Error al obtener token de acceso"
**Síntomas:**
- `azd up` falla con errores de autenticación
- Los comandos devuelven "no autorizado" o "acceso denegado"

**Soluciones:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Problema: "Privilegios insuficientes" durante la implementación
**Síntomas:**
- La implementación falla con errores de permisos
- No puede crear ciertos recursos de Azure

**Soluciones:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Problemas de autenticación multiinquilino
**Soluciones:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Errores en la Provisión de Infraestructura

### Problema: Conflictos de nombres de recursos
**Síntomas:**
- Errores de "El nombre del recurso ya existe"
- La implementación falla durante la creación de recursos

**Soluciones:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Problema: Ubicación/Región no disponible
**Síntomas:**
- "La ubicación 'xyz' no está disponible para el tipo de recurso"
- Ciertas SKUs no disponibles en la región seleccionada

**Soluciones:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Cambiar la variable de ubicación no migra los recursos existentes. Un grupo de recursos o recurso existente puede rechazar un cambio de ubicación; use un entorno separado para una reimplementación regional.

### Problema: Errores por cuota excedida
**Síntomas:**
- "Cuota excedida para el tipo de recurso"
- "Número máximo de recursos alcanzado"

**Soluciones:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Para desarrollo, elija una SKU más pequeña soportada en `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Errores en plantillas Bicep
**Síntomas:**
- Fallos en la validación de plantillas
- Errores de sintaxis en archivos Bicep

**Soluciones:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Fallos en la Implementación

### Problema: Fallos en la compilación
**Síntomas:**
- La aplicación falla al compilar durante la implementación
- Errores en la instalación de paquetes

**Soluciones:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problema: Fallos en la implementación de contenedores
**Síntomas:**
- Las aplicaciones en contenedores no se inician
- Errores al extraer imagen

**Soluciones:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Fallos en la conexión a la base de datos
**Síntomas:**
- La aplicación no puede conectar con la base de datos
- Errores de tiempo de espera en conexión

**Soluciones:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuración

### Problema: Variables de entorno que no funcionan
**Síntomas:**
- La app no puede leer valores de configuración
- Variables de entorno aparecen vacías

**Soluciones:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas con certificados SSL/TLS
**Síntomas:**
- HTTPS no funciona
- Errores de validación de certificados

**Soluciones:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas de configuración CORS
**Síntomas:**
- El frontend no puede llamar a la API
- Solicitud cross-origin bloqueada

**Soluciones:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Actualice su aplicación Express existente (con `cors` importado):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Problemas de Gestión de Entornos

### Problema: Problemas al cambiar de entorno
**Síntomas:**
- Se está usando un entorno incorrecto
- La configuración no cambia correctamente

**Soluciones:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problema: Corrupción del entorno
**Síntomas:**
- El entorno muestra un estado no válido
- Los recursos no coinciden con la configuración

**Soluciones:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Problemas de Rendimiento

### Problema: Tiempos de implementación lentos
**Síntomas:**
- Las implementaciones tardan demasiado
- Tiempos de espera durante la implementación

**Soluciones:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Problema: Problemas de rendimiento de la aplicación
**Síntomas:**
- Tiempos de respuesta lentos
- Alto uso de recursos

**Soluciones:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Herramientas y Comandos para Solución de Problemas

### Comandos de Depuración
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Análisis de Registros
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigación de Recursos
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obtener Ayuda Adicional

### Cuándo Escalar
- Problemas de autenticación persisten después de probar todas las soluciones
- Problemas de infraestructura con servicios de Azure
- Problemas relacionados con facturación o suscripción
- Preocupaciones o incidentes de seguridad

### Canales de Soporte
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Información para Recopilar
Antes de contactar soporte, recopile:
- Salida de `azd version`
- Salida de `azd config show`
- `azd show` salida (estado de la implementación actual)
- Mensajes de error (texto completo)
- Pasos para reproducir el problema
- Detalles del entorno redactados (nunca comparta `azd env get-values` sin procesar, que podría contener secretos)
- Cronología de cuándo comenzó el problema

### Script de recopilación de registros
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevención de problemas

### Lista de verificación previa a la implementación
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Configuración de monitoreo
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Mantenimiento regular
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Recursos relacionados

- [Guía de depuración](debugging.md) - Técnicas avanzadas de depuración
- [Recursos de aprovisionamiento](../chapter-04-infrastructure/provisioning.md) - Solución de problemas de infraestructura
- [Planificación de capacidad](../chapter-06-pre-deployment/capacity-planning.md) - Guía para planificación de recursos
- [Selección de SKU](../chapter-06-pre-deployment/sku-selection.md) - Recomendaciones de nivel de servicio

---

**Consejo**: Mantenga esta guía como favorito y consúltela siempre que encuentre problemas. ¡La mayoría de los problemas ya se han visto antes y tienen soluciones establecidas!

---

**Navegación**
- **Lección anterior**: [Recursos de aprovisionamiento](../chapter-04-infrastructure/provisioning.md)
- **Próxima lección**: [Guía de depuración](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->