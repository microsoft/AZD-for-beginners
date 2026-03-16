# Aplicación de Chat de Microsoft Foundry Models

**Ruta de Aprendizaje:** Intermedio ⭐⭐ | **Tiempo:** 35-45 minutos | **Costo:** $50-200/mes

Una aplicación completa de chat de Microsoft Foundry Models desplegada usando Azure Developer CLI (azd). Este ejemplo demuestra el despliegue de gpt-4.1, acceso seguro a la API y una interfaz de chat simple.

## 🎯 Lo que Aprenderás

- Desplegar el Servicio Microsoft Foundry Models con el modelo gpt-4.1
- Proteger claves API de OpenAI con Key Vault
- Construir una interfaz de chat simple con Python
- Monitorear uso de tokens y costos
- Implementar limitación de tasa y manejo de errores

## 📦 Qué Incluye

✅ **Servicio Microsoft Foundry Models** - despliegue del modelo gpt-4.1  
✅ **App de Chat en Python** - Interfaz de chat simple en línea de comandos  
✅ **Integración con Key Vault** - Almacenamiento seguro de claves API  
✅ **Plantillas ARM** - Infraestructura como código completa  
✅ **Monitoreo de Costos** - Seguimiento del uso de tokens  
✅ **Limitación de Tasa** - Prevención de agotamiento de cuota  

## Arquitectura

```mermaid
graph TD
    App[Aplicación de Chat Python<br/>Local/Nube<br/>Interfaz de línea de comandos<br/>Historial de conversación<br/>Seguimiento de uso de tokens] -- "HTTPS (Clave API)" --> Foundry[Servicio de Modelos Microsoft Foundry<br/>Modelo gpt-4.1<br/>Capacidad de 20K tokens/min<br/>Conmutación por error multirregional]
    Foundry --> KV[Azure Key Vault<br/>Clave API de OpenAI<br/>URL del endpoint]
    Foundry -. Managed Identity .-> KV
```
## Requisitos Previos

### Obligatorios

