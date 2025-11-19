<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-19T20:29:19+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "es"
}
-->
# Problemas Comunes y Soluciones

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 7 - Solución de Problemas y Depuración
- **⬅️ Capítulo Anterior**: [Capítulo 6: Verificaciones Previas](../pre-deployment/preflight-checks.md)
- **➡️ Siguiente**: [Guía de Depuración](debugging.md)
- **🚀 Próximo Capítulo**: [Capítulo 8: Patrones de Producción y Empresariales](../microsoft-foundry/production-ai-practices.md)

## Introducción

Esta guía integral de solución de problemas cubre los problemas más frecuentes al usar Azure Developer CLI. Aprende a diagnosticar, solucionar y resolver problemas comunes relacionados con la autenticación, el despliegue, la provisión de infraestructura y la configuración de aplicaciones. Cada problema incluye síntomas detallados, causas raíz y procedimientos paso a paso para su resolución.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Dominar técnicas de diagnóstico para problemas de Azure Developer CLI
- Comprender problemas comunes de autenticación y permisos, y sus soluciones
- Resolver fallos de despliegue, errores de provisión de infraestructura y problemas de configuración
- Implementar estrategias proactivas de monitoreo y depuración
- Aplicar metodologías sistemáticas de solución de problemas para problemas complejos
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
# Verificar la versión y el estado de azd
azd version
azd config list

# Verificar la autenticación de Azure
az account show
az account list

# Comprobar el entorno actual
azd env show
azd env get-values

# Habilitar el registro de depuración
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
# 1. Reautenticar con Azure CLI
az login
az account show

# 2. Borrar credenciales en caché
az account clear
az login

# 3. Usar flujo de código de dispositivo (para sistemas sin interfaz gráfica)
az login --use-device-code

# 4. Establecer suscripción explícita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilegios insuficientes" durante el despliegue
**Síntomas:**
- El despliegue falla con errores de permisos
- No se pueden crear ciertos recursos de Azure

**Soluciones:**
```bash
# 1. Verifica tus asignaciones de roles de Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Asegúrate de tener los roles requeridos
# - Colaborador (para la creación de recursos)
# - Administrador de acceso de usuario (para asignaciones de roles)

# 3. Contacta a tu administrador de Azure para obtener los permisos adecuados
```

### Problema: Problemas de autenticación multi-inquilino
**Soluciones:**
```bash
# 1. Iniciar sesión con un inquilino específico
az login --tenant "your-tenant-id"

# 2. Establecer inquilino en la configuración
azd config set auth.tenantId "your-tenant-id"

# 3. Limpiar la caché del inquilino si se cambian los inquilinos
az account clear
```

## 🏗️ Errores de Provisión de Infraestructura

### Problema: Conflictos de nombres de recursos
**Síntomas:**
- Errores de "El nombre del recurso ya existe"
- El despliegue falla durante la creación de recursos

**Soluciones:**
```bash
# 1. Utilice nombres de recursos únicos con tokens
# En su plantilla Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Cambie el nombre del entorno
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Limpie los recursos existentes
azd down --force --purge
```

### Problema: Ubicación/Región no disponible
**Síntomas:**
- "La ubicación 'xyz' no está disponible para el tipo de recurso"
- Ciertos SKUs no están disponibles en la región seleccionada

**Soluciones:**
```bash
# 1. Verificar ubicaciones disponibles para tipos de recursos
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Usar regiones comúnmente disponibles
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Verificar disponibilidad del servicio por región
# Visitar: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Errores de cuota excedida
**Síntomas:**
- "Cuota excedida para el tipo de recurso"
- "Se alcanzó el número máximo de recursos"

**Soluciones:**
```bash
# 1. Verificar el uso actual de la cuota
az vm list-usage --location eastus2 -o table

# 2. Solicitar aumento de cuota a través del portal de Azure
# Ir a: Suscripciones > Uso + cuotas

# 3. Usar SKUs más pequeños para desarrollo
# En main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Limpiar los recursos no utilizados
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Errores en plantillas Bicep
**Síntomas:**
- Fallos en la validación de plantillas
- Errores de sintaxis en archivos Bicep

**Soluciones:**
```bash
# 1. Validar la sintaxis de Bicep
az bicep build --file infra/main.bicep

# 2. Usar el linter de Bicep
az bicep lint --file infra/main.bicep

# 3. Verificar la sintaxis del archivo de parámetros
cat infra/main.parameters.json | jq '.'

# 4. Previsualizar los cambios de implementación
azd provision --preview
```

## 🚀 Fallos de Despliegue

### Problema: Fallos de compilación
**Síntomas:**
- La aplicación falla al compilar durante el despliegue
- Errores de instalación de paquetes

**Soluciones:**
```bash
# 1. Verificar registros de compilación
azd logs --service web
azd deploy --service web --debug

# 2. Probar la compilación localmente
cd src/web
npm install
npm run build

# 3. Verificar la compatibilidad de versiones de Node.js/Python
node --version  # Debe coincidir con la configuración de azure.yaml
python --version

# 4. Limpiar la caché de compilación
rm -rf node_modules package-lock.json
npm install

# 5. Verificar el Dockerfile si se usan contenedores
docker build -t test-image .
docker run --rm test-image
```

### Problema: Fallos en el despliegue de contenedores
**Síntomas:**
- Las aplicaciones de contenedor no se inician
- Errores al extraer imágenes

