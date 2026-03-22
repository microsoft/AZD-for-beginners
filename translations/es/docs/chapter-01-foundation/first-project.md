# Tu Primer Proyecto - Tutorial Práctico

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Instalación y Configuración](installation.md)
- **➡️ Siguiente**: [Configuración](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introducción

¡Bienvenido a tu primer proyecto con Azure Developer CLI! Este completo tutorial práctico ofrece un recorrido completo para crear, desplegar y gestionar una aplicación full-stack en Azure usando azd. Trabajarás con una aplicación real de tareas que incluye un frontend en React, un backend API en Node.js y una base de datos MongoDB.

## Objetivos de Aprendizaje

Al completar este tutorial, podrás:
- Dominar el flujo de trabajo de inicialización de proyectos azd usando plantillas
- Entender la estructura y archivos de configuración de un proyecto Azure Developer CLI
- Ejecutar el despliegue completo de la aplicación a Azure con provisión de infraestructura
- Implementar actualizaciones y estrategias de redepliegue de la aplicación
- Gestionar múltiples entornos para desarrollo y pruebas
- Aplicar prácticas de limpieza de recursos y gestión de costos

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Inicializar y configurar proyectos azd desde plantillas de forma independiente
- Navegar y modificar estructuras de proyecto azd eficazmente
- Desplegar aplicaciones full-stack a Azure con comandos únicos
- Resolver problemas comunes de despliegue y autenticación
- Gestionar múltiples entornos de Azure para diferentes etapas de despliegue
- Implementar flujos de trabajo de despliegue continuo para actualizaciones

## Comenzando

### Lista de Requisitos Previos
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

Comencemos con una plantilla popular de aplicación de tareas que incluye un frontend React y un backend API Node.js.

```bash
# Explorar las plantillas disponibles
azd template list

# Inicializar la plantilla de la aplicación de tareas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sigue las indicaciones:
# - Ingresa un nombre para el entorno: "dev"
# - Elige una suscripción (si tienes varias)
# - Elige una región: "East US 2" (o tu región preferida)
```

### ¿Qué acaba de pasar?
- Se descargó el código de la plantilla en tu directorio local
- Se creó un archivo `azure.yaml` con definiciones de servicios
- Se configuró código de infraestructura en el directorio `infra/`
- Se creó una configuración de entorno

## Paso 2: Explorar la Estructura del Proyecto

Veamos qué ha creado azd para nosotros:

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

### Archivos Clave para Entender

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

## Paso 3: Personalizar Tu Proyecto (Opcional)

Antes del despliegue, puedes personalizar la aplicación:

### Modificar el Frontend
```bash
# Abrir el componente de la aplicación React
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

## Paso 4: Desplegar a Azure

¡Ahora la parte emocionante: desplegar todo a Azure!

```bash
# Desplegar infraestructura y aplicación
azd up

# Este comando hará:
# 1. Proveer recursos de Azure (App Service, Cosmos DB, etc.)
# 2. Construir tu aplicación
# 3. Desplegar en los recursos provistos
# 4. Mostrar la URL de la aplicación
```

### ¿Qué sucede durante el despliegue?

El comando `azd up` realiza estos pasos:
1. **Provisionar** (`azd provision`) - Crea los recursos de Azure
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

## Paso 5: Probar Tu Aplicación

### Acceder a Tu Aplicación
Haz clic en la URL proporcionada en la salida del despliegue o consíguela en cualquier momento:
```bash
# Obtener los puntos finales de la aplicación
azd show

# Abre la aplicación en tu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Probar la Aplicación de Tareas
1. **Agregar una tarea** - Haz clic en "Add Todo" y escribe una tarea
2. **Marcar como completada** - Marca las tareas completadas
3. **Eliminar tareas** - Elimina tareas que ya no necesites

### Monitorea Tu Aplicación
```bash
# Abrir el portal de Azure para tus recursos
azd monitor

# Ver registros de la aplicación
azd monitor --logs

# Ver métricas en vivo
azd monitor --live
```

## Paso 6: Hacer Cambios y Redeplegar

Hagamos un cambio y veamos qué tan sencillo es actualizar:

### Modificar la API
```bash
# Edita el código de la API
code src/api/src/routes/lists.js
```

Agrega un encabezado personalizado en la respuesta:
```javascript
// Encuentra un manejador de ruta y añade:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Desplegar Solo los Cambios de Código
```bash
# Desplegar solo el código de la aplicación (omitir infraestructura)
azd deploy

# Esto es mucho más rápido que 'azd up' ya que la infraestructura ya existe
```

## Paso 7: Gestionar Múltiples Entornos

Crea un entorno de staging para probar cambios antes de producción:

```bash
# Crear un nuevo entorno de prueba
azd env new staging

# Desplegar en staging
azd up

# Volver al entorno de desarrollo
azd env select dev

# Listar todos los entornos
azd env list
```

### Comparación de Entornos
```bash
# Ver entorno de desarrollo
azd env select dev
azd show

# Ver entorno de preparación
azd env select staging
azd show
```

## Paso 8: Limpiar Recursos

Cuando termines de experimentar, limpia los recursos para evitar cargos continuos:

```bash
# Eliminar todos los recursos de Azure para el entorno actual
azd down

# Forzar eliminación sin confirmación y purgar recursos eliminados suavemente
azd down --force --purge

# Eliminar el entorno específico
azd env select staging
azd down --force --purge
```

## Aplicación Clásica vs. Aplicación con IA: Mismo Flujo de Trabajo

Acabas de desplegar una aplicación web tradicional. Pero, ¿y si quisieras desplegar una aplicación potenciada por IA, por ejemplo, una aplicación de chat respaldada por Microsoft Foundry Models?

La buena noticia: **el flujo es idéntico.**

| Paso | Aplicación de Tareas Clásica | Aplicación de Chat IA |
|------|-----------------------------|-----------------------|
| Inicializar | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autenticar | `azd auth login` | `azd auth login` |
| Desplegar | `azd up` | `azd up` |
| Monitorear | `azd monitor` | `azd monitor` |
| Limpiar | `azd down --force --purge` | `azd down --force --purge` |

La única diferencia es la **plantilla** desde la que empiezas. Una plantilla de IA incluye infraestructura adicional (como un recurso Microsoft Foundry Models o un índice AI Search), pero azd se encarga de todo eso. No necesitas aprender nuevos comandos, adoptar otra herramienta o cambiar la forma en que piensas sobre el despliegue.

Este es el principio central de azd: **un flujo de trabajo, cualquier carga de trabajo.** Las habilidades que practicaste en este tutorial —inicializar, desplegar, monitorear, redeplegar y limpiar— aplican igual a las aplicaciones y agentes de IA.

---

## Lo Que Has Aprendido

¡Felicidades! Has logrado:
- ✅ Inicializar un proyecto azd desde plantilla
- ✅ Explorar la estructura del proyecto y archivos clave
- ✅ Desplegar una aplicación full-stack a Azure
- ✅ Hacer cambios en el código y redeplegar
- ✅ Gestionar múltiples entornos
- ✅ Limpiar recursos

## 🎯 Ejercicios de Validación de Habilidades

### Ejercicio 1: Desplegar una Plantilla Diferente (15 minutos)
**Objetivo**: Demostrar dominio de azd init y flujo de despliegue

```bash
# Prueba la pila Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificar despliegue
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpiar
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] La aplicación se despliega sin errores
- [ ] Se puede acceder a la URL de la aplicación en el navegador
- [ ] La aplicación funciona correctamente (agregar/eliminar tareas)
- [ ] Se limpiaron con éxito todos los recursos

