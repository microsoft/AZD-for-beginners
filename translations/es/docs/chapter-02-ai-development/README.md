# Capítulo 2: Desarrollo con IA como Prioridad

**📚 Curso**: [AZD para Principiantes](../../README.md) | **⏱️ Duración**: 4-5 horas incluyendo el taller | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo se centra en desplegar aplicaciones con IA usando Azure Developer CLI y los servicios de Microsoft Foundry. Desde simples aplicaciones de chat con IA hasta agentes inteligentes con herramientas.

> **Revisión de lanzamiento (2026-11-04):** La guía de AI CLI fue verificada contra la documentación/fuentes publicadas `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, y `azure.ai.evaluations` `1.0.0-beta.2`. Use `azd >= 1.37.0` para el flujo de trabajo combinado. Las evaluaciones ahora usan el namespace separado `azd ai eval`; vea [cambios de lanzamiento y guía de migración](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Esto no es una validación en tiempo real de despliegue.

## Objetivos de Aprendizaje

Al completar este capítulo, usted podrá:
- Desplegar aplicaciones de IA usando plantillas preconstruidas de AZD
- Entender la integración de Microsoft Foundry con AZD
- Configurar y personalizar agentes de IA con herramientas
- Desplegar aplicaciones RAG (Generación Aumentada por Recuperación)

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Integración Microsoft Foundry](microsoft-foundry-integration.md) | Conectar AZD con servicios Foundry | 30 min |
| 2 | [Guía de Agentes IA](agents.md) | Desplegar agentes inteligentes con herramientas | 45 min |
| 3 | [Despliegue de Modelos IA](ai-model-deployment.md) | Desplegar y configurar modelos de IA | 30 min |
| 4 | [Laboratorio Taller de IA](ai-workshop-lab.md) | Práctica: Explorar una plantilla y planificar tu conversión | 2-3 horas |

---

## 🚀 Inicio Rápido

Elige una opción en un directorio vacío nuevo. El `.` final inicializa el directorio actual; de lo contrario AZD puede crear un subdirectorio sin cambiar el directorio de trabajo de tu shell.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Plantillas Destacadas de IA

| Plantilla | Descripción | Servicios |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citas | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente IA con herramientas | Servicio de Agentes IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA básico | OpenAI + Container Apps |

---

## 💰 Consciencia de Costos

Estos son rangos ilustrativos, no cotizaciones ni topes; el tráfico del modelo, SKUs de búsqueda/cómputo, región y características opcionales pueden excederlos. Revise la guía de precios actual de su ejemplo elegido antes de provisionar.

| Entorno | Coste Mensual Estimado |
|-------------|----------------------|
| Desarrollo | $80-150 |
| Pruebas | $150-300 |
| Producción | $300-3,500+ |

**Consejo:** Ejecute `azd down` después de probar para evitar cargos.

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