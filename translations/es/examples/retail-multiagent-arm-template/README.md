# Solución Minorista Multi-Agente - Plantilla de Infraestructura

**Capítulo 5: Paquete de Despliegue en Producción**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Relacionado**: [Capítulo 5: Soluciones de IA Multi-Agente](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guía del Escenario**: [Arquitectura Completa](../retail-scenario.md)
- **🎯 Despliegue Rápido**: [Despliegue con un Clic](../../../../examples/retail-multiagent-arm-template)

> **⚠️ SOLO PLANTILLA DE INFRAESTRUCTURA**  
> Esta plantilla ARM despliega **recursos de Azure** para un sistema multi-agente.  
>  
> **Qué se despliega (15-25 minutos):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings en 3 regiones)
> - ✅ Servicio de Búsqueda AI (vacío, listo para crear índices)
> - ✅ Aplicaciones en Contenedores (imágenes de marcador de posición, listas para tu código)
> - ✅ Almacenamiento, Cosmos DB, Key Vault, Application Insights
>  
> **Qué NO está incluido (requiere desarrollo):**
> - ❌ Código de implementación de agentes (Agente de Cliente, Agente de Inventario)
> - ❌ Lógica de enrutamiento y puntos de API
> - ❌ Interfaz de chat frontend
> - ❌ Esquemas de índices de búsqueda y pipelines de datos
> - ❌ **Esfuerzo estimado de desarrollo: 80-120 horas**
>  
> **Usa esta plantilla si:**
> - ✅ Quieres aprovisionar infraestructura de Azure para un proyecto multi-agente
> - ✅ Planeas desarrollar la implementación de agentes por separado
> - ✅ Necesitas una base de infraestructura lista para producción
>  
> **No la uses si:**
> - ❌ Esperas un demo funcional de multi-agentes inmediatamente
> - ❌ Buscas ejemplos completos de código de aplicación

## Resumen

Este directorio contiene una plantilla completa de Azure Resource Manager (ARM) para desplegar la **base de infraestructura** de un sistema de soporte al cliente multi-agente. La plantilla aprovisiona todos los servicios necesarios de Azure, configurados e interconectados correctamente, listos para el desarrollo de tu aplicación.

**Después del despliegue tendrás:** Infraestructura de Azure lista para producción  
**Para completar el sistema necesitas:** Código de agentes, interfaz frontend y configuración de datos (ver [Guía de Arquitectura](../retail-scenario.md))

## 🎯 Qué se Despliega

### Infraestructura Principal (Estado Después del Despliegue)

✅ **Servicios Azure OpenAI** (Listos para llamadas API)
  - Región principal: Despliegue GPT-4o (capacidad de 20K TPM)
  - Región secundaria: Despliegue GPT-4o-mini (capacidad de 10K TPM)
  - Región terciaria: Modelo de embeddings de texto (capacidad de 30K TPM)
  - Región de evaluación: Modelo evaluador GPT-4o (capacidad de 15K TPM)
  - **Estado:** Totalmente funcional - puede realizar llamadas API inmediatamente

✅ **Azure AI Search** (Vacío - listo para configuración)
  - Capacidades de búsqueda vectorial habilitadas
  - Nivel estándar con 1 partición, 1 réplica
  - **Estado:** Servicio en ejecución, pero requiere creación de índices
  - **Acción necesaria:** Crear índice de búsqueda con tu esquema

✅ **Cuenta de Almacenamiento Azure** (Vacía - lista para cargas)
  - Contenedores de blobs: `documents`, `uploads`
  - Configuración segura (solo HTTPS, sin acceso público)
  - **Estado:** Lista para recibir archivos
  - **Acción necesaria:** Cargar tus datos de productos y documentos

⚠️ **Entorno de Aplicaciones en Contenedores** (Imágenes de marcador de posición desplegadas)
  - Aplicación de enrutador de agentes (imagen predeterminada de nginx)
  - Aplicación frontend (imagen predeterminada de nginx)
  - Configuración de autoescalado (0-10 instancias)
  - **Estado:** Contenedores de marcador de posición en ejecución
  - **Acción necesaria:** Construir y desplegar tus aplicaciones de agentes

