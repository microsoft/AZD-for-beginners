# Tu Primer Proyecto - Tutorial Práctico

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Instalación y Configuración](installation.md)
- **➡️ Siguiente**: [Trae Tu Propia Aplicación](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducción

¡Bienvenido a tu primer proyecto con Azure Developer CLI! Desplegarás una aplicación de tareas con un frontend en React, una API en Node.js y Azure Cosmos DB. La plantilla conserva el nombre histórico `todo-nodejs-mongo`; su infraestructura actual usa Cosmos DB para NoSQL, así que revisa el README descargado y `infra/` en lugar de inferir la API de base de datos por el nombre.

> Revisado con `azd 1.37.2` y la plantilla pública en noviembre de 2026. Los ejemplos a continuación usan Bash; la extracción JSON también requiere `jq`. Los despliegues en Azure generan costos y no se ejecutaron durante esta revisión.

## Objetivos de Aprendizaje

Al completar este tutorial, podrás:
- Dominar el flujo de trabajo de inicialización de proyectos azd usando plantillas
- Entender la estructura del proyecto Azure Developer CLI y sus archivos de configuración
- Ejecutar el despliegue completo de la aplicación en Azure con aprovisionamiento de infraestructura
- Implementar actualizaciones de la aplicación y estrategias de redepliegue
- Gestionar múltiples entornos para desarrollo y pruebas
- Aplicar prácticas de limpieza de recursos y gestión de costos

## Resultados del Aprendizaje

Al finalizar, serás capaz de:
- Inicializar y configurar proyectos azd desde plantillas de forma independiente
- Navegar y modificar efectivamente las estructuras de proyectos azd
- Desplegar aplicaciones full-stack en Azure con comandos únicos
- Diagnosticar problemas comunes de despliegue y autenticación
- Administrar múltiples entornos de Azure para diferentes etapas de despliegue
- Implementar flujos de trabajo de despliegue continuo para actualizaciones de aplicaciones

## Comenzando

### Lista de Requisitos Previos
- ✅ Azure Developer CLI instalado ([Guía de Instalación](installation.md))
- ✅ Autenticación en AZD completada con `azd auth login`
- ✅ Git instalado en tu sistema
- ✅ Node.js 22 LTS (o una versión compatible requerida por la plantilla descargada)
- ✅ Visual Studio Code (recomendado)

Antes de continuar, ejecuta el validador de configuración desde la raíz del repositorio:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifica tu Configuración
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifica la autenticación opcional de Azure CLI

```bash
az account show
```

### Comprueba la versión de Node.js
```bash
node --version
```

## Paso 1: Elegir e Inicializar una Plantilla

Comencemos con una plantilla popular de aplicación de tareas que incluye frontend en React y backend API en Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

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

## Paso 2: Explora la Estructura del Proyecto

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
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Archivos Clave para Entender

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

## Paso 3: Personaliza tu Proyecto (Opcional)

Antes de desplegar, puedes personalizar la aplicación:

### Modifica el Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Haz un cambio simple:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configura Variables de Entorno
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Estos dos valores personalizados demuestran almacenamiento local únicamente. La plantilla base no consume `WEBSITE_TITLE` ni `API_VERSION`, por lo que no cambian la app. La edición explícita de la fuente arriba cambia el título mostrado.

## Paso 4: Despliega en Azure

Ahora viene la parte emocionante: ¡desplegar todo en Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ¿Qué Está Pasando Durante el Despliegue?

El flujo aprovisiona infraestructura y empaqueta/despliega el código. El orden exacto puede personalizarse mediante `workflows.up` en `azure.yaml`; esta plantilla especifica provisionar seguido de desplegar. No confíes en un orden universal de fases para todas las plantillas.

### Salida Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Paso 5: Prueba tu Aplicación

### Accede a tu Aplicación
Haz clic en la URL proporcionada en la salida del despliegue, o consíguela en cualquier momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Prueba la App de Tareas
1. **Agrega un ítem a la lista** - Haz clic en "Agregar tarea" y escribe una tarea
2. **Marca como completado** - Marca los ítems completados
3. **Elimina ítems** - Borra las tareas que ya no necesites

### Monitorea tu Aplicación
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifica tu Despliegue

Antes de continuar, realiza esta rápida lista de verificación para confirmar que todo realmente funciona—no asumas que "despliegue exitoso" significa "app funciona":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**El despliegue se verifica cuando:**
- ✅ `azd show` lista una URL de endpoint accesible
- ✅ La URL se abre en tu navegador sin errores
- ✅ Las funciones principales funcionan (agregar/completar/eliminar una tarea)
- ✅ `azd monitor --logs` muestra solicitudes llegando sin errores inesperados

Si alguna verificación falla, dirígete a [Capítulo 7: Solución de Problemas](../chapter-07-troubleshooting/README.md).

## Paso 6: Haz Cambios y Redepliega

Hagamos un cambio y veamos qué tan fácil es actualizar:

### Modifica la API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Agrega un encabezado de respuesta personalizado:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Despliega Solo los Cambios de Código
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Paso 7: Gestiona Múltiples Entornos

Crea un entorno de staging para probar cambios antes de producción:

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

## Paso 8: Limpia Recursos

Cuando termines de experimentar, limpia para evitar cargos continuos:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Aplicación Clásica vs. Aplicación con IA: Mismo Flujo de Trabajo

Acabas de desplegar una aplicación web tradicional. Pero, ¿qué pasa si quieres desplegar una aplicación con IA—por ejemplo, una app de chat basada en Microsoft Foundry Models?

La buena noticia: **el flujo es idéntico.**

| Paso | App de Tareas Clásica | App de Chat con IA |
|------|-----------------|-------------|
| Inicializar (directorio vacío) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autenticar | `azd auth login` | `azd auth login` |
| Desplegar | `azd up` | `azd up` |
| Monitorear | `azd monitor` | `azd monitor` |
| Limpiar | `azd down --force --purge` | `azd down --force --purge` |

Los comandos del ciclo de vida son iguales, pero los requisitos previos difieren. Una plantilla IA puede requerir acceso a modelos, cuota regional, ingestión de datos y configuración adicional. Lee su README antes del despliegue; `azd up` no puede suministrar permisos o cuotas faltantes.

Este es el principio central de azd: **un flujo, cualquier carga de trabajo.** Las habilidades practicadas en este tutorial—inicialización, despliegue, monitoreo, redepliegue y limpieza—se aplican igual a aplicaciones y agentes de IA.

---

## Lo Que Has Aprendido

¡Felicidades! Has:
- ✅ Inicializado un proyecto azd desde plantilla
- ✅ Exploraste la estructura del proyecto y archivos clave
- ✅ Desplegado una aplicación full-stack en Azure
- ✅ Realizado cambios de código y redeplegado
- ✅ Gestionado múltiples entornos
- ✅ Limpiado los recursos

## 🎯 Ejercicios para Validar Habilidades

### Ejercicio 1: Despliega una Plantilla Diferente (15 minutos)
**Objetivo**: Demostrar dominio de azd init y flujo de despliegue

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] La aplicación despliega sin errores
- [ ] Se puede acceder a la URL de la aplicación en el navegador
- [ ] La aplicación funciona correctamente (agregar/eliminar tareas)
- [ ] Todos los recursos se limpian exitosamente