### Ejercicio 2: Personalizar la Configuración (20 minutos)
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

**Criterios de Éxito:**
- [ ] Entorno personalizado creado exitosamente
- [ ] Variables de entorno establecidas y recuperables
- [ ] La aplicación se despliega con configuración personalizada
- [ ] Se puede verificar la configuración personalizada en la aplicación desplegada

### Ejercicio 3: Flujo de Trabajo Multi-Entorno (25 minutos)
**Objetivo**: Dominar gestión de entornos y estrategias de despliegue

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
- [ ] Dos entornos creados con configuraciones diferentes
- [ ] Ambos entornos desplegados correctamente
- [ ] Se puede cambiar entre entornos usando `azd env select`
- [ ] Las variables de entorno difieren entre entornos
- [ ] Se limpiaron con éxito ambos entornos

## 📊 Tu Progreso

**Tiempo Invertido**: ~60-90 minutos  
**Habilidades Adquiridas**:
- ✅ Inicialización de proyectos desde plantilla
- ✅ Provisión de recursos Azure
- ✅ Flujos de despliegue de aplicaciones
- ✅ Gestión de entornos
- ✅ Configuración
- ✅ Limpieza de recursos y gestión de costos

**Siguiente Nivel**: ¡Estás listo para la [Guía de Configuración](configuration.md) para aprender patrones avanzados de configuración!

## Resolución de Problemas Comunes

### Errores de Autenticación
```bash
# Reautenticar con Azure
az login

# Verificar el acceso a la suscripción
az account show
```

### Fallos de Despliegue
```bash
# Habilitar registro de depuración
export AZD_DEBUG=true
azd up --debug

# Ver registros de la aplicación en Azure
azd monitor --logs

# Para Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflictos de Nombres de Recursos
```bash
# Use un nombre de entorno único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Puerto/Red
```bash
# Verificar si los puertos están disponibles
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Pasos

Ahora que has completado tu primer proyecto, explora estos temas avanzados:

### 1. Personalizar Infraestructura
- [Infraestructura como Código](../chapter-04-infrastructure/provisioning.md)
- [Agregar bases de datos, almacenamiento y otros servicios](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Flujos de CI/CD completos
- [Documentación Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuración de pipelines

### 3. Mejores Prácticas en Producción
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md) - Seguridad, rendimiento y monitoreo

### 4. Explorar Más Plantillas
```bash
# Navega por plantillas por categoría
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prueba diferentes pilas de tecnología
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionales

### Materiales de Aprendizaje
- [Documentación Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidad y Soporte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Comunidad de Desarrolladores Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Plantillas y Ejemplos
- [Galería Oficial de Plantillas](https://azure.github.io/awesome-azd/)
- [Plantillas de la Comunidad](https://github.com/Azure-Samples/azd-templates)
- [Patrones Empresariales](https://github.com/Azure/azure-dev/tree/main/templates)

---

**¡Felicidades por completar tu primer proyecto azd!** Ahora estás listo para construir y desplegar aplicaciones increíbles en Azure con confianza.

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 1 - Fundamentos y Inicio Rápido
- **⬅️ Anterior**: [Instalación y Configuración](installation.md)
- **➡️ Siguiente**: [Configuración](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desarrollo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Próxima Lección**: [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que pueda surgir del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->