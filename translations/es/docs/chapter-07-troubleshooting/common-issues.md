# Problemas y soluciones comunes

**Chapter Navigation:**
- **📚 Course Home**: [AZD para principiantes](../../README.md)
- **📖 Current Chapter**: Capítulo 7 - Solución de problemas y depuración
- **⬅️ Previous Chapter**: [Capítulo 6: Verificaciones previas al despliegue](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Guía de depuración](debugging.md)
- **🚀 Next Chapter**: [Capítulo 8: Patrones de producción y empresariales](../chapter-08-production/production-ai-practices.md)

## Introducción

Esta guía de solución de problemas abarca los problemas más frecuentes al usar Azure Developer CLI. Aprende a diagnosticar, solucionar y resolver problemas comunes con autenticación, despliegue, aprovisionamiento de infraestructura y configuración de aplicaciones. Cada problema incluye síntomas detallados, causas raíz y procedimientos de resolución paso a paso.

## Objetivos de aprendizaje

Al completar esta guía, usted:
- Dominará técnicas de diagnóstico para problemas con Azure Developer CLI
- Entenderá problemas comunes de autenticación y permisos y sus soluciones
- Resolverá fallos de despliegue, errores de aprovisionamiento de infraestructura y problemas de configuración
- Implementará estrategias proactivas de monitoreo y depuración
- Aplicará metodologías sistemáticas de solución de problemas para problemas complejos
- Configurará el registro y monitoreo adecuados para prevenir problemas futuros

## Resultados del aprendizaje

Al finalizar, podrá:
- Diagnosticar problemas de Azure Developer CLI usando herramientas diagnósticas incorporadas
- Resolver problemas de autenticación, suscripción y permisos de forma independiente
- Solucionar fallos de despliegue y errores de aprovisionamiento de infraestructura de manera efectiva
- Depurar problemas de configuración de aplicaciones y problemas específicos del entorno
- Implementar monitoreo y alertas para identificar proactivamente problemas potenciales
- Aplicar buenas prácticas para registro, depuración y flujos de trabajo de resolución de problemas

## Diagnósticos rápidos

Antes de profundizar en problemas específicos, ejecute estos comandos para recopilar información diagnóstica:

```bash
# Comprobar la versión y el estado de azd
azd version
azd config show

# Verificar la autenticación de Azure
az account show
az account list

# Comprobar el entorno actual
azd env list
azd env get-values

# Habilitar el registro de depuración
export AZD_DEBUG=true
azd <command> --debug
```

## Problemas de autenticación

### Issue: "Failed to get access token"
**Síntomas:**
- `azd up` falla con errores de autenticación
- Los comandos devuelven "unauthorized" o "access denied"

**Soluciones:**
```bash
# 1. Vuelva a autenticarse con Azure CLI
az login
az account show

# 2. Borre las credenciales en caché
az account clear
az login

# 3. Utilice el flujo de código de dispositivo (para sistemas sin interfaz gráfica)
az login --use-device-code

# 4. Establezca la suscripción explícita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Issue: "Insufficient privileges" during deployment
**Síntomas:**
- El despliegue falla con errores de permisos
- No se pueden crear ciertos recursos de Azure

**Soluciones:**
```bash
# 1. Comprueba tus asignaciones de roles en Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Asegúrate de tener los roles requeridos
# - Colaborador (para la creación de recursos)
# - Administrador de acceso de usuario (para asignaciones de roles)

# 3. Contacta a tu administrador de Azure para obtener los permisos adecuados
```

### Issue: Multi-tenant authentication problems
**Soluciones:**
```bash
# 1. Iniciar sesión con un tenant específico
az login --tenant "your-tenant-id"

# 2. Establecer el tenant en la configuración
azd config set auth.tenantId "your-tenant-id"

# 3. Borrar la caché del tenant si se cambia de tenant
az account clear
```

## 🏗️ Errores de aprovisionamiento de infraestructura

### Issue: Resource name conflicts
**Síntomas:**
- Errores de "The resource name already exists"
- El despliegue falla durante la creación de recursos

**Soluciones:**
```bash
# 1. Usa nombres de recursos únicos con tokens
# En tu plantilla Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Cambia el nombre del entorno
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Limpia los recursos existentes
azd down --force --purge
```

### Issue: Location/Region not available
**Síntomas:**
- "The location 'xyz' is not available for resource type"
- Ciertos SKUs no están disponibles en la región seleccionada

**Soluciones:**
```bash
# 1. Compruebe las ubicaciones disponibles para los tipos de recursos
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Utilice regiones comúnmente disponibles
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Compruebe la disponibilidad del servicio por región
# Visite: https://azure.microsoft.com/global-infrastructure/services/
```

### Issue: Quota exceeded errors
**Síntomas:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Soluciones:**
```bash
# 1. Verificar el uso actual de la cuota
az vm list-usage --location eastus2 -o table