✅ **Azure Cosmos DB** (Vacío - listo para datos)
  - Base de datos y contenedor preconfigurados
  - Optimizado para operaciones de baja latencia
  - TTL habilitado para limpieza automática
  - **Estado:** Listo para almacenar historial de chat

✅ **Azure Key Vault** (Opcional - listo para secretos)
  - Eliminación suave habilitada
  - RBAC configurado para identidades administradas
  - **Estado:** Listo para almacenar claves API y cadenas de conexión

✅ **Application Insights** (Opcional - monitoreo activo)
  - Conectado al espacio de trabajo de Log Analytics
  - Métricas personalizadas y alertas configuradas
  - **Estado:** Listo para recibir telemetría de tus aplicaciones

✅ **Document Intelligence** (Listo para llamadas API)
  - Nivel S0 para cargas de trabajo de producción
  - **Estado:** Listo para procesar documentos cargados

✅ **API de Búsqueda Bing** (Listo para llamadas API)
  - Nivel S1 para búsquedas en tiempo real
  - **Estado:** Listo para consultas de búsqueda web

### Modos de Despliegue

| Modo | Capacidad OpenAI | Instancias de Contenedores | Nivel de Búsqueda | Redundancia de Almacenamiento | Mejor Para |
|------|------------------|---------------------------|-------------------|-----------------------------|------------|
| **Mínimo** | 10K-20K TPM | 0-2 réplicas | Básico | LRS (Local) | Desarrollo/pruebas, aprendizaje, prueba de concepto |
| **Estándar** | 30K-60K TPM | 2-5 réplicas | Estándar | ZRS (Zona) | Producción, tráfico moderado (<10K usuarios) |
| **Premium** | 80K-150K TPM | 5-10 réplicas, redundancia zonal | Premium | GRS (Geo) | Empresa, tráfico alto (>10K usuarios), SLA 99.99% |

**Impacto en Costos:**
- **Mínimo → Estándar:** ~4x aumento de costo ($100-370/mes → $420-1,450/mes)
- **Estándar → Premium:** ~3x aumento de costo ($420-1,450/mes → $1,150-3,500/mes)
- **Elige según:** Carga esperada, requisitos de SLA, restricciones de presupuesto

**Planificación de Capacidad:**
- **TPM (Tokens Por Minuto):** Total en todos los despliegues de modelos
- **Instancias de Contenedores:** Rango de autoescalado (réplicas mínimas-máximas)
- **Nivel de Búsqueda:** Afecta el rendimiento de consultas y límites de tamaño de índices

## 📋 Requisitos Previos

### Herramientas Necesarias
1. **Azure CLI** (versión 2.50.0 o superior)
   ```bash
   az --version  # Verificar versión
   az login      # Autenticar
   ```

2. **Suscripción activa de Azure** con acceso de Propietario o Colaborador
   ```bash
   az account show  # Verificar suscripción
   ```

### Cuotas de Azure Necesarias

Antes del despliegue, verifica cuotas suficientes en tus regiones objetivo:

```bash
# Verificar la disponibilidad de Azure OpenAI en tu región
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verificar la cuota de OpenAI (ejemplo para gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Verificar la cuota de Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Cuotas Mínimas Requeridas:**
- **Azure OpenAI:** 3-4 despliegues de modelos en varias regiones
  - GPT-4o: 20K TPM (Tokens Por Minuto)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Nota:** GPT-4o puede tener lista de espera en algunas regiones - verifica [disponibilidad de modelos](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Aplicaciones en Contenedores:** Entorno administrado + 2-10 instancias de contenedores
- **AI Search:** Nivel estándar (Básico insuficiente para búsqueda vectorial)
- **Cosmos DB:** Rendimiento aprovisionado estándar

**Si las cuotas son insuficientes:**
1. Ve al Portal de Azure → Cuotas → Solicitar aumento
2. O usa Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Considera regiones alternativas con disponibilidad

## 🚀 Despliegue Rápido

### Opción 1: Usando Azure CLI

```bash
# Clona o descarga los archivos de plantilla
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Haz que el script de despliegue sea ejecutable
chmod +x deploy.sh

