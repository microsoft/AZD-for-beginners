# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para Principiantes](../../README.md)
- **📖 Current Chapter**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Previous**: [Implementación de modelos de IA](ai-model-deployment.md)
- **➡️ Next**: [Buenas prácticas de IA en producción](production-ai-practices.md)
- **🚀 Next Chapter**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Workshop Overview

Este laboratorio práctico guía a los desarrolladores a través del proceso de tomar una plantilla de IA existente y desplegarla usando Azure Developer CLI (AZD). Aprenderás patrones esenciales para despliegues de IA en producción usando los servicios de Microsoft Foundry.

**Duration:** 2-3 hours  
**Level:** Intermedio  
**Prerequisites:** Conocimientos básicos de Azure, familiaridad con conceptos de IA/ML

## 🎓 Learning Objectives

Al finalizar este taller, podrás:
- ✅ Convertir una aplicación de IA existente para usar plantillas AZD
- ✅ Configurar servicios de Microsoft Foundry con AZD
- ✅ Implementar gestión segura de credenciales para servicios de IA
- ✅ Desplegar aplicaciones de IA listas para producción con monitoreo
- ✅ Solucionar problemas comunes de despliegue de IA

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalado
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalado
- [Git](https://git-scm.com/) instalado
- Editor de código (se recomienda VS Code)

### Azure Resources
- Suscripción de Azure con acceso de colaborador
- Acceso a servicios Azure OpenAI (o capacidad para solicitar acceso)
- Permisos para crear grupos de recursos

### Knowledge Prerequisites
- Entendimiento básico de los servicios de Azure
- Familiaridad con interfaces de línea de comandos
- Conceptos básicos de IA/ML (APIs, modelos, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Comprobar la instalación de AZD
azd version

# Comprobar la CLI de Azure
az --version

# Iniciar sesión en Azure
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**Qué buscar:**
- Definiciones de servicio para componentes de IA
- Mapeos de variables de entorno
- Configuraciones de host

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Patrones clave de IA a identificar:**
- Provisionamiento del servicio Azure OpenAI
- Integración con Cognitive Search
- Gestión segura de claves
- Configuraciones de seguridad de red

### **Discussion Point:** Por qué estos patrones importan para la IA

- **Service Dependencies**: Las aplicaciones de IA a menudo requieren múltiples servicios coordinados
- **Security**: Las claves de API y los endpoints necesitan gestión segura
- **Scalability**: Las cargas de trabajo de IA tienen requisitos de escalado únicos
- **Cost Management**: Los servicios de IA pueden ser costosos si no se configuran adecuadamente

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Establece tu región de Azure preferida
azd env set AZURE_LOCATION eastus

# Opcional: Establece un modelo específico de OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Provisiona el servicio Azure OpenAI
- ✅ Crea el servicio Cognitive Search
- ✅ Configura App Service para la aplicación web
- ✅ Configura redes y seguridad
- ✅ Despliega el código de la aplicación
- ✅ Configura monitoreo y logging

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - Navega a la aplicación web
   - Prueba consultas de ejemplo
   - Verifica que las respuestas de la IA funcionen

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Your deployment succeeded but the AI isn't responding.

**Common issues to check:**
1. **OpenAI API keys**: Verifica que estén configuradas correctamente
2. **Model availability**: Comprueba si tu región soporta el modelo
3. **Network connectivity**: Asegura que los servicios puedan comunicarse
4. **RBAC permissions**: Verifica que la app pueda acceder a OpenAI

**Debugging commands:**
```bash
# Comprobar las variables de entorno
azd env get-values

# Ver los registros de despliegue
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Comprobar el estado del despliegue de OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Cambiar a un modelo diferente (si está disponible en su región)
azd env set AZURE_OPENAI_MODEL gpt-4

# Volver a desplegar con la nueva configuración
azd deploy
```

2. **Add additional AI services:**

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Diferentes configuraciones para desarrollo y producción.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# En producción normalmente se usan SKUs más altos
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Habilitar funciones de seguridad adicionales
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Configura la plantilla para un desarrollo rentable.

**Tasks:**
1. Identificar qué SKUs pueden configurarse en niveles gratuitos/básicos
2. Configurar variables de entorno para costo mínimo
3. Desplegar y comparar costos con la configuración de producción

**Solution hints:**
- Usa la capa F0 (gratuita) para Cognitive Services cuando sea posible
- Usa la capa Básica para el Search Service en desarrollo
- Considera usar el plan de Consumo para Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Muchas aplicaciones de IA codifican claves de API o usan almacenamiento inseguro.

**AZD Solution**: Integración Managed Identity + Key Vault.

1. **Review the security configuration in your template:**
```bash
# Busca la configuración de Key Vault e identidad administrada
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Comprobar si la aplicación web tiene la configuración de identidad correcta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights debería configurarse automáticamente
# Comprueba la configuración:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

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

### **Lab Exercise 4.1: Security Audit**

**Task**: Revisa tu despliegue para las mejores prácticas de seguridad.

**Checklist:**
- [ ] No hay secretos codificados en el código o la configuración
- [ ] Managed Identity utilizado para autenticación entre servicios
- [ ] Key Vault almacena la configuración sensible
- [ ] El acceso a la red está correctamente restringido
- [ ] Monitoreo y logging están habilitados

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, responde a estas preguntas:

1. **Application Architecture:**
   - ¿Qué servicios de IA usa tu app?
   - ¿Qué recursos de cómputo necesita?
   - ¿Requiere una base de datos?
   - ¿Cuáles son las dependencias entre servicios?

2. **Security Requirements:**
   - ¿Qué datos sensibles maneja tu app?
   - ¿Qué requisitos de cumplimiento tienes?
   - ¿Necesitas redes privadas?

3. **Scaling Requirements:**
   - ¿Cuál es la carga esperada?
   - ¿Necesitas autoescalado?
   - ¿Hay requisitos regionales?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializar la plantilla AZD
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Crea una plantilla AZD para una app de IA de procesamiento de documentos.

**Requirements:**
- Azure OpenAI para análisis de contenido
- Document Intelligence para OCR
- Storage Account para cargas de documentos
- Function App para la lógica de procesamiento
- Web app para la interfaz de usuario

**Bonus points:**
- Añadir manejo de errores adecuado
- Incluir estimación de costos
- Configurar paneles de monitoreo

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** El despliegue falla con error de cuota
**Solutions:**
```bash
# Comprobar cuotas actuales
az cognitiveservices usage list --location eastus

# Solicitar aumento de cuota o probar otra región
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** Las respuestas de IA fallan o hay errores de despliegue del modelo
**Solutions:**
```bash
# Comprobar la disponibilidad del modelo por región
az cognitiveservices model list --location eastus

# Actualizar al modelo disponible
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** Errores 403 Forbidden al llamar a servicios de IA
**Solutions:**
```bash
# Comprobar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Agregar roles faltantes
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Revisa Application Insights para métricas de rendimiento
2. Revisa las métricas del servicio OpenAI en el portal de Azure
3. Verifica la conectividad de red y la latencia

**Solutions:**
- Implementa caching para consultas comunes
- Usa el modelo de OpenAI apropiado para tu caso de uso
- Considera réplicas de lectura para escenarios de alta carga

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Tu despliegue fue exitoso, pero la aplicación devuelve errores 500.

**Debugging tasks:**
1. Revisa los logs de la aplicación
2. Verifica la conectividad entre servicios
3. Prueba la autenticación
4. Revisa la configuración

**Tools to use:**
- `azd show` para visión general del despliegue
- Portal de Azure para logs detallados de servicios
- Application Insights para telemetría de la aplicación

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Navega al portal de Azure y crea un panel con:
- Recuento y latencia de solicitudes a OpenAI
- Tasas de error de la aplicación
- Utilización de recursos
- Seguimiento de costos

2. **Set up alerts:**
```bash
# Alerta por alta tasa de errores
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Usar la CLI de Azure para obtener datos de costos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Configura alertas de presupuesto
- Usa políticas de autoescalado
- Implementa caching de solicitudes
- Monitorea el uso de tokens en OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimiza tu aplicación de IA tanto para rendimiento como para costo.

**Metrics to improve:**
- Reducir el tiempo de respuesta promedio en un 20%
- Reducir los costos mensuales en un 15%
- Mantener 99.9% de disponibilidad

**Strategies to try:**
- Implementar caching de respuestas
- Optimizar prompts para eficiencia de tokens
- Usar SKUs de cómputo apropiados
- Configurar autoescalado adecuado

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Te asignan crear un chatbot de servicio al cliente potenciado por IA listo para producción con estos requisitos:

**Functional Requirements:**
- Interfaz web para interacciones con clientes
- Integración con Azure OpenAI para respuestas
- Capacidad de búsqueda de documentos usando Cognitive Search
- Integración con la base de datos de clientes existente
- Soporte multilenguaje

**Non-Functional Requirements:**
- Manejar 1000 usuarios concurrentes
- SLA de 99.9% de uptime
- Cumplimiento SOC 2
- Costo por debajo de $500/mes
- Desplegar en múltiples entornos (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Funcionalidad**: ¿Cumple con todos los requisitos?
- ✅ **Seguridad**: ¿Se implementaron las mejores prácticas?
- ✅ **Escalabilidad**: ¿Puede manejar la carga?
- ✅ **Mantenibilidad**: ¿El código y la infraestructura están bien organizados?
- ✅ **Costo**: ¿Se mantiene dentro del presupuesto?

## Additional Resources

### Microsoft Documentation
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación del servicio Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentación de Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Discord de Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub de Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Plantillas AZD destacadas](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
¡Felicidades! Has completado el Laboratorio del Taller de IA. Ahora deberías poder:

- ✅ Convertir aplicaciones de IA existentes a plantillas AZD
- ✅ Desplegar aplicaciones de IA listas para producción
- ✅ Implementar prácticas recomendadas de seguridad para cargas de trabajo de IA
- ✅ Supervisar y optimizar el rendimiento de aplicaciones de IA
- ✅ Solucionar problemas comunes de despliegue

### Próximos pasos
1. Aplica estos patrones a tus propios proyectos de IA
2. Contribuye con plantillas de vuelta a la comunidad
3. Únete al Microsoft Foundry Discord para soporte continuo
4. Explora temas avanzados como despliegues multi-región

---

**Comentarios del taller**: Ayúdanos a mejorar este taller compartiendo tu experiencia en el [canal #Azure de Microsoft Foundry en Discord](https://discord.gg/microsoft-azure).

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo con IA como prioridad
- **⬅️ Anterior**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Mejores prácticas de IA en producción](production-ai-practices.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestra comunidad para obtener soporte y participar en discusiones sobre AZD y despliegues de IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción de IA [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por alcanzar la mayor exactitud posible, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->