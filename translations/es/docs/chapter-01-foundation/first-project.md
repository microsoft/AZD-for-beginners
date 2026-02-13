# Tu Primer Proyecto - Tutorial Práctico

**Chapter Navigation:**
- **📚 Course Home**: [AZD para principiantes](../../README.md)
- **📖 Current Chapter**: Capítulo 1 - Fundamentos y Comienzo Rápido
- **⬅️ Previous**: [Instalación y Configuración](installation.md)
- **➡️ Next**: [Configuración](configuration.md)
- **🚀 Next Chapter**: [Capítulo 2: Desarrollo con IA como prioridad](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducción

¡Bienvenido/a a tu primer proyecto de Azure Developer CLI! Este completo tutorial práctico ofrece una guía paso a paso para crear, desplegar y gestionar una aplicación full-stack en Azure usando azd. Trabajarás con una aplicación real de todo que incluye un frontend en React, un backend API en Node.js y una base de datos MongoDB.

## Objetivos de aprendizaje

Al completar este tutorial, podrás:
- Dominar el flujo de inicialización de proyectos azd usando plantillas
- Entender la estructura de proyectos y los archivos de configuración de Azure Developer CLI
- Realizar el despliegue completo de la aplicación en Azure con aprovisionamiento de infraestructura
- Implementar actualizaciones de la aplicación y estrategias de redepliegue
- Administrar múltiples entornos para desarrollo y preproducción
- Aplicar prácticas de limpieza de recursos y gestión de costos

## Resultados de aprendizaje

Al finalizar, serás capaz de:
- Inicializar y configurar proyectos azd a partir de plantillas de forma independiente
- Navegar y modificar las estructuras de proyectos azd de manera eficaz
- Desplegar aplicaciones full-stack en Azure usando comandos únicos
- Resolver problemas comunes de despliegue y de autenticación
- Gestionar múltiples entornos de Azure para diferentes etapas de despliegue
- Implementar flujos de trabajo de despliegue continuo para actualizaciones de la aplicación

## Comenzando

### Lista de comprobación de requisitos previos
- ✅ Azure Developer CLI instalado ([Guía de instalación](installation.md))
- ✅ Azure CLI instalado y autenticado
- ✅ Git instalado en tu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verifica tu configuración
```bash
# Comprobar la instalación de azd
azd version
```
### Verificar la autenticación de Azure

```bash
az account show
```

### Comprobar la versión de Node.js
```bash
node --version
```

## Paso 1: Elegir e inicializar una plantilla

Comencemos con una plantilla popular de aplicación todo que incluye un frontend en React y un backend API en Node.js.

```bash
# Examinar las plantillas disponibles
azd template list

# Inicializar la plantilla de la aplicación de tareas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga las indicaciones:
# - Ingrese un nombre de entorno: "dev"
# - Elija una suscripción (si tiene varias)
# - Elija una región: "East US 2" (o la región de su preferencia)
```

### ¿Qué acaba de suceder?
- Descargaraste el código de la plantilla en tu directorio local
- Creaste un archivo `azure.yaml` con definiciones de servicios
- Configuraste el código de infraestructura en el directorio `infra/`
- Creaste una configuración de entorno

## Paso 2: Explorar la estructura del proyecto

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

### Archivos clave para entender

**azure.yaml** - El corazón de tu proyecto azd:
```bash
# Ver la configuración del proyecto
cat azure.yaml
```

**infra/main.bicep** - Definición de infraestructura:
```bash
# Ver el código de infraestructura
head -30 infra/main.bicep
```

## Paso 3: Personaliza tu proyecto (Opcional)

Antes de desplegar, puedes personalizar la aplicación:

### Modificar el frontend
```bash
# Abrir el componente de la aplicación React
code src/web/src/App.tsx
```

Realiza un cambio sencillo:
```typescript
// Encuentra el título y cámbialo
<h1>My Awesome Todo App</h1>
```

### Configurar variables de entorno
```bash
# Establecer variables de entorno personalizadas
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Ver todas las variables de entorno
azd env get-values
```

## Paso 4: Desplegar en Azure

Ahora la parte emocionante: ¡despliega todo en Azure!

```bash
# Desplegar la infraestructura y la aplicación
azd up

# Este comando realizará:
# 1. Aprovisionar recursos de Azure (App Service, Cosmos DB, etc.)
# 2. Compilar su aplicación
# 3. Desplegar en los recursos aprovisionados
# 4. Mostrar la URL de la aplicación
```

### ¿Qué sucede durante el despliegue?

El comando `azd up` realiza estos pasos:
1. **Aprovisionamiento** (`azd provision`) - Crea recursos de Azure
2. **Empaquetado** - Compila el código de tu aplicación
3. **Despliegue** (`azd deploy`) - Despliega el código en los recursos de Azure

### Salida esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Paso 5: Probar tu aplicación

### Accede a tu aplicación
Haz clic en la URL proporcionada en la salida del despliegue, o consíguela en cualquier momento:
```bash
# Obtener puntos finales de la aplicación
azd show

# Abrir la aplicación en su navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Prueba la aplicación Todo
1. **Agregar un elemento todo** - Haz clic en "Agregar Todo" e ingresa una tarea
2. **Marcar como completado** - Marca los elementos completados
3. **Eliminar elementos** - Elimina los todos que ya no necesites

### Monitorea tu aplicación
```bash
# Abrir el portal de Azure para sus recursos
azd monitor

# Ver registros de la aplicación
azd monitor --logs

# Ver métricas en tiempo real
azd monitor --live
```

## Paso 6: Realiza cambios y redepliega

Hagamos un cambio y veamos lo fácil que es actualizar:

### Modifica la API
```bash
# Editar el código de la API
code src/api/src/routes/lists.js
```

Agregar un encabezado de respuesta personalizado:
```javascript
// Busca un manejador de ruta y añádelo:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Desplegar solo los cambios de código
```bash
# Despliega solo el código de la aplicación (omite la infraestructura)
azd deploy

# Esto es mucho más rápido que 'azd up' porque la infraestructura ya existe
```

## Paso 7: Gestionar múltiples entornos

Crea un entorno de preproducción para probar cambios antes de producción:

```bash
# Crear un nuevo entorno de preproducción
azd env new staging

# Desplegar en el entorno de preproducción
azd up

# Volver al entorno de desarrollo
azd env select dev

# Listar todos los entornos
azd env list
```

### Comparación de entornos
```bash
# Ver entorno de desarrollo
azd env select dev
azd show

# Ver entorno de preproducción
azd env select staging
azd show
```

## Paso 8: Limpiar recursos

Cuando termines de experimentar, limpia los recursos para evitar cargos continuos:

```bash
# Eliminar todos los recursos de Azure del entorno actual
azd down

# Forzar eliminación sin confirmación y purgar recursos con eliminación suave
azd down --force --purge

# Eliminar un entorno específico
azd env select staging
azd down --force --purge
```

## Lo que has aprendido

¡Felicidades! Has logrado con éxito:
- ✅ Inicializar un proyecto azd a partir de una plantilla
- ✅ Explorar la estructura del proyecto y archivos clave
- ✅ Desplegar una aplicación full-stack en Azure
- ✅ Realizar cambios de código y redeplegarlos
- ✅ Gestionar múltiples entornos
- ✅ Limpiar recursos

## 🎯 Ejercicios de validación de habilidades

### Ejercicio 1: Desplegar una plantilla diferente (15 minutos)
**Objetivo**: Demostrar dominio de azd init y el flujo de despliegue

```bash
# Probar la pila Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificar el despliegue
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpiar
azd down --force --purge
```

**Criterios de éxito:**
- [ ] La aplicación se despliega sin errores
- [ ] Puede acceder a la URL de la aplicación en el navegador
- [ ] La aplicación funciona correctamente (agregar/eliminar todos)
- [ ] Los recursos se limpiaron correctamente

### Ejercicio 2: Personalizar la configuración (20 minutos)
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

# Desplegar con configuración personalizada
azd up
```

**Criterios de éxito:**
- [ ] Entorno personalizado creado con éxito
- [ ] Variables de entorno configuradas y recuperables
- [ ] La aplicación se despliega con la configuración personalizada
- [ ] Se pueden verificar los ajustes personalizados en la aplicación desplegada

### Ejercicio 3: Flujo de trabajo multi-entorno (25 minutos)
**Objetivo**: Dominar la gestión de entornos y estrategias de despliegue

```bash
# Crear entorno de desarrollo
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL de desarrollo
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Crear entorno de preproducción
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL de preproducción
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Comparar entornos
azd env list

# Probar ambos entornos
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Limpiar ambos entornos
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Criterios de éxito:**
- [ ] Dos entornos creados con configuraciones diferentes
- [ ] Ambos entornos desplegados con éxito
- [ ] Se puede cambiar entre entornos usando `azd env select`
- [ ] Las variables de entorno difieren entre entornos
- [ ] Ambos entornos se limpiaron correctamente

## 📊 Tu progreso

**Tiempo invertido**: ~60-90 minutos  
**Habilidades adquiridas**:
- ✅ Inicialización de proyectos basada en plantillas
- ✅ Aprovisionamiento de recursos de Azure
- ✅ Flujos de trabajo de despliegue de aplicaciones
- ✅ Gestión de entornos
- ✅ Gestión de configuración
- ✅ Limpieza de recursos y gestión de costos

**Siguiente nivel**: ¡Estás listo para la [Guía de configuración](configuration.md) para aprender patrones avanzados de configuración!

## Solución de problemas comunes

### Errores de autenticación
```bash
# Reautenticarse con Azure
az login

# Verificar el acceso a la suscripción
az account show
```

### Fallas en el despliegue
```bash
# Habilitar el registro de depuración
export AZD_DEBUG=true
azd up --debug

# Ver los registros de la aplicación en Azure
azd monitor --logs

# Para Container Apps, use la CLI de Azure:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflictos de nombres de recursos
```bash
# Usa un nombre de entorno único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de puerto/red
```bash
# Comprobar si los puertos están disponibles
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos pasos

Ahora que has completado tu primer proyecto, explora estos temas avanzados:

### 1. Personalizar la infraestructura
- [Infraestructura como Código](../chapter-04-infrastructure/provisioning.md)
- [Agregar bases de datos, almacenamiento y otros servicios](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md) - Flujos completos de CI/CD
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuración de pipelines

### 3. Buenas prácticas de producción
- [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, rendimiento y monitoreo

### 4. Explora más plantillas
```bash
# Explorar plantillas por categoría
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Probar diferentes pilas tecnológicas
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos adicionales

### Materiales de aprendizaje
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de arquitectura de Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidad y soporte
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunidad de desarrolladores de Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Plantillas y ejemplos
- [Galería oficial de plantillas](https://azure.github.io/awesome-azd/)
- [Plantillas de la comunidad](https://github.com/Azure-Samples/azd-templates)
- [Patrones empresariales](https://github.com/Azure/azure-dev/tree/main/templates)

---

**¡Felicidades por completar tu primer proyecto azd!** Ahora estás listo para crear y desplegar aplicaciones increíbles en Azure con confianza.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD para principiantes](../../README.md)
- **📖 Current Chapter**: Capítulo 1 - Fundamentos y Comienzo Rápido
- **⬅️ Previous**: [Instalación y Configuración](installation.md)
- **➡️ Next**: [Configuración](configuration.md)
- **🚀 Next Chapter**: [Capítulo 2: Desarrollo con IA como prioridad](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción por IA Co-op Translator (https://github.com/Azure/co-op-translator). Aunque nos esforzamos por ser precisos, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->