# Despliega con configuraciones predeterminadas
./deploy.sh -g myResourceGroup

# Despliega para producción con características premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opción 2: Usando el Portal de Azure

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opción 3: Usando Azure CLI directamente

```bash
# Crear grupo de recursos
az group create --name myResourceGroup --location eastus2

# Implementar plantilla
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Cronograma de Despliegue

### Qué Esperar

| Fase | Duración | Qué Sucede |
|------|----------|------------||
| **Validación de Plantilla** | 30-60 segundos | Azure valida la sintaxis y parámetros de la plantilla ARM |
| **Configuración del Grupo de Recursos** | 10-20 segundos | Crea el grupo de recursos (si es necesario) |
| **Aprovisionamiento de OpenAI** | 5-8 minutos | Crea 3-4 cuentas de OpenAI y despliega modelos |
| **Aplicaciones en Contenedores** | 3-5 minutos | Crea el entorno y despliega contenedores de marcador de posición |
| **Búsqueda y Almacenamiento** | 2-4 minutos | Aprovisiona el servicio de Búsqueda AI y cuentas de almacenamiento |
| **Cosmos DB** | 2-3 minutos | Crea la base de datos y configura contenedores |
| **Configuración de Monitoreo** | 2-3 minutos | Configura Application Insights y Log Analytics |
| **Configuración de RBAC** | 1-2 minutos | Configura identidades administradas y permisos |
| **Despliegue Total** | **15-25 minutos** | Infraestructura completa lista |

**Después del Despliegue:**
- ✅ **Infraestructura Lista:** Todos los servicios de Azure aprovisionados y en ejecución
- ⏱️ **Desarrollo de Aplicaciones:** 80-120 horas (tu responsabilidad)
- ⏱️ **Configuración de Índices:** 15-30 minutos (requiere tu esquema)
- ⏱️ **Carga de Datos:** Varía según el tamaño del conjunto de datos
- ⏱️ **Pruebas y Validación:** 2-4 horas

---

## ✅ Verificar Éxito del Despliegue

### Paso 1: Verificar Aprovisionamiento de Recursos (2 minutos)

```bash
# Verificar que todos los recursos se hayan implementado correctamente
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Esperado:** Tabla vacía (todos los recursos muestran estado "Succeeded")

### Paso 2: Verificar Despliegues de Azure OpenAI (3 minutos)

```bash
# Enumerar todas las cuentas de OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Verificar implementaciones de modelos para la región principal
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Esperado:** 
- 3-4 cuentas de OpenAI (regiones principal, secundaria, terciaria, evaluación)
- 1-2 despliegues de modelos por cuenta (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Paso 3: Probar Puntos de Infraestructura (5 minutos)

```bash
# Obtener URLs de la aplicación de contenedor
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Probar el endpoint del enrutador (responderá una imagen de marcador de posición)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Esperado:** 
- Aplicaciones en Contenedores muestran estado "Running"
- Nginx de marcador de posición responde con HTTP 200 o 404 (sin código de aplicación aún)

### Paso 4: Verificar Acceso API de Azure OpenAI (3 minutos)

