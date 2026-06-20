# Hoja de referencia de comandos - Comandos esenciales de AZD

**Referencia rápida para todos los capítulos**
- **📚 Inicio del curso**: [AZD para Principiantes](../README.md)
- **📖 Inicio rápido**: [Capítulo 1: Fundamentos e Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desarrollo orientado a IA](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzado**: [Capítulo 4: Infraestructura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducción

Esta hoja de referencia completa proporciona acceso rápido a los comandos más utilizados de la Azure Developer CLI, organizados por categoría con ejemplos prácticos. Perfecta para consultas rápidas durante el desarrollo, la resolución de problemas y las operaciones diarias con proyectos azd.

## Objetivos de aprendizaje

Al usar esta hoja de referencia, usted:
- Tendrá acceso instantáneo a comandos y sintaxis esenciales de Azure Developer CLI
- Comprenderá la organización de los comandos por categorías funcionales y casos de uso
- Consultará ejemplos prácticos para escenarios comunes de desarrollo y despliegue
- Accederá a comandos de solución de problemas para resolución rápida de incidencias
- Encontrará opciones avanzadas de configuración y personalización de manera eficiente
- Localizará comandos de gestión de entornos y flujos de trabajo multi-entorno

## Resultados de aprendizaje

Con la referencia habitual a esta hoja, usted podrá:
- Ejecutar comandos azd con confianza sin tener que consultar la documentación completa
- Resolver rápidamente problemas comunes usando los comandos de diagnóstico apropiados
- Gestionar eficientemente múltiples entornos y escenarios de despliegue
- Aplicar funciones avanzadas y opciones de configuración de azd según sea necesario
- Solucionar problemas de despliegue usando secuencias sistemáticas de comandos
- Optimizar flujos de trabajo mediante el uso eficaz de atajos y opciones de azd

## Comandos para empezar

### Autenticación
```bash
# Iniciar sesión en Azure mediante AZD
azd auth login

# Iniciar sesión en Azure CLI (AZD usa esto internamente)
az login

# Comprobar la cuenta actual
az account show

# Establecer la suscripción predeterminada
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Cerrar sesión de AZD
azd auth logout

# Cerrar sesión de Azure CLI
az logout
```

### Inicialización del proyecto
```bash
# Explorar plantillas disponibles
azd template list

# Inicializar desde plantilla
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializar en el directorio actual
azd init .

# Inicializar con nombre personalizado
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandos principales de despliegue

### Flujo completo de despliegue
```bash
# Desplegar todo (aprovisionamiento + despliegue)
azd up

# Desplegar con los avisos de confirmación deshabilitados
azd up --confirm-with-no-prompt

# Desplegar a un entorno específico
azd up --environment production

# Desplegar con parámetros personalizados
azd up --parameter location=westus2
```

### Solo infraestructura
```bash
# Provisionar recursos de Azure
azd provision

# 🧪 Vista previa de los cambios en la infraestructura
azd provision --preview
# Muestra una vista de simulación (dry-run) de qué recursos se crearían/modificarían/eliminarían
# Similar a 'terraform plan' o 'bicep what-if' - seguro de ejecutar, no se aplican cambios
```

### Solo aplicación
```bash
# Desplegar el código de la aplicación
azd deploy

# Desplegar un servicio específico
azd deploy --service web
azd deploy --service api

# Desplegar todos los servicios
azd deploy --all
```

### Compilar y empaquetar
```bash
# Restaurar (descargar) las dependencias de la aplicación
azd restore

# Restaurar un servicio específico
azd restore --service api

# Construir un artefacto desplegable sin desplegar
azd package

# Construir un servicio específico
azd package --service api
```

> **`azd restore`** descarga las dependencias de tu aplicación (npm, pip, NuGet, Maven, etc.). Se ejecuta automáticamente durante `azd package` y `azd deploy`, por lo que rara vez lo llamas directamente: ejecútalo manualmente para predescargar dependencias (por ejemplo, para precalentar la caché de CI o trabajar sin conexión después).

> **`azd package`** construye el artefacto desplegable (una imagen de contenedor o un zip) **sin** subirlo a Azure. Úsalo por separado para verificar que la compilación tenga éxito, inspeccionar la salida o producir un artefacto que un proceso independiente desplegará más tarde. `azd deploy` empaqueta automáticamente, así que solo necesitas `azd package` cuando quieras el artefacto sin desplegarlo.

## 🌍 Gestión de entornos

### Operaciones de entorno
```bash
# Listar todos los entornos
azd env list

# Crear nuevo entorno
azd env new development
azd env new staging --location westus2

# Seleccionar entorno
azd env select production

# Mostrar entornos disponibles
azd env list

# Actualizar estado del entorno
azd env refresh
```

### Variables de entorno
```bash
# Establecer variable de entorno
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Obtener variable de entorno
azd env get API_KEY

# Listar todas las variables de entorno
azd env get-values

# Eliminar variable de entorno
azd env unset DEBUG
```

## ⚙️ Comandos de configuración

### Configuración global
```bash
# Listar toda la configuración
azd config show

# Establecer valores predeterminados globales
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Eliminar la configuración
azd config unset defaults.location

# Restablecer toda la configuración
azd config reset
```

### Configuración del proyecto
```bash
# Validar azure.yaml
azd config validate

# Mostrar información del proyecto
azd show

# Obtener puntos de conexión del servicio
azd show --output json
```

## 📊 Monitorización y diagnósticos

### Panel de monitorización
```bash
# Abrir el panel de supervisión del portal de Azure
azd monitor

# Abrir métricas en vivo de Application Insights
azd monitor --live

# Abrir el panel de registros de Application Insights
azd monitor --logs

# Abrir la descripción general de Application Insights
azd monitor --overview
```

### Visualizar registros de contenedores
```bash
# Ver registros mediante Azure CLI (para Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seguir los registros en tiempo real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ver registros en el Portal de Azure
azd monitor --logs
```

### Consultas de Log Analytics
```bash
# Acceder a Log Analytics a través del Portal de Azure
azd monitor --logs

# Consultar registros mediante Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandos de mantenimiento

### Limpieza
```bash
# Eliminar todos los recursos de Azure
azd down

# Forzar eliminación sin confirmación
azd down --force

# Purgar recursos eliminados temporalmente
azd down --purge

# Limpieza completa
azd down --force --purge
```

### Actualizaciones
```bash
# Buscar actualizaciones de azd
azd version

# Obtener la versión actual
azd version

# Ver la configuración actual
azd config show
```

## 🔧 Comandos avanzados

### Canalización e CI/CD
```bash
# Configurar GitHub Actions
azd pipeline config

# Configurar Azure DevOps
azd pipeline config --provider azdo

# Mostrar la configuración de la canalización
azd pipeline show
```

### Gestión de infraestructura
```bash
# Generar plantillas de infraestructura
azd infra generate

# 🧪 Vista previa y planificación de infraestructura
azd provision --preview
# Simula la provisión de infraestructura sin desplegar
# Analiza plantillas Bicep/Terraform y muestra:
# - Recursos que se añadirán (verde +)
# - Recursos que se modificarán (amarillo ~)
# - Recursos que se eliminarán (rojo -)
# Seguro de ejecutar - no se realizan cambios reales en el entorno de Azure

# Sintetizar infraestructura desde azure.yaml
azd infra synth
```

### Información del proyecto
```bash
# Mostrar el estado del proyecto y los puntos finales
azd show

# Mostrar información detallada del proyecto en formato JSON
azd show --output json

# Obtener los puntos finales del servicio
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA y extensiones

### Extensiones de AZD
```bash
# Listar todas las extensiones disponibles (incluyendo IA)
azd extension list

# Instalar la extensión Foundry Agents
azd extension install azure.ai.agents

# Instalar la extensión Agent Skills (vista previa)
azd extension install azure.ai.skills

# Instalar la extensión Foundry Connections (vista previa)
azd extension install azure.ai.connections

# Instalar la extensión de ajuste fino
azd extension install azure.ai.finetune

# Instalar la extensión de modelos personalizados
azd extension install azure.ai.models

# Actualizar todas las extensiones instaladas
azd extension upgrade --all
```

### Comandos de agente IA
```bash
# Inicializar un proyecto de agente desde un manifiesto
azd ai agent init -m <manifest-path-or-uri>

# Apuntar a un proyecto específico de Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Especificar el directorio de código fuente del agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Elegir un destino de alojamiento
azd ai agent init -m agent-manifest.yaml --host containerapp

# Probar un agente desplegado (imprime la latencia y el tiempo hasta el primer byte)
azd ai agent invoke

# Mostrar la configuración del endpoint en vivo
azd ai agent endpoint show

# Generar un conjunto de datos de evaluación, luego optimizar el agente
azd ai agent eval generate
azd ai agent optimize

# Descargar el código fuente desplegado de un agente hospedado basado en código
azd ai agent code download

# Eliminar un agente hospedado y todas sus versiones (--force finaliza sesiones activas)
azd ai agent delete --force
```

### MCP Server (Alfa)
```bash
# Inicia el servidor MCP para tu proyecto
azd mcp start

# Gestiona el consentimiento de la herramienta para las operaciones de MCP
azd copilot consent list
```

### Generación de infraestructura
```bash
# Generar archivos IaC a partir de la definición de su proyecto
azd infra generate

# Sintetizar infraestructura desde azure.yaml
azd infra synth
```

---

## 🎯 Flujos de trabajo rápidos

### Flujo de trabajo de desarrollo
```bash
# Iniciar nuevo proyecto
azd init --template todo-nodejs-mongo
cd my-project

# Desplegar en desarrollo
azd env new dev
azd up

# Realizar cambios y volver a desplegar
azd deploy

# Abrir panel de monitoreo
azd monitor --live
```

### Flujo de trabajo multi-entorno
```bash
# Configurar entornos
azd env new dev
azd env new staging  
azd env new production

# Desplegar en desarrollo
azd env select dev
azd up

# Probar y promover a preproducción
azd env select staging
azd up

# Desplegar en producción
azd env select production
azd up
```

### Flujo de trabajo de resolución de problemas
```bash
# Habilitar el modo de depuración
export AZD_DEBUG=true

# Comprobar el estado del despliegue
azd show

# Validar la configuración
azd config show

# Abrir el panel de monitorización para ver los registros
azd monitor --logs

# Comprobar el estado de los recursos
azd show --output json
```

## 🔍 Comandos de depuración

### Información de depuración
```bash
# Habilitar salida de depuración
export AZD_DEBUG=true
azd <command> --debug

# Desactivar la telemetría para una salida más limpia
export AZD_DISABLE_TELEMETRY=true

# Comprobar la configuración actual
azd config show

# Comprobar el estado de autenticación
az account show
```

### Depuración de plantillas
```bash
# Listar plantillas disponibles con detalles
azd template list --output json

# Mostrar información de la plantilla
azd template show <template-name>

# Validar la plantilla antes de inicializar
azd template validate <template-name>
```

## 📁 Comandos de archivos y directorios

### Estructura del proyecto
```bash
# Mostrar la estructura del directorio actual
tree /f  # Windows
find . -type f  # Linux/macOS

# Navegar a la raíz del proyecto azd
cd $(azd root)

# Mostrar el directorio de configuración de azd
echo $AZD_CONFIG_DIR  # Normalmente ~/.azd
```

## 🎨 Formato de salida

### Salida JSON
```bash
# Obtener salida JSON para scripts
azd show --output json
azd env list --output json
azd config show --output json

# Analizar con jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Salida en tabla
```bash
# Formatear como tabla
azd env list --output table

# Ver servicios desplegados
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaciones comunes de comandos

### Script de verificación de estado
```bash
#!/bin/bash
# Comprobación rápida de estado
azd show
azd env get-values
azd monitor --logs
```

### Validación de despliegue
```bash
#!/bin/bash
# Validación previa al despliegue
azd show
azd provision --preview  # Previsualizar los cambios antes de desplegar
az account show
```

### Comparación de entornos
```bash
#!/bin/bash
# Comparar entornos
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de limpieza de recursos
```bash
#!/bin/bash
# Limpiar entornos antiguos
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variables de entorno

### Variables de entorno comunes
```bash
# Configuración de Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Configuración de AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configuración de la aplicación
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de emergencia

### Soluciones rápidas
```bash
# Restablecer la autenticación
az account clear
az login

# Forzar actualización del entorno
azd env refresh

# Volver a desplegar todos los servicios
azd deploy

# Comprobar el estado del despliegue
azd show --output json
```

### Comandos de recuperación
```bash
# Recuperarse de una implementación fallida - limpiar y volver a desplegar
azd down --force --purge
azd up

# Reprovisionar solo la infraestructura
azd provision

# Volver a desplegar solo la aplicación
azd deploy
```

## 💡 Consejos profesionales

### Alias para un flujo de trabajo más rápido
```bash
# Añádelo a tu .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atajos de función
```bash
# Cambio rápido de entorno
azd-env() {
    azd env select $1 && azd show
}

# Despliegue rápido con supervisión
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Estado del entorno
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ayuda y documentación

### Obtener ayuda
```bash
# Ayuda general
azd --help
azd help

# Ayuda específica del comando
azd up --help
azd env --help
azd config --help

# Mostrar versión e información de compilación
azd version
azd version --output json
```

### Enlaces de documentación
```bash
# Abrir la documentación en el navegador
azd docs

# Mostrar la documentación de la plantilla
azd template show <template-name> --docs
```

---

**Sugerencia**: Marca esta hoja de referencia y usa `Ctrl+F` para encontrar rápidamente los comandos que necesitas!

---

**Navegación**
- **Lección anterior**: [Comprobaciones previas al despliegue](../docs/pre-deployment/preflight-checks.md)
- **Siguiente lección**: [Glosario](glossary.md)

---

> **💡 ¿Quieres ayuda con comandos de Azure en tu editor?** Instala [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 skills para IA, Foundry, despliegue, diagnóstico y más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->