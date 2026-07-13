# Laboratorio Taller de IA: Cómo hacer que tus soluciones de IA sean desplegables con AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo con IA primero
- **⬅️ Anterior**: [Despliegue de modelo de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores prácticas de IA en producción](production-ai-practices.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Resumen del taller

Este laboratorio práctico guía a los desarrolladores a través del proceso de tomar una plantilla de IA existente y desplegarla usando Azure Developer CLI (AZD). Aprenderás patrones esenciales para despliegues de IA en producción utilizando los servicios de Microsoft Foundry.

> **Nota de validación (2026-07-13):** Este taller fue revisado con `azd` versión `1.27.1`. Si tu instalación local es más antigua, actualiza AZD antes de comenzar para que el flujo de autenticación, plantilla y despliegue coincida con los pasos a continuación.

**Duración:** 2-3 horas  
**Nivel:** Intermedio  
**Requisitos previos:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Objetivos de aprendizaje

Al final de este taller, podrás:
- ✅ Convertir una aplicación de IA existente para usar plantillas AZD
- ✅ Configurar servicios Microsoft Foundry con AZD
- ✅ Implementar gestión segura de credenciales para servicios de IA
- ✅ Desplegar aplicaciones de IA listas para producción con monitoreo
- ✅ Solucionar problemas comunes en despliegues de IA

## Requisitos previos

### Herramientas requeridas
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (se recomienda VS Code)

### Recursos de Azure
- Suscripción de Azure con acceso de colaborador
- Acceso a servicios Microsoft Foundry Models (o capacidad para solicitar acceso)
- Permisos para crear grupos de recursos

### Conocimientos previos
- Entendimiento básico de servicios de Azure
- Familiaridad con interfaces de línea de comandos
- Conceptos básicos de IA/ML (APIs, modelos, prompts)

## Configuración del laboratorio

### Paso 1: Preparación del entorno

1. **Verifica la instalación de herramientas:**
```bash
# Verificar la instalación de AZD
azd version

# Verificar Azure CLI
az --version

# Iniciar sesión en Azure para flujos de trabajo de AZD
azd auth login

# Iniciar sesión en Azure CLI solo si planeas ejecutar comandos az durante el diagnóstico
az login
```

Si trabajas en múltiples inquilinos o tu suscripción no se detecta automáticamente, intenta iniciar sesión con `azd auth login --tenant-id <tenant-id>`.

2. **Clona el repositorio del taller:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Entendiendo la estructura AZD para aplicaciones de IA

### Anatomía de una plantilla AZD para IA

Explora los archivos clave en una plantilla AZD lista para IA:

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

1. **Examina el archivo azure.yaml:**
```bash
cat azure.yaml
```

**Qué buscar:**
- Definiciones de servicios para componentes de IA
- Mapeos de variables de entorno
- Configuraciones de host

2. **Revisa la infraestructura main.bicep:**
```bash
cat infra/main.bicep
```

**Patrones clave de IA para identificar:**
- Provisión del servicio Microsoft Foundry Models
- Integración con Azure AI Search
- Gestión segura de claves
- Configuraciones de seguridad de red

### **Punto de discusión:** Por qué importan estos patrones para IA

- **Dependencias de servicio**: Las apps de IA suelen requerir múltiples servicios coordinados
- **Seguridad**: Las claves API y puntos finales necesitan gestión segura
- **Escalabilidad**: Las cargas de trabajo de IA tienen requisitos únicos de escalado
- **Gestión de costos**: Los servicios de IA pueden ser costosos si no se configuran adecuadamente

## Módulo 2: Despliega tu primera aplicación de IA

### Paso 2.1: Inicializar el entorno

1. **Crea un nuevo entorno AZD:**
```bash
azd env new myai-workshop
```

2. **Configura los parámetros requeridos:**
```bash
# Establece tu región preferida de Azure
azd env set AZURE_LOCATION eastus

# Opcional: Establece un modelo específico de OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Paso 2.2: Despliega la infraestructura y la aplicación

1. **Despliega con AZD:**
```bash
azd up
```

**Qué sucede durante `azd up`:**
- ✅ Provisión del servicio Microsoft Foundry Models
- ✅ Creación del servicio Azure AI Search
- ✅ Configuración de App Service para la aplicación web
- ✅ Configuración de red y seguridad
- ✅ Despliegue del código de la aplicación
- ✅ Configuración de monitoreo y registro

2. **Monitorea el progreso del despliegue** y observa los recursos que se están creando.

### Paso 2.3: Verifica tu despliegue

1. **Revisa los recursos desplegados:**
```bash
azd show
```

2. **Abre la aplicación desplegada:**
```bash
azd show
```

Abre el punto final web mostrado en la salida de `azd show`.

3. **Prueba la funcionalidad de IA:**
   - Navega a la aplicación web
   - Prueba consultas de ejemplo
   - Verifica que las respuestas de IA funcionen

### **Ejercicio de laboratorio 2.1: Práctica de solución de problemas**

**Escenario**: Tu despliegue fue exitoso pero la IA no responde.

**Problemas comunes a verificar:**
1. **Claves API de OpenAI**: Verifica que estén correctamente configuradas
2. **Disponibilidad del modelo**: Comprueba si tu región soporta el modelo
3. **Conectividad de red**: Asegúrate que los servicios puedan comunicarse
4. **Permisos RBAC**: Verifica que la aplicación pueda acceder a OpenAI

**Comandos de depuración:**
```bash
# Comprobar variables de entorno
azd env get-values

# Ver registros de despliegue
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Comprobar estado del despliegue de OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando aplicaciones de IA para tus necesidades

### Paso 3.1: Modificar la configuración de IA

1. **Actualiza el modelo OpenAI:**
```bash
# Cambiar a un modelo diferente (si está disponible en su región)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Reimplementa con la nueva configuración
azd deploy
```

2. **Agrega servicios adicionales de IA:**

Edita `infra/main.bicep` para añadir Inteligencia de Documentos:

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

**Mejor práctica**: Configuraciones diferentes para desarrollo y producción.

1. **Crea un entorno de producción:**
```bash
azd env new myai-production
```

2. **Configura parámetros específicos para producción:**
```bash
# La producción típicamente utiliza SKUs más altos
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Habilitar funciones de seguridad adicionales
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ejercicio de laboratorio 3.1: Optimización de costos**

**Desafío**: Configura la plantilla para un desarrollo costo-efectivo.

**Tareas:**
1. Identifica qué SKUs pueden configurarse a niveles gratuitos/básicos
2. Configura variables de entorno para costo mínimo
3. Despliega y compara costos con la configuración de producción

**Pistas para la solución:**
- Usa nivel F0 (gratis) para Servicios Azure AI cuando sea posible
- Usa nivel Básico para el Servicio de Búsqueda en desarrollo
- Considera usar plan de Consumo para Functions

## Módulo 4: Seguridad y mejores prácticas en producción

### Paso 4.1: Gestión segura de credenciales

**Desafío actual**: Muchas aplicaciones de IA codifican claves API o usan almacenamiento inseguro.

**Solución AZD**: Identidad administrada + integración con Key Vault.

1. **Revisa la configuración de seguridad en tu plantilla:**
```bash
# Buscar configuración de Key Vault e identidad administrada
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica que la Identidad Administrada funcione:**
```bash
# Verificar si la aplicación web tiene la configuración de identidad correcta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Paso 4.2: Seguridad de red

1. **Habilita puntos finales privados** (si no están ya configurados):

Añadir a tu plantilla bicep:
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

1. **Configura Application Insights:**
```bash
# Application Insights debe configurarse automáticamente
# Verifique la configuración:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configura monitoreo específico para IA:**

Añade métricas personalizadas para operaciones de IA:
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
- [ ] Uso de Identidad Administrada para autenticación entre servicios
- [ ] Key Vault almacena configuraciones sensibles
- [ ] Acceso a red correctamente restringido
- [ ] Monitoreo y registro habilitados

## Módulo 5: Convertir tu propia aplicación de IA

### Paso 5.1: Hoja de evaluación

**Antes de convertir tu aplicación**, responde estas preguntas:

1. **Arquitectura de la aplicación:**
   - ¿Qué servicios de IA usa tu aplicación?
   - ¿Qué recursos de cómputo necesita?
   - ¿Requiere base de datos?
   - ¿Cuáles son las dependencias entre servicios?

2. **Requisitos de seguridad:**
   - ¿Qué datos sensibles maneja tu aplicación?
   - ¿Qué requisitos de cumplimiento tienes?
   - ¿Necesitas red privada?

3. **Requisitos de escalado:**
   - ¿Cuál es la carga esperada?
   - ¿Necesitas autoescalado?
   - ¿Existen requisitos regionales?

### Paso 5.2: Crea tu plantilla AZD

**Sigue este patrón para convertir tu aplicación:**

1. **Crea la estructura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar plantilla AZD
azd init --template minimal
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Ejercicio de laboratorio 5.1: Desafío de creación de plantilla**

**Desafío**: Crea una plantilla AZD para una aplicación de IA de procesamiento de documentos.

**Requisitos:**
- Microsoft Foundry Models para análisis de contenido
- Inteligencia de documentos para OCR
- Cuenta de almacenamiento para cargas de documentos
- Aplicación Function para lógica de procesamiento
- Aplicación web para interfaz de usuario

**Puntos extra:**
- Agrega manejo adecuado de errores
- Incluye estimación de costos
- Configura paneles de monitoreo

## Módulo 6: Solución de problemas comunes

### Problemas comunes en despliegues

#### Problema 1: Cuota excedida del servicio OpenAI
**Síntomas:** El despliegue falla con error de cuota
**Soluciones:**
```bash
# Verificar las cuotas actuales
az cognitiveservices usage list --location eastus

# Solicitar aumento de cuota o probar una región diferente
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo no disponible en la región
**Síntomas:** Fallos en respuestas de IA o errores en despliegue de modelo
**Soluciones:**
```bash
# Verificar la disponibilidad del modelo por región
az cognitiveservices model list --location eastus

# Actualizar al modelo disponible
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Problemas de permisos
**Síntomas:** Errores 403 Forbidden al llamar servicios de IA
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

### Problemas de rendimiento

#### Problema 4: Respuestas lentas de IA
**Pasos para investigar:**
1. Revisa Application Insights para métricas de rendimiento
2. Revisa métricas del servicio OpenAI en el portal de Azure
3. Verifica conectividad y latencia de red

**Soluciones:**
- Implementa caché para consultas comunes
- Usa el modelo OpenAI adecuado para tu caso de uso
- Considera réplicas de lectura para escenarios de gran carga

### **Ejercicio de laboratorio 6.1: Desafío de depuración**

**Escenario**: Tu despliegue fue exitoso, pero la aplicación retorna errores 500.

**Tareas de depuración:**
1. Revisa los registros de la aplicación
2. Verifica conectividad del servicio
3. Prueba autenticación
4. Revisa la configuración

**Herramientas a utilizar:**
- `azd show` para vista general del despliegue
- Portal de Azure para registros detallados de servicios
- Application Insights para telemetría de la aplicación

## Módulo 7: Monitoreo y optimización

### Paso 7.1: Configura monitoreo integral

1. **Crea paneles personalizados:**

Navega al portal de Azure y crea un panel con:
- Conteo y latencia de solicitudes a OpenAI
- Tasa de errores de la aplicación
- Utilización de recursos
- Seguimiento de costos

2. **Configura alertas:**
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

1. **Analiza los costos actuales:**
```bash
# Utilice Azure CLI para obtener datos de costos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementa controles de costo:**
- Configura alertas de presupuesto
- Usa políticas de autoescalado
- Implementa caché de solicitudes
- Monitorea uso de tokens para OpenAI

### **Ejercicio de laboratorio 7.1: Optimización de rendimiento**

**Tarea**: Optimiza tu aplicación de IA para rendimiento y costo.

**Métricas a mejorar:**
- Reducir tiempo medio de respuesta en 20%
- Reducir costos mensuales en 15%
- Mantener 99.9% de tiempo de activo

**Estrategias para probar:**
- Implementa caché de respuesta
- Optimiza prompts para eficiencia de tokens
- Usa SKUs de cómputo adecuados
- Configura autoescalado adecuado

## Desafío final: Implementación de extremo a extremo

### Escenario del desafío

Te asignaron crear un chatbot de servicio al cliente impulsado por IA listo para producción con estos requisitos:

**Requisitos funcionales:**
- Interfaz web para interacciones con clientes
- Integración con Microsoft Foundry Models para respuestas
- Búsqueda de documentos usando Azure AI Search
- Integración con base de datos de clientes existente
- Soporte multilingüe

**Requisitos no funcionales:**
- Soportar 1000 usuarios concurrentes
- SLA de 99.9% de tiempo activo
- Cumplimiento SOC 2
- Costos bajo $500/mes
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
- ✅ **Seguridad**: ¿Se implementan buenas prácticas?
- ✅ **Escalabilidad**: ¿Puede manejar la carga?
- ✅ **Mantenibilidad**: ¿Está el código e infraestructura bien organizados?
- ✅ **Costo**: ¿Se mantiene dentro del presupuesto?

## Recursos adicionales

### Documentación de Microsoft
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación del servicio Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentación de Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Plantillas de ejemplo
- [Aplicación de chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Inicio rápido de aplicación de chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos de la Comunidad
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Plantillas Awesome AZD](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Finalización

¡Felicitaciones! Has completado el Laboratorio del Taller de IA. Ahora deberías poder:

- ✅ Convertir aplicaciones de IA existentes a plantillas AZD
- ✅ Desplegar aplicaciones de IA listas para producción
- ✅ Implementar las mejores prácticas de seguridad para cargas de trabajo de IA
- ✅ Monitorear y optimizar el rendimiento de aplicaciones de IA
- ✅ Solucionar problemas comunes de despliegue

### Próximos Pasos
1. Aplica estos patrones a tus propios proyectos de IA
2. Contribuye con plantillas a la comunidad
3. Únete al Microsoft Foundry Discord para soporte continuo
4. Explora temas avanzados como despliegues multirregionales

---

**Comentarios sobre el Taller**: Ayúdanos a mejorar este taller compartiendo tu experiencia en el [canal #Azure de Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo IA-Primero
- **⬅️ Anterior**: [Despliegue de Modelo de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores Prácticas de IA en Producción](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestra comunidad para soporte y discusiones sobre AZD y despliegues de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->