<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T16:55:46+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "es"
}
-->
# Conceptos Básicos de AZD - Entendiendo Azure Developer CLI

## Introducción

Esta lección te introduce a Azure Developer CLI (azd), una poderosa herramienta de línea de comandos que acelera tu camino desde el desarrollo local hasta el despliegue en Azure. Aprenderás los conceptos fundamentales, las características principales y cómo azd simplifica el despliegue de aplicaciones nativas en la nube.

## Objetivos de Aprendizaje

Al final de esta lección, podrás:
- Entender qué es Azure Developer CLI y su propósito principal
- Aprender los conceptos clave de plantillas, entornos y servicios
- Explorar características principales como desarrollo basado en plantillas e Infraestructura como Código
- Comprender la estructura y el flujo de trabajo de los proyectos azd
- Estar preparado para instalar y configurar azd en tu entorno de desarrollo

## Resultados de Aprendizaje

Después de completar esta lección, serás capaz de:
- Explicar el papel de azd en los flujos de trabajo modernos de desarrollo en la nube
- Identificar los componentes de la estructura de un proyecto azd
- Describir cómo las plantillas, entornos y servicios trabajan juntos
- Comprender los beneficios de Infraestructura como Código con azd
- Reconocer diferentes comandos de azd y sus propósitos

## ¿Qué es Azure Developer CLI (azd)?

Azure Developer CLI (azd) es una herramienta de línea de comandos diseñada para acelerar tu camino desde el desarrollo local hasta el despliegue en Azure. Simplifica el proceso de construir, desplegar y gestionar aplicaciones nativas en la nube en Azure.

## Conceptos Clave

### Plantillas
Las plantillas son la base de azd. Contienen:
- **Código de la aplicación** - Tu código fuente y dependencias
- **Definiciones de infraestructura** - Recursos de Azure definidos en Bicep o Terraform
- **Archivos de configuración** - Configuraciones y variables de entorno
- **Scripts de despliegue** - Flujos de trabajo automatizados de despliegue

### Entornos
Los entornos representan diferentes objetivos de despliegue:
- **Desarrollo** - Para pruebas y desarrollo
- **Staging** - Entorno de preproducción
- **Producción** - Entorno de producción en vivo

Cada entorno mantiene su propio:
- Grupo de recursos de Azure
- Configuración
- Estado de despliegue

### Servicios
Los servicios son los bloques de construcción de tu aplicación:
- **Frontend** - Aplicaciones web, SPAs
- **Backend** - APIs, microservicios
- **Base de datos** - Soluciones de almacenamiento de datos
- **Almacenamiento** - Almacenamiento de archivos y blobs

## Características Principales

### 1. Desarrollo Basado en Plantillas
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infraestructura como Código
- **Bicep** - Lenguaje específico de dominio de Azure
- **Terraform** - Herramienta de infraestructura multi-nube
- **ARM Templates** - Plantillas de Azure Resource Manager

### 3. Flujos de Trabajo Integrados
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Gestión de Entornos
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Estructura del Proyecto

Una estructura típica de proyecto azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Archivos de Configuración

### azure.yaml
El archivo principal de configuración del proyecto:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configuración específica del entorno:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Flujos de Trabajo Comunes

### Iniciar un Nuevo Proyecto
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Ciclo de Desarrollo
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Gestión de Múltiples Entornos
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Comandos de Navegación

### Descubrimiento
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestión de Proyectos
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoreo
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Mejores Prácticas

### 1. Usa Nombres Significativos
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Aprovecha las Plantillas
- Comienza con plantillas existentes
- Personalízalas según tus necesidades
- Crea plantillas reutilizables para tu organización

### 3. Aislamiento de Entornos
- Usa entornos separados para desarrollo/staging/producción
- Nunca despliegues directamente en producción desde tu máquina local
- Usa pipelines de CI/CD para despliegues en producción

### 4. Gestión de Configuración
- Usa variables de entorno para datos sensibles
- Mantén la configuración bajo control de versiones
- Documenta configuraciones específicas de cada entorno

## Progresión de Aprendizaje

### Principiante (Semana 1-2)
1. Instalar azd y autenticar
2. Desplegar una plantilla simple
3. Comprender la estructura del proyecto
4. Aprender comandos básicos (up, down, deploy)

### Intermedio (Semana 3-4)
1. Personalizar plantillas
2. Gestionar múltiples entornos
3. Comprender el código de infraestructura
4. Configurar pipelines de CI/CD

### Avanzado (Semana 5+)
1. Crear plantillas personalizadas
2. Patrones avanzados de infraestructura
3. Despliegues multi-región
4. Configuraciones de nivel empresarial

## Próximos Pasos

- [Instalación y Configuración](installation.md) - Instala y configura azd
- [Tu Primer Proyecto](first-project.md) - Tutorial práctico
- [Guía de Configuración](configuration.md) - Opciones avanzadas de configuración

## Recursos Adicionales

- [Descripción General de Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galería de Plantillas](https://azure.github.io/awesome-azd/)
- [Ejemplos de la Comunidad](https://github.com/Azure-Samples)

---

**Navegación**
- **Lección Anterior**: [README](../../README.md)
- **Próxima Lección**: [Instalación y Configuración](installation.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.