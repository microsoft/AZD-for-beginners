# Aplicación de Chat de Azure OpenAI

**Ruta de Aprendizaje:** Intermedio ⭐⭐ | **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes

Una aplicación completa de chat de Azure OpenAI desplegada utilizando Azure Developer CLI (azd). Este ejemplo demuestra el despliegue de GPT-4, acceso seguro a la API y una interfaz de chat sencilla.

## 🎯 Lo que Aprenderás

- Desplegar el servicio Azure OpenAI con el modelo GPT-4
- Proteger las claves de la API de OpenAI con Key Vault
- Construir una interfaz de chat sencilla con Python
- Monitorear el uso de tokens y costos
- Implementar limitación de tasa y manejo de errores

## 📦 Lo que Incluye

✅ **Servicio Azure OpenAI** - Despliegue del modelo GPT-4  
✅ **Aplicación de Chat en Python** - Interfaz de chat sencilla en línea de comandos  
✅ **Integración con Key Vault** - Almacenamiento seguro de claves de API  
✅ **Plantillas ARM** - Infraestructura completa como código  
✅ **Monitoreo de Costos** - Seguimiento del uso de tokens  
✅ **Limitación de Tasa** - Prevención de agotamiento de cuotas  

## Arquitectura

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Requisitos Previos

### Obligatorios

