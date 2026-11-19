# Hoja de referencia de comandos - Comandos esenciales de AZD

**Referencia rápida para todos los capítulos**
- **📚 Inicio del curso**: [AZD para principiantes](../README.md)
- **📖 Inicio rápido**: [Capítulo 1: Fundamentos e inicio rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desarrollo con IA primero](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzado**: [Capítulo 4: Infraestructura como código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducción

Esta hoja de referencia completa proporciona un acceso rápido a los comandos más usados del Azure Developer CLI, organizados por categoría con ejemplos prácticos. Perfecta para consultas rápidas durante el desarrollo, solución de problemas y operaciones diarias con proyectos azd.

## Objetivos de aprendizaje

Con esta hoja de referencia, usted:
- Tendrá acceso instantáneo a comandos esenciales y sintaxis del Azure Developer CLI
- Entenderá la organización de comandos según categorías funcionales y casos de uso
- Consultará ejemplos prácticos para escenarios comunes de desarrollo y despliegue
- Accederá a comandos de solución de problemas para una rápida resolución de incidencias
- Encontrará opciones avanzadas de configuración y personalización eficientemente
- Ubicará comandos para gestión de entornos y flujos de trabajo multinivel

## Resultados esperados

Con referencia regular a esta hoja de comandos podrá:
- Ejecutar comandos azd con confianza sin consultar la documentación completa
- Resolver rápidamente problemas comunes usando comandos diagnósticos adecuados
- Gestionar múltiples entornos y escenarios de despliegue eficazmente
- Aplicar funciones avanzadas y opciones de configuración azd según se requiera
- Diagnosticar problemas de despliegue usando secuencias sistemáticas de comandos
- Optimizar flujos de trabajo con el uso efectivo de atajos y opciones de azd

## Comandos para empezar

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

### Inicialización del proyecto
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

## Comandos básicos de despliegue

### Flujo de trabajo completo de despliegue
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

### Solo infraestructura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Solo aplicación
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Compilar y empaquetar
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

> **`azd restore`** descarga las dependencias de su aplicación (npm, pip, NuGet, Maven, etc.). Se ejecuta automáticamente durante `azd package` y `azd deploy`, por lo que rara vez se llama directamente; ejecútelo manualmente para predescargar dependencias (por ejemplo, para precalentar una caché CI o para trabajar desconectado después).

> **`azd package`** prepara un artefacto desplegable sin desplegar el servicio de la aplicación. El comportamiento depende del lenguaje y host: el empaquetado del contenedor puede usar compilaciones remotas de Azure y publicar imágenes en un registro, por lo que no es necesariamente sin conexión ni libre de escrituras en Azure. `azd deploy` puede empaquetar automáticamente; use un paso de empaquetado separado cuando necesite un artefacto o una comprobación de compilación.


## 🌍 Gestión de entornos

### Operaciones de entorno
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

### Variables de entorno
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

Los archivos de entorno son texto plano. No considere `azd env set` como almacenamiento secreto; use referencias de Key Vault o identidad gestionada según corresponda.

## ⚙️ Comandos de configuración

### Configuración global
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

### Configuración del proyecto
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoreo y diagnóstico

### Panel de monitoreo
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

Application Insights debe estar configurado por la plantilla. La opción Live Metrics de AZD no es compatible actualmente con aplicaciones Python; use en su lugar el resumen, los registros o el flujo de trabajo de rastreo documentado del ejemplo.

### Ver registros de contenedores
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Consultas en Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandos de mantenimiento

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

## 🔧 Comandos avanzados

### Pipeline y CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Gestión de infraestructura
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

### Información del proyecto
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA y extensiones

### Extensiones AZD

Referencia Foundry GA actualizada 2026-11-09: `microsoft.foundry` paquete 1.0, anunciado el [5 de noviembre de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Use `azd >= 1.37.0`; los componentes tienen versión independiente y las funciones de vista previa son opcionales y mantienen su propio estado.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

El paquete no incluye evaluaciones, conjuntos de datos, ajuste fino ni modelos personalizados. La instalación de extensiones núcleo individuales sigue siendo compatible. Siga el [tutorial de agente alojado GA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) para un ejemplo ejecutable con Python 3.13+, uv actual, permisos y cuota de modelos.

### Comandos de agentes de IA
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` reemplaza la escritura obsoleta `--manifest`/`-m`; los manifiestos heredados necesitan migración. Actualmente no existe opción `--host containerapp` agent-init. Las vistas previas de managed-harness, voz y ejecución prolongada requieren autorización independiente en shell/entorno CI; consulte la [referencia CLI de IA](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Las pruebas locales aún usan implementaciones de modelos Azure y generan cargos. Para limpieza, `azd down` elimina el grupo de recursos de un proyecto Foundry recién creado, pero deja los recursos de proyectos reutilizados en su lugar; elimine solo los recursos no deseados que posea por separado.

### Evaluaciones y optimización de IA
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agents beta.22 reemplazó los comandos heredados de evaluación por `azd ai eval` de `azure.ai.evaluations`. La nueva configuración de evaluación usa claves en camelCase. La optimización `--config` usa una solicitud de API de optimización independiente, **no** los comandos heredados `eval.yaml` o nuevos `azure.eval.yaml`; use `--eval`/`--eval-config` para reutilizar evaluaciones. Consulte [configuración de evaluación](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) y [migración de optimización](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

El fragmento runner no es un flujo de trabajo completo. Realice commit de la configuración de evaluación revisada y activos no secretos, otorgue acceso a dataset/evaluator/modelo y use un entorno por etapa. Vea el [ejemplo CI/CD autenticado](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### Servidor MCP (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generación de infraestructura
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Flujos de trabajo rápidos

### Flujo de trabajo de desarrollo
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

### Flujo de trabajo multi-entorno
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

### Flujo de solución de problemas
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

## 🔍 Comandos de depuración

### Información de depuración
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

### Depuración de plantillas
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comandos de archivos y directorios

### Estructura del proyecto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formato de salida

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

### Salida en tabla
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinaciones comunes de comandos

### Script de verificación de estado
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validación de despliegue
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Comparación de entornos
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script de limpieza de recursos
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variables de entorno

### Variables de entorno comunes
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

## 🚨 Comandos de emergencia

### Soluciones rápidas
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

### Comandos de recuperación
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Consejos profesionales

### Alias para un flujo de trabajo más rápido
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atajos de funciones
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

## 📖 Ayuda y documentación

### Obtener ayuda
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

### Enlaces de documentación
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Consejo**: ¡Añada esta hoja de referencia a sus favoritos y use `Ctrl+F` para encontrar rápidamente los comandos que necesita!

---

**Navegación**
- **Lección anterior**: [Comprobaciones previas](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Lección siguiente**: [Glosario](glossary.md)

---

> **💡 ¿Quiere ayuda con comandos de Azure en su editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 habilidades para IA, Foundry, despliegue, diagnóstico y más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->