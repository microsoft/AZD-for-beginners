<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:07:55+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "es"
}
-->
# Problemas Comunes y Soluciones

## Introducción

Esta guía completa de resolución de problemas cubre los problemas más frecuentes al usar Azure Developer CLI. Aprende a diagnosticar, solucionar y resolver problemas comunes relacionados con la autenticación, el despliegue, la provisión de infraestructura y la configuración de aplicaciones. Cada problema incluye síntomas detallados, causas raíz y procedimientos paso a paso para su resolución.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar técnicas de diagnóstico para problemas con Azure Developer CLI
- Comprender problemas comunes de autenticación y permisos, y sus soluciones
- Resolver fallos de despliegue, errores de provisión de infraestructura y problemas de configuración
- Implementar estrategias proactivas de monitoreo y depuración
- Aplicar metodologías sistemáticas de resolución de problemas complejos
- Configurar registros y monitoreo adecuados para prevenir problemas futuros

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Diagnosticar problemas de Azure Developer CLI utilizando herramientas de diagnóstico integradas
- Resolver problemas relacionados con autenticación, suscripción y permisos de manera independiente
- Solucionar fallos de despliegue y errores de provisión de infraestructura de manera efectiva
- Depurar problemas de configuración de aplicaciones y problemas específicos del entorno
- Implementar monitoreo y alertas para identificar problemas potenciales de manera proactiva
- Aplicar mejores prácticas para registros, depuración y flujos de trabajo de resolución de problemas

## Diagnósticos Rápidos

Antes de profundizar en problemas específicos, ejecuta estos comandos para recopilar información de diagnóstico:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Problemas de Autenticación

### Problema: "No se pudo obtener el token de acceso"
**Síntomas:**
- `azd up` falla con errores de autenticación
- Los comandos devuelven "no autorizado" o "acceso denegado"

**Soluciones:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilegios insuficientes" durante el despliegue
**Síntomas:**
- El despliegue falla con errores de permisos
- No se pueden crear ciertos recursos de Azure

**Soluciones:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Problema: Problemas de autenticación multi-inquilino
**Soluciones:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Errores de Provisión de Infraestructura

### Problema: Conflictos de nombres de recursos
**Síntomas:**
- Errores de "El nombre del recurso ya existe"
- El despliegue falla durante la creación de recursos

**Soluciones:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Problema: Ubicación/Región no disponible
**Síntomas:**
- "La ubicación 'xyz' no está disponible para el tipo de recurso"
- Ciertos SKUs no están disponibles en la región seleccionada

**Soluciones:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Errores por exceder cuotas
**Síntomas:**
- "Cuota excedida para el tipo de recurso"
- "Se alcanzó el número máximo de recursos"

**Soluciones:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

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

## 🚀 Fallos de Despliegue

### Problema: Fallos de compilación
**Síntomas:**
- La aplicación falla al compilar durante el despliegue
- Errores en la instalación de paquetes

**Soluciones:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Problema: Fallos en el despliegue de contenedores
**Síntomas:**
- Las aplicaciones en contenedores no se inician
- Errores al extraer imágenes

**Soluciones:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Fallos de conexión a la base de datos
**Síntomas:**
- La aplicación no puede conectarse a la base de datos
- Errores de tiempo de espera en la conexión

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

### Problema: Las variables de entorno no funcionan
**Síntomas:**
- La aplicación no puede leer valores de configuración
- Las variables de entorno aparecen vacías

**Soluciones:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

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

### Problema: Problemas de configuración de CORS
**Síntomas:**
- El frontend no puede llamar a la API
- Solicitudes de origen cruzado bloqueadas

**Soluciones:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Problemas de Gestión de Entornos

### Problema: Problemas al cambiar de entorno
**Síntomas:**
- Se utiliza el entorno incorrecto
- La configuración no cambia correctamente

**Soluciones:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Problema: Corrupción del entorno
**Síntomas:**
- El entorno muestra un estado inválido
- Los recursos no coinciden con la configuración

**Soluciones:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Problemas de Rendimiento

### Problema: Tiempos de despliegue lentos
**Síntomas:**
- Los despliegues tardan demasiado
- Errores de tiempo de espera durante el despliegue

**Soluciones:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Problema: Problemas de rendimiento de la aplicación
**Síntomas:**
- Tiempos de respuesta lentos
- Alto uso de recursos

**Soluciones:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Herramientas y Comandos de Resolución de Problemas

### Comandos de Depuración
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Análisis de Registros
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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
- Los problemas de autenticación persisten después de intentar todas las soluciones
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
Antes de contactar al soporte, recopila:
- Salida de `azd version`
- Salida de `azd info`
- Mensajes de error (texto completo)
- Pasos para reproducir el problema
- Detalles del entorno (`azd env show`)
- Línea de tiempo de cuándo comenzó el problema

### Script de Recopilación de Registros
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevención de Problemas

### Lista de Verificación Pre-despliegue
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

### Configuración de Monitoreo
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Mantenimiento Regular
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Recursos Relacionados

- [Guía de Depuración](debugging.md) - Técnicas avanzadas de depuración
- [Provisión de Recursos](../deployment/provisioning.md) - Resolución de problemas de infraestructura
- [Planificación de Capacidad](../pre-deployment/capacity-planning.md) - Guía de planificación de recursos
- [Selección de SKU](../pre-deployment/sku-selection.md) - Recomendaciones de niveles de servicio

---

**Consejo**: Guarda esta guía en tus marcadores y consúltala siempre que encuentres problemas. La mayoría de los problemas ya han sido vistos antes y tienen soluciones establecidas.

---

**Navegación**
- **Lección Anterior**: [Provisión de Recursos](../deployment/provisioning.md)
- **Próxima Lección**: [Guía de Depuración](debugging.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.