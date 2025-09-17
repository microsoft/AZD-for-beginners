<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T15:12:14+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "es"
}
-->
# Hoja de Referencia de Comandos - Comandos Esenciales de AZD

**Referencia Rápida para Todos los Capítulos**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../README.md)
- **📖 Inicio Rápido**: [Capítulo 1: Fundamentos e Inicio Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desarrollo con IA](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzado**: [Capítulo 4: Infraestructura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducción

Esta completa hoja de referencia proporciona un acceso rápido a los comandos más utilizados de Azure Developer CLI, organizados por categoría con ejemplos prácticos. Perfecta para consultas rápidas durante el desarrollo, resolución de problemas y operaciones diarias con proyectos azd.

## Objetivos de Aprendizaje

Al usar esta hoja de referencia, podrás:
- Tener acceso instantáneo a los comandos esenciales de Azure Developer CLI y su sintaxis
- Comprender la organización de los comandos por categorías funcionales y casos de uso
- Consultar ejemplos prácticos para escenarios comunes de desarrollo y despliegue
- Acceder a comandos de resolución de problemas para solucionar inconvenientes rápidamente
- Encontrar opciones avanzadas de configuración y personalización de manera eficiente
- Ubicar comandos para la gestión de entornos y flujos de trabajo multi-entorno

## Resultados de Aprendizaje

Con el uso regular de esta hoja de referencia, serás capaz de:
- Ejecutar comandos azd con confianza sin necesidad de consultar la documentación completa
- Resolver problemas comunes rápidamente utilizando comandos de diagnóstico apropiados
- Gestionar múltiples entornos y escenarios de despliegue de manera eficiente
- Aplicar características avanzadas de azd y opciones de configuración según sea necesario
- Solucionar problemas de despliegue utilizando secuencias sistemáticas de comandos
- Optimizar flujos de trabajo mediante el uso efectivo de atajos y opciones de azd

## Comandos para Comenzar

### Autenticación
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inicialización de Proyecto
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandos Principales de Despliegue

### Flujo Completo de Despliegue
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Solo Infraestructura
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Solo Aplicación
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Construcción y Empaquetado
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

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

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Variables de Entorno
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Comandos de Configuración

### Configuración Global
```bash
# List all configuration
azd config list

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
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoreo y Registros

### Registros de Aplicación
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Monitoreo
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Comandos Avanzados

### Pipeline y CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Gestión de Infraestructura
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Gestión de Servicios
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Flujos de Trabajo Rápidos

### Flujo de Trabajo de Desarrollo
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Flujo de Trabajo Multi-Entorno
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

### Flujo de Trabajo de Resolución de Problemas
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Comandos de Depuración

### Información de Depuración
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Depuración de Plantillas
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Comandos de Archivos y Directorios

### Estructura del Proyecto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formateo de Salida

### Salida en JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Salida en Tabla
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Combinaciones Comunes de Comandos

### Script de Verificación de Salud
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validación de Despliegue
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Comparación de Entornos
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de Limpieza de Recursos
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variables de Entorno

### Variables de Entorno Comunes
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergencia

### Soluciones Rápidas
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Comandos de Recuperación
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Consejos Profesionales

### Alias para Flujos de Trabajo Más Rápidos
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atajos de Funciones
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
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

**Consejo**: Marca esta hoja de referencia y usa `Ctrl+F` para encontrar rápidamente los comandos que necesitas.

---

**Navegación**
- **Lección Anterior**: [Verificaciones Previas al Despliegue](../docs/pre-deployment/preflight-checks.md)
- **Próxima Lección**: [Glosario](glossary.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.