# Taller de IA: Haciendo que Sus Soluciones de IA Sean Desplegables con AZD

**Navegación del Capítulo:**  
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)  
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-First  
- **⬅️ Anterior**: [Despliegue de Modelos de IA](ai-model-deployment.md)  
- **➡️ Siguiente**: [Mejores Prácticas para IA en Producción](production-ai-practices.md)  
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)  

## Resumen del Taller

Este laboratorio práctico guía a los desarrolladores a través del proceso de tomar una plantilla de IA existente y desplegarla usando Azure Developer CLI (AZD). Aprenderá patrones esenciales para despliegues de IA en producción utilizando los servicios de Microsoft Foundry.

**Duración:** 2-3 horas  
**Nivel:** Intermedio  
**Prerequisitos:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Objetivos de Aprendizaje

Al final de este taller, usted podrá:  
- ✅ Convertir una aplicación de IA existente para usar plantillas AZD  
- ✅ Configurar servicios de Microsoft Foundry con AZD  
- ✅ Implementar gestión segura de credenciales para servicios de IA  
- ✅ Desplegar aplicaciones de IA listas para producción con monitoreo  
- ✅ Solucionar problemas comunes en despliegues de IA  

## Prerrequisitos

### Herramientas Requeridas  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado  
- [Git](https://git-scm.com/) instalado  
- Editor de código (recomendado VS Code)  

### Recursos de Azure  
- Suscripción de Azure con acceso de colaborador  
- Acceso a servicios de Microsoft Foundry Models (o posibilidad de solicitar acceso)  
- Permisos para crear grupos de recursos  

### Conocimientos Previos  
- Comprensión básica de servicios de Azure  
- Familiaridad con interfaces de línea de comandos  
- Conceptos básicos de IA/ML (APIs, modelos, prompts)  

## Configuración del Laboratorio

### Paso 1: Preparación del Entorno

1. **Verificar instalaciones de herramientas:**  
```bash
# Verificar instalación de AZD
azd version

# Verificar Azure CLI
az --version

# Iniciar sesión en Azure
az login
azd auth login
```
  
2. **Clonar el repositorio del taller:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Módulo 1: Entendiendo la Estructura AZD para Aplicaciones de IA

### Anatomía de una Plantilla AZD para IA

Explore los archivos clave en una plantilla AZD preparada para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  
### **Ejercicio de Laboratorio 1.1: Explorar la Configuración**

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
- Provisionamiento del servicio Microsoft Foundry Models  
- Integración con Cognitive Search  
- Gestión segura de claves  
- Configuraciones de seguridad de red  

### **Punto de Discusión:** Por Qué Estos Patrones Importan para IA

- **Dependencias de Servicios:** Las apps de IA suelen requerir varios servicios coordinados  
- **Seguridad:** Las claves API y endpoints necesitan gestión segura  
- **Escalabilidad:** Las cargas de trabajo de IA tienen requerimientos únicos de escalado  
- **Gestión de Costos:** Los servicios de IA pueden ser costosos si no se configuran correctamente  

## Módulo 2: Despliega Tu Primera Aplicación de IA

### Paso 2.1: Inicializar el Entorno

1. **Crear un nuevo entorno AZD:**  
```bash
azd env new myai-workshop
```
  
2. **Configurar los parámetros required:**  
```bash
# Establece tu región preferida de Azure
azd env set AZURE_LOCATION eastus

# Opcional: Establece un modelo específico de OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```
  
### Paso 2.2: Desplegar la Infraestructura y Aplicación

1. **Desplegar con AZD:**  
```bash
azd up
```
  
**Qué ocurre durante `azd up`:**  
- ✅ Provisión del servicio Microsoft Foundry Models  
- ✅ Creación del servicio Cognitive Search  
- ✅ Configuración del App Service para la aplicación web  
- ✅ Configuración de redes y seguridad  
- ✅ Despliegue del código de la aplicación  
- ✅ Configuración de monitoreo y registros  

2. **Monitorear el progreso del despliegue** y observar los recursos creados.

### Paso 2.3: Verificar el Despliegue

1. **Verificar los recursos desplegados:**  
```bash
azd show
```
  
2. **Abrir la aplicación desplegada:**  
```bash
azd show --output json | grep "webAppUrl"
```
  
3. **Probar la funcionalidad de IA:**  
   - Navegar a la aplicación web  
   - Probar consultas de ejemplo  
   - Verificar que las respuestas de IA funcionen  

### **Ejercicio de Laboratorio 2.1: Práctica de Solución de Problemas**

**Escenario:** El despliegue fue exitoso pero la IA no responde.

**Problemas comunes a revisar:**  
1. **Claves API de OpenAI:** Verifique que estén configuradas correctamente  
2. **Disponibilidad del modelo:** Verifique si su región soporta el modelo  
3. **Conectividad de red:** Asegúrese que los servicios puedan comunicarse  
4. **Permisos RBAC:** Verifique que la aplicación pueda acceder a OpenAI  

**Comandos para depuración:**  
```bash
# Verificar variables de entorno
azd env get-values

# Ver registros de despliegue
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar estado del despliegue de OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Módulo 3: Personalización de Aplicaciones de IA para Sus Necesidades

### Paso 3.1: Modificar la Configuración de IA

1. **Actualizar el modelo OpenAI:**  
```bash
# Cambiar a un modelo diferente (si está disponible en tu región)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Reimplementa con la nueva configuración
azd deploy
```
  
2. **Agregar servicios adicionales de IA:**  

Edite `infra/main.bicep` para agregar Document Intelligence:

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
  
### Paso 3.2: Configuraciones Específicas Por Entorno

**Mejor práctica:** Configuraciones diferentes para desarrollo y producción.

1. **Crear un entorno de producción:**  
```bash
azd env new myai-production
```
  
2. **Configurar parámetros específicos para producción:**  
```bash
# La producción típicamente usa SKUs más altos
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Habilitar características adicionales de seguridad
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Ejercicio de Laboratorio 3.1: Optimización de Costos**

**Desafío:** Configurar la plantilla para un desarrollo costo-efectivo.

**Tareas:**  
1. Identificar qué SKUs pueden configurarse en niveles gratuitos/básicos  
2. Configurar variables de entorno para costo mínimo  
3. Desplegar y comparar costos con la configuración de producción  

**Pistas para la solución:**  
- Usar nivel F0 (gratis) para Cognitive Services cuando sea posible  
- Usar nivel Básico para Search Service en desarrollo  
- Considerar usar plan Consumo para Functions  

## Módulo 4: Seguridad y Mejores Prácticas en Producción

### Paso 4.1: Gestión Segura de Credenciales

**Desafío actual:** Muchas apps de IA codifican claves API o usan almacenamiento inseguro.

**Solución AZD:** Identidad Administrada + integración con Key Vault.

1. **Revisar la configuración de seguridad en su plantilla:**  
```bash
# Busca la configuración de Key Vault e Identidad Administrada
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Verificar que la Identidad Administrada funcione:**  
```bash
# Verificar si la aplicación web tiene la configuración de identidad correcta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### Paso 4.2: Seguridad de Red

1. **Habilitar endpoints privados** (si no están configurados):

Agregar a su plantilla bicep:  
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

1. **Configurar Application Insights:**  
```bash
# Application Insights debería configurarse automáticamente
# Verifique la configuración:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Configurar monitoreo específico para IA:**

Agregar métricas personalizadas para operaciones de IA:  
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
  
### **Ejercicio de Laboratorio 4.1: Auditoría de Seguridad**

**Tarea:** Revisar su despliegue para mejores prácticas de seguridad.

**Lista de verificación:**  
- [ ] No hay secretos codificados en el código o configuración  
- [ ] Se usa Identidad Administrada para autenticación de servicio a servicio  
- [ ] Key Vault almacena configuraciones sensibles  
- [ ] El acceso de red está adecuadamente restringido  
- [ ] Monitoreo y registro están habilitados  

## Módulo 5: Convertir Su Propia Aplicación de IA

### Paso 5.1: Cuestionario de Evaluación

**Antes de convertir su app**, responda estas preguntas:

1. **Arquitectura de la Aplicación:**  
   - ¿Qué servicios de IA usa su app?  
   - ¿Qué recursos de cómputo necesita?  
   - ¿Requiere base de datos?  
   - ¿Cuáles son las dependencias entre servicios?  

2. **Requisitos de Seguridad:**  
   - ¿Qué datos sensibles maneja su app?  
   - ¿Qué requisitos de cumplimiento tiene?  
   - ¿Necesita red privada?  

3. **Requisitos de Escalado:**  
   - ¿Cuál es la carga esperada?  
   - ¿Necesita autoescalado?  
   - ¿Hay requerimientos regionales?  

### Paso 5.2: Crear Su Plantilla AZD

**Siga este patrón para convertir su app:**

1. **Crear la estructura básica:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar plantilla AZD
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
  
### **Ejercicio de Laboratorio 5.1: Desafío de Creación de Plantilla**

**Desafío:** Crear una plantilla AZD para una app de IA de procesamiento de documentos.

**Requisitos:**  
- Microsoft Foundry Models para análisis de contenido  
- Document Intelligence para OCR  
- Cuenta de almacenamiento para subidas de documentos  
- Function App para lógica de procesamiento  
- App web para interfaz de usuario  

**Puntos extra:**  
- Añadir manejo adecuado de errores  
- Incluir estimación de costos  
- Configurar paneles de monitoreo  

## Módulo 6: Solución de Problemas Comunes

### Problemas Comunes de Despliegue

#### Problema 1: Cuota del Servicio OpenAI Excedida  
**Síntomas:** El despliegue falla con error de cuota  
**Soluciones:**  
```bash
# Verificar cuotas actuales
az cognitiveservices usage list --location eastus

# Solicitar aumento de cuota o intentar en una región diferente
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Problema 2: Modelo No Disponible en la Región  
**Síntomas:** Fallos en respuestas de IA o errores en despliegue del modelo  
**Soluciones:**  
```bash
# Verificar la disponibilidad del modelo por región
az cognitiveservices model list --location eastus

# Actualizar al modelo disponible
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```
  
#### Problema 3: Problemas de Permisos  
**Síntomas:** Errores 403 Forbidden al llamar a servicios de IA  
**Soluciones:**  
```bash
# Verificar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Agregar roles faltantes
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Problemas de Rendimiento

#### Problema 4: Respuestas de IA Lentas  
**Pasos para investigar:**  
1. Revisar métricas en Application Insights  
2. Revisar métricas del servicio OpenAI en el portal de Azure  
3. Verificar conectividad y latencia de red  

**Soluciones:**  
- Implementar caché para consultas comunes  
- Usar el modelo OpenAI apropiado para su caso de uso  
- Considerar réplicas de lectura para escenarios de alta carga  

### **Ejercicio de Laboratorio 6.1: Desafío de Depuración**

**Escenario:** Su despliegue fue exitoso, pero la app devuelve errores 500.

**Tareas de depuración:**  
1. Revisar logs de la aplicación  
2. Verificar conectividad de servicios  
3. Probar autenticación  
4. Revisar configuración  

**Herramientas a usar:**  
- `azd show` para vista general del despliegue  
- Portal de Azure para logs detallados de servicios  
- Application Insights para telemetría de la aplicación  

## Módulo 7: Monitoreo y Optimización

### Paso 7.1: Configurar Monitoreo Integral

1. **Crear paneles personalizados:**  

Ingrese al portal de Azure y cree un panel con:  
- Conteo y latencia de solicitudes OpenAI  
- Tasas de error de la aplicación  
- Utilización de recursos  
- Seguimiento de costos  

2. **Configurar alertas:**  
```bash
# Alerta por alta tasa de error
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```
  
### Paso 7.2: Optimización de Costos

1. **Analizar costos actuales:**  
```bash
# Use Azure CLI para obtener datos de costos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Implementar controles de costos:**  
- Configurar alertas de presupuesto  
- Usar políticas de autoscaling  
- Implementar caché de solicitudes  
- Monitorear uso de tokens para OpenAI  

### **Ejercicio de Laboratorio 7.1: Optimización de Rendimiento**

**Tarea:** Optimizar su aplicación de IA para rendimiento y coste.

**Métricas a mejorar:**  
- Reducir tiempo de respuesta promedio en 20%  
- Reducir costos mensuales en 15%  
- Mantener uptime del 99.9%  

**Estrategias a probar:**  
- Implementar caché de respuestas  
- Optimizar prompts para eficiencia en tokens  
- Usar SKUs de cómputo apropiados  
- Configurar autoscaling adecuado  

## Desafío Final: Implementación de extremo a extremo

### Escenario del Desafío

Se le asigna crear un chatbot de atención al cliente impulsado por IA listo para producción con estos requisitos:

**Requisitos Funcionales:**  
- Interfaz web para interacciones con clientes  
- Integración con Microsoft Foundry Models para respuestas  
- Capacidad de búsqueda de documentos usando Cognitive Search  
- Integración con base de datos de clientes existente  
- Soporte multilenguaje  

**Requisitos No Funcionales:**  
- Soportar 1000 usuarios concurrentes  
- SLA de uptime del 99.9%  
- Cumplimiento SOC 2  
- Costo bajo $500/mes  
- Desplegar en múltiples entornos (dev, staging, prod)  

### Pasos de Implementación

1. **Diseñar la arquitectura**  
2. **Crear la plantilla AZD**  
3. **Implementar medidas de seguridad**  
4. **Configurar monitoreo y alertas**  
5. **Crear pipelines de despliegue**  
6. **Documentar la solución**  

### Criterios de Evaluación

- ✅ **Funcionalidad:** ¿Cumple todos los requisitos?  
- ✅ **Seguridad:** ¿Implementa mejores prácticas?  
- ✅ **Escalabilidad:** ¿Puede manejar la carga?  
- ✅ **Mantenibilidad:** ¿Está bien organizado el código e infraestructura?  
- ✅ **Costo:** ¿Se mantiene dentro del presupuesto?  

## Recursos Adicionales

### Documentación de Microsoft  
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentación de Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentación de Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Plantillas de Ejemplo  
- [App de Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)  

### Recursos de la Comunidad  
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 Certificado de Finalización

¡Felicidades! Ha completado el Taller de IA. Ahora debería ser capaz de:
- ✅ Convertir aplicaciones de IA existentes a plantillas AZD
- ✅ Desplegar aplicaciones de IA listas para producción
- ✅ Implementar las mejores prácticas de seguridad para cargas de trabajo de IA
- ✅ Monitorear y optimizar el rendimiento de aplicaciones de IA
- ✅ Solucionar problemas comunes de despliegue

### Próximos pasos
1. Aplica estos patrones a tus propios proyectos de IA
2. Contribuye con las plantillas a la comunidad
3. Únete al Discord de Microsoft Foundry para soporte continuo
4. Explora temas avanzados como despliegues multirregionales

---

**Comentarios del taller**: Ayúdanos a mejorar este taller compartiendo tu experiencia en el [canal #Azure de Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo con enfoque en IA
- **⬅️ Anterior**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Buenas prácticas de IA en producción](production-ai-practices.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestra comunidad para soporte y discusiones sobre AZD y despliegues de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->