### Ejercicio 2: Personaliza Configuración (20 minutos)
**Objetivo**: Practicar almacenamiento de valores de entorno local sin confundirlo con configuración en tiempo de ejecución

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Criterios de Éxito:**
- [ ] Entorno personalizado creado exitosamente
- [ ] Variables de entorno configuradas y recuperables
- [ ] `azd env get-value APP_TITLE` imprime `My Custom Todo App`
- [ ] Puede explicar por qué estos valores no cambian la app base a menos que el código/infraestructura los consuma

### Ejercicio 3: Flujo Multi-Entorno (25 minutos)
**Objetivo**: Dominar gestión de entornos y estrategias de despliegue

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criterios de Éxito:**
- [ ] Se crean dos entornos con configuraciones diferentes
- [ ] Ambos entornos desplegados exitosamente
- [ ] Se puede cambiar entre entornos usando `azd env select`
- [ ] Las variables de entorno difieren entre ambientes
- [ ] Ambos entornos limpiados exitosamente

## 📊 Tu Progreso

**Tiempo Invertido**: ~60-90 minutos  
**Habilidades Adquiridas**:
- ✅ Inicialización de proyectos basado en plantillas
- ✅ Aprovisionamiento de recursos Azure
- ✅ Flujos de despliegue de aplicaciones
- ✅ Gestión de entornos
- ✅ Gestión de configuración
- ✅ Limpieza de recursos y gestión de costos

**Siguiente Nivel**: ¡Estás listo para la [Guía de Configuración](../chapter-03-configuration/configuration.md) para aprender patrones avanzados de configuración!

## Solución de Problemas Comunes

### Errores de Autenticación
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Fallos de Despliegue
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflictos de Nombres de Recursos
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Puerto/Red
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Pasos

Ahora que completaste tu primer proyecto, explora estos temas avanzados:

### 1. Personaliza Infraestructura
- [Infraestructura como Código](../chapter-04-infrastructure/provisioning.md)
- [Agregar infraestructura de base de datos](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Configura CI/CD
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Flujos completos de CI/CD
- [Documentación Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuración de pipelines

### 3. Mejores Prácticas en Producción
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, rendimiento y monitoreo

### 4. Explora Más Plantillas
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Recursos Adicionales

### Materiales de Aprendizaje
- [Documentación Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Marco Well-Architected de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidad y Soporte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Comunidad Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Plantillas y Ejemplos
- [Galería Oficial de Plantillas](https://azure.github.io/awesome-azd/)
- [Contribuciones de Plantillas de la Comunidad](https://github.com/Azure/awesome-azd)
- [Origen Plantilla de Tareas](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**¡Felicidades por completar tu primer proyecto azd!** Ahora estás listo para construir y desplegar aplicaciones increíbles en Azure con confianza.

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Instalación y Configuración](installation.md)
- **➡️ Siguiente**: [Trae Tu Propia Aplicación](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->