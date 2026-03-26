# Hoja de Referencia Rápida de Comandos - Comandos Esenciales de AZD

**Referencia Rápida para Todos los Capítulos**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Inicio Rápido**: [Capítulo 1: Fundamentos e Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desarrollo con IA Primero](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzado**: [Capítulo 4: Infraestructura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducción

Esta hoja de referencia completa proporciona una guía rápida para los comandos más comúnmente usados de Azure Developer CLI, organizados por categoría con ejemplos prácticos. Perfecta para consultas rápidas durante el desarrollo, resolución de problemas y operaciones diarias con proyectos azd.

## Objetivos de Aprendizaje

Al usar esta hoja, usted:
- Tendrá acceso instantáneo a comandos esenciales y sintaxis de Azure Developer CLI
- Entenderá la organización de comandos por categorías funcionales y casos de uso
- Consultará ejemplos prácticos para escenarios comunes de desarrollo y despliegue
- Accederá a comandos de resolución de problemas para solución rápida de incidencias
- Encontrará opciones avanzadas de configuración y personalización eficientemente
- Localizará comandos para gestión de entornos y flujos de trabajo multientorno

## Resultados de Aprendizaje

Con la consulta regular de esta hoja, podrá:
- Ejecutar comandos azd con confianza sin necesidad de consultar la documentación completa
- Resolver rápidamente problemas comunes usando comandos diagnósticos apropiados
- Gestionar eficientemente múltiples entornos y escenarios de despliegue
- Aplicar funciones avanzadas de azd y opciones de configuración según se requiera
- Solucionar incidencias de despliegue usando secuencias sistemáticas de comandos
- Optimizar flujos de trabajo mediante el uso efectivo de atajos y opciones de azd

## Comandos para Empezar

### Autenticación
```bash
# Iniciar sesión en Azure a través de AZD
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

### Inicialización del Proyecto
```bash
# Examinar plantillas disponibles
azd template list

# Inicializar desde plantilla
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializar en el directorio actual
azd init .

# Inicializar con nombre personalizado
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandos Básicos de Despliegue

### Flujo Completo de Despliegue
```bash
# Desplegar todo (provisión + despliegue)
azd up

# Desplegar con solicitudes de confirmación deshabilitadas
azd up --confirm-with-no-prompt

# Desplegar a un entorno específico
azd up --environment production

# Desplegar con parámetros personalizados
azd up --parameter location=westus2
```

### Solo Infraestructura
```bash
# Provisionar recursos de Azure
azd provision

# 🧪 Vista previa de cambios en la infraestructura
azd provision --preview
# Muestra una vista de simulación de qué recursos serían creados/modificados/eliminados
# Similar a 'terraform plan' o 'bicep what-if' - seguro para ejecutar, no se aplican cambios
```

### Solo Aplicación
```bash
# Desplegar código de la aplicación
azd deploy

# Desplegar servicio específico
azd deploy --service web
azd deploy --service api

# Desplegar todos los servicios
azd deploy --all
```

### Construcción y Empaquetado
```bash
# Construir aplicaciones
azd package

# Construir servicio específico
azd package --service api
```

## 🌍 Gestión de Entornos

### Operaciones de Entorno
```bash
# Listar todos los entornos
azd env list

# Crear nuevo entorno
azd env new development
azd env new staging --location westus2

# Seleccionar entorno
azd env select production

# Mostrar entorno actual
azd env show

# Actualizar estado del entorno
azd env refresh
```

### Variables de Entorno
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

## ⚙️ Comandos de Configuración

### Configuración Global
```bash
# Listar toda la configuración
azd config list

# Establecer valores predeterminados globales
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Eliminar configuración
azd config unset defaults.location

# Restablecer toda la configuración
azd config reset
```

### Configuración del Proyecto
```bash
# Validar azure.yaml
azd config validate

# Mostrar información del proyecto
azd show

# Obtener puntos finales del servicio
azd show --output json
```

## 📊 Monitoreo y Diagnóstico

### Panel de Monitoreo
```bash
# Abrir el panel de monitoreo del portal de Azure
azd monitor

# Abrir métricas en vivo de Application Insights
azd monitor --live

# Abrir la sección de registros de Application Insights
azd monitor --logs

# Abrir la vista general de Application Insights
azd monitor --overview
```

### Visualización de Logs de Contenedores
```bash
# Ver registros a través de Azure CLI (para aplicaciones de contenedores)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seguir registros en tiempo real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ver registros desde el portal de Azure
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

## 🛠️ Comandos de Mantenimiento

### Limpieza
```bash
# Eliminar todos los recursos de Azure
azd down

# Forzar eliminación sin confirmación
azd down --force

# Purga de recursos eliminados suavemente
azd down --purge

# Limpieza completa
azd down --force --purge
```

### Actualizaciones
```bash
# Buscar actualizaciones de azd
azd version

# Obtener versión actual
azd version

# Ver configuración actual
azd config list
```

## 🔧 Comandos Avanzados

### Pipeline y CI/CD
```bash
# Configurar GitHub Actions
azd pipeline config

# Configurar Azure DevOps
azd pipeline config --provider azdo

# Mostrar configuración de la canalización
azd pipeline show
```

### Gestión de Infraestructura
```bash
# Generar plantillas de infraestructura
azd infra generate

# 🧪 Vista previa y planificación de infraestructura
azd provision --preview
# Simula la provisión de infraestructura sin desplegar
# Analiza plantillas Bicep/Terraform y muestra:
# - Recursos que serán añadidos (verde +)
# - Recursos que serán modificados (amarillo ~)
# - Recursos que serán eliminados (rojo -)
# Seguro para ejecutar - no realiza cambios reales en el entorno Azure

# Sintetizar infraestructura desde azure.yaml
azd infra synth
```

### Información del Proyecto
```bash
# Mostrar estado del proyecto y puntos finales
azd show

# Mostrar información detallada del proyecto en formato JSON
azd show --output json

# Obtener puntos finales del servicio
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA y Extensiones

### Extensiones AZD
```bash
# Listar todas las extensiones disponibles (incluyendo IA)
azd extension list

# Instalar la extensión de agentes de Foundry
azd extension install azure.ai.agents

# Instalar la extensión de ajuste fino
azd extension install azure.ai.finetune

# Instalar la extensión de modelos personalizados
azd extension install azure.ai.models

# Actualizar todas las extensiones instaladas
azd extension upgrade --all
```

### Comandos de Agente de IA
```bash
# Inicializar un proyecto de agente desde un manifiesto
azd ai agent init -m <manifest-path-or-uri>

# Apuntar a un proyecto específico de Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Especificar el directorio fuente del agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Elegir un objetivo de alojamiento
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Servidor MCP (Alfa)
```bash
# Inicie el servidor MCP para su proyecto
azd mcp start

# Administre el consentimiento de la herramienta para las operaciones MCP
azd mcp consent
```

### Generación de Infraestructura
```bash
# Generar archivos IaC desde la definición de su proyecto
azd infra generate

# Sintetizar infraestructura desde azure.yaml
azd infra synth
```

---

## 🎯 Flujos de Trabajo Rápidos

### Flujo de Trabajo de Desarrollo
```bash
# Iniciar nuevo proyecto
azd init --template todo-nodejs-mongo
cd my-project

# Desplegar en desarrollo
azd env new dev
azd up

# Hacer cambios y redistribuir
azd deploy

# Abrir panel de monitoreo
azd monitor --live
```

### Flujo de Trabajo Multientorno
```bash
# Configurar entornos
azd env new dev
azd env new staging  
azd env new production

# Desplegar a desarrollo
azd env select dev
azd up

# Probar y promover a preproducción
azd env select staging
azd up

# Desplegar a producción
azd env select production
azd up
```

### Flujo de Trabajo para Resolución de Problemas
```bash
# Habilitar modo de depuración
export AZD_DEBUG=true

# Verificar el estado del despliegue
azd show

# Validar configuración
azd config list

# Abrir el panel de monitoreo para registros
azd monitor --logs

# Verificar el estado de los recursos
azd show --output json
```

## 🔍 Comandos de Depuración

### Información de Depuración
```bash
# Habilitar salida de depuración
export AZD_DEBUG=true
azd <command> --debug

# Desactivar telemetría para una salida más limpia
export AZD_DISABLE_TELEMETRY=true

# Verificar configuración actual
azd config list

# Verificar estado de autenticación
az account show
```

### Depuración de Plantillas
```bash
# Listar plantillas disponibles con detalles
azd template list --output json

# Mostrar información de la plantilla
azd template show <template-name>

# Validar plantilla antes de iniciar
azd template validate <template-name>
```

## 📁 Comandos de Archivos y Directorios

### Estructura del Proyecto
```bash
# Mostrar la estructura del directorio actual
tree /f  # Windows
find . -type f  # Linux/macOS

# Navegar a la raíz del proyecto azd
cd $(azd root)

# Mostrar el directorio de configuración de azd
echo $AZD_CONFIG_DIR  # Usualmente ~/.azd
```

## 🎨 Formato de Salida

### Salida en JSON
```bash
# Obtener salida JSON para scripting
azd show --output json
azd env list --output json
azd config list --output json

# Analizar con jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Salida en Tabla
```bash
# Formatear como tabla
azd env list --output table

# Ver servicios desplegados
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaciones Comunes de Comandos

### Script de Verificación de Salud
```bash
#!/bin/bash
# Revisión rápida de salud
azd show
azd env show
azd monitor --logs
```

### Validación de Despliegue
```bash
#!/bin/bash
# Validación previa a la implementación
azd show
azd provision --preview  # Vista previa de los cambios antes de desplegar
az account show
```

### Comparación de Entornos
```bash
#!/bin/bash
# Comparar entornos
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de Limpieza de Recursos
```bash
#!/bin/bash
# Limpiar entornos antiguos
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variables de Entorno

### Variables Comunes de Entorno
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

## 🚨 Comandos de Emergencia

### Soluciones Rápidas
```bash
# Restablecer autenticación
az account clear
az login

# Forzar actualización del entorno
azd env refresh

# Redistribuir todos los servicios
azd deploy

# Verificar estado de la implementación
azd show --output json
```

### Comandos de Recuperación
```bash
# Recuperar de una implementación fallida - limpiar y volver a implementar
azd down --force --purge
azd up

# Reaprovisionar solo la infraestructura
azd provision

# Volver a implementar solo la aplicación
azd deploy
```

## 💡 Consejos Profesionales

### Alias para Flujo de Trabajo Más Rápido
```bash
# Agrega a tu .bashrc o .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atajos de Funciones
```bash
# Cambio rápido de entorno
azd-env() {
    azd env select $1 && azd show
}

# Despliegue rápido con monitoreo
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Estado del entorno
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ayuda y Documentación

### Obtener Ayuda
```bash
# Ayuda general
azd --help
azd help

# Ayuda específica del comando
azd up --help
azd env --help
azd config --help

# Mostrar información de versión y compilación
azd version
azd version --output json
```

### Enlaces de Documentación
```bash
# Abrir documentación en el navegador
azd docs

# Mostrar documentación de la plantilla
azd template show <template-name> --docs
```

---

**Consejo**: ¡Agregue esta hoja a sus favoritos y use `Ctrl+F` para encontrar rápidamente los comandos que necesita!

---

**Navegación**
- **Lección Anterior**: [Verificaciones Previas](../docs/pre-deployment/preflight-checks.md)
- **Próxima Lección**: [Glosario](glossary.md)

---

> **💡 ¿Quiere ayuda con comandos de Azure en su editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 habilidades para IA, Foundry, despliegue, diagnóstico y más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional realizada por humanos. No nos hacemos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->