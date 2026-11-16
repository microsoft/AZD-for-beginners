# Capítulo 5: Soluciones de IA Multi-Agente

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-3 horas | **⭐ Complejidad**: Avanzado

---

## Resumen

Este capítulo cubre patrones avanzados de arquitectura multi-agente, orquestación de agentes y despliegues de IA listos para producción en escenarios complejos.

> Guía de comandos revisada según la referencia `azd 1.37.2` publicada. No se ejecutaron despliegues en la nube.

## Objetivos de Aprendizaje

Al completar este capítulo, usted:
- Entenderá los patrones de arquitectura multi-agente
- Desplegará sistemas coordinados de agentes de IA
- Implementará comunicación entre agentes
- Construirá soluciones multi-agente listas para producción

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|---------|-------------|-------|
| 1 | [Fundamentos Multi-Agente](multi-agent-basics.md) | Práctica: despliegue una app multi-agente funcional con `azd up` | 45 min |
| 2 | [Patrones de Coordinación](../chapter-06-pre-deployment/coordination-patterns.md) | Estrategias de orquestación de agentes (continúa en el Capítulo 6) | 30 min |
| 3 | [Despliegue con Plantilla ARM](../../examples/retail-multiagent-arm-template/README.md) | Ejemplo de despliegue con un clic | 30 min |

> **Comience con la Lección 1.** Es la única lección completamente práctica y desplegable en este capítulo. La Lección 2 está en el Capítulo 6 (se comparte con la planificación previa al despliegue), y la [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) es un plano de arquitectura—una referencia de diseño, no una plantilla de comando único.

---

## 🚀 Inicio Rápido

```bash
# Option 1: Deploy the multi-agent template used in Lesson 1
azd init --template Azure-Samples/contoso-creative-writer .
azd up

# Option 2: Initialize a Foundry agent interactively with the GA bundle
azd ext install microsoft.foundry
azd ai agent init
azd up
```

> **¿Qué enfoque elegir?** Use `azd init --template` para comenzar desde un ejemplo funcional. Use `azd ai agent init` de forma interactiva, o `azd ai agent init --template <path-to-azure.yaml>` para adoptar un proyecto de agentes actual. Consulte la [referencia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para requisitos de versión y migración de evaluación.

Ejecute estas alternativas en carpetas vacías separadas. El flujo GA Foundry requiere `azd >= 1.37.0`; su flujo interactivo no genera la canalización personalizada de Service Bus en la lección de coordinación. Para pruebas locales, despliegue de código y limpieza entre proyectos nuevos y reutilizados, siga la [guía de agente alojado](../chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga).

---

## 🤖 Arquitectura Multi-Agente

```mermaid
graph TD
    Orchestrator[Orchestrator Agent<br/>Routes requests, manages workflow] --> Customer[Customer Agent<br/>User queries, preferences]
    Orchestrator --> Inventory[Inventory Agent<br/>Stock levels, orders]
```

---

## 🎯 Solución Destacada: Multi-Agente para Retail

La [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) demuestra:

- **Agente de Cliente**: Gestiona interacciones y preferencias del usuario
- **Agente de Inventario**: Maneja el stock y el procesamiento de pedidos
- **Orquestador**: Coordina entre agentes
- **Memoria Compartida**: Gestión del contexto entre agentes

### Servicios Utilizados

| Servicio | Propósito |
|---------|----------|
| Modelos Microsoft Foundry | Comprensión del lenguaje |
| Azure AI Search | Catálogo de productos |
| Cosmos DB | Estado y memoria del agente |
| Container Apps | Hospedaje de agentes |
| Application Insights | Monitoreo |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|----------|
| **Anterior** | [Capítulo 4: Infraestructura](../chapter-04-infrastructure/README.md) |
| **Siguiente** | [Capítulo 6: Pre-Despliegue](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guía de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Prácticas de IA en Producción](../chapter-08-production/production-ai-practices.md)
- [Solución de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->