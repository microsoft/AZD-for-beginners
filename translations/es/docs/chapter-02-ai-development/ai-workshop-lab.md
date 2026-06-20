# Laboratorio del Taller de IA: Hacer que sus soluciones de IA sean desplegables con AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Anterior**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Siguiente**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Siguiente capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Descripción del taller

Este laboratorio práctico guía a los desarrolladores a través del proceso de tomar una plantilla de IA existente y desplegarla usando Azure Developer CLI (AZD). Aprenderá patrones esenciales para despliegues de IA en producción usando los servicios de Microsoft Foundry.

> **Nota de validación (2026-03-25):** Este taller fue revisado contra `azd` `1.23.12`. Si su instalación local es más antigua, actualice AZD antes de comenzar para que la autenticación, la plantilla y el flujo de trabajo de despliegue coincidan con los pasos a continuación.

**Duración:** 2-3 horas  
**Nivel:** Intermedio  
**Requisitos previos:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Objetivos de aprendizaje

Al final de este taller, podrá:
- ✅ Convertir una aplicación de IA existente para usar plantillas AZD
- ✅ Configurar servicios de Microsoft Foundry con AZD
- ✅ Implementar gestión segura de credenciales para servicios de IA
- ✅ Desplegar aplicaciones de IA listas para producción con monitoreo
- ✅ Resolver problemas comunes de despliegue de IA

## Requisitos previos

### Herramientas requeridas
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (se recomienda VS Code)

### Recursos de Azure
- Suscripción de Azure con acceso de colaborador
- Acceso a los servicios Microsoft Foundry Models (o capacidad para solicitar acceso)
- Permisos para crear grupos de recursos

### Conocimientos previos
- Conocimientos básicos de los servicios de Azure
- Familiaridad con interfaces de línea de comandos
- Conceptos básicos de IA/ML (APIs, modelos, prompts)

## Configuración del laboratorio

### Paso 1: Preparación del entorno

1. **Verifique las instalaciones de herramientas:**
```bash
# Comprobar la instalación de AZD
azd version

# Comprobar la CLI de Azure
az --version

# Iniciar sesión en Azure para los flujos de trabajo de AZD
azd auth login

# Iniciar sesión en la CLI de Azure solo si planea ejecutar comandos az durante el diagnóstico
az login
```

Si trabaja en varios tenants o su suscripción no se detecta automáticamente, intente de nuevo con `azd auth login --tenant-id <tenant-id>`.

2. **Clonar el repositorio del taller:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Comprendiendo la estructura AZD para aplicaciones de IA

### Anatomía de una plantilla AZD para IA

Explore los archivos clave en una plantilla AZD lista para IA:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Ejercicio de laboratorio 1.1: Explorar la configuración**

1. **Examine el archivo azure.yaml:**
```bash
cat azure.yaml
```

**Qué buscar:**
- Definiciones de servicio para componentes de IA
- Mapeos de variables de entorno
- Configuraciones de host

2. **Revise la infraestructura main.bicep:**
```bash
cat infra/main.bicep
```

**Patrones clave de IA para identificar:**
- Aprovisionamiento del servicio Microsoft Foundry Models
- Integración con Azure AI Search
- Gestión segura de claves
- Configuraciones de seguridad de red

### **Punto de discusión:** Por qué estos patrones importan para IA

- **Dependencias de servicios**: Las aplicaciones de IA a menudo requieren múltiples servicios coordinados
- **Seguridad**: Las claves API y los endpoints necesitan gestión segura
- **Escalabilidad**: Las cargas de trabajo de IA tienen requisitos de escalado únicos
- **Gestión de costos**: Los servicios de IA pueden ser costosos si no se configuran correctamente

## Módulo 2: Despliegue su primera aplicación de IA

### Paso 2.1: Inicialice el entorno

1. **Cree un nuevo entorno AZD:**
```bash
azd env new myai-workshop
```

