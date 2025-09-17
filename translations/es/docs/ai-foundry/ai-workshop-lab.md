<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T17:27:08+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "es"
}
-->
# Taller de IA: Haciendo tus soluciones de IA desplegables con AZD

**Anterior:** [Despliegue de Modelos de IA](ai-model-deployment.md) | **Siguiente:** [Prácticas de IA en Producción](production-ai-practices.md)

## Resumen del Taller

Este laboratorio práctico guía a los desarrolladores en el proceso de tomar una aplicación de IA existente y hacerla desplegable utilizando Azure Developer CLI (AZD). Aprenderás patrones esenciales para despliegues de IA en producción utilizando los servicios de Azure AI Foundry.

**Duración:** 2-3 horas  
**Nivel:** Intermedio  
**Requisitos previos:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Objetivos de Aprendizaje

Al final de este taller, serás capaz de:
- ✅ Convertir una aplicación de IA existente para usar plantillas de AZD
- ✅ Configurar servicios de Azure AI Foundry con AZD
- ✅ Implementar gestión segura de credenciales para servicios de IA
- ✅ Desplegar aplicaciones de IA listas para producción con monitoreo
- ✅ Solucionar problemas comunes de despliegue de IA

## Requisitos previos

### Herramientas necesarias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (se recomienda VS Code)

### Recursos de Azure
- Suscripción de Azure con acceso de colaborador
- Acceso a servicios de Azure OpenAI (o capacidad para solicitar acceso)
- Permisos para crear grupos de recursos

### Conocimientos previos
- Comprensión básica de los servicios de Azure
- Familiaridad con interfaces de línea de comandos
- Conceptos básicos de IA/ML (APIs, modelos, prompts)

## Configuración del Laboratorio

### Paso 1: Preparación del Entorno

1. **Verificar instalaciones de herramientas:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clonar el repositorio del taller:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Comprendiendo la estructura de AZD para aplicaciones de IA

### Anatomía de una plantilla AZD lista para IA

Explora los archivos clave en una plantilla AZD preparada para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Ejercicio de laboratorio 1.1: Explorar la configuración**

1. **Examinar el archivo azure.yaml:**
```bash
cat azure.yaml
```

**Qué buscar:**
- Definiciones de servicios para componentes de IA
- Mapeos de variables de entorno
- Configuraciones de host

2. **Revisar la infraestructura main.bicep:**
```bash
cat infra/main.bicep
```

**Patrones clave de IA para identificar:**
- Aprovisionamiento del servicio Azure OpenAI
- Integración de Cognitive Search
- Gestión segura de claves
- Configuraciones de seguridad de red

### **Punto de discusión:** Por qué estos patrones son importantes para IA

- **Dependencias de servicios**: Las aplicaciones de IA suelen requerir múltiples servicios coordinados
- **Seguridad**: Las claves API y los endpoints necesitan gestión segura
- **Escalabilidad**: Las cargas de trabajo de IA tienen requisitos únicos de escalabilidad
- **Gestión de costos**: Los servicios de IA pueden ser costosos si no se configuran adecuadamente

## Módulo 2: Despliega tu primera aplicación de IA

### Paso 2.1: Inicializar el entorno

1. **Crear un nuevo entorno AZD:**
```bash
azd env new myai-workshop
```

2. **Establecer parámetros requeridos:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Paso 2.2: Desplegar la infraestructura y la aplicación

1. **Desplegar con AZD:**
```bash
azd up
```

**Qué sucede durante `azd up`:**
- ✅ Aprovisiona el servicio Azure OpenAI
- ✅ Crea el servicio Cognitive Search
- ✅ Configura App Service para la aplicación web
- ✅ Configura redes y seguridad
- ✅ Despliega el código de la aplicación
- ✅ Configura monitoreo y registro

2. **Monitorea el progreso del despliegue** y toma nota de los recursos que se están creando.

### Paso 2.3: Verificar tu despliegue

1. **Revisar los recursos desplegados:**
```bash
azd show
```

2. **Abrir la aplicación desplegada:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Probar la funcionalidad de IA:**
   - Navega a la aplicación web
   - Prueba consultas de ejemplo
   - Verifica que las respuestas de IA funcionen

### **Ejercicio de laboratorio 2.1: Práctica de solución de problemas**

**Escenario**: Tu despliegue fue exitoso, pero la IA no responde.

**Problemas comunes a verificar:**
1. **Claves API de OpenAI**: Verifica que estén configuradas correctamente
2. **Disponibilidad del modelo**: Comprueba si tu región admite el modelo
3. **Conectividad de red**: Asegúrate de que los servicios puedan comunicarse
4. **Permisos RBAC**: Verifica que la aplicación pueda acceder a OpenAI