# 2. Solicitar un aumento de cuota a través del portal de Azure
# Ir a: Suscripciones > Uso + cuotas

# 3. Usar SKUs más pequeños para desarrollo
# En main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Eliminar recursos no utilizados
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Issue: Bicep template errors
**Síntomas:**
- Fallos de validación de plantillas
- Errores de sintaxis en archivos Bicep

**Soluciones:**
```bash
# 1. Validar la sintaxis de Bicep
az bicep build --file infra/main.bicep

# 2. Usar el linter de Bicep
az bicep lint --file infra/main.bicep

# 3. Comprobar la sintaxis del archivo de parámetros
cat infra/main.parameters.json | jq '.'

# 4. Previsualizar los cambios de implementación
azd provision --preview
```

## 🚀 Fallos de despliegue

### Issue: Build failures
**Síntomas:**
- La aplicación no se compila durante el despliegue
- Errores al instalar paquetes

**Soluciones:**
```bash
# 1. Revisar la salida de la compilación con la bandera de depuración
azd deploy --service web --debug

# 2. Ver el estado del servicio desplegado
azd show

# 3. Probar la compilación localmente
cd src/web
npm install
npm run build

# 3. Comprobar la compatibilidad de versiones de Node.js y Python
node --version  # Debe coincidir con la configuración de azure.yaml
python --version

# 4. Limpiar la caché de compilación
rm -rf node_modules package-lock.json
npm install

# 5. Revisar el Dockerfile si se usan contenedores
docker build -t test-image .
docker run --rm test-image
```

### Issue: Container deployment failures
**Síntomas:**
- Las aplicaciones en contenedores no arrancan
- Errores al extraer la imagen

**Soluciones:**
```bash
# 1. Probar la compilación de Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificar los registros del contenedor usando Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Supervisar la aplicación a través de azd
azd monitor --logs

# 3. Verificar el acceso al registro de contenedores
az acr login --name myregistry

# 4. Comprobar la configuración de la aplicación de contenedores
az containerapp show --name my-app --resource-group my-rg
```

### Issue: Database connection failures
**Síntomas:**
- La aplicación no puede conectarse a la base de datos
- Errores de tiempo de espera de conexión

**Soluciones:**
```bash
# 1. Comprueba las reglas de firewall de la base de datos
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Prueba la conectividad desde la aplicación
# Añade a tu aplicación temporalmente:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifica el formato de la cadena de conexión
azd env get-values | grep DATABASE

# 4. Comprueba el estado del servidor de base de datos
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de configuración

### Issue: Environment variables not working
**Síntomas:**
- La aplicación no puede leer valores de configuración
- Las variables de entorno aparecen vacías

**Soluciones:**
```bash
# 1. Verificar que las variables de entorno estén configuradas
azd env get-values
azd env get DATABASE_URL

# 2. Comprobar los nombres de las variables en azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reiniciar la aplicación
azd deploy --service web

# 4. Comprobar la configuración del servicio de aplicaciones
az webapp config appsettings list --name myapp --resource-group myrg
```

### Issue: SSL/TLS certificate problems
**Síntomas:**
- HTTPS no funciona
- Errores de validación del certificado

**Soluciones:**
```bash
# 1. Comprobar el estado del certificado SSL
az webapp config ssl list --resource-group myrg

# 2. Habilitar solo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Añadir dominio personalizado (si es necesario)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Issue: CORS configuration problems
**Síntomas:**
- El frontend no puede llamar a la API
- Solicitud de origen cruzado bloqueada

**Soluciones:**
```bash
# 1. Configurar CORS para App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Actualizar la API para manejar CORS
# En Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Comprobar si se está ejecutando en las URL correctas
azd show
```

## 🌍 Problemas de gestión de entornos

### Issue: Environment switching problems
**Síntomas:**
- Se está usando el entorno incorrecto
- La configuración no cambia correctamente

**Soluciones:**
```bash
# 1. Listar todos los entornos
azd env list

# 2. Seleccionar explícitamente el entorno
azd env select production

# 3. Verificar el entorno actual
azd env list

# 4. Crear un nuevo entorno si está corrupto
azd env new production-new
azd env select production-new
```

