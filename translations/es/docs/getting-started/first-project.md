<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-19T20:43:26+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "es"
}
-->
# Tu Primer Proyecto - Tutorial Práctico

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Comienzo Rápido
- **⬅️ Anterior**: [Instalación y Configuración](installation.md)
- **➡️ Siguiente**: [Configuración](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo con Enfoque en IA](../microsoft-foundry/microsoft-foundry-integration.md)

## Introducción

¡Bienvenido a tu primer proyecto con Azure Developer CLI! Este tutorial práctico y completo te guiará paso a paso en la creación, implementación y gestión de una aplicación full-stack en Azure utilizando azd. Trabajarás con una aplicación real de tareas pendientes que incluye un frontend en React, un backend API en Node.js y una base de datos MongoDB.

## Objetivos de Aprendizaje

Al completar este tutorial, podrás:
- Dominar el flujo de inicialización de proyectos azd utilizando plantillas
- Comprender la estructura de proyectos y archivos de configuración de Azure Developer CLI
- Ejecutar la implementación completa de aplicaciones en Azure con aprovisionamiento de infraestructura
- Implementar actualizaciones de aplicaciones y estrategias de reimplementación
- Gestionar múltiples entornos para desarrollo y pruebas
- Aplicar prácticas de limpieza de recursos y gestión de costos

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Inicializar y configurar proyectos azd desde plantillas de forma independiente
- Navegar y modificar estructuras de proyectos azd de manera efectiva
- Implementar aplicaciones full-stack en Azure con comandos simples
- Solucionar problemas comunes de implementación y autenticación
- Gestionar múltiples entornos de Azure para diferentes etapas de implementación
- Implementar flujos de trabajo de implementación continua para actualizaciones de aplicaciones

## Comenzando

### Lista de Verificación de Requisitos Previos
- ✅ Azure Developer CLI instalado ([Guía de Instalación](installation.md))
- ✅ Azure CLI instalado y autenticado
- ✅ Git instalado en tu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verifica tu Configuración
```bash
# Verificar la instalación de azd
azd version
```
### Verificar autenticación en Azure

```bash
az account show
```

### Verificar versión de Node.js
```bash
node --version
```

## Paso 1: Elegir e Inicializar una Plantilla

Comencemos con una plantilla popular de aplicación de tareas pendientes que incluye un frontend en React y un backend API en Node.js.

```bash
# Explorar las plantillas disponibles
azd template list

# Inicializar la plantilla de la aplicación de tareas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga las indicaciones:
# - Ingrese un nombre de entorno: "dev"
# - Elija una suscripción (si tiene varias)
# - Elija una región: "Este de EE. UU. 2" (o su región preferida)
```

### ¿Qué Acaba de Suceder?
- Se descargó el código de la plantilla en tu directorio local
- Se creó un archivo `azure.yaml` con definiciones de servicios
- Se configuró el código de infraestructura en el directorio `infra/`
- Se creó una configuración de entorno

## Paso 2: Explorar la Estructura del Proyecto

Examinemos lo que azd creó para nosotros:

```bash
# Ver la estructura del proyecto
tree /f   # Windows
# o
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
# Ver la configuración del proyecto
cat azure.yaml
```

**infra/main.bicep** - Definición de infraestructura:
```bash
# Ver el código de infraestructura
head -30 infra/main.bicep
```

## Paso 3: Personalizar tu Proyecto (Opcional)

Antes de implementar, puedes personalizar la aplicación:

### Modificar el Frontend
```bash
# Abre el componente de la aplicación React
code src/web/src/App.tsx
```

Haz un cambio simple:
```typescript
// Encuentra el título y cámbialo
<h1>My Awesome Todo App</h1>
```

### Configurar Variables de Entorno
```bash
# Establecer variables de entorno personalizadas
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Ver todas las variables de entorno
azd env get-values
```

## Paso 4: Implementar en Azure

¡Ahora viene la parte emocionante: implementar todo en Azure!

```bash
# Implementar infraestructura y aplicación
azd up

# Este comando hará:
# 1. Proveer recursos de Azure (App Service, Cosmos DB, etc.)
# 2. Construir tu aplicación
# 3. Implementar en los recursos provisionados
# 4. Mostrar la URL de la aplicación
```

### ¿Qué Sucede Durante la Implementación?

El comando `azd up` realiza estos pasos:
1. **Aprovisionar** (`azd provision`) - Crea recursos de Azure
2. **Empaquetar** - Construye el código de tu aplicación
3. **Implementar** (`azd deploy`) - Implementa el código en los recursos de Azure

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
Haz clic en la URL proporcionada en la salida de la implementación, o consíguela en cualquier momento:
```bash
# Obtener los puntos finales de la aplicación
azd show

# Abrir la aplicación en tu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Probar la Aplicación de Tareas
1. **Agregar una tarea** - Haz clic en "Add Todo" e ingresa una tarea
2. **Marcar como completada** - Marca las tareas completadas
3. **Eliminar tareas** - Borra las tareas que ya no necesites

### Monitorear tu Aplicación
```bash
# Abrir el portal de Azure para tus recursos
azd monitor

# Ver registros de la aplicación
azd logs
```

## Paso 6: Realizar Cambios y Reimplementar

Hagamos un cambio y veamos qué tan fácil es actualizar:

### Modificar la API
```bash
# Editar el código de la API
code src/api/src/routes/lists.js
```

Agrega un encabezado de respuesta personalizado:
```javascript
// Encuentra un manejador de rutas y añade:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementar Solo los Cambios de Código
```bash
# Implementar solo el código de la aplicación (omitir infraestructura)
azd deploy

# Esto es mucho más rápido que 'azd up' ya que la infraestructura ya existe
```

