# Taller de Laboratorio de IA: Haciendo que tus Soluciones de IA sean Desplegables con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo con Enfoque en IA
- **⬅️ Anterior**: [Despliegue de Modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores Prácticas para IA en Producción](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

## Resumen del Taller

Este laboratorio práctico guía a los desarrolladores a través del proceso de tomar una plantilla de IA existente y desplegarla utilizando Azure Developer CLI (AZD). Aprenderás patrones esenciales para despliegues de IA en producción utilizando los servicios de Microsoft Foundry.

**Duración:** 2-3 horas  
**Nivel:** Intermedio  
**Requisitos Previos:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Objetivos de Aprendizaje

Al final de este taller, serás capaz de:
- ✅ Convertir una aplicación de IA existente para usar plantillas de AZD
- ✅ Configurar servicios de Microsoft Foundry con AZD
- ✅ Implementar gestión segura de credenciales para servicios de IA
- ✅ Desplegar aplicaciones de IA listas para producción con monitoreo
- ✅ Solucionar problemas comunes de despliegue de IA

## Requisitos Previos

### Herramientas Necesarias
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (se recomienda VS Code)

### Recursos de Azure
- Suscripción a Azure con acceso de colaborador
- Acceso a servicios de Azure OpenAI (o capacidad para solicitar acceso)
- Permisos para crear grupos de recursos

### Conocimientos Previos
- Comprensión básica de los servicios de Azure
- Familiaridad con interfaces de línea de comandos
- Conceptos básicos de IA/ML (APIs, modelos, prompts)

## Configuración del Laboratorio

### Paso 1: Preparación del Entorno

1. **Verifica las instalaciones de las herramientas:**
```bash
# Verificar la instalación de AZD
azd version

# Verificar Azure CLI
az --version

# Iniciar sesión en Azure
az login
azd auth login
```

2. **Clona el repositorio del taller:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Módulo 1: Comprendiendo la Estructura de AZD para Aplicaciones de IA

### Anatomía de una Plantilla AZD Lista para IA

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

### **Ejercicio de Laboratorio 1.1: Explora la Configuración**

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

**Patrones clave de IA a identificar:**
- Aprovisionamiento del servicio Azure OpenAI
- Integración con Cognitive Search
- Gestión segura de claves
- Configuraciones de seguridad de red

### **Punto de Discusión:** Por qué Importan Estos Patrones para la IA

- **Dependencias de Servicios**: Las aplicaciones de IA a menudo requieren múltiples servicios coordinados
- **Seguridad**: Las claves API y los endpoints necesitan gestión segura
- **Escalabilidad**: Las cargas de trabajo de IA tienen requisitos únicos de escalabilidad
- **Gestión de Costos**: Los servicios de IA pueden ser costosos si no se configuran adecuadamente

## Módulo 2: Despliega tu Primera Aplicación de IA

### Paso 2.1: Inicializa el Entorno

1. **Crea un nuevo entorno AZD:**
```bash
azd env new myai-workshop
```

2. **Configura los parámetros requeridos:**
```bash
# Establezca su región preferida de Azure
azd env set AZURE_LOCATION eastus

# Opcional: Establezca un modelo específico de OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Paso 2.2: Despliega la Infraestructura y la Aplicación

1. **Despliega con AZD:**
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

### Paso 2.3: Verifica tu Despliegue

1. **Revisa los recursos desplegados:**
```bash
azd show
```

2. **Abre la aplicación desplegada:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Prueba la funcionalidad de IA:**
   - Navega a la aplicación web
   - Prueba consultas de ejemplo
   - Verifica que las respuestas de IA funcionen

### **Ejercicio de Laboratorio 2.1: Práctica de Solución de Problemas**

**Escenario**: Tu despliegue fue exitoso, pero la IA no responde.

**Problemas comunes a verificar:**
1. **Claves API de OpenAI**: Verifica que estén configuradas correctamente
2. **Disponibilidad del modelo**: Comprueba si tu región admite el modelo
3. **Conectividad de red**: Asegúrate de que los servicios puedan comunicarse
4. **Permisos RBAC**: Verifica que la aplicación pueda acceder a OpenAI

**Comandos de depuración:**
```bash
# Verificar las variables de entorno
azd env get-values

# Verificar los registros de implementación
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificar el estado de implementación de OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Módulo 3: Personalizando Aplicaciones de IA para tus Necesidades

### Paso 3.1: Modifica la Configuración de IA

1. **Actualiza el modelo de OpenAI:**
```bash
# Cambiar a un modelo diferente (si está disponible en tu región)
azd env set AZURE_OPENAI_MODEL gpt-4

# Reimplementar con la nueva configuración
azd deploy
```

2. **Agrega servicios adicionales de IA:**

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

### Paso 3.2: Configuraciones Específicas del Entorno

**Mejor Práctica**: Diferentes configuraciones para desarrollo y producción.

1. **Crea un entorno de producción:**
```bash
azd env new myai-production
```

2. **Configura parámetros específicos de producción:**
```bash
# La producción típicamente utiliza SKUs más altos
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Habilitar características de seguridad adicionales
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Ejercicio de Laboratorio 3.1: Optimización de Costos**

**Desafío**: Configura la plantilla para un desarrollo rentable.

**Tareas:**
1. Identifica qué SKUs pueden configurarse en niveles gratuitos/básicos
2. Configura variables de entorno para minimizar costos
3. Despliega y compara costos con la configuración de producción

**Pistas para la solución:**
- Usa el nivel F0 (gratuito) para Cognitive Services cuando sea posible
- Usa el nivel Básico para Search Service en desarrollo
- Considera usar el plan de Consumo para Functions

## Módulo 4: Seguridad y Mejores Prácticas para Producción

### Paso 4.1: Gestión Segura de Credenciales

**Desafío actual**: Muchas aplicaciones de IA codifican claves API o usan almacenamiento inseguro.

**Solución AZD**: Integración de Managed Identity + Key Vault.

1. **Revisa la configuración de seguridad en tu plantilla:**
```bash
# Buscar la configuración de Key Vault e Identidad Administrada
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica que Managed Identity esté funcionando:**
```bash
# Verificar si la aplicación web tiene la configuración de identidad correcta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Paso 4.2: Seguridad de Red

1. **Habilita endpoints privados** (si no están configurados):

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

### Paso 4.3: Monitoreo y Observabilidad

1. **Configura Application Insights:**
```bash
# Los Insights de la Aplicación deben configurarse automáticamente
# Verifique la configuración:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configura monitoreo específico de IA:**

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

### **Ejercicio de Laboratorio 4.1: Auditoría de Seguridad**

**Tarea**: Revisa tu despliegue en busca de mejores prácticas de seguridad.

**Lista de Verificación:**
- [ ] No hay secretos codificados en el código o configuración
- [ ] Se usa Managed Identity para autenticación entre servicios
- [ ] Key Vault almacena configuraciones sensibles
- [ ] El acceso a la red está restringido adecuadamente
- [ ] El monitoreo y registro están habilitados

## Módulo 5: Convirtiendo tu Propia Aplicación de IA

### Paso 5.1: Hoja de Evaluación

**Antes de convertir tu aplicación**, responde estas preguntas:

1. **Arquitectura de la Aplicación:**
   - ¿Qué servicios de IA usa tu aplicación?
   - ¿Qué recursos de cómputo necesita?
   - ¿Requiere una base de datos?
   - ¿Cuáles son las dependencias entre servicios?

2. **Requisitos de Seguridad:**
   - ¿Qué datos sensibles maneja tu aplicación?
   - ¿Qué requisitos de cumplimiento tienes?
   - ¿Necesitas redes privadas?

3. **Requisitos de Escalabilidad:**
   - ¿Cuál es tu carga esperada?
   - ¿Necesitas autoescalado?
   - ¿Hay requisitos regionales?

### Paso 5.2: Crea tu Plantilla AZD

**Sigue este patrón para convertir tu aplicación:**

1. **Crea la estructura básica:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar la plantilla AZD
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

### **Ejercicio de Laboratorio 5.1: Desafío de Creación de Plantillas**

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

## Módulo 6: Solución de Problemas Comunes

### Problemas Comunes de Despliegue

#### Problema 1: Cuota Excedida del Servicio OpenAI
**Síntomas:** El despliegue falla con error de cuota
**Soluciones:**
```bash
# Verificar las cuotas actuales
az cognitiveservices usage list --location eastus

# Solicitar aumento de cuota o intentar en una región diferente
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelo No Disponible en la Región
**Síntomas:** Las respuestas de IA fallan o errores de despliegue del modelo
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

#### Problema 4: Respuestas Lentas de IA
**Pasos de investigación:**
1. Revisa métricas de rendimiento en Application Insights
2. Revisa métricas del servicio OpenAI en el portal de Azure
3. Verifica conectividad de red y latencia

**Soluciones:**
- Implementa caché para consultas comunes
- Usa el modelo OpenAI adecuado para tu caso de uso
- Considera réplicas de lectura para escenarios de alta carga

### **Ejercicio de Laboratorio 6.1: Desafío de Depuración**

**Escenario**: Tu despliegue fue exitoso, pero la aplicación devuelve errores 500.

**Tareas de depuración:**
1. Revisa los registros de la aplicación
2. Verifica la conectividad de los servicios
3. Prueba la autenticación
4. Revisa la configuración

**Herramientas a usar:**
- `azd show` para una visión general del despliegue
- Portal de Azure para registros detallados de servicios
- Application Insights para telemetría de la aplicación

## Módulo 7: Monitoreo y Optimización

### Paso 7.1: Configura un Monitoreo Integral

1. **Crea paneles personalizados:**

Navega al portal de Azure y crea un panel con:
- Conteo de solicitudes y latencia de OpenAI
- Tasas de error de la aplicación
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

### Paso 7.2: Optimización de Costos

1. **Analiza los costos actuales:**
```bash
# Usar Azure CLI para obtener datos de costos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementa controles de costos:**
- Configura alertas de presupuesto
- Usa políticas de autoescalado
- Implementa caché de solicitudes
- Monitorea el uso de tokens para OpenAI

### **Ejercicio de Laboratorio 7.1: Optimización de Rendimiento**

**Tarea**: Optimiza tu aplicación de IA para rendimiento y costo.

**Métricas a mejorar:**
- Reducir el tiempo promedio de respuesta en un 20%
- Reducir los costos mensuales en un 15%
- Mantener un tiempo de actividad del 99.9%

**Estrategias a probar:**
- Implementa caché de respuestas
- Optimiza los prompts para eficiencia de tokens
- Usa SKUs de cómputo adecuados
- Configura un autoescalado adecuado

## Desafío Final: Implementación de Extremo a Extremo

### Escenario del Desafío

Se te asigna la tarea de crear un chatbot de servicio al cliente impulsado por IA listo para producción con estos requisitos:

**Requisitos Funcionales:**
- Interfaz web para interacciones con clientes
- Integración con Azure OpenAI para respuestas
- Capacidad de búsqueda de documentos usando Cognitive Search
- Integración con la base de datos de clientes existente
- Soporte multilingüe

**Requisitos No Funcionales:**
- Manejar 1000 usuarios concurrentes
- SLA de tiempo de actividad del 99.9%
- Cumplimiento SOC 2
- Costo inferior a $500/mes
- Despliegue en múltiples entornos (desarrollo, pruebas, producción)

### Pasos de Implementación

1. **Diseña la arquitectura**
2. **Crea la plantilla AZD**
3. **Implementa medidas de seguridad**
4. **Configura monitoreo y alertas**
5. **Crea pipelines de despliegue**
6. **Documenta la solución**

### Criterios de Evaluación

- ✅ **Funcionalidad**: ¿Cumple con todos los requisitos?
- ✅ **Seguridad**: ¿Se implementaron las mejores prácticas?
- ✅ **Escalabilidad**: ¿Puede manejar la carga?
- ✅ **Mantenibilidad**: ¿El código y la infraestructura están bien organizados?
- ✅ **Costo**: ¿Se mantiene dentro del presupuesto?

## Recursos Adicionales

### Documentación de Microsoft
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación del Servicio Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentación de Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Plantillas de Ejemplo
- [Aplicación de Chat con Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Inicio Rápido de Aplicación de Chat con OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Recursos de la Comunidad
- [Discord de Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Plantillas Impresionantes de AZD](https://azure.github.io/awesome-azd/)

## 🎓 Certificado de Finalización
¡Felicidades! Has completado el Taller de IA. Ahora deberías ser capaz de:

- ✅ Convertir aplicaciones de IA existentes en plantillas AZD
- ✅ Desplegar aplicaciones de IA listas para producción
- ✅ Implementar mejores prácticas de seguridad para cargas de trabajo de IA
- ✅ Monitorear y optimizar el rendimiento de aplicaciones de IA
- ✅ Solucionar problemas comunes de despliegue

### Próximos Pasos
1. Aplica estos patrones a tus propios proyectos de IA
2. Contribuye con plantillas a la comunidad
3. Únete al Discord de Microsoft Foundry para soporte continuo
4. Explora temas avanzados como despliegues en múltiples regiones

---

**Comentarios sobre el Taller**: Ayúdanos a mejorar este taller compartiendo tu experiencia en el [canal #Azure de Discord de Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navegación por los Capítulos:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo con IA como prioridad
- **⬅️ Anterior**: [Despliegue de Modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores Prácticas para IA en Producción](production-ai-practices.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

**¿Necesitas Ayuda?** Únete a nuestra comunidad para soporte y discusiones sobre AZD y despliegues de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->