# Capítulo 5: Soluciones de IA Multi-Agente

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-3 horas | **⭐ Complejidad**: Avanzado

---

## Descripción general

Este capítulo cubre patrones avanzados de arquitectura multiagente, orquestación de agentes y despliegues de IA listos para producción para escenarios complejos.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Entenderá los patrones de arquitectura multiagente
- Desplegará sistemas de agentes de IA coordinados
- Implementará comunicación entre agentes
- Construirá soluciones multiagente listas para producción

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) | Recorrido completo de la implementación | 90 min |
| 2 | [Patrones de Coordinación](../chapter-06-pre-deployment/coordination-patterns.md) | Estrategias de orquestación de agentes | 30 min |
| 3 | [Despliegue de plantilla ARM](../../examples/retail-multiagent-arm-template/README.md) | Despliegue con un clic | 30 min |

---

## 🚀 Inicio rápido

```bash
# Despliegue la solución minorista multiagente
cd examples/retail-multiagent-arm-template
./deploy.sh

# O use la plantilla directamente
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arquitectura Multi-Agente

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Solución destacada: Retail Multi-Agente

La [Solución Multi-Agente para Retail](../../examples/retail-scenario.md) demuestra:

- **Agente de Cliente**: Gestiona las interacciones y preferencias del usuario
- **Agente de Inventario**: Gestiona el stock y el procesamiento de pedidos
- **Orquestador**: Coordina entre los agentes
- **Memoria Compartida**: Gestión del contexto entre agentes

### Servicios utilizados

| Servicio | Propósito |
|---------|---------|
| Azure OpenAI | Comprensión del lenguaje |
| Azure AI Search | Catálogo de productos |
| Cosmos DB | Estado y memoria del agente |
| Container Apps | Alojamiento de agentes |
| Application Insights | Supervisión |

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
- [Solución de problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción automática con IA [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por traductores humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea que pueda surgir del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->