# Capítulo 2: Desarrollo AI-First

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 4-5 horas incluyendo el taller | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo se centra en desplegar aplicaciones potenciadas por IA usando Azure Developer CLI y servicios Microsoft Foundry. Desde aplicaciones simples de chat IA hasta agentes inteligentes con herramientas.

> **Actualización Foundry GA (2026-11-09):** El paquete `microsoft.foundry` 1.0 está [disponible en general](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Use `azd >= 1.37.0`; las evaluaciones siguen siendo una instalación separada. El [recorrido del agente alojado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) cubre pruebas locales con Agent Inspector y despliegue de código remoto. Esto es una revisión de la documentación, no una validación de despliegue en vivo; las características previas opcionales mantienen su propio estado.

## Objetivos de Aprendizaje

Al completar este capítulo, usted podrá:
- Desplegar aplicaciones IA usando plantillas AZD preconstruidas
- Entender la integración de Microsoft Foundry con AZD
- Instalar el paquete GA y probar un agente alojado localmente antes de desplegar su código fuente a Foundry
- Revisar `azure.yaml`, activos de evaluación y limpieza de proyectos nuevos frente a reutilizados
- Configurar y personalizar agentes IA con herramientas
- Desplegar aplicaciones RAG (Generación aumentada por recuperación)

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Integración Microsoft Foundry](microsoft-foundry-integration.md) | Paquete GA, flujo de trabajo local a nube con agente alojado y evaluaciones | 60 min |
| 2 | [Guía de Agentes IA](agents.md) | Desplegar agentes inteligentes con herramientas | 45 min |
| 3 | [Despliegue de Modelos IA](ai-model-deployment.md) | Desplegar y configurar modelos IA | 30 min |
| 4 | [Laboratorio Taller IA](ai-workshop-lab.md) | Práctica: Explora una plantilla y planea tu conversión | 2-3 horas |

---

## 🚀 Inicio Rápido

Elige una opción en un directorio nuevo y vacío. El sufijo `.` inicializa el directorio actual; de lo contrario AZD puede crear un subdirectorio sin cambiar el directorio de trabajo del shell.

Para la **ruta GA de despliegue de código con agente alojado**, comienza con el [recorrido guiado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Requiere AZD 1.37.0+, uv actual, Python 3.13+, permisos Foundry y cuota de modelo. Las plantillas completas de aplicación abajo son alternativas, no prerrequisitos para ese recorrido.

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

## 🤖 Plantillas IA Destacadas

| Plantilla | Descripción | Servicios |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG con citas | OpenAI + Búsqueda IA |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agente IA con herramientas | Servicio Agente IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA básico | OpenAI + Aplicaciones en contenedores |

---

## 💰 Conciencia de Costos

Estos son rangos ilustrativos, no cotizaciones ni topes; el tráfico de modelos, SKU de Búsqueda/cómputo, región y características opcionales pueden excederlos. Revise la guía de precios actual de su ejemplo elegido antes de aprovisionar.

| Entorno | Costo Mensual Estimado |
|-------------|----------------------|
| Desarrollo | $80-150 |
| Pruebas | $150-300 |
| Producción | $300-3,500+ |

**Limpieza:** Revise `azd down` antes de confirmar: para un proyecto Foundry recién creado borra el grupo de recursos y todo en él. Para un proyecto Foundry reutilizado deja el proyecto y recursos del agente en su lugar; siga la [guía de limpieza del recorrido](microsoft-foundry-integration.md#7-clean-up-deliberately) para eliminar recursos no deseados por separado.

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
- [Prácticas de IA en Producción](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->