**Comandos de depuración:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando aplicaciones de IA según tus necesidades

### Paso 3.1: Modificar la configuración de IA

1. **Actualizar el modelo de OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Agregar servicios adicionales de IA:**

Edita `infra/main.bicep` para agregar Document Intelligence:

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

### Paso 3.2: Configuraciones específicas del entorno

**Mejor práctica**: Configuraciones diferentes para desarrollo vs producción.

1. **Crear un entorno de producción:**
```bash
azd env new myai-production
```

2. **Establecer parámetros específicos de producción:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ejercicio de laboratorio 3.1: Optimización de costos**

**Desafío**: Configura la plantilla para un desarrollo rentable.

**Tareas:**
1. Identifica qué SKUs pueden configurarse en niveles gratuitos/básicos
2. Configura variables de entorno para minimizar costos
3. Despliega y compara costos con la configuración de producción

**Pistas para la solución:**
- Usa el nivel F0 (gratuito) para Cognitive Services cuando sea posible
- Usa el nivel Básico para Search Service en desarrollo
- Considera usar el plan de Consumo para Functions

## Módulo 4: Seguridad y mejores prácticas en producción

### Paso 4.1: Gestión segura de credenciales

**Desafío actual**: Muchas aplicaciones de IA codifican claves API o usan almacenamiento inseguro.

**Solución AZD**: Integración de Managed Identity + Key Vault.

1. **Revisar la configuración de seguridad en tu plantilla:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificar que Managed Identity esté funcionando:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Paso 4.2: Seguridad de red

1. **Habilitar endpoints privados** (si no están configurados):

Agrega a tu plantilla bicep:
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

### Paso 4.3: Monitoreo y observabilidad

1. **Configurar Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Establecer monitoreo específico de IA:**

Agrega métricas personalizadas para operaciones de IA:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Ejercicio de laboratorio 4.1: Auditoría de seguridad**

**Tarea**: Revisa tu despliegue para mejores prácticas de seguridad.

**Lista de verificación:**
- [ ] No hay secretos codificados en el código o configuración
- [ ] Managed Identity se usa para autenticación entre servicios
- [ ] Key Vault almacena configuraciones sensibles
- [ ] El acceso a la red está restringido adecuadamente
- [ ] Monitoreo y registro están habilitados

## Módulo 5: Convertir tu propia aplicación de IA

### Paso 5.1: Hoja de evaluación

**Antes de convertir tu aplicación**, responde estas preguntas:

1. **Arquitectura de la aplicación:**
   - ¿Qué servicios de IA usa tu aplicación?
   - ¿Qué recursos de cómputo necesita?
   - ¿Requiere una base de datos?
   - ¿Cuáles son las dependencias entre servicios?

2. **Requisitos de seguridad:**
   - ¿Qué datos sensibles maneja tu aplicación?
   - ¿Qué requisitos de cumplimiento tienes?
   - ¿Necesitas redes privadas?

3. **Requisitos de escalabilidad:**
   - ¿Cuál es tu carga esperada?
   - ¿Necesitas autoescalado?
   - ¿Hay requisitos regionales?

### Paso 5.2: Crear tu plantilla AZD

**Sigue este patrón para convertir tu aplicación:**

1. **Crear la estructura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Crear azure.yaml:**
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

3. **Crear plantillas de infraestructura:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Ejercicio de laboratorio 5.1: Desafío de creación de plantillas**

**Desafío**: Crea una plantilla AZD para una aplicación de procesamiento de documentos con IA.

**Requisitos:**
- Azure OpenAI para análisis de contenido
- Document Intelligence para OCR
- Storage Account para cargas de documentos
- Function App para lógica de procesamiento
- Aplicación web para interfaz de usuario

**Puntos extra:**
- Agrega manejo adecuado de errores
- Incluye estimación de costos
- Configura paneles de monitoreo

## Módulo 6: Solución de problemas comunes

### Problemas comunes de despliegue

#### Problema 1: Cuota del servicio OpenAI excedida
**Síntomas:** El despliegue falla con error de cuota
**Soluciones:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo no disponible en la región
**Síntomas:** Las respuestas de IA fallan o errores de despliegue del modelo
**Soluciones:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Problemas de permisos
**Síntomas:** Errores 403 Forbidden al llamar a servicios de IA
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

### Problemas de rendimiento

#### Problema 4: Respuestas lentas de IA
**Pasos de investigación:**
1. Revisa métricas de rendimiento en Application Insights
2. Revisa métricas del servicio OpenAI en el portal de Azure
3. Verifica conectividad de red y latencia

**Soluciones:**
- Implementa caché para consultas comunes
- Usa el modelo OpenAI adecuado para tu caso de uso
- Considera réplicas de lectura para escenarios de alta carga

