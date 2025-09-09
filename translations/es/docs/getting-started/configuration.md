<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "71971408c9d2c3ed2357433ec9bc72b5",
  "translation_date": "2025-09-09T16:52:11+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "es"
}
-->
# Guía de Configuración

## Introducción

Esta guía completa cubre todos los aspectos de la configuración de Azure Developer CLI para flujos de trabajo óptimos de desarrollo y despliegue. Aprenderás sobre la jerarquía de configuración, gestión de entornos, métodos de autenticación y patrones avanzados de configuración que permiten despliegues eficientes y seguros en Azure.

## Objetivos de Aprendizaje

Al final de esta lección, podrás:
- Dominar la jerarquía de configuración de azd y entender cómo se priorizan las configuraciones
- Configurar ajustes globales y específicos de proyectos de manera efectiva
- Gestionar múltiples entornos con diferentes configuraciones
- Implementar patrones seguros de autenticación y autorización
- Comprender patrones avanzados de configuración para escenarios complejos

## Resultados de Aprendizaje

Después de completar esta lección, serás capaz de:
- Configurar azd para flujos de trabajo de desarrollo óptimos
- Configurar y gestionar múltiples entornos de despliegue
- Implementar prácticas seguras de gestión de configuración
- Solucionar problemas relacionados con la configuración
- Personalizar el comportamiento de azd para requisitos específicos de tu organización

Esta guía completa cubre todos los aspectos de la configuración de Azure Developer CLI para flujos de trabajo óptimos de desarrollo y despliegue.

## Jerarquía de Configuración

azd utiliza un sistema de configuración jerárquico:
1. **Flags de línea de comandos** (mayor prioridad)
2. **Variables de entorno**
3. **Configuración local del proyecto** (`.azd/config.json`)
4. **Configuración global del usuario** (`~/.azd/config.json`)
5. **Valores predeterminados** (menor prioridad)

## Configuración Global

### Configuración de Valores Predeterminados Globales
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### Configuraciones Globales Comunes
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
```

## 🏗️ Configuración del Proyecto

### Estructura de azure.yaml
El archivo `azure.yaml` es el núcleo de tu proyecto azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Opciones de Configuración de Servicios

#### Tipos de Host
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Configuraciones Específicas de Lenguaje
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Gestión de Entornos

### Creación de Entornos
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuración de Entornos
Cada entorno tiene su propia configuración en `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Variables de Entorno
```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### Plantillas de Entorno
Crea `.azure/env.template` para una configuración consistente de entornos:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Configuración de Autenticación

### Integración con Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Autenticación con Principal de Servicio
Para pipelines de CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identidad Administrada
Para entornos alojados en Azure:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configuración de Infraestructura

### Parámetros de Bicep
Configura parámetros de infraestructura en `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Configuración de Terraform
Para proyectos Terraform, configura en `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configuración de Despliegue

### Configuración de Build
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Configuración de Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```

## 🔧 Configuración Avanzada

### Nombres Personalizados de Recursos
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configuración de Red
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configuración de Monitoreo
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Configuraciones Específicas de Entorno

### Entorno de Desarrollo
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Entorno de Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Entorno de Producción
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validación de Configuración

### Validar Configuración
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### Scripts de Configuración
Crea scripts de validación en `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validate azure.yaml syntax
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Mejores Prácticas

### 1. Usar Variables de Entorno
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizar Archivos de Configuración
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Consideraciones de Control de Versiones
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Documentación de Configuración
Documenta tu configuración en `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## Próximos Pasos

- [Tu Primer Proyecto](first-project.md) - Aplica la configuración en la práctica
- [Guía de Despliegue](../deployment/deployment-guide.md) - Usa la configuración para el despliegue
- [Provisionamiento de Recursos](../deployment/provisioning.md) - Configuraciones listas para producción

## Referencias

- [Referencia de Configuración de azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Esquema de azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variables de Entorno](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navegación**
- **Lección Anterior**: [Instalación y Configuración](installation.md)
- **Próxima Lección**: [Tu Primer Proyecto](first-project.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.