**Soluciones:**
```bash
# 1. Probar la construcción de Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificar los registros del contenedor
azd logs --service api --follow

# 3. Verificar el acceso al registro del contenedor
az acr login --name myregistry

# 4. Verificar la configuración de la aplicación del contenedor
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Fallos de conexión a la base de datos
**Síntomas:**
- La aplicación no puede conectarse a la base de datos
- Errores de tiempo de espera de conexión

**Soluciones:**
```bash
# 1. Verificar las reglas del firewall de la base de datos
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Probar la conectividad desde la aplicación
# Agregar temporalmente a tu aplicación:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verificar el formato de la cadena de conexión
azd env get-values | grep DATABASE

# 4. Verificar el estado del servidor de la base de datos
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemas de Configuración

### Problema: Las variables de entorno no funcionan
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

# 4. Comprobar la configuración del servicio de la aplicación
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemas con certificados SSL/TLS
**Síntomas:**
- HTTPS no funciona
- Errores de validación de certificados

**Soluciones:**
```bash
# 1. Verificar el estado del certificado SSL
az webapp config ssl list --resource-group myrg

# 2. Habilitar solo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Agregar un dominio personalizado (si es necesario)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemas de configuración CORS
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

# 3. Verificar si se está ejecutando en las URLs correctas
azd show
```

## 🌍 Problemas de Gestión de Entornos

### Problema: Problemas al cambiar de entorno
**Síntomas:**
- Se utiliza el entorno incorrecto
- La configuración no cambia correctamente

**Soluciones:**
```bash
# 1. Listar todos los entornos
azd env list

# 2. Seleccionar explícitamente el entorno
azd env select production

# 3. Verificar el entorno actual
azd env show

# 4. Crear un nuevo entorno si está dañado
azd env new production-new
azd env select production-new
```

### Problema: Corrupción del entorno
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
# Actualizar manualmente .azure/production/config.json con los IDs de los recursos
```

## 🔍 Problemas de Rendimiento

### Problema: Tiempos de despliegue lentos
**Síntomas:**
- Los despliegues tardan demasiado
- Errores de tiempo de espera durante el despliegue

**Soluciones:**
```bash
# 1. Habilitar despliegue paralelo
azd config set deploy.parallelism 5

# 2. Usar despliegues incrementales
azd deploy --incremental

# 3. Optimizar el proceso de construcción
# En package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verificar ubicaciones de recursos (usar la misma región)
azd config set defaults.location eastus2
```

### Problema: Problemas de rendimiento de la aplicación
**Síntomas:**
- Tiempos de respuesta lentos
- Alto uso de recursos

**Soluciones:**
```bash
# 1. Escalar recursos
# Actualizar SKU en main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Habilitar el monitoreo de Application Insights
azd monitor

# 3. Revisar los registros de la aplicación para cuellos de botella
azd logs --service api --follow

# 4. Implementar almacenamiento en caché
# Agregar caché de Redis a tu infraestructura
```

## 🛠️ Herramientas y Comandos de Solución de Problemas

### Comandos de Depuración
```bash
# Depuración integral
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verificar información del sistema
azd info

# Validar configuración
azd config validate

# Probar conectividad
curl -v https://myapp.azurewebsites.net/health
```

### Análisis de Registros
```bash
# Registros de la aplicación
azd logs --service web --follow
azd logs --service api --since 1h

# Registros de recursos de Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Registros de contenedores (para aplicaciones de contenedores)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigación de Recursos
```bash
# Listar todos los recursos
az resource list --resource-group myrg -o table

# Verificar el estado del recurso
az webapp show --name myapp --resource-group myrg --query state

# Diagnósticos de red
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
# 1. Verificar el estado del servicio de Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Crear un ticket de soporte de Azure
# Ir a: https://portal.azure.com -> Ayuda + soporte

# 3. Recursos de la comunidad
# - Stack Overflow: etiqueta azure-developer-cli
# - Problemas en GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Información para Recopilar
Antes de contactar al soporte, recopila:
- Salida de `azd version`
- Salida de `azd info`
- Mensajes de error (texto completo)
- Pasos para reproducir el problema
- Detalles del entorno (`azd env show`)
- Cronología de cuándo comenzó el problema

### Script de Recopilación de Registros
```bash
#!/bin/bash
# recopilar-información-de-depuración.sh

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
# 1. Validar autenticación
az account show

# 2. Verificar cuotas y límites
az vm list-usage --location eastus2

# 3. Validar plantillas
az bicep build --file infra/main.bicep

# 4. Probar localmente primero
npm run build
npm run test

# 5. Usar implementaciones de prueba
azd provision --preview
```

### Configuración de Monitoreo
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

### Mantenimiento Regular
```bash
# Revisiones de salud semanales
./scripts/health-check.sh

# Revisión de costos mensual
az consumption usage list --billing-period-name 202401

# Revisión de seguridad trimestral
az security assessment list --resource-group myrg
```

## Recursos Relacionados

- [Guía de Depuración](debugging.md) - Técnicas avanzadas de depuración
- [Provisión de Recursos](../deployment/provisioning.md) - Solución de problemas de infraestructura
- [Planificación de Capacidad](../pre-deployment/capacity-planning.md) - Guía de planificación de recursos
- [Selección de SKU](../pre-deployment/sku-selection.md) - Recomendaciones de niveles de servicio

---

**Consejo**: Guarda esta guía en tus favoritos y consúltala siempre que encuentres problemas. La mayoría de los problemas ya han sido vistos antes y tienen soluciones establecidas.

---

**Navegación**
- **Lección Anterior**: [Provisión de Recursos](../deployment/provisioning.md)
- **Próxima Lección**: [Guía de Depuración](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->