### **Ejercicio de laboratorio 6.1: Desafío de depuración**

**Escenario**: Tu despliegue fue exitoso, pero la aplicación devuelve errores 500.

**Tareas de depuración:**
1. Revisa los registros de la aplicación
2. Verifica la conectividad de servicios
3. Prueba la autenticación
4. Revisa la configuración

**Herramientas a usar:**
- `azd show` para vista general del despliegue
- Portal de Azure para registros detallados de servicios
- Application Insights para telemetría de la aplicación

## Módulo 7: Monitoreo y optimización

### Paso 7.1: Configurar monitoreo integral

1. **Crear paneles personalizados:**

Navega al portal de Azure y crea un panel con:
- Conteo de solicitudes y latencia de OpenAI
- Tasas de error de la aplicación
- Utilización de recursos
- Seguimiento de costos

2. **Configurar alertas:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Paso 7.2: Optimización de costos

1. **Analizar costos actuales:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementar controles de costos:**
- Configurar alertas de presupuesto
- Usar políticas de autoescalado
- Implementar caché de solicitudes
- Monitorear uso de tokens para OpenAI

### **Ejercicio de laboratorio 7.1: Optimización de rendimiento**

**Tarea**: Optimiza tu aplicación de IA para rendimiento y costos.

**Métricas a mejorar:**
- Reducir el tiempo promedio de respuesta en un 20%
- Reducir costos mensuales en un 15%
- Mantener un tiempo de actividad del 99.9%

**Estrategias a probar:**
- Implementar caché de respuestas
- Optimizar prompts para eficiencia de tokens
- Usar SKUs de cómputo adecuados
- Configurar autoescalado adecuado

## Desafío final: Implementación de extremo a extremo

### Escenario del desafío

Se te asigna la tarea de crear un chatbot de servicio al cliente impulsado por IA listo para producción con estos requisitos:

**Requisitos funcionales:**
- Interfaz web para interacciones con clientes
- Integración con Azure OpenAI para respuestas
- Capacidad de búsqueda de documentos usando Cognitive Search
- Integración con la base de datos de clientes existente
- Soporte multilingüe

**Requisitos no funcionales:**
- Manejar 1000 usuarios concurrentes
- SLA de tiempo de actividad del 99.9%
- Cumplimiento SOC 2
- Costo inferior a $500/mes
- Desplegar en múltiples entornos (desarrollo, pruebas, producción)

### Pasos de implementación

1. **Diseñar la arquitectura**
2. **Crear la plantilla AZD**
3. **Implementar medidas de seguridad**
4. **Configurar monitoreo y alertas**
5. **Crear pipelines de despliegue**
6. **Documentar la solución**

### Criterios de evaluación

- ✅ **Funcionalidad**: ¿Cumple con todos los requisitos?
- ✅ **Seguridad**: ¿Se implementaron las mejores prácticas?
- ✅ **Escalabilidad**: ¿Puede manejar la carga?
- ✅ **Mantenibilidad**: ¿Está bien organizado el código y la infraestructura?
- ✅ **Costo**: ¿Se mantiene dentro del presupuesto?

## Recursos adicionales

### Documentación de Microsoft
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación del servicio Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentación de Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Plantillas de ejemplo
- [Aplicación de chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Inicio rápido de aplicación de chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos comunitarios
- [Discord de Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Plantillas AZD increíbles](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de finalización

¡Felicidades! Has completado el Taller de IA. Ahora deberías ser capaz de:

- ✅ Convertir aplicaciones de IA existentes a plantillas AZD
- ✅ Desplegar aplicaciones de IA listas para producción
- ✅ Implementar prácticas recomendadas de seguridad para cargas de trabajo de IA  
- ✅ Monitorear y optimizar el rendimiento de aplicaciones de IA  
- ✅ Solucionar problemas comunes de implementación  

### Próximos pasos  
1. Aplica estos patrones a tus propios proyectos de IA  
2. Contribuye con plantillas a la comunidad  
3. Únete al Discord de Azure AI Foundry para soporte continuo  
4. Explora temas avanzados como implementaciones en múltiples regiones  

---

**Comentarios sobre el taller**: Ayúdanos a mejorar este taller compartiendo tu experiencia en el [canal #Azure de Discord de Azure AI Foundry](https://discord.gg/microsoft-azure).  

---

**Anterior:** [Implementación de modelos de IA](ai-model-deployment.md) | **Siguiente:** [Prácticas de IA en producción](production-ai-practices.md)  

**¿Necesitas ayuda?** Únete a nuestra comunidad para soporte y discusiones sobre AZD y despliegues de IA.  

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.