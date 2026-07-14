# Capítulo 2: Desarrollo AI-First

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1-2 horas | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo se centra en desplegar aplicaciones impulsadas por IA utilizando Azure Developer CLI y los servicios de Microsoft Foundry. Desde aplicaciones simples de chat con IA hasta agentes inteligentes con herramientas.

> **Nota de validación (2026-07-13):** El flujo de comandos y la guía de extensiones en este capítulo se revisaron contra `azd` `1.27.1` y la versión actual de previsualización de la extensión de agente IA `azure.ai.agents` `1.0.0-beta.5`. Si usas una versión anterior de AZD, actualiza primero y luego continúa con los ejercicios.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Desplegará aplicaciones de IA usando plantillas AZD preconstruidas
- Entenderá la integración de Microsoft Foundry con AZD
- Configurará y personalizará agentes IA con herramientas
- Desplegará aplicaciones RAG (Generación Aumentada por Recuperación)

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Integración Microsoft Foundry](microsoft-foundry-integration.md) | Conectar AZD con servicios Foundry | 30 min |
| 2 | [Guía de Agentes IA](agents.md) | Desplegar agentes inteligentes con herramientas | 45 min |
| 3 | [Despliegue de Modelos IA](ai-model-deployment.md) | Desplegar y configurar modelos de IA | 30 min |
| 4 | [Laboratorio Taller IA](ai-workshop-lab.md) | Práctica: Hacer tu solución IA lista para AZD | 60 min |

---

## 🚀 Inicio Rápido

```bash
# Opción 1: Aplicación de Chat RAG
azd init --template azure-search-openai-demo
azd up

# Opción 2: Agentes de IA
azd init --template get-started-with-ai-agents
azd up

# Opción 3: Aplicación de Chat Rápida
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Plantillas Destacadas de IA

| Plantilla | Descripción | Servicios |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citas | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente IA con herramientas | Servicio de Agentes IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat básico de IA | OpenAI + Container Apps |

---

## 💰 Conciencia de Costos

| Entorno | Costo Mensual Estimado |
|-------------|----------------------|
| Desarrollo | $80-150 |
| Preproducción | $150-300 |
| Producción | $300-3,500+ |

**Consejo:** Ejecuta `azd down` después de probar para evitar cargos.

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 1: Fundamentos](../chapter-01-foundation/README.md) |
| **Siguiente** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Saltar a** | [Capítulo 8: Patrones de Producción](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Resolución de Problemas IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Prácticas de Producción IA](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->