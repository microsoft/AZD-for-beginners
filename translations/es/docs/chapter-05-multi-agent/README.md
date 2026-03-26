# Capítulo 5: Soluciones de IA Multi-Agente

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-3 horas | **⭐ Complejidad**: Avanzado

---

## Visión General

Este capítulo cubre patrones avanzados de arquitectura multi-agente, orquestación de agentes y despliegues de IA listos para producción para escenarios complejos.

## Objetivos de Aprendizaje

Al completar este capítulo, usted:
- Comprenderá patrones de arquitectura multi-agente
- Desplegará sistemas coordinados de agentes de IA
- Implementará comunicación agente a agente
- Construirá soluciones multi-agente listas para producción

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|--------|
| 1 | [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) | Recorrido completo de la implementación | 90 min |
| 2 | [Patrones de Coordinación](../chapter-06-pre-deployment/coordination-patterns.md) | Estrategias de orquestación de agentes | 30 min |
| 3 | [Despliegue con Plantilla ARM](../../examples/retail-multiagent-arm-template/README.md) | Despliegue con un clic | 30 min |

---

## 🚀 Inicio Rápido

```bash
# Opción 1: Desplegar desde una plantilla
azd init --template agent-openai-python-prompty
azd up

# Opción 2: Desplegar desde un manifiesto de agente (requiere la extensión azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **¿Qué enfoque?** Use `azd init --template` para comenzar desde un ejemplo funcional. Use `azd ai agent init` cuando tenga su propio manifiesto de agente. Consulte la [referencia AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para más detalles.

---

## 🤖 Arquitectura Multi-Agente

```mermaid
graph TD
    Orchestrator[Agente Orquestador<br/>Dirige solicitudes, gestiona flujo de trabajo] --> Customer[Agente Cliente<br/>Consultas de usuario, preferencias]
    Orchestrator --> Inventory[Agente de Inventario<br/>Niveles de stock, pedidos]
```
---

## 🎯 Solución Destacada: Retail Multi-Agente

La [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) demuestra:

- **Agente de Cliente**: Maneja interacciones y preferencias del usuario
- **Agente de Inventario**: Gestiona stock y procesamiento de pedidos
- **Orquestador**: Coordina entre agentes
- **Memoria Compartida**: Gestión de contexto entre agentes

### Servicios Utilizados

| Servicio | Propósito |
|----------|-----------|
| Microsoft Foundry Models | Comprensión del lenguaje |
| Azure AI Search | Catálogo de productos |
| Cosmos DB | Estado y memoria de agentes |
| Container Apps | Hospedaje de agentes |
| Application Insights | Monitorización |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|----------|
| **Anterior** | [Capítulo 4: Infraestructura](../chapter-04-infrastructure/README.md) |
| **Siguiente** | [Capítulo 6: Pre-Despliegue](../chapter-06-pre-deployment/README.md) |

---

## 📖 Recursos Relacionados

- [Guía de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Prácticas de IA para Producción](../chapter-08-production/production-ai-practices.md)
- [Solución de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->