- **Azure Developer CLI (azd)** - [Guía de instalación](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Suscripción de Azure** con acceso a OpenAI - [Solicitar acceso](https://aka.ms/oai/access)
- **Python 3.9+** - [Instalar Python](https://www.python.org/downloads/)

### Verificar Requisitos Previos

```bash
# Verificar la versión de azd (necesita 1.5.0 o superior)
azd version

# Verificar inicio de sesión en Azure
azd auth login

# Verificar la versión de Python
python --version  # o python3 --version

# Verificar acceso a OpenAI (comprobar en el Portal de Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Importante:** Azure OpenAI requiere aprobación de la aplicación. Si no has aplicado, visita [aka.ms/oai/access](https://aka.ms/oai/access). La aprobación generalmente toma 1-2 días hábiles.

## ⏱️ Cronograma de Despliegue

| Fase | Duración | Qué Ocurre |
|------|----------|------------|
| Verificación de requisitos previos | 2-3 minutos | Verificar disponibilidad de cuota de OpenAI |
| Desplegar infraestructura | 8-12 minutos | Crear OpenAI, Key Vault, despliegue del modelo |
| Configurar aplicación | 2-3 minutos | Configurar entorno y dependencias |
| **Total** | **12-18 minutos** | Listo para chatear con GPT-4 |

**Nota:** El primer despliegue de OpenAI puede tardar más debido a la provisión del modelo.

## Inicio Rápido

```bash
# Navegar al ejemplo
cd examples/azure-openai-chat

# Inicializar el entorno
azd env new myopenai

# Desplegar todo (infraestructura + configuración)
azd up
# Se te pedirá que:
# 1. Selecciones la suscripción de Azure
# 2. Elijas una ubicación con disponibilidad de OpenAI (por ejemplo, eastus, eastus2, westus)
# 3. Esperes 12-18 minutos para el despliegue

# Instalar dependencias de Python
pip install -r requirements.txt

# ¡Comienza a chatear!
python chat.py
```

**Salida Esperada:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verificar Despliegue

### Paso 1: Verificar Recursos de Azure

```bash
# Ver recursos implementados
azd show

# La salida esperada muestra:
# - Servicio OpenAI: (nombre del recurso)
# - Key Vault: (nombre del recurso)
# - Implementación: gpt-4
# - Ubicación: eastus (o la región seleccionada)
```

### Paso 2: Probar la API de OpenAI

```bash
# Obtener el endpoint y la clave de OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Probar la llamada a la API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Respuesta Esperada:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Paso 3: Verificar Acceso a Key Vault

```bash
# Enumerar secretos en Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Secretos Esperados:**
- `openai-api-key`
- `openai-endpoint`

**Criterios de Éxito:**
- ✅ Servicio OpenAI desplegado con GPT-4
- ✅ Llamada a la API devuelve una respuesta válida
- ✅ Secretos almacenados en Key Vault
- ✅ Seguimiento del uso de tokens funciona

## Estructura del Proyecto

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Funcionalidades de la Aplicación

### Interfaz de Chat (`chat.py`)

La aplicación de chat incluye:

- **Historial de Conversación** - Mantiene el contexto entre mensajes
- **Conteo de Tokens** - Rastrea el uso y estima costos
- **Manejo de Errores** - Manejo adecuado de límites de tasa y errores de API
- **Estimación de Costos** - Cálculo en tiempo real del costo por mensaje
- **Soporte de Streaming** - Respuestas en streaming opcionales

### Comandos

Mientras chateas, puedes usar:
- `quit` o `exit` - Terminar la sesión
- `clear` - Limpiar el historial de conversación
- `tokens` - Mostrar el uso total de tokens
- `cost` - Mostrar el costo total estimado

### Configuración (`config.py`)

Carga configuración desde variables de entorno:
```python
AZURE_OPENAI_ENDPOINT  # Desde Key Vault
AZURE_OPENAI_API_KEY   # Desde Key Vault
AZURE_OPENAI_MODEL     # Predeterminado: gpt-4
AZURE_OPENAI_MAX_TOKENS # Predeterminado: 800
```

## Ejemplos de Uso

### Chat Básico

```bash
python chat.py
```

### Chat con Modelo Personalizado

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat con Streaming

```bash
python chat.py --stream
```

### Ejemplo de Conversación

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Gestión de Costos

### Precios de Tokens (GPT-4)

| Modelo | Entrada (por 1K tokens) | Salida (por 1K tokens) |
|--------|-------------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Costos Mensuales Estimados

Basado en patrones de uso:

| Nivel de Uso | Mensajes/Día | Tokens/Día | Costo Mensual |
|--------------|--------------|------------|---------------|
| **Ligero** | 20 mensajes | 3,000 tokens | $3-5 |
| **Moderado** | 100 mensajes | 15,000 tokens | $15-25 |
| **Intenso** | 500 mensajes | 75,000 tokens | $75-125 |

**Costo Base de Infraestructura:** $1-2/mes (Key Vault + cómputo mínimo)

### Consejos para Optimizar Costos

```bash
# 1. Usa GPT-3.5-Turbo para tareas más simples (20x más barato)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduce el máximo de tokens para respuestas más cortas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitorea el uso de tokens
python chat.py --show-tokens

# 4. Configura alertas de presupuesto
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoreo

### Ver Uso de Tokens

```bash
# En el Portal de Azure:
# Recurso de OpenAI → Métricas → Seleccionar "Transacción de Tokens"

# O a través de Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Ver Registros de API

```bash
# Transmitir registros de diagnóstico
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Consultar registros
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Solución de Problemas

### Problema: Error "Access Denied"

**Síntomas:** 403 Forbidden al llamar a la API

**Soluciones:**
```bash
# 1. Verificar que el acceso a OpenAI esté aprobado
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Comprobar que la clave API sea correcta
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verificar el formato de la URL del endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Debería ser: https://[name].openai.azure.com/
```

### Problema: "Rate Limit Exceeded"

**Síntomas:** 429 Demasiadas Solicitudes

**Soluciones:**
```bash
# 1. Verificar la cuota actual
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Solicitar aumento de cuota (si es necesario)
# Ir al Portal de Azure → Recurso OpenAI → Cuotas → Solicitar aumento

# 3. Implementar lógica de reintento (ya en chat.py)
# La aplicación reintenta automáticamente con retroceso exponencial
```

### Problema: "Model Not Found"

**Síntomas:** Error 404 en el despliegue

**Soluciones:**
```bash
# 1. Enumerar implementaciones disponibles
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verificar el nombre del modelo en el entorno
echo $AZURE_OPENAI_MODEL

# 3. Actualizar al nombre de implementación correcto
export AZURE_OPENAI_MODEL=gpt-4  # o gpt-35-turbo
```

### Problema: Alta Latencia

**Síntomas:** Tiempos de respuesta lentos (>5 segundos)

**Soluciones:**
```bash
# 1. Verificar la latencia regional
# Implementar en la región más cercana a los usuarios

# 2. Reducir max_tokens para respuestas más rápidas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Usar transmisión para una mejor experiencia de usuario
python chat.py --stream
```

## Mejores Prácticas de Seguridad

### 1. Proteger Claves de API

```bash
# Nunca comprometas claves en el control de versiones
# Usa Key Vault (ya configurado)

# Rota las claves regularmente
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementar Filtrado de Contenido

```python
# Azure OpenAI incluye filtrado de contenido integrado
# Configurar en el Portal de Azure:
# Recurso OpenAI → Filtros de Contenido → Crear Filtro Personalizado

# Categorías: Odio, Sexual, Violencia, Autolesión
# Niveles: Bajo, Medio, Alto filtrado
```

### 3. Usar Identidad Administrada (Producción)

```bash
# Para implementaciones en producción, use identidad administrada
# en lugar de claves API (requiere alojamiento de la aplicación en Azure)

# Actualice infra/openai.bicep para incluir:
# identity: { type: 'SystemAssigned' }
```

## Desarrollo

### Ejecutar Localmente

```bash
# Instalar dependencias
pip install -r src/requirements.txt

# Configurar variables de entorno
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Ejecutar la aplicación
python src/chat.py
```

### Ejecutar Pruebas

```bash
# Instalar dependencias de prueba
pip install pytest pytest-cov

# Ejecutar pruebas
pytest tests/ -v

# Con cobertura
pytest tests/ --cov=src --cov-report=html
```

### Actualizar Despliegue del Modelo

```bash
# Implementar una versión diferente del modelo
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Limpieza

```bash
# Eliminar todos los recursos de Azure
azd down --force --purge

# Esto elimina:
# - Servicio OpenAI
# - Key Vault (con eliminación suave de 90 días)
# - Grupo de recursos
# - Todas las implementaciones y configuraciones
```

## Próximos Pasos

### Expandir Este Ejemplo

1. **Agregar Interfaz Web** - Construir frontend con React/Vue
   ```bash
   # Agregar el servicio frontend a azure.yaml
   # Implementar en Azure Static Web Apps
   ```

2. **Implementar RAG** - Agregar búsqueda de documentos con Azure AI Search
   ```python
   # Integrar Azure Cognitive Search
   # Subir documentos y crear índice vectorial
   ```

3. **Agregar Llamadas a Funciones** - Habilitar uso de herramientas
   ```python
   # Definir funciones en chat.py
   # Permitir que GPT-4 llame a APIs externas
   ```

4. **Soporte Multi-Modelo** - Desplegar múltiples modelos
   ```bash
   # Agregar gpt-35-turbo, modelos de embeddings
   # Implementar lógica de enrutamiento de modelos
   ```

### Ejemplos Relacionados

- **[Multi-Agente para Retail](../retail-scenario.md)** - Arquitectura avanzada de múltiples agentes
- **[Aplicación de Base de Datos](../../../../examples/database-app)** - Agregar almacenamiento persistente
- **[Aplicaciones en Contenedores](../../../../examples/container-app)** - Desplegar como servicio en contenedores

### Recursos de Aprendizaje

- 📚 [Curso AZD para Principiantes](../../README.md) - Página principal del curso
- 📚 [Documentación de Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Documentación oficial
- 📚 [Referencia de API de OpenAI](https://platform.openai.com/docs/api-reference) - Detalles de la API
- 📚 [IA Responsable](https://www.microsoft.com/ai/responsible-ai) - Mejores prácticas

## Recursos Adicionales

### Documentación
- **[Servicio Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Guía completa
- **[Modelos GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacidades del modelo
- **[Filtrado de Contenido](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funciones de seguridad
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia de azd

### Tutoriales
- **[Inicio Rápido de OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Primer despliegue
- **[Completaciones de Chat](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construcción de aplicaciones de chat
- **[Llamadas a Funciones](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Funciones avanzadas

### Herramientas
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Entorno de pruebas basado en web
- **[Guía de Ingeniería de Prompts](https://platform.openai.com/docs/guides/prompt-engineering)** - Escribir mejores prompts
- **[Calculadora de Tokens](https://platform.openai.com/tokenizer)** - Estimar uso de tokens

### Comunidad
- **[Discord de Azure AI](https://discord.gg/azure)** - Ayuda de la comunidad
- **[Discusiones en GitHub](https://github.com/Azure-Samples/openai/discussions)** - Foro de preguntas y respuestas
- **[Blog de Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Últimas actualizaciones

---

**🎉 ¡Éxito!** Has desplegado Azure OpenAI y construido una aplicación de chat funcional. Comienza a explorar las capacidades de GPT-4 y experimenta con diferentes prompts y casos de uso.

**¿Preguntas?** [Abre un problema](https://github.com/microsoft/AZD-for-beginners/issues) o consulta las [Preguntas Frecuentes](../../resources/faq.md)

**Alerta de Costos:** Recuerda ejecutar `azd down` cuando termines de probar para evitar cargos continuos (~$50-100/mes por uso activo).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->