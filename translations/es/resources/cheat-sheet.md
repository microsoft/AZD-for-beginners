# Hoja de Comandos - Comandos esenciales de AZD

**Referencia rápida para todos los capítulos**
- **📚 Inicio del curso**: [AZD para principiantes](../README.md)
- **📖 Inicio rápido**: [Capítulo 1: Fundamentos e Inicio rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desarrollo con prioridad en IA](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzado**: [Capítulo 4: Infraestructura como código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducción

Esta hoja de referencia completa proporciona una guía rápida para los comandos de Azure Developer CLI más utilizados, organizados por categoría con ejemplos prácticos. Perfecta para búsquedas rápidas durante el desarrollo, la resolución de problemas y las operaciones diarias con proyectos azd.

## Objetivos de aprendizaje

Al usar esta hoja de referencia, usted:
- Tendrá acceso instantáneo a los comandos esenciales y la sintaxis de Azure Developer CLI
- Entenderá la organización de los comandos por categorías funcionales y casos de uso
- Consultará ejemplos prácticos para escenarios comunes de desarrollo y despliegue
- Accederá a comandos de diagnóstico para una resolución rápida de problemas
- Encontrará opciones avanzadas de configuración y personalización de forma eficiente
- Localizará comandos de gestión de entornos y flujos de trabajo multi-entorno

## Resultados de aprendizaje

Con la consulta regular de esta hoja de referencia, usted podrá:
- Ejecutar comandos azd con confianza sin consultar la documentación completa
- Resolver rápidamente problemas comunes usando los comandos diagnósticos apropiados
- Gestionar eficientemente múltiples entornos y escenarios de despliegue
- Aplicar funciones avanzadas de azd y opciones de configuración según sea necesario
- Depurar problemas de despliegue usando secuencias sistemáticas de comandos
- Optimizar flujos de trabajo mediante el uso eficaz de atajos y opciones de azd

## Comandos para comenzar

### Autenticación
```bash
# Iniciar sesión en Azure a través de AZD
azd auth login

# Iniciar sesión en Azure CLI (AZD lo usa internamente)
az login

# Comprobar la cuenta actual
az account show

# Establecer suscripción predeterminada
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

# Inicializar desde una plantilla
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializar en el directorio actual
azd init .

# Inicializar con un nombre personalizado
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandos principales de despliegue

### Flujo completo de despliegue
```bash
# Desplegar todo (aprovisionar + desplegar)
azd up

# Desplegar con solicitudes de confirmación desactivadas
azd up --confirm-with-no-prompt

# Desplegar en un entorno específico
azd up --environment production

# Desplegar con parámetros personalizados
azd up --parameter location=westus2
```

### Solo infraestructura
```bash
# Aprovisionar recursos en Azure
azd provision

# 🧪 Vista previa de los cambios en la infraestructura
azd provision --preview
# Muestra una vista de simulación de qué recursos se crearían/modificarían/eliminarían
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

### Compilar y empacar
```bash
# Construir aplicaciones
azd package

# Construir servicio específico
azd package --service api
```

## 🌍 Gestión de entornos

### Operaciones de entornos
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

# Obtener puntos finales del servicio
azd show --output json
```

## 📊 Monitoreo y diagnóstico

### Panel de monitorización
```bash
# Abrir el panel de supervisión del portal de Azure
azd monitor

# Abrir las métricas en tiempo real de Application Insights
azd monitor --live

# Abrir el panel de registros de Application Insights
azd monitor --logs

# Abrir la descripción general de Application Insights
azd monitor --overview
```

### Ver registros de contenedores
```bash
# Ver registros a través de Azure CLI (para Container Apps)
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

# Consultar registros usando Azure CLI
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
# Comprobar si hay actualizaciones de azd
azd version

# Obtener la versión actual
azd version

# Ver la configuración actual
azd config show
```

## 🔧 Comandos avanzados

### Pipelines y CI/CD
```bash
# Configurar GitHub Actions
azd pipeline config

# Configurar Azure DevOps
azd pipeline config --provider azdo

# Mostrar la configuración del pipeline
azd pipeline show
```

### Gestión de infraestructura
```bash
# Generar plantillas de infraestructura
azd infra generate

# 🧪 Vista previa y planificación de la infraestructura
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
# Mostrar el estado del proyecto y los endpoints
azd show

# Mostrar información detallada del proyecto en JSON
azd show --output json

# Obtener endpoints del servicio
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA y extensiones

### Extensiones de AZD
```bash
# Lista todas las extensiones disponibles (incluyendo IA)
azd extension list

# Instala la extensión Foundry agents
azd extension install azure.ai.agents

# Instala la extensión de ajuste fino
azd extension install azure.ai.finetune

# Instala la extensión de modelos personalizados
azd extension install azure.ai.models

# Actualiza todas las extensiones instaladas
azd extension upgrade --all
```

### Comandos de agentes de IA
```bash
# Inicializar un proyecto de agente a partir de un manifiesto
azd ai agent init -m <manifest-path-or-uri>

# Apuntar a un proyecto Foundry específico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Especificar el directorio de origen del agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Elegir un destino de alojamiento
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Servidor MCP (Alfa)
```bash
# Inicia el servidor MCP para tu proyecto
azd mcp start

# Gestiona el consentimiento de la herramienta para las operaciones de MCP
azd copilot consent list
```

### Generación de infraestructura
```bash
# Generar archivos IaC a partir de la definición de tu proyecto
azd infra generate

# Sintetizar la infraestructura a partir de azure.yaml
azd infra synth
```

---

## 🎯 Flujos de trabajo rápidos

### Flujo de desarrollo
```bash
# Iniciar un nuevo proyecto
azd init --template todo-nodejs-mongo
cd my-project

# Desplegar en el entorno de desarrollo
azd env new dev
azd up

# Realizar cambios y volver a desplegar
azd deploy

# Abrir el panel de monitoreo
azd monitor --live
```

### Flujo de trabajo para múltiples entornos
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

### Flujo de resolución de problemas
```bash
# Habilitar modo de depuración
export AZD_DEBUG=true

# Comprobar estado del despliegue
azd show

# Validar configuración
azd config show

# Abrir el panel de monitorización para ver registros
azd monitor --logs

# Comprobar el estado del recurso
azd show --output json
```

## 🔍 Comandos de depuración

### Información de depuración
```bash
# Habilitar la salida de depuración
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
# Obtener salida JSON para secuencias de comandos
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

### Script de comprobación de salud
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

# Forzar la actualización del entorno
azd env refresh

# Volver a desplegar todos los servicios
azd deploy

# Comprobar el estado del despliegue
azd show --output json
```

### Comandos de recuperación
```bash
# Recuperar una implementación fallida - limpiar y volver a desplegar
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

### Atajos de funciones
```bash
# Cambio rápido entre entornos
azd-env() {
    azd env select $1 && azd show
}

# Despliegue rápido con monitorización
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

**Consejo**: Añade esta hoja de referencia rápida a tus marcadores y usa `Ctrl+F` para encontrar rápidamente los comandos que necesitas!

---

**Navegación**
- **Lección anterior**: [Comprobaciones previas](../docs/pre-deployment/preflight-checks.md)
- **Siguiente lección**: [Glosario](glossary.md)

---

> **💡 ¿Quieres ayuda con comandos de Azure en tu editor?** Instala [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 habilidades para IA, Foundry, despliegue, diagnósticos y más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->