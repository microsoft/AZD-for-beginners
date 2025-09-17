<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T15:17:08+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "es"
}
-->
# Solución Minorista Multi-Agente - Implementación de Plantilla ARM

**Capítulo 5: Paquete de Implementación en Producción**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Relacionado**: [Capítulo 5: Soluciones de IA Multi-Agente](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guía del Escenario**: [Implementación Completa](../retail-scenario.md)
- **🎯 Implementación Rápida**: [Implementación con un Clic](../../../../examples/retail-multiagent-arm-template)

Este directorio contiene una plantilla completa de Azure Resource Manager (ARM) para implementar la solución de soporte al cliente minorista Multi-Agente, proporcionando infraestructura como código para toda la arquitectura.

## 🎯 Qué se Implementa

### Infraestructura Principal
- **Servicios de Azure OpenAI** (Multi-región para alta disponibilidad)
  - Región principal: GPT-4o para el agente de atención al cliente
  - Región secundaria: GPT-4o-mini para el agente de inventario  
  - Región terciaria: Modelo de incrustaciones de texto
  - Región de evaluación: Modelo evaluador GPT-4o
- **Azure AI Search** con capacidades de búsqueda vectorial
- **Cuenta de Almacenamiento de Azure** con contenedores de blobs para documentos y cargas
- **Entorno de Aplicaciones en Contenedor de Azure** con escalado automático
- **Aplicaciones en Contenedor** para el enrutador de agentes y la interfaz
- **Azure Cosmos DB** para almacenamiento del historial de chat
- **Azure Key Vault** para gestión de secretos (opcional)
- **Application Insights** y Log Analytics para monitoreo (opcional)
- **Document Intelligence** para procesamiento de documentos
- **API de Búsqueda Bing** para información en tiempo real

### Modos de Implementación

| Modo | Descripción | Caso de Uso | Recursos |
|------|-------------|------------|----------|
| **Mínimo** | Implementación básica optimizada en costos | Desarrollo, pruebas | SKUs básicos, una sola región, capacidad reducida |
| **Estándar** | Implementación equilibrada para cargas de trabajo en producción | Producción, escala moderada | SKUs estándar, multi-región, capacidad estándar |
| **Premium** | Implementación de alto rendimiento para empresas | Empresas, alta escala | SKUs premium, multi-región, alta capacidad |

## 📋 Requisitos Previos

1. **Azure CLI** instalado y configurado
2. **Suscripción activa de Azure** con cuotas suficientes
3. **Permisos adecuados** para crear recursos en la suscripción objetivo
4. **Cuotas de recursos** para:
   - Azure OpenAI (ver disponibilidad regional)
   - Aplicaciones en Contenedor (varía según la región)
   - AI Search (se recomienda nivel estándar o superior)

## 🚀 Implementación Rápida

### Opción 1: Usando Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opción 2: Usando el Portal de Azure

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opción 3: Usando Azure CLI directamente

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opciones de Configuración

### Parámetros de la Plantilla

| Parámetro | Tipo | Predeterminado | Descripción |
|-----------|------|---------------|-------------|
| `projectName` | string | "retail" | Prefijo para todos los nombres de recursos |
| `location` | string | Ubicación del grupo de recursos | Región principal de implementación |
| `secondaryLocation` | string | "westus2" | Región secundaria para implementación multi-región |
| `tertiaryLocation` | string | "francecentral" | Región para el modelo de incrustaciones |
| `environmentName` | string | "dev" | Designación del entorno (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuración de implementación (mínimo/estándar/premium) |
| `enableMultiRegion` | bool | true | Habilitar implementación multi-región |
| `enableMonitoring` | bool | true | Habilitar Application Insights y registro |
| `enableSecurity` | bool | true | Habilitar Key Vault y seguridad mejorada |

### Personalización de Parámetros

Editar `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Descripción General de la Arquitectura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Uso del Script de Implementación

El script `deploy.sh` proporciona una experiencia de implementación interactiva:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Características del Script

- ✅ **Validación de requisitos previos** (Azure CLI, estado de inicio de sesión, archivos de plantilla)
- ✅ **Gestión de grupos de recursos** (crea si no existe)
- ✅ **Validación de la plantilla** antes de la implementación
- ✅ **Monitoreo del progreso** con salida en colores
- ✅ **Visualización de resultados de implementación**
- ✅ **Guía post-implementación**

## 📊 Monitoreo de la Implementación

### Verificar el Estado de Implementación

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Resultados de la Implementación

Después de una implementación exitosa, estarán disponibles los siguientes resultados:

- **URL de la Interfaz**: Punto de acceso público para la interfaz web
- **URL del Enrutador**: Punto de acceso API para el enrutador de agentes
- **Endpoints de OpenAI**: Endpoints principales y secundarios del servicio OpenAI
- **Servicio de Búsqueda**: Endpoint del servicio Azure AI Search
- **Cuenta de Almacenamiento**: Nombre de la cuenta de almacenamiento para documentos
- **Key Vault**: Nombre del Key Vault (si está habilitado)
- **Application Insights**: Nombre del servicio de monitoreo (si está habilitado)

## 🔧 Configuración Post-Implementación

### 1. Configurar el Índice de Búsqueda

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Subir Datos Iniciales

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Probar los Endpoints de los Agentes

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Configurar Aplicaciones en Contenedor

La plantilla ARM implementa imágenes de contenedor de marcador de posición. Para implementar el código real de los agentes:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Resolución de Problemas

### Problemas Comunes

#### 1. Cuota de Azure OpenAI Excedida

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Fallo en la Implementación de Aplicaciones en Contenedor

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicialización del Servicio de Búsqueda

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validación de la Implementación

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Consideraciones de Seguridad

### Gestión de Claves
- Todos los secretos se almacenan en Azure Key Vault (cuando está habilitado)
- Las aplicaciones en contenedor utilizan identidad administrada para autenticación
- Las cuentas de almacenamiento tienen configuraciones seguras predeterminadas (solo HTTPS, sin acceso público a blobs)

### Seguridad de Red
- Las aplicaciones en contenedor utilizan redes internas cuando es posible
- El servicio de búsqueda está configurado con la opción de endpoints privados
- Cosmos DB está configurado con los permisos mínimos necesarios

### Configuración de RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimización de Costos

### Estimaciones de Costos (Mensuales, USD)

| Modo | OpenAI | Aplicaciones en Contenedor | Búsqueda | Almacenamiento | Total Estimado |
|------|--------|----------------------------|----------|----------------|----------------|
| Mínimo | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Estándar | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitoreo de Costos

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Actualizaciones y Mantenimiento

### Actualizaciones de la Plantilla
- Control de versiones de los archivos de plantilla ARM
- Probar cambios primero en el entorno de desarrollo
- Usar el modo de implementación incremental para actualizaciones

### Actualizaciones de Recursos
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Respaldo y Recuperación
- Respaldo automático habilitado en Cosmos DB
- Eliminación suave habilitada en Key Vault
- Revisiones de aplicaciones en contenedor mantenidas para retrocesos

## 📞 Soporte

- **Problemas con la Plantilla**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Soporte de Azure**: [Portal de Soporte de Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunidad**: [Discord de Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ ¿Listo para implementar tu solución multi-agente?**

Comienza con: `./deploy.sh -g myResourceGroup`

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.