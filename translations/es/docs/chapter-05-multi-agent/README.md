# Capítulo 5: Soluciones de IA Multi-Agente

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-3 horas | **⭐ Complejidad**: Avanzado

---

## Visión general

Este capítulo cubre patrones avanzados de arquitectura multi-agente, orquestación de agentes y despliegues de IA listos para producción para escenarios complejos.

> La orientación de los comandos fue revisada con la referencia `azd 1.37.2` publicada. No se ejecutaron despliegues en la nube.

## Objetivos de aprendizaje

Al completar este capítulo, usted podrá:
- Entender patrones de arquitectura multi-agente
- Desplegar sistemas coordinados de agentes de IA
- Implementar comunicación entre agentes
- Construir soluciones multi-agente listas para producción

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Conceptos básicos multi-agente](multi-agent-basics.md) | Práctica: desplegar una aplicación multi-agente funcional con `azd up` | 45 min |
| 2 | [Patrones de coordinación](../chapter-06-pre-deployment/coordination-patterns.md) | Estrategias de orquestación de agentes (continúa en el Capítulo 6) | 30 min |
| 3 | [Despliegue con plantilla ARM](../../examples/retail-multiagent-arm-template/README.md) | Ejemplo de despliegue con un clic | 30 min |

> **Comience con la Lección 1.** Es la única lección totalmente práctica y desplegable en este capítulo. La Lección 2 está en el Capítulo 6 (se comparte con la planificación previa al despliegue), y la [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) es un plano de arquitectura—una referencia de diseño, no una plantilla de un solo comando.

---

## 🚀 Inicio rápido

```bash
# Option 1: Deploy the multi-agent template used in Lesson 1
azd init --template Azure-Samples/contoso-creative-writer .
azd up

# Option 2: Initialize a Foundry agent interactively (requires azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init
azd up
```

> **¿Qué enfoque usar?** Utilice `azd init --template` para comenzar desde un ejemplo funcional. Use `azd ai agent init` de forma interactiva, o `azd ai agent init --template <path-to-azure.yaml>` para adoptar un proyecto de agente existente. Consulte la [referencia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para requisitos de versión y migración de evaluación.

Ejecute estas alternativas en carpetas vacías separadas. La extensión Agents `1.0.0-beta.23` requiere `azd >= 1.37.0`; su flujo interactivo no genera la canalización personalizada de Service Bus en la lección de coordinación.

---

## 🤖 Arquitectura multi-agente

```mermaid
graph TD
    Orchestrator[Orchestrator Agent<br/>Routes requests, manages workflow] --> Customer[Customer Agent<br/>User queries, preferences]
    Orchestrator --> Inventory[Inventory Agent<br/>Stock levels, orders]
```

---

## 🎯 Solución destacada: Multi-Agente para Retail

La [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) demuestra:

- **Agente de Cliente**: Maneja interacciones y preferencias del usuario
- **Agente de Inventario**: Administra stock y procesamiento de pedidos
- **Orquestador**: Coordina entre agentes
- **Memoria Compartida**: Gestión de contexto entre agentes

### Servicios utilizados

| Servicio | Propósito |
|---------|---------|
| Modelos Microsoft Foundry | Comprensión del lenguaje |
| Azure AI Search | Catálogo de productos |
| Cosmos DB | Estado y memoria de agentes |
| Container Apps | Hospedaje de agentes |
| Application Insights | Monitoreo |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 4: Infraestructura](../chapter-04-infrastructure/README.md) |
| **Siguiente** | [Capítulo 6: Pre-Despliegue](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos relacionados

- [Guía de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Prácticas de IA en Producción](../chapter-08-production/production-ai-practices.md)
- [Solución de Problemas en IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->