2. **Establezca los parámetros requeridos:**
```bash
# Establece tu región de Azure preferida
azd env set AZURE_LOCATION eastus

# Opcional: Establece un modelo específico de OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Paso 2.2: Desplegar la infraestructura y la aplicación

1. **Despliegue con AZD:**
```bash
azd up
```

**Qué ocurre durante `azd up`:**
- ✅ Aprovisiona el servicio Microsoft Foundry Models
- ✅ Crea el servicio Azure AI Search
- ✅ Configura App Service para la aplicación web
- ✅ Configura redes y seguridad
- ✅ Despliega el código de la aplicación
- ✅ Configura monitoreo y registro

2. **Monitoree el progreso del despliegue** y observe los recursos que se están creando.

### Paso 2.3: Verifique su despliegue

1. **Verifique los recursos desplegados:**
```bash
azd show
```

2. **Abra la aplicación desplegada:**
```bash
azd show
```

Abra el endpoint web que se muestra en la salida de `azd show`.

3. **Pruebe la funcionalidad de IA:**
   - Navegue a la aplicación web
   - Pruebe consultas de ejemplo
   - Verifique que las respuestas de IA funcionen

### **Ejercicio de laboratorio 2.1: Práctica de resolución de problemas**

**Escenario**: Su despliegue tuvo éxito pero la IA no responde.

**Problemas comunes para verificar:**
1. **Claves API de OpenAI**: Verifique que estén configuradas correctamente
2. **Disponibilidad del modelo**: Compruebe si su región admite el modelo
3. **Conectividad de red**: Asegúrese de que los servicios puedan comunicarse
4. **Permisos RBAC**: Verifique que la aplicación pueda acceder a OpenAI

**Comandos de depuración:**
```bash
# Comprobar variables de entorno
azd env get-values

# Ver registros de despliegue
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Comprobar el estado del despliegue de OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizar aplicaciones de IA según sus necesidades

### Paso 3.1: Modificar la configuración de IA

1. **Actualice el modelo de OpenAI:**
```bash
# Cambiar a un modelo diferente (si está disponible en su región)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Volver a desplegar con la nueva configuración
azd deploy
```

2. **Agregar servicios de IA adicionales:**

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

### Paso 3.2: Configuraciones específicas por entorno

**Mejor práctica**: Configuraciones diferentes para desarrollo y producción.

1. **Cree un entorno de producción:**
```bash
azd env new myai-production
```

2. **Establezca parámetros específicos de producción:**
```bash
# La producción normalmente usa SKUs más altos
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Habilitar funciones de seguridad adicionales
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ejercicio de laboratorio 3.1: Optimización de costos**

**Desafío**: Configure la plantilla para un desarrollo rentable.

**Tareas:**
1. Identificar qué SKUs pueden establecerse en niveles gratuitos/básicos
2. Configurar variables de entorno para minimizar costos
3. Desplegar y comparar costos con la configuración de producción

**Pistas de solución:**
- Use la capa F0 (gratis) para Azure AI Services cuando sea posible
- Use la capa Básica para Search Service en desarrollo
- Considere usar el plan Consumption para Functions

## Módulo 4: Seguridad y mejores prácticas de producción

### Paso 4.1: Gestión segura de credenciales

**Desafío actual**: Muchas aplicaciones de IA codifican en duro las claves API o usan almacenamiento inseguro.

**Solución AZD**: Integración de Managed Identity + Key Vault.

1. **Revise la configuración de seguridad en su plantilla:**
```bash
# Buscar la configuración de Key Vault e identidad administrada
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifique que Managed Identity esté funcionando:**
```bash
# Comprobar si la aplicación web tiene la configuración de identidad correcta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Paso 4.2: Seguridad de red

1. **Habilitar endpoints privados** (si no están ya configurados):

Agregue a su plantilla bicep:
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

1. **Configure Application Insights:**
```bash
# Application Insights debería configurarse automáticamente
# Compruebe la configuración:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configure el monitoreo específico para IA:**