- **Azure Developer CLI (azd)** - [Guía de instalación](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Suscripción de Azure** con acceso a OpenAI - [Solicitar acceso](https://aka.ms/oai/access)
- **Python 3.9+** - [Instalar Python](https://www.python.org/downloads/)

### Verificar Requisitos Previos

```bash
# Comprobar versión de azd (se necesita 1.5.0 o superior)
azd version

# Verificar inicio de sesión en Azure
azd auth login

# Comprobar versión de Python
python --version  # o python3 --version

# Verificar acceso a OpenAI (verificar en Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Importante:** Microsoft Foundry Models requiere aprobación de la aplicación. Si no has solicitado acceso, visita [aka.ms/oai/access](https://aka.ms/oai/access). La aprobación suele tardar 1-2 días hábiles.

## ⏱️ Cronograma de Despliegue

| Fase | Duración | Qué Sucede |
|-------|----------|--------------|
| Verificación de requisitos | 2-3 minutos | Verificar disponibilidad de cuota OpenAI |
| Desplegar infraestructura | 8-12 minutos | Crear OpenAI, Key Vault, despliegue de modelo |
| Configurar aplicación | 2-3 minutos | Configurar ambiente y dependencias |
| **Total** | **12-18 minutos** | Listo para chatear con gpt-4.1 |

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
# 2. Elijas la ubicación con disponibilidad de OpenAI (por ejemplo, eastus, eastus2, westus)
# 3. Esperes de 12 a 18 minutos para el despliegue

# Instalar dependencias de Python
pip install -r requirements.txt

# ¡Comienza a chatear!
python chat.py
```

**Salida Esperada:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verificar Despliegue

### Paso 1: Verificar Recursos de Azure

```bash
# Ver recursos desplegados
azd show

# La salida esperada muestra:
# - Servicio OpenAI: (nombre del recurso)
# - Key Vault: (nombre del recurso)
# - Despliegue: gpt-4.1
# - Ubicación: eastus (o su región seleccionada)
```

### Paso 2: Probar la API de OpenAI

```bash
# Obtener el endpoint y la clave de OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Probar llamada a la API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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
# Listar secretos en Key Vault
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
- ✅ Servicio OpenAI desplegado con gpt-4.1
- ✅ Llamada API retorna completación válida
- ✅ Secretos almacenados en Key Vault
- ✅ Seguimiento de uso de tokens funcionando

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

## Características de la Aplicación

### Interfaz de Chat (`chat.py`)

La aplicación de chat incluye:

- **Historial de Conversación** - Mantiene el contexto entre mensajes
- **Conteo de Tokens** - Rastrea uso y estima costos
- **Manejo de Errores** - Manejo adecuado de límites de tasa y errores API
- **Estimación de Costos** - Cálculo de costos en tiempo real por mensaje
- **Soporte de Streaming** - Respuestas en streaming opcionales

### Comandos

Mientras chateas, puedes usar:
- `quit` o `exit` - Finalizar la sesión
- `clear` - Borrar historial de conversación
- `tokens` - Mostrar uso total de tokens
- `cost` - Mostrar costo total estimado

### Configuración (`config.py`)

Carga configuración desde variables de entorno:
```python
AZURE_OPENAI_ENDPOINT  # Desde Key Vault
AZURE_OPENAI_API_KEY   # Desde Key Vault
AZURE_OPENAI_MODEL     # Predeterminado: gpt-4.1
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

### Conversación de Ejemplo

```
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Gestión de Costos

### Precios por Token (gpt-4.1)

| Modelo | Entrada (por 1K tokens) | Salida (por 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Costos Mensuales Estimados

Basado en patrones de uso:

| Nivel de Uso | Mensajes/Día | Tokens/Día | Costo Mensual |
|-------------|--------------|------------|--------------|
| **Ligero** | 20 mensajes | 3,000 tokens | $3-5 |
| **Moderado** | 100 mensajes | 15,000 tokens | $15-25 |
| **Intenso** | 500 mensajes | 75,000 tokens | $75-125 |

**Costo Base de Infraestructura:** $1-2/mes (Key Vault + cómputo mínimo)

### Consejos de Optimización de Costos

```bash
# 1. Usar GPT-3.5-Turbo para tareas más simples (20 veces más barato)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reducir el máximo de tokens para respuestas más cortas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitorear el uso de tokens
python chat.py --show-tokens

# 4. Configurar alertas de presupuesto
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoreo

### Ver Uso de Tokens

```bash
# En el Portal de Azure:
# Recurso OpenAI → Métricas → Seleccionar "Transacción de tokens"

# O mediante Azure CLI:
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

### Problema: Error "Acceso Denegado"

**Síntomas:** 403 Prohibido al llamar a la API

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
# Debe ser: https://[name].openai.azure.com/
```

### Problema: "Límite de Tasa Excedido"

**Síntomas:** 429 Demasiadas Solicitudes

**Soluciones:**
```bash
# 1. Verificar la cuota actual
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. Solicitar aumento de cuota (si es necesario)
# Ir al Portal de Azure → Recurso OpenAI → Cuotas → Solicitar aumento

# 3. Implementar lógica de reintento (ya está en chat.py)
# La aplicación reintenta automáticamente con backoff exponencial
```

### Problema: "Modelo No Encontrado"

**Síntomas:** Error 404 para despliegue

**Soluciones:**
```bash
# 1. Listar implementaciones disponibles
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verificar nombre del modelo en el entorno
echo $AZURE_OPENAI_MODEL

# 3. Actualizar al nombre correcto de implementación
export AZURE_OPENAI_MODEL=gpt-4.1  # o gpt-35-turbo
```

### Problema: Latencia Alta

**Síntomas:** Respuestas lentas (>5 segundos)

**Soluciones:**
```bash
# 1. Verificar la latencia regional
# Desplegar en la región más cercana a los usuarios

# 2. Reducir max_tokens para respuestas más rápidas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Usar streaming para mejor experiencia de usuario
python chat.py --stream
```

## Mejores Prácticas de Seguridad

### 1. Proteger Claves API

```bash
# Nunca cometas claves en el control de versiones
# Usa Key Vault (ya configurado)

# Rota las claves regularmente
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementar Filtro de Contenido

```python
# Microsoft Foundry Models incluye filtrado de contenido incorporado
# Configurar en el Portal de Azure:
# Recurso OpenAI → Filtros de contenido → Crear filtro personalizado

# Categorías: Odio, Sexual, Violencia, Autolesiones
# Niveles: Filtrado bajo, medio, alto
```

### 3. Usar Identidad Gestionada (Producción)

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

# Establecer variables de entorno
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Ejecutar aplicación
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

### Actualizar Despliegue de Modelo

```bash
# Desplegar diferentes versiones del modelo
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

### Ampliar Este Ejemplo

1. **Agregar Interfaz Web** - Construir frontend React/Vue
   ```bash
   # Agregar servicio frontend a azure.yaml
   # Desplegar en Azure Static Web Apps
   ```

2. **Implementar RAG** - Añadir búsqueda documental con Azure AI Search
   ```python
   # Integrar Azure Cognitive Search
   # Subir documentos y crear índice vectorial
   ```

3. **Agregar Llamadas a Funciones** - Habilitar uso de herramientas
   ```python
   # Definir funciones en chat.py
   # Permitir que gpt-4.1 llame a APIs externas
   ```

4. **Soporte Multi-Modelo** - Desplegar múltiples modelos
   ```bash
   # Agregar modelos gpt-35-turbo, embeddings
   # Implementar lógica de enrutamiento de modelos
   ```

### Ejemplos Relacionados

- **[Retail Multi-Agent](../retail-scenario.md)** - Arquitectura avanzada multi-agente
- **[Database App](../../../../examples/database-app)** - Añadir almacenamiento persistente
- **[Container Apps](../../../../examples/container-app)** - Desplegar como servicio en contenedor

### Recursos de Aprendizaje

- 📚 [Curso AZD para Principiantes](../../README.md) - Página principal del curso
- 📚 [Documentación Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/) - Documentación oficial
- 📚 [Referencia API OpenAI](https://platform.openai.com/docs/api-reference) - Detalles de la API
- 📚 [IA Responsable](https://www.microsoft.com/ai/responsible-ai) - Mejores prácticas

## Recursos Adicionales

### Documentación
- **[Servicio Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/)** - Guía completa
- **[Modelos gpt-4.1](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacidades del modelo
- **[Filtro de Contenido](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funciones de seguridad
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia azd

### Tutoriales
- **[Inicio rápido OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Primer despliegue
- **[Completaciones de Chat](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construcción de apps de chat
- **[Llamadas a Funciones](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Funciones avanzadas

### Herramientas
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Entorno web interactivo
- **[Guía de Ingeniería de Prompts](https://platform.openai.com/docs/guides/prompt-engineering)** - Escribir mejores prompts
- **[Calculadora de Tokens](https://platform.openai.com/tokenizer)** - Estimar uso de tokens

### Comunidad
- **[Azure AI Discord](https://discord.gg/azure)** - Obtener ayuda de la comunidad
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Foro de preguntas y respuestas
- **[Blog de Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Últimas novedades

---

**🎉 ¡Éxito!** Has desplegado Microsoft Foundry Models y construido una aplicación de chat funcional. Comienza a explorar las capacidades de gpt-4.1 y experimenta con diferentes prompts y casos de uso.

**¿Preguntas?** [Abre un issue](https://github.com/microsoft/AZD-for-beginners/issues) o revisa las [FAQ](../../resources/faq.md)

**Alerta de Costos:** Recuerda ejecutar `azd down` al terminar las pruebas para evitar cargos continuos (~$50-100/mes por uso activo).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos responsabilizamos por malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->