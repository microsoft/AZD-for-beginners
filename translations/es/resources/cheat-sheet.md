# Hoja de Comandos - Comandos Esenciales de AZD

**Referencia Rápida para Todos los Capítulos**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Inicio Rápido**: [Capítulo 1: Fundamentos y Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desarrollo con IA Primero](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzado**: [Capítulo 4: Infraestructura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducción

Esta hoja de comandos integral proporciona una referencia rápida para los comandos más comúnmente usados de Azure Developer CLI, organizados por categoría con ejemplos prácticos. Perfecta para consultas rápidas durante el desarrollo, resolución de problemas y operaciones diarias con proyectos azd.

## Objetivos de Aprendizaje

Al usar esta hoja de comandos, usted:
- Tendrá acceso inmediato a comandos esenciales y sintaxis de Azure Developer CLI
- Entenderá la organización de comandos por categorías funcionales y casos de uso
- Consultará ejemplos prácticos para escenarios comunes de desarrollo y despliegue
- Accederá a comandos de solución de problemas para resolución rápida de incidencias
- Encontrará opciones avanzadas de configuración y personalización eficientemente
- Localizará comandos para gestión de entornos y flujos de trabajo multi-entorno

## Resultados del Aprendizaje

Con referencia regular a esta hoja de comandos, podrá:
- Ejecutar comandos azd con confianza sin consultar documentación completa
- Resolver rápidamente problemas comunes usando comandos diagnósticos apropiados
- Gestionar eficientemente múltiples entornos y escenarios de despliegue
- Aplicar funciones avanzadas y opciones de configuración de azd según sea necesario
- Solucionar problemas de despliegue usando secuencias sistemáticas de comandos
- Optimizar los flujos de trabajo mediante el uso efectivo de atajos y opciones de azd

## Comandos para Comenzar

### Autenticación
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Inicialización de Proyecto
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Comandos Principales de Despliegue

### Flujo Completo de Despliegue
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Solo Infraestructura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Solo Aplicación
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Construir y Empaquetar
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** descarga las dependencias de su aplicación (npm, pip, NuGet, Maven, etc.). Se ejecuta automáticamente durante `azd package` y `azd deploy`, por lo que rara vez se usa directamente—ejecútelo manualmente para predescargar dependencias (por ejemplo, para calentar una caché de CI o trabajar sin conexión después).

> **`azd package`** prepara un artefacto desplegable sin desplegar el servicio de aplicación. El comportamiento depende del lenguaje y host: el empaquetado de contenedores puede usar compilaciones remotas de Azure y publicar imágenes en un registro, por lo que no siempre es sin conexión o libre de escrituras en Azure. `azd deploy` puede empaquetar automáticamente; use un paso de empaquetado separado cuando necesite un artefacto o una comprobación de compilación.


## 🌍 Gestión de Entornos

### Operaciones de Entorno
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Variables de Entorno
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

Los archivos de entorno son texto plano. No trate `azd env set` como almacenamiento secreto; use referencias a Key Vault o identidad administrada según corresponda.

## ⚙️ Comandos de Configuración

### Configuración Global
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Configuración de Proyecto
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorización y Diagnóstico

### Panel de Monitorización
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

Application Insights debe ser configurado por la plantilla. La opción Live Metrics de AZD no está actualmente soportada para aplicaciones Python; utilice la visión general, registros o el flujo de trabajo de trazado documentado en el ejemplo.

### Visualización de Registros de Contenedores
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Consultas de Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandos de Mantenimiento

### Limpieza
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Actualizaciones
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Comandos Avanzados

### Pipeline y CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Gestión de Infraestructura
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Información del Proyecto
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA y Extensiones

### Extensiones AZD

Referencia de CLI de IA revisada 2026-11-04: `azd 1.37.2`, agentes `1.0.0-beta.23`, evaluaciones `1.0.0-beta.2`. Use `azd >= 1.37.0` para el flujo combinado; actualice el CLI principal antes de extensiones incompatibles.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### Comandos de Agente de IA
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` reemplaza la ortografía `--manifest`/`-m` depreciada; los manifiestos heredados necesitan migración. No existe opción agent-init `--host containerapp` actual. Las vistas previas de managed-harness, voz y ejecución prolongada requieren adopciones independientes en shell/entorno CI; vea la [referencia AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Evaluaciones y Optimización de IA
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agentes beta.22 reemplazó comandos de evaluación heredados con `azd ai eval` de `azure.ai.evaluations`. La nueva configuración de evaluación usa claves camelCase. La optimización `--config` toma una solicitud de API de optimización independiente, **no** los heredados `eval.yaml` o nuevo `azure.eval.yaml`; use `--eval`/`--eval-config` para reutilización de evaluaciones. Vea [configuración de evaluación](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) y [migración de optimización](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Servidor MCP (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generación de Infraestructura
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Flujos de Trabajo Rápidos

### Flujo de Desarrollo
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### Flujo Multi-Entorno
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Flujo de Solución de Problemas
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Comandos para Depuración

### Información de Depuración
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Depuración de Plantillas
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comandos de Archivos y Directorios

### Estructura del Proyecto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formato de Salida

### Salida JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Salida en Tabla
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaciones Comunes de Comandos

### Script de Verificación de Salud
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validación de Despliegue
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Comparación de Entornos
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script de Limpieza de Recursos
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variables de Entorno

### Variables de Entorno Comunes
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergencia

### Soluciones Rápidas
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Comandos de Recuperación
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Consejos Profesionales

### Alias para un Flujo de Trabajo Más Rápido
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atajos de Funciones
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ayuda y Documentación

### Obtener Ayuda
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Enlaces de Documentación
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Consejo**: ¡Agregue esta hoja de comandos a sus favoritos y use `Ctrl+F` para encontrar rápidamente los comandos que necesita!

---

**Navegación**
- **Lección Anterior**: [Verificaciones Previas](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Próxima Lección**: [Glosario](glossary.md)

---

> **💡 ¿Quiere ayuda con comandos de Azure en su editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 habilidades para IA, Foundry, despliegues, diagnósticos y más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->