Agregue métricas personalizadas para operaciones de IA:
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

**Tarea**: Revise su despliegue en busca de mejores prácticas de seguridad.

**Lista de verificación:**
- [ ] No hay secretos codificados en el código o la configuración
- [ ] Se utiliza Managed Identity para la autenticación entre servicios
- [ ] Key Vault almacena la configuración sensible
- [ ] El acceso a la red está correctamente restringido
- [ ] El monitoreo y el registro están habilitados

## Módulo 5: Convertir su propia aplicación de IA

### Paso 5.1: Hoja de evaluación

**Antes de convertir su aplicación**, responda estas preguntas:

1. **Arquitectura de la aplicación:**
   - ¿Qué servicios de IA utiliza su aplicación?
   - ¿Qué recursos de cómputo necesita?
   - ¿Requiere una base de datos?
   - ¿Cuáles son las dependencias entre servicios?

2. **Requisitos de seguridad:**
   - ¿Qué datos sensibles maneja su aplicación?
   - ¿Qué requisitos de cumplimiento tiene?
   - ¿Necesita redes privadas?

3. **Requisitos de escalado:**
   - ¿Cuál es la carga esperada?
   - ¿Necesita autoescalado?
   - ¿Hay requisitos regionales?

### Paso 5.2: Cree su plantilla AZD

**Siga este patrón para convertir su aplicación:**

1. **Cree la estructura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar la plantilla AZD
azd init --template minimal
```

2. **Cree azure.yaml:**
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

3. **Cree plantillas de infraestructura:**

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

**Desafío**: Cree una plantilla AZD para una aplicación de IA de procesamiento de documentos.

**Requisitos:**
- Microsoft Foundry Models para análisis de contenido
- Document Intelligence para OCR
- Storage Account para cargas de documentos
- Function App para la lógica de procesamiento
- Aplicación web para la interfaz de usuario

**Puntos extra:**
- Agregar manejo de errores adecuado
- Incluir estimación de costos
- Configurar paneles de monitoreo

## Módulo 6: Solución de problemas comunes

### Problemas comunes de despliegue

#### Problema 1: Cuota del servicio OpenAI excedida
**Síntomas:** El despliegue falla con un error de cuota
**Soluciones:**
```bash
# Comprobar cuotas actuales
az cognitiveservices usage list --location eastus

# Solicitar aumento de cuota o probar otra región
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo no disponible en la región
**Síntomas:** Fallos en las respuestas de IA o errores en el despliegue del modelo
**Soluciones:**
```bash
# Comprobar la disponibilidad del modelo por región
az cognitiveservices model list --location eastus

# Actualizar al modelo disponible
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Problemas de permisos
**Síntomas:** Errores 403 Forbidden al llamar a los servicios de IA
**Soluciones:**
```bash
# Comprobar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Agregar roles faltantes
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemas de rendimiento

#### Problema 4: Respuestas de IA lentas
**Pasos de investigación:**
1. Revise Application Insights para métricas de rendimiento
2. Revise las métricas del servicio OpenAI en el portal de Azure
3. Verifique la conectividad de red y la latencia

**Soluciones:**
- Implemente caché para consultas comunes
- Use el modelo de OpenAI apropiado para su caso de uso
- Considere réplicas de lectura para escenarios de alta carga

### **Ejercicio de laboratorio 6.1: Desafío de depuración**

**Escenario**: Su despliegue tuvo éxito, pero la aplicación devuelve errores 500.

**Tareas de depuración:**
1. Verificar los registros de la aplicación
2. Verificar la conectividad entre servicios
3. Probar la autenticación
4. Revisar la configuración

**Herramientas para usar:**
- `azd show` para vista general del despliegue
- Portal de Azure para registros detallados del servicio
- Application Insights para telemetría de la aplicación

## Módulo 7: Monitoreo y optimización

