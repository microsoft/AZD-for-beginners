# Guía de Configuración

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 3 - Configuración y Autenticación
- **⬅️ Anterior**: [Tu Primer Proyecto](first-project.md)
- **➡️ Siguiente**: [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Siguiente Capítulo**: [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/deployment-guide.md)

## Introducción

Esta guía completa cubre todos los aspectos de la configuración de Azure Developer CLI para flujos de trabajo óptimos de desarrollo y despliegue. Aprenderás sobre la jerarquía de configuración, la gestión de entornos, los métodos de autenticación y los patrones avanzados de configuración que permiten despliegues en Azure eficientes y seguros.

## Objetivos de Aprendizaje

Al final de esta lección, tú:
- Dominarás la jerarquía de configuración de azd y entenderás cómo se priorizan los ajustes
- Configurarás ajustes globales y específicos del proyecto de forma efectiva
- Gestionarás múltiples entornos con diferentes configuraciones
- Implementarás patrones seguros de autenticación y autorización
- Entenderás patrones avanzados de configuración para escenarios complejos

## Resultados de Aprendizaje

Después de completar esta lección, serás capaz de:
- Configurar azd para flujos de trabajo de desarrollo óptimos
- Configurar y gestionar múltiples entornos de despliegue
- Implementar prácticas seguras de gestión de configuración
- Solucionar problemas relacionados con la configuración
- Personalizar el comportamiento de azd para requisitos organizacionales específicos

Esta guía completa cubre todos los aspectos de la configuración de Azure Developer CLI para flujos de trabajo óptimos de desarrollo y despliegue.

## Entendiendo los Agentes de IA en un Proyecto azd

Si eres nuevo en los agentes de IA, aquí tienes una forma simple de pensarlos dentro del mundo azd.

### ¿Qué es un Agente?

Un agente es un fragmento de software que puede recibir una solicitud, razonar sobre ella y tomar acciones—a menudo llamando a un modelo de IA, consultando datos o invocando otros servicios. En un proyecto azd, un agente es solo otro **servicio** junto a tu frontend web o backend API.

### Cómo Encajan los Agentes en la Estructura del Proyecto azd

Un proyecto azd está compuesto por tres capas: **infraestructura**, **código** y **configuración**. Los agentes se conectan a estas capas de la misma manera que cualquier otro servicio:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions a web app and database | Provisions an AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Contains your frontend and API source code | Contains your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | Lists your services and their hosting targets | Lists your agent as a service, pointing to its code and host |

### El Rol de `azure.yaml`

No necesitas memorizar la sintaxis ahora mismo. Conceptualmente, `azure.yaml` es el archivo donde le dices a azd: *"Aquí están los servicios que componen mi aplicación, y aquí es donde encontrar su código."*

Cuando tu proyecto incluye un agente de IA, `azure.yaml` simplemente lista ese agente como uno de los servicios. azd entonces sabe aprovisionar la infraestructura adecuada (como un endpoint de Microsoft Foundry Models o una Container App para hospedar el agente) y desplegar el código de tu agente—tal como lo haría para una aplicación web o API.

Esto significa que no hay nada fundamentalmente nuevo que aprender. Si entiendes cómo azd gestiona un servicio web, ya entiendes cómo gestiona un agente.

## Jerarquía de Configuración

azd usa un sistema de configuración jerárquico:
1. **Flags de línea de comando** (mayor prioridad)
2. **Variables de entorno**
3. **Configuración local del proyecto** (`.azd/config.json`)
4. **Configuración global del usuario** (`~/.azd/config.json`)
5. **Valores por defecto** (menor prioridad)

## Configuración Global

### Estableciendo Valores Predeterminados Globales
```bash
# Establecer la suscripción predeterminada
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Establecer la ubicación predeterminada
azd config set defaults.location "eastus2"

# Establecer la convención de nombres predeterminada para grupos de recursos
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Ver toda la configuración global
azd config show

# Eliminar una configuración
azd config unset defaults.location
```

### Ajustes Globales Comunes
```bash
# Preferencias de desarrollo
azd config set alpha.enable true                    # Habilitar funciones alfa
azd config set telemetry.enabled false             # Desactivar telemetría
azd config set output.format json                  # Establecer formato de salida

# Configuración de seguridad
azd config set auth.useAzureCliCredential true     # Usar Azure CLI para la autenticación
azd config set tls.insecure false                  # Forzar la verificación TLS

# Optimización del rendimiento
azd config set provision.parallelism 5             # Creación de recursos en paralelo
azd config set deploy.timeout 30m                  # Tiempo de espera de despliegue
```

## 🏗️ Configuración del Proyecto

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

### Opciones de Configuración de Servicios

#### Tipos de Hosting
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

#### Ajustes Específicos por Lenguaje
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
# Crear un nuevo entorno
azd env new development

# Crear con ubicación específica
azd env new staging --location "westus2"

# Crear a partir de una plantilla
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuración del Entorno
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

# Verificar eliminación
azd env get-values | grep DEBUG
# (no debería devolver nada)
```

### Plantillas de Entorno
Crea `.azure/env.template` para una configuración de entorno coherente:
```bash
# Variables requeridas
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Configuración de la aplicación
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Ajustes opcionales de desarrollo
DEBUG=false
LOG_LEVEL=info
```

### Compartir Entornos en un Equipo

Cuando más de una persona trabaja en un proyecto, necesitan ponerse de acuerdo sobre **qué viaja con el repositorio y qué se mantiene local**. azd mantiene cada entorno bajo una carpeta `.azure/`, y no todo debería ser comprometido.

**Qué hay en `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Qué ignorar en git.** El `.gitignore` predeterminado de azd ya excluye `.azure/`. Manténlo así—los archivos `.env` pueden contener secretos, y los IDs de recursos son específicos de quien los aprovisionó. Cada compañero de equipo crea su **propio** entorno localmente:

```bash
# Cada desarrollador ejecuta esto una vez para obtener su propio entorno aislado
azd env new dev-alice
azd up
```

**Cambiar entre entornos.** Un desarrollador que gestiona varios entornos selecciona el activo antes de ejecutar comandos:

```bash
azd env list                 # ver todos los entornos locales y cuál es el predeterminado
azd env select staging       # establecer 'staging' como el entorno activo
azd env get-values           # confirmar que estás apuntando al entorno correcto
```

**Proveer valores por defecto no secretos al equipo.** Haz commit de una plantilla (como la `.azure/env.template` arriba) para que todos sepan qué variables establecer—pero nunca hagas commit de los valores rellenados. Los nuevos compañeros copian la plantilla y completan sus propios valores.

**Entornos en CI/CD.** Las pipelines no leen tu carpeta local `.azure/`. En su lugar, proporciona los valores del entorno como variables/secretos de la pipeline, y azd los lee desde el entorno del proceso:

```bash
# En CI, azd los lee desde el entorno, no desde .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Regla general:** el código de infraestructura (`infra/`, `azure.yaml`) se comparte en Git; el *estado y secretos del entorno* (`.azure/`) son por desarrollador y por pipeline. `azd pipeline config` configura las variables de la pipeline por ti automáticamente.

## 🔐 Configuración de Autenticación

### Integración con Azure CLI
```bash
# Usar credenciales de Azure CLI (predeterminado)
azd config set auth.useAzureCliCredential true

# Iniciar sesión con un tenant específico
az login --tenant <tenant-id>

# Establecer suscripción predeterminada
az account set --subscription <subscription-id>
```

### Autenticación con Service Principal
Para pipelines CI/CD:
```bash
# Establecer variables de entorno
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# O configurar directamente
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Para entornos hospedados en Azure:
```bash
# Habilitar la autenticación mediante identidad administrada
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configuración de Infraestructura

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
Ejemplo `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configuración Avanzada

### Nombres Personalizados de Recursos
```bash
# Establecer convenciones de nomenclatura
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

### Configuración de Monitorización
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

## 🎯 Configuraciones Específicas por Entorno

### Entorno de Desarrollo
```bash
# .azure/desarrollo/.env
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
# Comprobar la sintaxis de configuración
azd config validate

# Probar variables de entorno
azd env get-values

# Validar infraestructura
azd provision --dry-run
```

### Scripts de Configuración
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

## 🎓 Mejores Prácticas

### 1. Usa Variables de Entorno
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiza los Archivos de Configuración
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
.azure/*/config.json         # Configuraciones del entorno (contienen identificadores de recursos)
.azure/*/.env               # Variables de entorno (pueden contener secretos)
.env                        # Archivo de entorno local
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

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Configuración Multi-Entorno (15 minutos)

**Objetivo**: Crear y configurar tres entornos con ajustes diferentes

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

**Criterios de Éxito:**
- [ ] Tres entornos creados con éxito
- [ ] Cada entorno tiene una configuración única
- [ ] Se puede cambiar entre entornos sin errores
- [ ] `azd env list` muestra los tres entornos

### Ejercicio 2: Gestión de Secretos (10 minutos)

**Objetivo**: Practicar configuración segura con datos sensibles

```bash
# Establecer secretos (no se muestran en la salida)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Establecer configuración no secreta
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Ver entorno (los secretos deben estar redactados)
azd env get-values

# Verificar que los secretos estén almacenados
azd env get DB_PASSWORD  # Debería mostrar el valor real
```

**Criterios de Éxito:**
- [ ] Secretos almacenados sin mostrarse en el terminal
- [ ] `azd env get-values` muestra secretos redactados
- [ ] `azd env get <SECRET_NAME>` individual recupera el valor real

## Siguientes Pasos

- [Tu Primer Proyecto](first-project.md) - Aplica la configuración en la práctica
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Usa la configuración para el despliegue
- [Aprovisionamiento de Recursos](../chapter-04-infrastructure/provisioning.md) - Configuraciones listas para producción

## Referencias

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 3 - Configuración y Autenticación
- **⬅️ Anterior**: [Tu Primer Proyecto](first-project.md)
- **➡️ Siguiente Capítulo**: [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/deployment-guide.md)
- **Siguiente Lección**: [Tu Primer Proyecto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->