<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "483bc6a036553e531b9af4d1d9dec31e",
  "translation_date": "2025-09-09T16:44:22+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "es"
}
-->
# Tu Primer Proyecto - Tutorial Práctico

## Introducción

¡Bienvenido a tu primer proyecto con Azure Developer CLI! Este completo tutorial práctico te guiará paso a paso para crear, desplegar y gestionar una aplicación full-stack en Azure utilizando azd. Trabajarás con una aplicación real de tareas pendientes que incluye un frontend en React, un backend API en Node.js y una base de datos MongoDB.

## Objetivos de Aprendizaje

Al completar este tutorial, lograrás:
- Dominar el flujo de inicialización de proyectos azd utilizando plantillas
- Comprender la estructura y los archivos de configuración de proyectos de Azure Developer CLI
- Ejecutar el despliegue completo de una aplicación en Azure con aprovisionamiento de infraestructura
- Implementar actualizaciones de la aplicación y estrategias de redepliegue
- Gestionar múltiples entornos para desarrollo y pruebas
- Aplicar prácticas de limpieza de recursos y gestión de costos

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Inicializar y configurar proyectos azd desde plantillas de forma independiente
- Navegar y modificar estructuras de proyectos azd de manera efectiva
- Desplegar aplicaciones full-stack en Azure con comandos simples
- Solucionar problemas comunes de despliegue y autenticación
- Gestionar múltiples entornos de Azure para diferentes etapas de despliegue
- Implementar flujos de despliegue continuo para actualizaciones de aplicaciones

## Comenzando

### Lista de Verificación de Requisitos Previos
- ✅ Azure Developer CLI instalado ([Guía de Instalación](installation.md))
- ✅ Azure CLI instalado y autenticado
- ✅ Git instalado en tu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verifica tu Configuración
```bash
# Check azd installation
azd version

# Verify Azure authentication
az account show

# Check Node.js version
node --version
```

## Paso 1: Elegir e Inicializar una Plantilla

Comencemos con una plantilla popular de aplicación de tareas pendientes que incluye un frontend en React y un backend API en Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### ¿Qué Acaba de Suceder?
- Se descargó el código de la plantilla en tu directorio local
- Se creó un archivo `azure.yaml` con definiciones de servicios
- Se configuró el código de infraestructura en el directorio `infra/`
- Se creó una configuración de entorno

## Paso 2: Explorar la Estructura del Proyecto

Examinemos lo que azd creó para nosotros:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Deberías ver:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Archivos Clave para Comprender

**azure.yaml** - El núcleo de tu proyecto azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definición de infraestructura:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Paso 3: Personalizar tu Proyecto (Opcional)

Antes de desplegar, puedes personalizar la aplicación:

### Modificar el Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Realiza un cambio simple:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configurar Variables de Entorno
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.0.0"

# View all environment variables
azd env get-values
```

## Paso 4: Desplegar en Azure

¡Ahora viene la parte emocionante: desplegar todo en Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ¿Qué Sucede Durante el Despliegue?

El comando `azd up` realiza estos pasos:
1. **Provisionar** (`azd provision`) - Crea recursos de Azure
2. **Empaquetar** - Construye el código de tu aplicación
3. **Desplegar** (`azd deploy`) - Despliega el código en los recursos de Azure

### Salida Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Paso 5: Probar tu Aplicación

### Acceder a tu Aplicación
Haz clic en la URL proporcionada en la salida del despliegue, o consíguela en cualquier momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Probar la Aplicación de Tareas
1. **Agregar una tarea** - Haz clic en "Add Todo" e ingresa una tarea
2. **Marcar como completada** - Marca las tareas completadas
3. **Eliminar tareas** - Borra las tareas que ya no necesites

### Monitorear tu Aplicación
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Paso 6: Realizar Cambios y Redeplegar

Hagamos un cambio y veamos qué tan fácil es actualizar:

### Modificar la API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Agrega un encabezado de respuesta personalizado:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Desplegar Solo los Cambios de Código
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Paso 7: Gestionar Múltiples Entornos

Crea un entorno de pruebas para verificar cambios antes de producción:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Comparación de Entornos
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Paso 8: Limpiar Recursos

Cuando termines de experimentar, limpia los recursos para evitar cargos continuos:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Lo que Has Aprendido

¡Felicidades! Has logrado:
- Inicializar un proyecto azd desde una plantilla
- Explorar la estructura del proyecto y los archivos clave
- Desplegar una aplicación full-stack en Azure
- Realizar cambios en el código y redeplegar
- Gestionar múltiples entornos
- Limpiar recursos

## Solución de Problemas Comunes

### Errores de Autenticación
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Fallos en el Despliegue
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Conflictos de Nombres de Recursos
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Puertos/Red
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Pasos

Ahora que has completado tu primer proyecto, explora estos temas avanzados:

### 1. Personalizar Infraestructura
- [Infraestructura como Código](../deployment/provisioning.md)
- [Agregar bases de datos, almacenamiento y otros servicios](../deployment/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Integración con GitHub Actions](../deployment/cicd-integration.md)
- [Pipelines de Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Mejores Prácticas para Producción
- [Configuraciones de seguridad](../deployment/best-practices.md#security)
- [Optimización de rendimiento](../deployment/best-practices.md#performance)
- [Monitoreo y registro](../deployment/best-practices.md#monitoring)

### 4. Explorar Más Plantillas
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionales

### Materiales de Aprendizaje
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Marco de Buenas Prácticas de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidad y Soporte
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunidad de Desarrolladores de Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Plantillas y Ejemplos
- [Galería Oficial de Plantillas](https://azure.github.io/awesome-azd/)
- [Plantillas de la Comunidad](https://github.com/Azure-Samples/azd-templates)
- [Patrones Empresariales](https://github.com/Azure/azure-dev/tree/main/templates)

---

**¡Felicidades por completar tu primer proyecto azd!** Ahora estás listo para construir y desplegar aplicaciones increíbles en Azure con confianza.

---

**Navegación**
- **Lección Anterior**: [Configuración](configuration.md)
- **Próxima Lección**: [Guía de Despliegue](../deployment/deployment-guide.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.