### Paso 7.1: Configure un monitoreo integral

1. **Cree paneles personalizados:**

Vaya al portal de Azure y cree un panel con:
- Recuento y latencia de solicitudes a OpenAI
- Tasas de error de la aplicación
- Utilización de recursos
- Seguimiento de costos

2. **Configure alertas:**
```bash
# Alerta por alta tasa de errores
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Paso 7.2: Optimización de costos

1. **Analice los costos actuales:**
```bash
# Usa Azure CLI para obtener datos de costos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implemente controles de costos:**
- Configure alertas de presupuesto
- Use políticas de autoscaling
- Implemente caché de solicitudes
- Monitoree el uso de tokens para OpenAI

### **Ejercicio de laboratorio 7.1: Optimización del rendimiento**

**Tarea**: Optimice su aplicación de IA tanto para rendimiento como para costo.

**Métricas a mejorar:**
- Reducir el tiempo de respuesta promedio en un 20%
- Reducir los costos mensuales en un 15%
- Mantener 99.9% de tiempo de actividad

**Estrategias para probar:**
- Implementar caché de respuestas
- Optimizar prompts para eficiencia de tokens
- Usar SKUs de cómputo apropiados
- Configurar autoescalado adecuado

## Desafío final: Implementación de extremo a extremo

### Escenario del desafío

Se le asigna la tarea de crear un chatbot de atención al cliente impulsado por IA listo para producción con estos requisitos:

**Requisitos funcionales:**
- Interfaz web para interacciones con clientes
- Integración con Microsoft Foundry Models para respuestas
- Capacidad de búsqueda de documentos usando Azure AI Search
- Integración con la base de datos de clientes existente
- Soporte multilingüe

**Requisitos no funcionales:**
- Atender 1000 usuarios concurrentes
- SLA de 99.9% de disponibilidad
- Cumplimiento SOC 2
- Costo por debajo de $500/mes
- Desplegar en múltiples entornos (dev, staging, prod)

### Pasos de implementación

1. **Diseñar la arquitectura**
2. **Crear la plantilla AZD**
3. **Implementar medidas de seguridad**
4. **Configurar monitoreo y alertas**
5. **Crear pipelines de despliegue**
6. **Documentar la solución**

### Criterios de evaluación

- ✅ **Funcionalidad**: ¿Cumple todos los requisitos?
- ✅ **Seguridad**: ¿Se implementaron las mejores prácticas?
- ✅ **Escalabilidad**: ¿Puede manejar la carga?
- ✅ **Mantenibilidad**: ¿Está bien organizada la infraestructura y el código?
- ✅ **Costo**: ¿Se mantiene dentro del presupuesto?

## Recursos adicionales

### Documentación de Microsoft
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación del servicio Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentación de Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Plantillas de ejemplo
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos de la comunidad
- [Discord de Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Plantillas Awesome de AZD](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de finalización

¡Felicidades! Has completado el laboratorio del taller de IA. Ahora deberías ser capaz de:

- ✅ Convertir aplicaciones de IA existentes a plantillas AZD
- ✅ Desplegar aplicaciones de IA listas para producción
- ✅ Implementar mejores prácticas de seguridad para cargas de trabajo de IA
- ✅ Supervisar y optimizar el rendimiento de aplicaciones de IA
- ✅ Solucionar problemas comunes de despliegue

### Próximos pasos
1. Aplica estos patrones a tus propios proyectos de IA
2. Contribuye con plantillas a la comunidad
3. Únete al Discord de Microsoft Foundry para soporte continuo
4. Explora temas avanzados como despliegues multirregión

---

**Comentarios sobre el taller**: Ayúdanos a mejorar este taller compartiendo tu experiencia en el [canal #Azure de Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Anterior**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores prácticas para IA en producción](production-ai-practices.md)
- **🚀 Capítulo siguiente**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestra comunidad para obtener soporte y participar en discusiones sobre despliegues de AZD y IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->