```bash
# Obtener el endpoint y la clave de OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Probar la implementación de GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Esperado:** Respuesta JSON con finalización de chat (confirma que OpenAI está funcional)

### Qué Funciona vs. Qué No

**✅ Funciona Después del Despliegue:**
- Modelos de Azure OpenAI desplegados y aceptando llamadas API
- Servicio de Búsqueda AI en ejecución (vacío, sin índices aún)
- Aplicaciones en Contenedores en ejecución (imágenes de nginx de marcador de posición)
- Cuentas de almacenamiento accesibles y listas para cargas
- Cosmos DB listo para operaciones de datos
- Application Insights recopilando telemetría de infraestructura
- Key Vault listo para almacenamiento de secretos

**❌ No Funciona Aún (Requiere Desarrollo):**
- Puntos de agentes (sin código de aplicación desplegado)
- Funcionalidad de chat (requiere implementación frontend + backend)
- Consultas de búsqueda (sin índice de búsqueda creado aún)
- Pipeline de procesamiento de documentos (sin datos cargados)
- Telemetría personalizada (requiere instrumentación de aplicación)

**Próximos Pasos:** Ver [Configuración Post-Despliegue](../../../../examples/retail-multiagent-arm-template) para desarrollar y desplegar tu aplicación

---

## ⚙️ Opciones de Configuración

### Parámetros de la Plantilla

| Parámetro | Tipo | Predeterminado | Descripción |
|-----------|------|---------------|-------------|
| `projectName` | string | "retail" | Prefijo para todos los nombres de recursos |
| `location` | string | Ubicación del grupo de recursos | Región principal de despliegue |
| `secondaryLocation` | string | "westus2" | Región secundaria para despliegue multi-región |
| `tertiaryLocation` | string | "francecentral" | Región para modelo de embeddings |
| `environmentName` | string | "dev" | Designación del entorno (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuración de despliegue (mínimo/estándar/premium) |
| `enableMultiRegion` | bool | true | Habilitar despliegue multi-región |
| `enableMonitoring` | bool | true | Habilitar Application Insights y registro |
| `enableSecurity` | bool | true | Habilitar Key Vault y seguridad mejorada |

### Personalización de Parámetros

Edita `azuredeploy.parameters.json`:

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

## 🏗️ Resumen de Arquitectura

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

## 📖 Uso del Script de Despliegue

El script `deploy.sh` proporciona una experiencia de despliegue interactiva:

```bash
# Mostrar ayuda
./deploy.sh --help

# Despliegue básico
./deploy.sh -g myResourceGroup

# Despliegue avanzado con configuraciones personalizadas
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Despliegue de desarrollo sin multi-región
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
- ✅ **Validación de plantilla** antes del despliegue
- ✅ **Monitoreo de progreso** con salida en colores
- ✅ **Visualización de resultados del despliegue**
- ✅ **Guía post-despliegue**

## 📊 Monitoreo del Despliegue

### Verificar Estado del Despliegue

