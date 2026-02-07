# Agentes de IA con Azure Developer CLI

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Anterior**: [Despliegue de Modelos de IA](ai-model-deployment.md)
- **➡️ Siguiente**: [Prácticas de IA en Producción](production-ai-practices.md)
- **🚀 Avanzado**: [Soluciones Multi-Agente](../../examples/retail-scenario.md)

---

## Introducción

Los agentes de IA son programas autónomos que pueden percibir su entorno, tomar decisiones y realizar acciones para lograr objetivos específicos. A diferencia de los chatbots simples que responden a mensajes, los agentes pueden:

- **Usar herramientas** - Llamar a APIs, buscar en bases de datos, ejecutar código
- **Planificar y razonar** - Dividir tareas complejas en pasos
- **Aprender del contexto** - Mantener memoria y adaptar el comportamiento
- **Colaborar** - Trabajar con otros agentes (sistemas multi-agente)

Esta guía te muestra cómo desplegar agentes de IA en Azure usando Azure Developer CLI (azd).

## Objetivos de aprendizaje

Al completar esta guía, podrás:
- Entender qué son los agentes de IA y cómo se diferencian de los chatbots
- Desplegar plantillas de agentes de IA preconstruidas usando AZD
- Configurar Foundry Agents para agentes personalizados
- Implementar patrones básicos de agentes (uso de herramientas, RAG, multi-agente)
- Monitorear y depurar agentes desplegados

## Resultados de aprendizaje

Al finalizar, podrás:
- Desplegar aplicaciones de agentes de IA en Azure con un solo comando
- Configurar herramientas y capacidades del agente
- Implementar generación aumentada por recuperación (RAG) con agentes
- Diseñar arquitecturas multi-agente para flujos de trabajo complejos
- Resolver problemas comunes en el despliegue de agentes

---

## 🤖 ¿Qué diferencia a un agente de un chatbot?

| Característica | Chatbot | Agente de IA |
|---------|---------|----------|
| **Comportamiento** | Responde a solicitudes | Toma acciones autónomas |
| **Herramientas** | Ninguno | Puede llamar APIs, buscar, ejecutar código |
| **Memoria** | Solo basada en sesión | Memoria persistente entre sesiones |
| **Planificación** | Respuesta única | Razonamiento en varios pasos |
| **Colaboración** | Entidad única | Puede trabajar con otros agentes |

### Analogía simple

- **Chatbot** = Una persona servicial respondiendo preguntas en un mostrador de información
- **Agente de IA** = Un asistente personal que puede hacer llamadas, reservar citas y completar tareas por ti

---

## 🚀 Inicio rápido: Despliega tu primer agente

### Opción 1: Plantilla Foundry Agents (recomendada)

```bash
# Inicializar la plantilla de agentes de IA
azd init --template get-started-with-ai-agents

# Desplegar en Azure
azd up
```

**Qué se despliega:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (para RAG)
- ✅ Azure Container Apps (interfaz web)
- ✅ Application Insights (monitoreo)

**Tiempo:** ~15-20 minutos
**Costo:** ~$100-150/mes (desarrollo)

### Opción 2: Agente OpenAI con Prompty

```bash
# Inicializar la plantilla de agente basada en Prompty
azd init --template agent-openai-python-prompty

# Desplegar en Azure
azd up
```

**Qué se despliega:**
- ✅ Azure Functions (ejecución sin servidor del agente)
- ✅ Azure OpenAI
- ✅ Archivos de configuración de Prompty
- ✅ Implementación de agente de ejemplo

**Tiempo:** ~10-15 minutos
**Costo:** ~$50-100/mes (desarrollo)

### Opción 3: Agente de Chat RAG

```bash
# Inicializar la plantilla de chat RAG
azd init --template azure-search-openai-demo

# Desplegar en Azure
azd up
```

**Qué se despliega:**
- ✅ Azure OpenAI
- ✅ Azure AI Search con datos de ejemplo
- ✅ Canalización de procesamiento de documentos
- ✅ Interfaz de chat con citas

**Tiempo:** ~15-25 minutos
**Costo:** ~$80-150/mes (desarrollo)

---

## 🏗️ Patrones de arquitectura de agentes

### Patrón 1: Agente único con herramientas

El patrón de agente más sencillo: un agente que puede usar múltiples herramientas.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Ideal para:**
- Bots de atención al cliente
- Asistentes de investigación
- Agentes de análisis de datos

**Plantilla AZD:** `azure-search-openai-demo`

### Patrón 2: Agente RAG (Generación aumentada por recuperación)

Un agente que recupera documentos relevantes antes de generar respuestas.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Ideal para:**
- Bases de conocimiento empresariales
- Sistemas de preguntas y respuestas de documentos
- Investigación legal y de cumplimiento

**Plantilla AZD:** `azure-search-openai-demo`

### Patrón 3: Sistema multi-agente

Múltiples agentes especializados que trabajan juntos en tareas complejas.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Ideal para:**
- Generación de contenido complejo
- Flujos de trabajo multi-paso
- Tareas que requieren diferentes especialidades

**Más información:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuración de herramientas del agente

Los agentes se vuelven poderosos cuando pueden usar herramientas. Aquí se explica cómo configurar herramientas comunes:

### Configuración de herramientas en Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definir herramientas personalizadas
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Crear agente con herramientas
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configuración del entorno

```bash
# Configurar variables de entorno específicas del agente
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Desplegar con la configuración actualizada
azd deploy
```

---

