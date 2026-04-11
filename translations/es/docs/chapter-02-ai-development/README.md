# Chapter 2: AI-First Development

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duración**: 1-2 horas | **⭐ Complejidad**: Intermedio

---

## Descripción general

This chapter focuses on deploying AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps to intelligent agents with tools.

> **Nota de validación (2026-03-25):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.23.12` and the current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Desplegar aplicaciones de IA usando plantillas AZD preconstruidas
- Entender la integración de Microsoft Foundry con AZD
- Configurar y personalizar agentes de IA con herramientas
- Desplegar aplicaciones RAG (Generación aumentada por recuperación)

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Conectar AZD con los servicios Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Desplegar agentes inteligentes con herramientas | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Desplegar y configurar modelos de IA | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Práctica: Preparar tu solución de IA para AZD | 60 min |

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

| Template | Descripción | Servicios |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citas | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente de IA con herramientas | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat de IA básico | OpenAI + Container Apps |

---

## 💰 Conciencia de costos

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Consejo:** Run `azd down` after testing to avoid charges.

---

## 🔗 Navegación

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Next** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Skip to** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Recursos relacionados

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->