```bash
# Listar implementaciones
az deployment group list --resource-group myResourceGroup --output table

# Obtener detalles de la implementación
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Ver progreso de la implementación
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Resultados del Despliegue

Después de un despliegue exitoso, los siguientes resultados están disponibles:

- **URL del Frontend**: Punto público para la interfaz web
- **URL del Enrutador**: Punto API para el enrutador de agentes
- **Puntos de OpenAI**: Puntos de servicio primario y secundario de OpenAI
- **Servicio de Búsqueda**: Punto de servicio de Azure AI Search
- **Cuenta de Almacenamiento**: Nombre de la cuenta de almacenamiento para documentos
- **Key Vault**: Nombre del Key Vault (si está habilitado)
- **Application Insights**: Nombre del servicio de monitoreo (si está habilitado)

## 🔧 Post-Despliegue: Próximos Pasos
> **📝 Importante:** La infraestructura está desplegada, pero necesitas desarrollar y desplegar el código de la aplicación.

### Fase 1: Desarrollar Aplicaciones de Agentes (Tu Responsabilidad)

La plantilla ARM crea **Container Apps vacíos** con imágenes de nginx como marcadores de posición. Debes:

**Desarrollo Requerido:**
1. **Implementación de Agentes** (30-40 horas)
   - Agente de servicio al cliente con integración GPT-4o
   - Agente de inventario con integración GPT-4o-mini
   - Lógica de enrutamiento de agentes

2. **Desarrollo Frontend** (20-30 horas)
   - Interfaz de chat (React/Vue/Angular)
   - Funcionalidad de carga de archivos
   - Renderizado y formato de respuestas

3. **Servicios Backend** (12-16 horas)
   - Enrutador FastAPI o Express
   - Middleware de autenticación
   - Integración de telemetría

**Consulta:** [Guía de Arquitectura](../retail-scenario.md) para patrones de implementación detallados y ejemplos de código

### Fase 2: Configurar el Índice de Búsqueda de IA (15-30 minutos)

Crea un índice de búsqueda que coincida con tu modelo de datos:

```bash
# Obtener detalles del servicio de búsqueda
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Crear índice con tu esquema (ejemplo)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Recursos:**
- [Diseño de Esquema de Índice de Búsqueda de IA](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Configuración de Búsqueda Vectorial](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Subir tus Datos (El tiempo varía)

Una vez que tengas datos de productos y documentos:

```bash
# Obtener detalles de la cuenta de almacenamiento
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Subir tus documentos
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Ejemplo: Subir un solo archivo
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Construir y Desplegar tus Aplicaciones (8-12 horas)

Una vez que hayas desarrollado el código de tus agentes:

```bash
# 1. Crear Azure Container Registry (si es necesario)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Construir y subir la imagen del enrutador de agentes
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Construir y subir la imagen del frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Actualizar las Container Apps con tus imágenes
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Configurar las variables de entorno
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fase 5: Probar tu Aplicación (2-4 horas)

```bash
# Obtén la URL de tu aplicación
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Prueba el endpoint del agente (una vez que tu código esté desplegado)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Revisa los registros de la aplicación
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Recursos de Implementación

**Arquitectura y Diseño:**
- 📖 [Guía Completa de Arquitectura](../retail-scenario.md) - Patrones de implementación detallados
- 📖 [Patrones de Diseño Multi-Agente](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Ejemplos de Código:**
- 🔗 [Ejemplo de Chat de Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Patrón RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework de agentes (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orquestación de agentes (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Conversaciones multi-agente

**Esfuerzo Total Estimado:**
- Despliegue de infraestructura: 15-25 minutos (✅ Completado)
- Desarrollo de aplicaciones: 80-120 horas (🔨 Tu trabajo)
- Pruebas y optimización: 15-25 horas (🔨 Tu trabajo)

## 🛠️ Resolución de Problemas

### Problemas Comunes

#### 1. Cuota de Azure OpenAI Excedida

```bash
# Verificar el uso actual de la cuota
az cognitiveservices usage list --location eastus2

# Solicitar aumento de cuota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Fallo en el Despliegue de Container Apps

```bash
# Verificar los registros de la aplicación del contenedor
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Reiniciar la aplicación del contenedor
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicialización del Servicio de Búsqueda

```bash
# Verificar el estado del servicio de búsqueda
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Probar la conectividad del servicio de búsqueda
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validación del Despliegue

```bash
# Validar que todos los recursos estén creados
az resource list \
  --resource-group myResourceGroup \
  --output table

# Verificar la salud de los recursos
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Consideraciones de Seguridad

### Gestión de Claves
- Todos los secretos se almacenan en Azure Key Vault (cuando está habilitado)
- Las Container Apps usan identidad administrada para autenticación
- Las cuentas de almacenamiento tienen configuraciones seguras por defecto (solo HTTPS, sin acceso público a blobs)

### Seguridad de Red
- Las Container Apps usan redes internas siempre que sea posible
- El servicio de búsqueda está configurado con la opción de puntos finales privados
- Cosmos DB está configurado con los permisos mínimos necesarios

### Configuración de RBAC
```bash
# Asignar roles necesarios para la identidad administrada
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimización de Costos

### Estimaciones de Costos (Mensuales, USD)

| Modo | OpenAI | Container Apps | Búsqueda | Almacenamiento | Total Est. |
|------|--------|----------------|----------|----------------|------------|
| Mínimo | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Estándar | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitoreo de Costos

```bash
# Configurar alertas de presupuesto
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
- Control de versiones de los archivos de la plantilla ARM
- Prueba los cambios primero en un entorno de desarrollo
- Usa el modo de despliegue incremental para actualizaciones

### Actualizaciones de Recursos
```bash
# Actualizar con nuevos parámetros
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Respaldo y Recuperación
- Respaldo automático habilitado para Cosmos DB
- Eliminación suave habilitada para Key Vault
- Revisiones de Container Apps mantenidas para retrocesos

## 📞 Soporte

- **Problemas con la Plantilla**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Soporte de Azure**: [Portal de Soporte de Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunidad**: [Discord de Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ ¿Listo para desplegar tu solución multi-agente?**

Comienza con: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->