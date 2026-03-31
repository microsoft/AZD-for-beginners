# Guía de Configuración

**Chapter Navigation:**
- **📚 Inicio del curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 3 - Configuración y Autenticación
- **⬅️ Anterior**: [Tu primer proyecto](first-project.md)
- **➡️ Siguiente**: [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Siguiente capítulo**: [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/deployment-guide.md)

## Introducción

Esta guía integral cubre todos los aspectos de la configuración de Azure Developer CLI para flujos de trabajo de desarrollo y despliegue óptimos. Aprenderás sobre la jerarquía de configuración, la gestión de entornos, los métodos de autenticación y patrones de configuración avanzados que permiten despliegues en Azure eficientes y seguros.

## Objetivos de aprendizaje

Al final de esta lección, podrás:
- Dominar la jerarquía de configuración de azd y entender cómo se priorizan las configuraciones
- Configurar ajustes globales y específicos del proyecto de manera efectiva
- Gestionar múltiples entornos con configuraciones diferentes
- Implementar patrones seguros de autenticación y autorización
- Entender patrones de configuración avanzados para escenarios complejos

## Resultados de aprendizaje

Después de completar esta lección, podrás:
- Configurar azd para flujos de trabajo de desarrollo óptimos
- Configurar y gestionar múltiples entornos de despliegue
- Implementar prácticas seguras de gestión de configuración
- Solucionar problemas relacionados con la configuración
- Personalizar el comportamiento de azd para requisitos organizacionales específicos

Esta guía integral cubre todos los aspectos de la configuración de Azure Developer CLI para flujos de trabajo de desarrollo y despliegue óptimos.

## Comprendiendo a los agentes de IA en un proyecto azd

Si eres nuevo en los agentes de IA, aquí tienes una forma sencilla de pensar en ellos dentro del mundo azd.

### ¿Qué es un agente?

Un agente es una pieza de software que puede recibir una solicitud, razonar sobre ella y tomar acciones—a menudo llamando a un modelo de IA, consultando datos o invocando otros servicios. En un proyecto azd, un agente es simplemente otro **servicio** junto a tu frontend web o backend de API.

### Cómo encajan los agentes en la estructura del proyecto azd

Un proyecto azd está compuesto por tres capas: **infrastructure**, **code**, y **configuration**. Los agentes se integran en estas capas de la misma manera que cualquier otro servicio:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Proporciona una aplicación web y una base de datos | Proporciona un endpoint de modelo de IA, un índice de búsqueda o un host para el agente |
| **Code** (`src/`) | Contiene el código fuente de tu frontend y API | Contiene la lógica de tu agente y las definiciones de prompts |
| **Configuration** (`azure.yaml`) | Enumera tus servicios y sus destinos de hospedaje | Enumera tu agente como un servicio, apuntando a su código y host |

### El papel de `azure.yaml`

No necesitas memorizar la sintaxis ahora mismo. Conceptualmente, `azure.yaml` es el archivo donde le dices a azd: *"Aquí están los servicios que componen mi aplicación, y aquí es donde se encuentra su código."*

Cuando tu proyecto incluye un agente de IA, `azure.yaml` simplemente lista ese agente como uno de los servicios. azd entonces sabe aprovisionar la infraestructura adecuada (como un Microsoft Foundry Models endpoint o una Container App para alojar el agente) y desplegar el código de tu agente—tal como lo haría para una aplicación web o una API.

Esto significa que no hay nada fundamentalmente nuevo que aprender. Si entiendes cómo azd gestiona un servicio web, ya entiendes cómo gestiona un agente.

## Jerarquía de configuración

azd usa un sistema de configuración jerárquico:
1. **Opciones de línea de comandos** (prioridad más alta)
2. **Variables de entorno**
3. **Configuración del proyecto local** (`.azd/config.json`)
4. **Configuración global del usuario** (`~/.azd/config.json`)
5. **Valores predeterminados** (prioridad más baja)

## Configuración global

### Establecer valores predeterminados
```bash
# Establecer suscripción predeterminada
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Establecer ubicación predeterminada
azd config set defaults.location "eastus2"

# Establecer la convención de nombres predeterminada para grupos de recursos
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Ver toda la configuración global
azd config show

# Eliminar una configuración
azd config unset defaults.location
```

### Configuraciones globales comunes
```bash
# Preferencias de desarrollo
azd config set alpha.enable true                    # Habilitar funciones alfa
azd config set telemetry.enabled false             # Desactivar telemetría
azd config set output.format json                  # Establecer formato de salida

# Configuración de seguridad
azd config set auth.useAzureCliCredential true     # Usar Azure CLI para autenticación
azd config set tls.insecure false                  # Forzar verificación TLS

# Ajuste de rendimiento
azd config set provision.parallelism 5             # Creación paralela de recursos
azd config set deploy.timeout 30m                  # Tiempo de espera de despliegue
```

## 🏗️ Configuración del proyecto

### Estructura de azure.yaml
El archivo `azure.yaml` es el corazón de tu proyecto azd:

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

### Opciones de configuración del servicio

#### Tipos de host
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

#### Configuraciones específicas por lenguaje
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

## 🌟 Gestión de entornos

### Creación de entornos
```bash
# Crear un nuevo entorno
azd env new development

# Crear con ubicación específica
azd env new staging --location "westus2"

# Crear a partir de una plantilla
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuración del entorno
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

### Variables de entorno
```bash
# Establecer variables específicas del entorno
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Ver variables de entorno
azd env get-values

# Salida esperada:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Eliminar variable de entorno
azd env unset DEBUG

# Verificar la eliminación
azd env get-values | grep DEBUG
# (no debería devolver nada)
```

### Plantillas de entorno
Crea `.azure/env.template` para una configuración coherente del entorno:
```bash
# Variables requeridas
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Configuración de la aplicación
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Configuraciones opcionales de desarrollo
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Configuración de autenticación

### Integración con Azure CLI
```bash
# Usar credenciales de Azure CLI (predeterminado)
azd config set auth.useAzureCliCredential true

# Iniciar sesión con un tenant específico
az login --tenant <tenant-id>

# Establecer suscripción predeterminada
az account set --subscription <subscription-id>
```

### Autenticación con principal de servicio
Para pipelines de CI/CD:
```bash
# Establecer variables de entorno
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# O configurar directamente
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identidad administrada
Para entornos alojados en Azure:
```bash
# Habilitar la autenticación con identidad administrada
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configuración de infraestructura

### Parámetros de Bicep
Configura los parámetros de infraestructura en `infra/main.parameters.json`:
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
Para proyectos con Terraform, configura en `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configuración de despliegue

### Configuración de compilación
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
Ejemplo `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configuración avanzada

### Nomenclatura personalizada de recursos
```bash
# Establecer convenciones de nomenclatura
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configuración de red
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configuración de monitoreo
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

## 🎯 Configuraciones específicas por entorno

### Entorno de desarrollo
```bash
# .azure/desarrollo/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Entorno de preproducción
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Entorno de producción
```bash
# .azure/producción/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validación de configuración

### Validar configuración
```bash
# Comprobar la sintaxis de la configuración
azd config validate

# Probar las variables de entorno
azd env get-values

# Validar la infraestructura
azd provision --dry-run
```

### Scripts de configuración
Crea scripts de validación en `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Comprobar las variables de entorno requeridas
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validar la sintaxis de azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Mejores prácticas

### 1. Usar variables de entorno
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizar archivos de configuración
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

### 3. Consideraciones de control de versiones
```bash
# .gitignore
.azure/*/config.json         # Configuraciones de entorno (contienen identificadores de recursos)
.azure/*/.env               # Variables de entorno (pueden contener secretos)
.env                        # Archivo de entorno local
```

### 4. Documentación de la configuración
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

## 🎯 Ejercicios prácticos

### Ejercicio 1: Configuración multientorno (15 minutos)

**Objetivo**: Crear y configurar tres entornos con configuraciones diferentes

```bash
# Crear entorno de desarrollo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Crear entorno de preproducción
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Crear entorno de producción
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verificar cada entorno
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Criterios de éxito:**
- [ ] Tres entornos creados con éxito
- [ ] Cada entorno tiene configuración única
- [ ] Se puede cambiar entre entornos sin errores
- [ ] `azd env list` muestra los tres entornos

### Ejercicio 2: Gestión de secretos (10 minutos)

**Objetivo**: Practicar la configuración segura con datos sensibles

```bash
# Establecer secretos (no se muestran en la salida)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Establecer configuración no secreta
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Ver el entorno (los secretos deben estar redactados)
azd env get-values

# Verificar que los secretos estén almacenados
azd env get DB_PASSWORD  # Debería mostrar el valor real
```

**Criterios de éxito:**
- [ ] Los secretos se almacenan sin mostrarse en la terminal
- [ ] `azd env get-values` muestra secretos enmascarados
- [ ] `azd env get <SECRET_NAME>` recupera el valor real

## Próximos pasos

- [Tu primer proyecto](first-project.md) - Aplicar la configuración en la práctica
- [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md) - Usar la configuración para el despliegue
- [Aprovisionamiento de recursos](../chapter-04-infrastructure/provisioning.md) - Configuraciones listas para producción

## Referencias

- [Referencia de configuración de azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Esquema de azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variables de entorno](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Inicio del curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 3 - Configuración y Autenticación
- **⬅️ Anterior**: [Tu primer proyecto](first-project.md)
- **➡️ Siguiente capítulo**: [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/deployment-guide.md)
- **Próxima lección**: [Tu primer proyecto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->