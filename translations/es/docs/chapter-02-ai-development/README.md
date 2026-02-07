# Capítulo 2: Desarrollo centrado en IA

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duración**: 1-2 horas | **⭐ Complejidad**: Intermedia

---

## Resumen

Este capítulo se centra en desplegar aplicaciones impulsadas por IA usando Azure Developer CLI y los servicios de Microsoft Foundry. Desde aplicaciones simples de chat con IA hasta agentes inteligentes con herramientas.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Desplegar aplicaciones de IA usando plantillas AZD preconstruidas
- Comprender la integración de Microsoft Foundry con AZD
- Configurar y personalizar agentes de IA con herramientas
- Desplegar aplicaciones RAG (Generación aumentada por recuperación)

---

## 📚 Lecciones

| # | Lección | Descripción | Duración |
|---|--------|-------------|------|
| 1 | [Integración de Microsoft Foundry](microsoft-foundry-integration.md) | Conectar AZD con los servicios de Foundry | 30 min |
| 2 | [Guía de agentes de IA](agents.md) | Desplegar agentes inteligentes con herramientas | 45 min |
| 3 | [Despliegue de modelos de IA](ai-model-deployment.md) | Desplegar y configurar modelos de IA | 30 min |
| 4 | [Taller práctico de IA](ai-workshop-lab.md) | Práctica: Prepara tu solución de IA para AZD | 60 min |

---

## 🚀 Inicio rápido

```bash
# Opción 1: Aplicación de chat RAG
azd init --template azure-search-openai-demo
azd up

# Opción 2: Agentes de IA
azd init --template get-started-with-ai-agents
azd up

# Opción 3: Aplicación de chat rápida
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Plantillas de IA destacadas

| Template | Descripción | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citas | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA con herramientas | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico de IA | OpenAI + Container Apps |

---

## 💰 Consideraciones de costo

| Entorno | Costo mensual estimado |
|-------------|----------------------|
| Desarrollo | $80-150 |
| Preproducción | $150-300 |
| Producción | $300-3,500+ |

**Consejo:** Ejecuta `azd down` después de las pruebas para evitar cargos.

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Siguiente** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Ir a** | [Capítulo 8: Patrones de producción](../chapter-08-production/README.md) |

---

## 📖 Recursos relacionados

- [Solución de problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prácticas de IA en producción](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o malinterpretación que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->