## 📊 Monitoreo de agentes

### Integración con Application Insights

Todas las plantillas de agentes AZD incluyen Application Insights para monitoreo:

```bash
# Abrir panel de supervisión
azd monitor --overview

# Ver registros en tiempo real
azd monitor --logs

# Ver métricas en tiempo real
azd monitor --live
```

### Métricas clave para monitorear

| Métrica | Descripción | Objetivo |
|--------|-------------|--------|
| Latencia de respuesta | Tiempo para generar respuesta | < 5 segundos |
| Uso de tokens | Tokens por solicitud | Monitorear por costo |
| Tasa de éxito de llamadas a herramientas | % de ejecuciones de herramientas exitosas | > 95% |
| Tasa de errores | Solicitudes de agente fallidas | < 1% |
| Satisfacción del usuario | Puntuaciones de retroalimentación | > 4.0/5.0 |

### Registro personalizado para agentes

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Consideraciones de costo

### Costos mensuales estimados por patrón

| Patrón | Entorno de desarrollo | Producción |
|---------|-----------------|------------|
| Agente único | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agentes) | $150-300 | $500-1,500 |
| Multi-Agente empresarial | $300-500 | $1,500-5,000+ |

### Consejos para optimizar costos

1. **Usar GPT-4o-mini para tareas simples**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementar caché para consultas repetidas**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Establecer límites de tokens**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Limitar la longitud de la respuesta
   )
   ```

4. **Escalar a cero cuando no esté en uso**
   ```bash
   # Las aplicaciones de contenedores escalan automáticamente hasta cero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Solución de problemas de agentes

### Problemas comunes y soluciones

<details>
<summary><strong>❌ El agente no responde a llamadas a herramientas</strong></summary>

```bash
# Comprueba si las herramientas están registradas correctamente
azd show

# Verifica la implementación de OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Comprueba los registros del agente
azd monitor --logs
```

**Causas comunes:**
- Firma de función de herramienta incompatible
- Permisos requeridos faltantes
- Punto de conexión de la API no accesible
</details>

<details>
<summary><strong>❌ Alta latencia en las respuestas del agente</strong></summary>

```bash
# Revisa Application Insights en busca de cuellos de botella
azd monitor --live

# Considera usar un modelo más rápido
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Consejos de optimización:**
- Usar respuestas en streaming
- Implementar caché de respuestas
- Reducir el tamaño de la ventana de contexto
</details>

<details>
<summary><strong>❌ El agente devuelve información incorrecta o alucinada</strong></summary>

```python
# Mejorar con mejores indicaciones del sistema
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Agregar recuperación para la fundamentación
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Fundamentar las respuestas en documentos
)
```
</details>

<details>
<summary><strong>❌ Errores por superar el límite de tokens</strong></summary>

```python
# Implementar la gestión de la ventana de contexto
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Estimación aproximada
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Ejercicios prácticos

### Ejercicio 1: Desplegar un agente básico (20 minutos)

**Objetivo:** Desplegar tu primer agente de IA usando AZD

```bash
# Paso 1: Inicializar la plantilla
azd init --template get-started-with-ai-agents

# Paso 2: Iniciar sesión en Azure
azd auth login

# Paso 3: Desplegar
azd up

# Paso 4: Probar el agente
# Abra la URL mostrada en la salida

# Paso 5: Limpiar
azd down --force --purge
```

**Criterios de éxito:**
- [ ] El agente responde a preguntas
- [ ] Puede acceder al panel de monitoreo
- [ ] Recursos limpiados correctamente

### Ejercicio 2: Agregar una herramienta personalizada (30 minutos)

**Objetivo:** Extender un agente con una herramienta personalizada

1. Desplegar la plantilla del agente
2. Crear una nueva función de herramienta:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Llamada a la API del servicio meteorológico
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrar la herramienta con el agente
4. Probar que el agente usa la nueva herramienta

**Criterios de éxito:**
- [ ] El agente reconoce consultas relacionadas con el clima
- [ ] La herramienta se llama correctamente
- [ ] La respuesta incluye información meteorológica

### Ejercicio 3: Construir un agente RAG (45 minutos)

**Objetivo:** Crear un agente que responda preguntas a partir de tus documentos

```bash
# Desplegar plantilla RAG
azd init --template azure-search-openai-demo
azd up

# Sube tus documentos
# (Sigue la guía de ingestión de datos de la plantilla)

# Prueba con preguntas específicas del dominio
```

**Criterios de éxito:**
- [ ] El agente responde desde documentos subidos
- [ ] Las respuestas incluyen citas
- [ ] No hay alucinaciones en preguntas fuera del alcance

---

## 📚 Próximos pasos

Ahora que entiendes los agentes de IA, explora estos temas avanzados:

| Tema | Descripción | Enlace |
|-------|-------------|------|
| **Sistemas multi-agente** | Construir sistemas con múltiples agentes que colaboran | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Patrones de coordinación** | Aprende patrones de orquestación y comunicación | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Despliegue en producción** | Despliegue de agentes listo para entornos empresariales | [Production AI Practices](production-ai-practices.md) |
| **Evaluación de agentes** | Probar y evaluar el rendimiento de los agentes | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Recursos adicionales

### Documentación oficial
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Plantillas AZD para agentes
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Recursos comunitarios
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navegación**
- **Lección anterior**: [Despliegue de Modelos de IA](ai-model-deployment.md)
- **Próxima lección**: [Prácticas de IA en Producción](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->