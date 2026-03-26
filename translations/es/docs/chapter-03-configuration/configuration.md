# Guía de Configuración

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 3 - Configuración y Autenticación
- **⬅️ Anterior**: [Tu Primer Proyecto](first-project.md)
- **➡️ Siguiente**: [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Siguiente Capítulo**: [Capítulo 4: Infraestructura como Código](../chapter-04-infrastructure/deployment-guide.md)

## Introducción

Esta guía integral cubre todos los aspectos para configurar Azure Developer CLI para flujos de trabajo óptimos de desarrollo y despliegue. Aprenderás sobre la jerarquía de configuración, gestión de entornos, métodos de autenticación y patrones avanzados de configuración que permiten despliegues eficientes y seguros en Azure.

## Objetivos de Aprendizaje

Al terminar esta lección, podrás:
- Dominar la jerarquía de configuración de azd y entender cómo se priorizan las configuraciones
- Configurar ajustes globales y específicos de proyectos efectivamente
- Gestionar múltiples entornos con diferentes configuraciones
- Implementar patrones seguros de autenticación y autorización
- Entender patrones avanzados de configuración para escenarios complejos

## Resultados de Aprendizaje

Después de completar esta lección, podrás:
- Configurar azd para flujos de trabajo de desarrollo óptimos
- Configurar y gestionar múltiples entornos de despliegue
- Implementar prácticas seguras de gestión de configuración
- Resolver problemas relacionados con la configuración
- Personalizar el comportamiento de azd para requerimientos específicos de la organización

Esta guía integral cubre todos los aspectos para configurar Azure Developer CLI para flujos de trabajo óptimos de desarrollo y despliegue.

## Entendiendo los Agentes de IA en un Proyecto azd

Si eres nuevo en agentes de IA, aquí tienes una forma simple de entenderlos dentro del mundo azd.

### ¿Qué es un Agente?

Un agente es un software que puede recibir una solicitud, razonar sobre ella y tomar acciones—frecuentemente llamando a un modelo de IA, consultando datos o invocando otros servicios. En un proyecto azd, un agente es simplemente otro **servicio** junto a tu frontend web o backend API.

### Cómo Encajan los Agentes en la Estructura de un Proyecto azd

Un proyecto azd está compuesto por tres capas: **infraestructura**, **código** y **configuración**. Los agentes se conectan a estas capas igual que cualquier otro servicio:

| Capa | Lo que hace para una App Tradicional | Lo que hace para un Agente |
|-------|-------------------------------------|---------------------------|
| **Infraestructura** (`infra/`) | Provee una app web y base de datos | Provee un endpoint de modelo de IA, índice de búsqueda o host de agente |
| **Código** (`src/`) | Contiene el código fuente de frontend y API | Contiene la lógica del agente y definiciones de prompts |
| **Configuración** (`azure.yaml`) | Lista tus servicios y sus destinos de hosting | Lista tu agente como servicio, apuntando a su código y host |

### El Rol de `azure.yaml`

No necesitas memorizar la sintaxis ahora mismo. Conceptualmente, `azure.yaml` es el archivo donde le dices a azd: *"Aquí están los servicios que componen mi aplicación, y aquí está dónde encontrar su código."*

Cuando tu proyecto incluye un agente de IA, `azure.yaml` simplemente enumera ese agente como uno de los servicios. azd entonces sabe provisionar la infraestructura correcta (como un endpoint de Microsoft Foundry Models o una Container App para hospedar el agente) y desplegar el código de tu agente—igual que lo haría para una app web o API.

Esto significa que no hay nada fundamentalmente nuevo que aprender. Si entiendes cómo azd gestiona un servicio web, ya entiendes cómo gestiona un agente.

## Jerarquía de Configuración

azd usa un sistema jerárquico de configuración:
1. **Flags de línea de comandos** (mayor prioridad)
2. **Variables de entorno**
3. **Configuración local del proyecto** (`.azd/config.json`)
4. **Configuración global del usuario** (`~/.azd/config.json`)
5. **Valores por defecto** (menor prioridad)

## Configuración Global

### Estableciendo Valores Globales Predeterminados
```bash
# Establecer suscripción predeterminada
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Establecer ubicación predeterminada
azd config set defaults.location "eastus2"

# Establecer convención predeterminada para nombres de grupos de recursos
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Ver toda la configuración global
azd config list

# Eliminar una configuración
azd config unset defaults.location
```

### Configuraciones Globales Comunes
```bash
# Preferencias de desarrollo
azd config set alpha.enable true                    # Habilitar funciones alfa
azd config set telemetry.enabled false             # Desactivar telemetría
azd config set output.format json                  # Establecer formato de salida

# Configuraciones de seguridad
azd config set auth.useAzureCliCredential true     # Usar Azure CLI para autenticación
azd config set tls.insecure false                  # Forzar verificación TLS

# Optimización de rendimiento
azd config set provision.parallelism 5             # Creación paralela de recursos
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

### Opciones de Configuración del Servicio

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

#### Configuraciones Específicas por Lenguaje
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

### Creando Entornos
```bash
# Crear un nuevo entorno
azd env new development

# Crear con ubicación específica
azd env new staging --location "westus2"

# Crear desde plantilla
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuración del Entorno
Cada entorno tiene su propia configuración en `.azure/<nombre-del-entorno>/config.json`:

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
# API_KEY=clave-api-secreta
# DEBUG=true

# Eliminar variable de entorno
azd env unset DEBUG

# Verificar eliminación
azd env get-values | grep DEBUG
# (debería no devolver nada)
```

### Plantillas de Entorno
Crea `.azure/env.template` para configuración consistente de entornos:
```bash
# Variables requeridas
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Configuraciones de la aplicación
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Configuraciones opcionales de desarrollo
DEBUG=false
LOG_LEVEL=info
```

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

### Identidad Gestionada
Para entornos alojados en Azure:
```bash
# Habilitar la autenticación de identidad administrada
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
Ejemplo de `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configuración Avanzada

### Nombres Personalizados para Recursos
```bash
# Establecer convenciones de nombres
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
# .azure/producción/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validación de Configuración

### Validar Configuración
```bash
# Comprobar la sintaxis de la configuración
azd config validate

# Probar variables de entorno
azd env get-values

# Validar la infraestructura
azd provision --dry-run
```

### Scripts de Configuración
Crea scripts de validación en `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Verificar variables de entorno requeridas
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

### 3. Consideraciones para Control de Versiones
```bash
# .gitignore
.azure/*/config.json         # Configuraciones del entorno (contienen IDs de recursos)
.azure/*/.env               # Variables de entorno (pueden contener secretos)
.env                        # Archivo del entorno local
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

**Objetivo**: Crear y configurar tres entornos con diferentes ajustes

```bash
# Crear entorno de desarrollo
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Crear entorno de pruebas
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
- [ ] Tres entornos creados exitosamente
- [ ] Cada entorno tiene configuración única
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

# Ver entorno (los secretos deben ser redactados)
azd env get-values

# Verificar que los secretos estén almacenados
azd env get DB_PASSWORD  # Debe mostrar el valor real
```

**Criterios de Éxito:**
- [ ] Secretos almacenados sin mostrarse en el terminal
- [ ] `azd env get-values` muestra secretos enmascarados
- [ ] `azd env get <SECRET_NAME>` individual recupera el valor real

## Próximos Pasos

- [Tu Primer Proyecto](first-project.md) - Aplica la configuración en práctica
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Usa la configuración para despliegue
- [Provisionamiento de Recursos](../chapter-04-infrastructure/provisioning.md) - Configuraciones listas para producción

## Referencias

- [Referencia de Configuración de azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Esquema de azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variables de Entorno](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

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
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->