## Paso 7: Gestionar Múltiples Entornos

Crea un entorno de pruebas para verificar cambios antes de producción:

```bash
# Crear un nuevo entorno de preparación
azd env new staging

# Implementar en preparación
azd up

# Cambiar de nuevo al entorno de desarrollo
azd env select dev

# Listar todos los entornos
azd env list
```

### Comparación de Entornos
```bash
# Ver entorno de desarrollo
azd env select dev
azd show

# Ver entorno de pruebas
azd env select staging
azd show
```

## Paso 8: Limpiar Recursos

Cuando termines de experimentar, limpia para evitar cargos continuos:

```bash
# Eliminar todos los recursos de Azure para el entorno actual
azd down

# Forzar la eliminación sin confirmación y purgar los recursos eliminados suavemente
azd down --force --purge

# Eliminar un entorno específico
azd env select staging
azd down --force --purge
```

## Lo que Has Aprendido

¡Felicidades! Has logrado:
- ✅ Inicializar un proyecto azd desde una plantilla
- ✅ Explorar la estructura del proyecto y los archivos clave
- ✅ Implementar una aplicación full-stack en Azure
- ✅ Realizar cambios en el código y reimplementar
- ✅ Gestionar múltiples entornos
- ✅ Limpiar recursos

## 🎯 Ejercicios de Validación de Habilidades

### Ejercicio 1: Implementar una Plantilla Diferente (15 minutos)
**Objetivo**: Demostrar dominio del flujo de trabajo de azd init e implementación

```bash
# Prueba la pila Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifica el despliegue
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpia
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] La aplicación se implementa sin errores
- [ ] Se puede acceder a la URL de la aplicación en el navegador
- [ ] La aplicación funciona correctamente (agregar/eliminar tareas)
- [ ] Todos los recursos se limpiaron exitosamente

### Ejercicio 2: Personalizar Configuración (20 minutos)
**Objetivo**: Practicar la configuración de variables de entorno

```bash
cd my-first-azd-app

# Crear entorno personalizado
azd env new custom-config

# Establecer variables personalizadas
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verificar variables
azd env get-values | grep APP_TITLE

# Implementar con configuración personalizada
azd up
```

**Criterios de Éxito:**
- [ ] Se creó un entorno personalizado con éxito
- [ ] Las variables de entorno se configuraron y son recuperables
- [ ] La aplicación se implementa con la configuración personalizada
- [ ] Se pueden verificar los ajustes personalizados en la aplicación implementada

### Ejercicio 3: Flujo de Trabajo Multi-Entorno (25 minutos)
**Objetivo**: Dominar la gestión de entornos y estrategias de implementación

```bash
# Crear entorno de desarrollo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL de desarrollo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Crear entorno de pruebas
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL de pruebas
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Comparar entornos
azd env list

# Probar ambos entornos
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Limpiar ambos
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criterios de Éxito:**
- [ ] Se crearon dos entornos con configuraciones diferentes
- [ ] Ambos entornos se implementaron con éxito
- [ ] Se puede cambiar entre entornos usando `azd env select`
- [ ] Las variables de entorno difieren entre los entornos
- [ ] Ambos entornos se limpiaron exitosamente

## 📊 Tu Progreso

**Tiempo Invertido**: ~60-90 minutos  
**Habilidades Adquiridas**:
- ✅ Inicialización de proyectos basada en plantillas
- ✅ Aprovisionamiento de recursos de Azure
- ✅ Flujos de trabajo de implementación de aplicaciones
- ✅ Gestión de entornos
- ✅ Gestión de configuración
- ✅ Limpieza de recursos y gestión de costos

**Próximo Nivel**: Estás listo para la [Guía de Configuración](configuration.md) y aprender patrones avanzados de configuración.

## Solución de Problemas Comunes

### Errores de Autenticación
```bash
# Reautenticar con Azure
az login

# Verificar acceso a la suscripción
az account show
```

### Fallos de Implementación
```bash
# Habilitar el registro de depuración
export AZD_DEBUG=true
azd up --debug

# Ver registros detallados
azd logs --service api
azd logs --service web
```

### Conflictos de Nombres de Recursos
```bash
# Usa un nombre de entorno único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Puertos/Red
```bash
# Verificar si los puertos están disponibles
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
# Explorar plantillas por categoría
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Probar diferentes pilas de tecnología
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionales

### Materiales de Aprendizaje
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Marco de Arquitectura Bien Diseñada de Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidad y Soporte
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunidad de Desarrolladores de Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Plantillas y Ejemplos
- [Galería Oficial de Plantillas](https://azure.github.io/awesome-azd/)
- [Plantillas de la Comunidad](https://github.com/Azure-Samples/azd-templates)
- [Patrones Empresariales](https://github.com/Azure/azure-dev/tree/main/templates)

---

**¡Felicidades por completar tu primer proyecto azd!** Ahora estás listo para construir e implementar aplicaciones increíbles en Azure con confianza.

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Comienzo Rápido
- **⬅️ Anterior**: [Instalación y Configuración](installation.md)
- **➡️ Siguiente**: [Configuración](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo con Enfoque en IA](../microsoft-foundry/microsoft-foundry-integration.md)
- **Próxima Lección**: [Guía de Implementación](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->