### Issue: Environment corruption
**Síntomas:**
- El entorno muestra un estado inválido
- Los recursos no coinciden con la configuración

**Soluciones:**
```bash
# 1. Actualizar el estado del entorno
azd env refresh

# 2. Restablecer la configuración del entorno
azd env new production-reset
# Copiar las variables de entorno requeridas
azd env set DATABASE_URL "your-value"

# 3. Importar recursos existentes (si es posible)
# Actualizar manualmente .azure/production/config.json con los identificadores de recursos
```

## 🔍 Problemas de rendimiento

### Issue: Slow deployment times
**Síntomas:**
- Los despliegues tardan demasiado
- Timeouts durante el despliegue

**Soluciones:**
```bash
# 1. Despliega servicios específicos para iterar más rápido
azd deploy --service web
azd deploy --service api

# 2. Usa despliegue solo de código cuando la infraestructura no cambie
azd deploy  # Más rápido que azd up

# 3. Optimiza el proceso de compilación
# En package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verifica las ubicaciones de los recursos (usa la misma región)
azd config set defaults.location eastus2
```

### Issue: Application performance problems
**Síntomas:**
- Respuestas lentas
- Alto uso de recursos

**Soluciones:**
```bash
# 1. Escala los recursos
# Actualiza el SKU en main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Habilita el monitoreo de Application Insights
azd monitor --overview

# 3. Revisa los registros de la aplicación en Azure
az webapp log tail --name myapp --resource-group myrg
# o para Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementa la caché
# Agrega caché Redis a tu infraestructura
```

## 🛠️ Herramientas y comandos para la solución de problemas

### Debug Commands
```bash
# Depuración exhaustiva
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Comprobar la versión de azd
azd version

# Ver la configuración actual
azd config show

# Probar la conectividad
curl -v https://myapp.azurewebsites.net/health
```

### Log Analysis
```bash
# Registros de la aplicación mediante Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Supervisar la aplicación con azd
azd monitor --logs
azd monitor --live

# Registros de recursos de Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Registros de contenedores (para Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# Listar todos los recursos
az resource list --resource-group myrg -o table

# Comprobar el estado del recurso
az webapp show --name myapp --resource-group myrg --query state

# Diagnóstico de red
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Obtener ayuda adicional

### Cuándo escalar
- Los problemas de autenticación persisten después de intentar todas las soluciones
- Problemas de infraestructura con servicios de Azure
- Problemas relacionados con facturación o suscripción
- Preocupaciones o incidentes de seguridad

### Canales de soporte
```bash
# 1. Comprobar el estado de Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Crear un ticket de soporte de Azure
# Ir a: https://portal.azure.com -> Ayuda y soporte

# 3. Recursos comunitarios
# - Stack Overflow: etiqueta azure-developer-cli
# - Incidencias en GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Información para recopilar
Antes de contactar con soporte, recopile:
- `azd version` output
- `azd config show` output
- `azd show` output (estado actual del despliegue)
- Mensajes de error (texto completo)
- Pasos para reproducir el problema
- Detalles del entorno (`azd env get-values`)
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
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevención de problemas

### Lista de verificación previa al despliegue
```bash
# 1. Validar la autenticación
az account show

# 2. Revisar cuotas y límites
az vm list-usage --location eastus2

# 3. Validar plantillas
az bicep build --file infra/main.bicep

# 4. Probar primero localmente
npm run build
npm run test

# 5. Usar despliegues en modo simulación
azd provision --preview
```

### Configuración de monitoreo
```bash
# Habilitar Application Insights
# Agregar a main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configurar alertas
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Mantenimiento regular
```bash
# Controles de salud semanales
./scripts/health-check.sh

# Revisión mensual de costos
az consumption usage list --billing-period-name 202401

# Revisión trimestral de seguridad
az security assessment list --resource-group myrg
```

## Recursos relacionados

- [Guía de depuración](debugging.md) - Técnicas avanzadas de depuración
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Resolución de problemas de infraestructura
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Orientación sobre planificación de recursos
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Recomendaciones de niveles de servicio

---

**Consejo**: Mantenga esta guía marcada y consúltela siempre que encuentre problemas. ¡La mayoría de los problemas ya se han visto antes y tienen soluciones establecidas!

---

**Navigation**
- **Previous Lesson**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Guía de depuración](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->