# Laboratorio de Taller de IA: Haciendo tus Soluciones de IA Desplegables con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-First
- **⬅️ Anterior**: [Despliegue de Modelo de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores Prácticas de IA en Producción](../chapter-08-production/production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Descripción General del Taller

Este laboratorio práctico guía a los desarrolladores a través del proceso de tomar una plantilla de IA existente y desplegarla usando Azure Developer CLI (AZD). Aprenderás patrones esenciales para despliegues de IA en producción usando servicios de Microsoft Foundry.

> **Revisión de versión (2026-11-04):** Las indicaciones de comandos AZD y nombres de configuración de muestra fueron verificados contra la versión `azd` `1.37.2` y la configuración actual de la muestra enlazada. Esta es una revisión documental, no una validación de despliegue en vivo. El laboratorio RAG no requiere la extensión de agente; para evaluaciones de agente, usa la extensión `azure.ai.evaluations` separada y el [flujo de evaluación actual](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), no comandos legados de evaluación de agente.

**Duración:** 2-3 horas  
**Nivel:** Intermedio  
**Requisitos previos:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Objetivos de Aprendizaje

Al finalizar este taller, podrás:
- ✅ Explorar una plantilla AZD de IA existente y planear la conversión de tu propia aplicación
- ✅ Configurar servicios Microsoft Foundry con AZD
- ✅ Implementar gestión segura de credenciales para servicios de IA
- ✅ Desplegar una aplicación de referencia de IA con monitoreo
- ✅ Resolver problemas comunes en despliegues de IA

## Requisitos Previos

### Herramientas Requeridas
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (se recomienda VS Code)

Estos bloques de comandos usan sintaxis Bash (incluyendo continuaciones de línea y `grep`). En Windows, usa Git Bash/WSL o tradúcelos a PowerShell. También instala el lenguaje, gestor de paquetes y herramientas de contenedores listadas en la [configuración del entorno local de la muestra](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Recursos de Azure
- Suscripción de Azure con permisos de provisión de recursos y asignación de roles (el rol de Colaborador solo no puede crear asignaciones RBAC; usa un administrador de roles autorizado o el equivalente documentado de la muestra)
- Acceso a servicios Microsoft Foundry Models (o capacidad para solicitar acceso)
- Permisos para crear grupos de recursos

### Conocimientos Previos
- Comprensión básica de servicios de Azure
- Familiaridad con interfaces de línea de comandos
- Conceptos básicos de IA/ML (APIs, modelos, prompts)

## Configuración del Laboratorio

### Paso 1: Preparación del Entorno

1. **Verifica las instalaciones de herramientas:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Si trabajas con varios tenants o tu suscripción no se detecta automáticamente, reintenta con `azd auth login --tenant-id <tenant-id>`.

2. **Clona el repositorio del taller:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Entendiendo la Estructura AZD para Aplicaciones de IA

### Anatomía de una Plantilla AZD para IA

Explora los archivos clave en una plantilla AZD preparada para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

La muestra descargada puede cambiar; `.azure/` aparece después de la inicialización del entorno, no necesariamente en una clonación fresca. Inspecciona la descarga real en lugar de crear directorios faltantes para igualar este esquema.

### **Ejercicio de Laboratorio 1.1: Explora la Configuración**

1. **Examina el archivo azure.yaml:**
```bash
cat azure.yaml
```

**Qué buscar:**
- Definiciones de servicios para componentes de IA
- Mapeos de variables de entorno
- Configuraciones de hosts

2. **Revisa la infraestructura main.bicep:**
```bash
cat infra/main.bicep
```

**Patrones clave de IA a identificar:**
- Provisión del servicio Microsoft Foundry Models
- Integración con Azure AI Search
- Gestión segura de claves
- Configuraciones de seguridad de red

### **Punto de Discusión:** Por qué Importan Estos Patrones para IA

- **Dependencias de Servicio**: Las aplicaciones de IA a menudo requieren varios servicios coordinados
- **Seguridad**: Las claves API y endpoints necesitan gestión segura
- **Escalabilidad**: Las cargas de trabajo de IA tienen requisitos únicos de escalado
- **Gestión de Costos**: Los servicios de IA pueden ser costosos si no se configuran adecuadamente

## Módulo 2: Despliega tu Primera Aplicación de IA

### Paso 2.1: Inicializa el Entorno

1. **Crea un nuevo entorno AZD:**
```bash
azd env new myai-workshop
```

2. **Establece los parámetros requeridos:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Paso 2.2: Despliega la Infraestructura y la Aplicación

1. **Despliega con AZD:**
```bash
azd up
```

**Qué sucede durante `azd up`:**
- ✅ Provisiona el servicio Microsoft Foundry Models
- ✅ Crea el servicio Azure AI Search
- ✅ Configura Azure Container Apps para el backend y frontend empaquetados (el valor predeterminado actual de la muestra)
- ✅ Configura redes y seguridad
- ✅ Despliega el código de la aplicación
- ✅ Configura monitoreo y registros

2. **Monitorea el progreso del despliegue** y observa los recursos que se están creando.

### Paso 2.3: Verifica tu Despliegue

1. **Revisa los recursos desplegados:**
```bash
azd show
```

2. **Abre la aplicación desplegada:**
```bash
azd show
```

Abre el endpoint web mostrado en la salida de `azd show`.

3. **Prueba la funcionalidad de IA:**
   - Navega a la aplicación web
   - Intenta consultas de muestra
   - Verifica que las respuestas de IA funcionen

### **Ejercicio de Laboratorio 2.1: Práctica de Solución de Problemas**

**Escenario**: Tu despliegue tuvo éxito pero la IA no responde.

**Problemas comunes para verificar:**
1. **Autenticación**: Verifica la identidad administrada y asignaciones de roles; solo revisa claves API si habilitaste la autenticación basada en claves deliberadamente
2. **Disponibilidad del modelo**: Comprueba si tu región soporta el modelo
3. **Conectividad de red**: Asegura que los servicios puedan comunicarse
4. **Permisos RBAC**: Verifica que la aplicación pueda acceder a OpenAI

**Comandos de depuración:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicaciones de IA para Tus Necesidades

### Paso 3.1: Modifica la Configuración de IA

1. **Actualiza el modelo OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Agrega servicios adicionales de IA:**

Edita `infra/main.bicep` para agregar Document Intelligence:

Lo siguiente es un fragmento ilustrativo, no una plantilla completa. La muestra puede ya proveer servicios de procesamiento de documentos: inspecciona su infraestructura actual antes de añadir recursos duplicados. Las adiciones personalizadas requieren enlazar salidas, identidades y configuración de la aplicación.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Paso 3.2: Configuraciones Específicas de Entorno

**Mejor Práctica**: Configuraciones diferentes para desarrollo y producción.

1. **Crea un entorno de producción:**
```bash
azd env new myai-production
```

2. **Establece parámetros específicos de producción:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Estos nombres provienen del [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) de la muestra. `azd env set` almacena un valor pero no hace efectivo un variable arbitraria: la plantilla debe consumirlo. Revisa la [guía de aislamiento de red](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) de la muestra antes de deshabilitar acceso público y usa `azd up` para aplicar cambios de infraestructura. La SKU OpenAI `S0` sola no determina el rendimiento del modelo; también importa el tipo de despliegue y capacidad.

### **Ejercicio de Laboratorio 3.1: Optimización de Costos**

**Desafío**: Configura la plantilla para desarrollo rentable.

**Tareas:**
1. Selecciona el entorno descartable del taller: `azd env select myai-workshop`.
2. Registra SKU Search actual y capacidad del modelo desde `infra/main.parameters.json` y el entorno seleccionado.
3. Usa las entradas soportadas abajo, después de confirmar cuota de modelo/región:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifica el SKU Search y capacidad de despliegue en el portal y estima la diferencia con la calculadora de precios. No esperes datos de facturación actualizados inmediatamente.

**Criterios de éxito:** Search usa Basic, el despliegue de chat tiene capacidad soportada solicitada, y la app responde una pregunta de muestra. La capacidad `10` es una asignación de límite de tasa, no un descuento en precio por token. Cambios de nivel Search pueden estar restringidos o requerir recreación; no experimentes en recursos de producción. F0 es específico de servicio y no es SKU de modelo Azure OpenAI.

## Módulo 4: Seguridad y Mejores Prácticas de Producción

### Paso 4.1: Gestión Segura de Credenciales

**Desafío actual**: Muchas apps de IA codifican claves API o usan almacenamiento inseguro.

**Solución AZD**: Identidad Gestionada + integración con Key Vault.

1. **Revisa la configuración de seguridad en tu plantilla:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica que la Identidad Gestionada funcione:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Paso 4.2: Seguridad de Red

1. **Habilita endpoints privados** usando la configuración de red soportada en la muestra (si no está ya configurada).

Para tu propia plantilla, este fragmento ilustrativo muestra la conexión al endpoint OpenAI. También necesita VNet, configuración privada DNS y conectividad de aplicación; no lo pegues sin cambios en la muestra, que ya tiene módulos de endpoint privado:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Paso 4.3: Monitoreo y Observabilidad

1. **Configura Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Habilita la integración de Application Insights en la muestra:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

La instrumentación de la muestra emite telemetría; un ajuste arbitrario `OPENAI_MONITOR_ENABLED` no habilita métricas de IA. Revisa rastros para llamadas a modelos, latencia, fallos y uso de tokens, y evita grabar prompts o respuestas sensibles.

### **Ejercicio de Laboratorio 4.1: Auditoría de Seguridad**

**Tarea**: Revisa tu despliegue para mejores prácticas de seguridad.

**Lista de verificación:**
- [ ] No hay secretos codificados en código o configuración
- [ ] Se usa Identidad Gestionada para autenticación servicio a servicio
- [ ] Key Vault almacena configuración sensible
- [ ] El acceso a la red está correctamente restringido
- [ ] Monitoreo y registros están habilitados

## Módulo 5: Convirtiendo tu Propia Aplicación de IA

### Paso 5.1: Cuestionario de Evaluación

**Antes de convertir tu app**, responde estas preguntas:

1. **Arquitectura de la Aplicación:**
   - ¿Qué servicios de IA usa tu app?
   - ¿Qué recursos computacionales necesita?
   - ¿Requiere base de datos?
   - ¿Cuáles son las dependencias entre servicios?

2. **Requisitos de Seguridad:**
   - ¿Qué datos sensibles maneja tu app?
   - ¿Qué requisitos de cumplimiento tienes?
   - ¿Necesitas red privada?

3. **Requisitos de Escalado:**
   - ¿Cuál es tu carga esperada?
   - ¿Necesitas autoescalado?
   - ¿Hay requisitos regionales?

### Paso 5.2: Crea tu Plantilla AZD

**Sigue este patrón para convertir tu app:**

**Solo estructura:** Esta sección no provee código fuente de API/aplicación web, infraestructura host, despliegues de modelos, identidad/RBAC, ni un `main.parameters.json` finalizado. El Bicep con ámbito de grupo de recursos ilustra composición de módulos; un punto de entrada típico AZD con ámbito de suscripción debe crear un grupo de recursos e invocarlo con ese ámbito. No esperes que `azd up` despliegue una app completa copiando solo estos fragmentos. Para una base ejecutable, sigue usando la plantilla RAG del Módulo 1.

1. **Crea la estructura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Crea azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Crea plantillas de infraestructura:**

**infra/main.bicep** - Plantilla principal:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Módulo OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Ejercicio de Laboratorio 5.1: Desafío de Creación de Plantilla**

**Desafío**: Crea una plantilla AZD para una app IA de procesamiento de documentos.

**Requisitos:**
- Microsoft Foundry Models para análisis de contenido
- Document Intelligence para OCR
- Cuenta de Almacenamiento para cargas de documentos
- Function App para lógica de procesamiento
- Aplicación web para interfaz de usuario

**Puntos extra:**
- Agrega manejo adecuado de errores
- Incluye estimación de costos
- Configura paneles de monitoreo

## Módulo 6: Resolviendo Problemas Comunes

### Problemas Comunes en Despliegues

#### Problema 1: Cuota de Servicio OpenAI Excedida
**Síntomas:** El despliegue falla con error de cuota
**Soluciones:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo No Disponible en la Región
**Síntomas:** Fallos en respuestas de IA o errores de despliegue de modelo
**Soluciones:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problema 3: Problemas de Permisos
**Síntomas:** Errores 403 Forbidden al llamar servicios IA
**Soluciones:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de Rendimiento

#### Problema 4: Respuestas Lentas de IA
**Pasos de investigación:**
1. Revisa Application Insights para métricas de rendimiento
2. Revisa métricas del servicio OpenAI en el portal Azure
3. Verifica conectividad y latencia de red

**Soluciones:**
- Implementa caché para consultas comunes
- Usa modelo OpenAI adecuado para tu caso de uso
- Escala réplicas de aplicación solo después de verificar límites RPM/TPM del modelo; los despliegues Azure OpenAI no exponen un ajuste genérico de "réplica de lectura" tipo base de datos

### **Ejercicio de Laboratorio 6.1: Desafío de Depuración**

**Escenario**: Tu despliegue tuvo éxito, pero la aplicación retorna errores 500.

**Tareas de depuración:**
1. Revisa los logs de la aplicación
2. Verifica la conectividad del servicio
3. Probar la autenticación
4. Revisar configuración

**Herramientas para usar:**
- `azd show` para visión general del despliegue
- Portal de Azure para registros detallados del servicio
- Application Insights para telemetría de la aplicación

## Módulo 7: Supervisión y Optimización

### Paso 7.1: Configurar supervisión integral

1. **Crear paneles personalizados:**

Navegar al portal de Azure y crear un panel con:
- Conteo y latencia de solicitudes OpenAI
- Tasas de error de la aplicación
- Utilización de recursos
- Seguimiento de costos

2. **Configurar alertas:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Verifique que el componente emita telemetría de solicitudes y agregue un grupo de acción si se requieren notificaciones. La métrica es un conteo, no un porcentaje de fallas; una alerta de tasa necesita una consulta adecuada y denominador.

### Paso 7.2: Optimización de costos

1. **Analizar costos actuales:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Reemplace los marcadores de fecha. El soporte de la API de consumo varía según el acuerdo de facturación; use Cost Management en el portal si los detalles de uso no están disponibles. Los costos tienen retraso, no son un oráculo de prueba en tiempo real.

2. **Implementar controles de costos:**
- Configurar alertas de presupuesto
- Usar políticas de autoscaling
- Implementar caché de solicitudes
- Supervisar uso de tokens para OpenAI

### **Ejercicio de Laboratorio 7.1: Optimización del rendimiento**

**Tarea**: Optimice su aplicación de IA para rendimiento y costo.

**Métricas a mejorar:**
- Reducir tiempo promedio de respuesta en un 20%
- Reducir costos mensuales en un 15%
- Definir un SLO de disponibilidad del 99.9% y una ventana de medición (un laboratorio corto no puede demostrar tiempo de actividad mensual)

**Estrategias a probar:**
- Implementar caché de respuestas
- Optimizar prompts para eficiencia de tokens
- Usar SKUs de cómputo apropiados
- Configurar autoscaling adecuado

## Desafío Final: Implementación de extremo a extremo

### Escenario del Desafío

Este es un **desafío opcional de arquitectura/diseño**, no un ejercicio ejecutable suministrado ni una certificación de producción. Proponga un chatbot de servicio al cliente impulsado por IA y documente qué requisitos necesitan más implementación y evidencia:

**Requisitos funcionales:**
- Interfaz web para interacciones con el cliente
- Integración con Microsoft Foundry Models para respuestas
- Capacidad de búsqueda documental usando Azure AI Search
- Integración con base de datos de clientes existente
- Soporte multilenguaje

**Requisitos no funcionales:**
- Manejar 1000 usuarios concurrentes
- SLA de tiempo de actividad del 99.9%
- Cumplimiento SOC 2
- Costo menor a $500/mes
- Desplegar en múltiples entornos (dev, staging, prod)

Estas son restricciones hipotéticas del stakeholder, no resultados garantizados simultáneamente. Defina tasa de solicitudes, tamaños de prompt/salida y duración de sesión antes de estimar costos; 1,000 usuarios concurrentes no establecen una carga ni prueban que un presupuesto de $500 es factible. SOC 2 es un resultado de auditoría organizacional, no un interruptor habilitado por una plantilla AZD. Identifique compensaciones y rechace restricciones inviables con evidencia.

### Pasos de implementación

1. **Diseñar la arquitectura**
2. **Crear la plantilla AZD**
3. **Implementar medidas de seguridad**
4. **Configurar supervisión y alertas**
5. **Crear pipelines de despliegue**
6. **Documentar la solución**

### Criterios de evaluación

- ✅ **Funcionalidad**: ¿Se demuestran las capacidades implementadas y los vacíos restantes son explícitos?
- ✅ **Seguridad**: ¿Se implementan las mejores prácticas?
- ✅ **Escalabilidad**: ¿Puede manejar la carga?
- ✅ **Mantenibilidad**: ¿Está bien organizado el código e infraestructura?
- ✅ **Costo**: ¿Permanece dentro del presupuesto?

## Recursos adicionales

### Documentación de Microsoft
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación del servicio Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentación de Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Plantillas de ejemplo
- [Aplicación de chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Inicio rápido de aplicación de chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos de la comunidad
- [Discord de Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Geniales plantillas AZD](https://azure.github.io/awesome-azd/)

## 🎓 Punto de Control de Finalización

¡Felicidades! Has completado el laboratorio del taller de IA. Ahora deberías ser capaz de:

- ✅ Explicar cómo adaptar una aplicación de IA existente a una plantilla AZD
- ✅ Desplegar y probar una aplicación de referencia de IA
- ✅ Implementar las mejores prácticas de seguridad para cargas de trabajo de IA
- ✅ Supervisar y optimizar el rendimiento de aplicaciones de IA
- ✅ Solucionar problemas comunes de despliegue

**Limpieza:** Ejecute `azd env list`, seleccione cada entorno desechable creado en este laboratorio (`myai-workshop`, y si se desplegó `myai-production`/`myai-quota-test`), y ejecute `azd down` en cada uno. Revise el plan de eliminación; eliminar solo la configuración local de un entorno no elimina recursos de Azure. Evite `--purge` a menos que comprenda la eliminación irreversible de recursos en estado soft-deleted.

### Próximos pasos
1. Aplicar estos patrones a sus propios proyectos de IA
2. Contribuir con plantillas a la comunidad
3. Unirse al Discord de Microsoft Foundry para soporte continuo
4. Explorar temas avanzados como despliegues multi-región

---

**Comentarios del taller**: Ayúdenos a mejorar este taller compartiendo su experiencia en el [canal #Azure del Discord de Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo AI-First
- **⬅️ Anterior**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores prácticas de IA en producción](../chapter-08-production/production-ai-practices.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestra comunidad para soporte y discusiones sobre AZD y despliegues de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->