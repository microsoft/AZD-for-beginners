# 5. Customize una plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Explorar las capacidades predeterminadas del Agente de IA
    - [ ] Agregar AI Search con tu propio índice
    - [ ] Activar y analizar métricas de seguimiento
    - [ ] Ejecutar una evaluación
    - [ ] Ejecutar un escaneo de red-teaming
    - [ ] **Laboratorio 5: Construir un Plan de Personalización**

---

## 5.1 Capacidades del Agente de IA

!!! success "Lo completamos en el Laboratorio 01"

- **Búsqueda de archivos**: búsqueda integrada de archivos de OpenAI para recuperación de conocimiento
- **Citas**: atribución automática de fuentes en las respuestas
- **Instrucciones personalizables**: modificar el comportamiento y la personalidad del agente
- **Integración de herramientas**: sistema extensible de herramientas para capacidades personalizadas

---

## 5.2 Opciones de recuperación de conocimiento

!!! task "Para completar esto necesitamos hacer cambios y volver a desplegar"    
    
    ```bash title=""
    # Configurar variables de entorno
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Cargar datos y crear mi índice

    ```

---

**Búsqueda de archivos OpenAI (predeterminada):**

- Integrada en Foundry Agents
- Procesamiento automático de documentos y creación de índices
- No se requiere configuración adicional

**Azure AI Search (opcional):**

- Búsqueda semántica e híbrida vectorial
- Gestión personalizada del índice
- Capacidades avanzadas de búsqueda
- Requiere `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Seguimiento y Monitoreo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Para completar esto necesitamos hacer cambios y volver a desplegar"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Seguimiento:**

- Integración OpenTelemetry
- Seguimiento de solicitudes/respuestas
- Métricas de desempeño
- Disponible en el portal Microsoft Foundry

**Registro de eventos:**

- Logs de aplicación en Container Apps
- Registro estructurado con IDs de correlación
- Visualización en tiempo real y histórica

---

## 5.4 [Evaluación del Agente](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Evaluación local:**

- Evaluadores incorporados para evaluación de calidad
- Scripts personalizados de evaluación
- Benchmarking de desempeño

**Monitoreo continuo:**

- Evaluación automática de interacciones en vivo
- Seguimiento de métricas de calidad
- Detección de regresiones de rendimiento

**Integración CI/CD:**

- Flujo de trabajo GitHub Actions
- Pruebas y evaluaciones automatizadas
- Pruebas de comparación estadística

---

## 5.5 [Agente de Red Teaming de IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming de IA:**

- Escaneo automatizado de seguridad
- Evaluación de riesgos para sistemas de IA
- Evaluación de seguridad en múltiples categorías

**Autenticación:**

- Identidad gestionada para servicios Azure
- Autenticación opcional de Azure App Service
- Autenticación básica como alternativa para desarrollo

!!! quote "AL FINAL DE ESTE LABORATORIO DEBERÍAS HABER"
    - [ ] Definido los requisitos de tu escenario
    - [ ] Personalizado variables de entorno (config)
    - [ ] Personalizado instrucciones del agente (tarea)
    - [ ] Desplegado la plantilla personalizada (app)
    - [ ] Completado tareas post-despliegue (manual)
    - [ ] Ejecutado una evaluación de prueba

Este ejemplo demuestra cómo personalizar la plantilla para un caso de uso empresarial minorista con dos agentes especializados y múltiples despliegues de modelo.

---

## 5.6 ¡Personalízalo para ti!

### 5.6.1. Requisitos del escenario

#### **Despliegues del Agente:**

   - Agente Comprador: ayuda a los clientes a encontrar y comparar productos
   - Agente de Lealtad: gestiona recompensas y promociones para clientes

#### **Despliegues del modelo:**

   - `gpt-4.1`: modelo principal para chat
   - `o3`: modelo de razonamiento para consultas complejas
   - `gpt-4.1-nano`: modelo liviano para interacciones simples
   - `text-embedding-3-large`: embeddings de alta calidad para búsqueda

#### **Características:**

   - Seguimiento y monitoreo habilitados
   - AI Search para catálogo de productos
   - Marco de evaluación para aseguramiento de calidad
   - Red teaming para validación de seguridad

---

### 5.6.2 Implementación del escenario


#### 5.6.2.1. Configuración previa al despliegue

Crea un script de configuración (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Establecer nombre del entorno
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configurar región (elegir según la disponibilidad del modelo)
azd env set AZURE_LOCATION "eastus2"

# Habilitar todos los servicios opcionales
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configurar modelo principal de chat (gpt-4.1 como el más cercano disponible a gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configurar modelo de incrustación para búsqueda mejorada
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Establecer nombre del agente (creará el primer agente)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configurar índice de búsqueda
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instrucciones del Agente

Crea `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Crea `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Script de despliegue

Crea `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validar requisitos previos
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Configurar el entorno
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Verificar cuota en la región seleccionada
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Desplegar infraestructura y aplicación
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capturar salidas del despliegue
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Obtener la URL de la aplicación web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Configuración post-despliegue

Crea `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Obtener información del despliegue
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instrucciones para la configuración manual
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Pruebas y validación

Crea `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verificar que las variables de entorno estén configuradas
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Probar la disponibilidad de la aplicación web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Ejecutar la evaluación si está configurada
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Resultados esperados

Después de seguir esta guía de implementación, tendrás:

1. **Infraestructura desplegada:**

      - Proyecto Microsoft Foundry con despliegues de modelos
      - Container Apps alojando la aplicación web
      - Servicio AI Search para catálogo de productos
      - Application Insights para monitoreo

2. **Agente inicial:**

      - Agente Comprador configurado con instrucciones básicas
      - Capacidad de búsqueda de archivos habilitada
      - Seguimiento y monitoreo configurados

3. **Listo para personalización:**

      - Marco para agregar Agente de Lealtad
      - Plantillas de instrucciones personalizadas
      - Scripts para pruebas y validación
      - Configuración para monitoreo y evaluación

4. **Preparado para producción:**

      - Escaneo de seguridad con red teaming
      - Monitoreo de rendimiento
      - Marco de evaluación de calidad
      - Arquitectura escalable

Este ejemplo demuestra cómo la plantilla AZD puede ser extendida y personalizada para escenarios empresariales específicos manteniendo las mejores prácticas de seguridad, monitoreo y escalabilidad.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas derivados del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->