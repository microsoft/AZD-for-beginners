# Capítulo 2: Desarrollo centrado en IA

**📚 Curso**: [AZD para principiantes](../../README.md) | **⏱️ Duración**: 1-2 horas | **⭐ Complejidad**: Intermedio

---

## Descripción general

Este capítulo se centra en desplegar aplicaciones impulsadas por IA usando Azure Developer CLI y los servicios de Microsoft Foundry. Desde aplicaciones sencillas de chat con IA hasta agentes inteligentes con herramientas.

> **Nota de validación (2026-06-15):** El flujo de comandos y las indicaciones de la extensión en este capítulo fueron revisados contra `azd` `1.25.6` y la versión preliminar actual de la extensión para agentes de IA `azure.ai.agents` `0.1.40-preview`. Si estás en una versión anterior de AZD, actualiza primero y luego continúa con los ejercicios.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Desplegar aplicaciones de IA usando plantillas AZD preconstruidas
- Comprender la integración de Microsoft Foundry con AZD
- Configurar y personalizar agentes de IA con herramientas
- Desplegar aplicaciones RAG (Generación aumentada por recuperación)

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Integración con Microsoft Foundry](microsoft-foundry-integration.md) | Conectar AZD con los servicios de Foundry | 30 min |
| 2 | [Guía de agentes de IA](agents.md) | Desplegar agentes inteligentes con herramientas | 45 min |
| 3 | [Despliegue de modelos de IA](ai-model-deployment.md) | Desplegar y configurar modelos de IA | 30 min |
| 4 | [Taller práctico de IA](ai-workshop-lab.md) | Práctico: Prepare su solución de IA para AZD | 60 min |

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

## 🤖 Plantillas destacadas de IA

| Plantilla | Descripción | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citas | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA con herramientas | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico con IA | OpenAI + Container Apps |

---

## 💰 Conciencia de costos

| Entorno | Costo mensual estimado |
|-------------|----------------------|
| Desarrollo | $80-150 |
| Preproducción | $150-300 |
| Producción | $300-3,500+ |

**Consejo:** Ejecute `azd down` después de las pruebas para evitar cargos.

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Siguiente** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Saltar a** | [Capítulo 8: Patrones de producción](../chapter-08-production/README.md) |

---

## 📖 Recursos relacionados

- [Solución de problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prácticas de IA en producción](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->