# Capítulo 8: Patrones de Producción y Empresariales

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-3 horas | **⭐ Complejidad**: Avanzado

---

## Visión General

Este capítulo cubre patrones de despliegue listos para empresas, endurecimiento de seguridad, monitoreo y optimización de costos para cargas de trabajo de IA en producción.

> Validado contra `azd 1.27.1` en julio de 2026.

## Objetivos de Aprendizaje

Al completar este capítulo, usted podrá:
- Desplegar aplicaciones resilientes multi-región
- Implementar patrones de seguridad empresariales
- Configurar monitoreo integral
- Optimizar costos a gran escala
- Configurar pipelines CI/CD con AZD

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Prácticas de IA en Producción](production-ai-practices.md) | Patrones de despliegue empresariales | 90 min |

---

## 🚀 Lista de Verificación para Producción

- [ ] Despliegue multi-región para resiliencia
- [ ] Identidad administrada para autenticación (sin claves)
- [ ] Application Insights para monitoreo
- [ ] Presupuestos y alertas de costos configurados
- [ ] Escaneo de seguridad habilitado
- [ ] Integración de pipeline CI/CD
- [ ] Plan de recuperación ante desastres

---

## 🏗️ Patrones de Arquitectura

### Patrón 1: Microservicios en IA

```mermaid
graph LR
    Gateway[Puerta de enlace API] --> AI[Servicio de IA] --> Models[Modelos Microsoft Foundry]
    Gateway --> Auth[Servicio de Autenticación]
    AI --> Data[Almacén de datos]
```

### Patrón 2: IA impulsada por eventos

```mermaid
graph LR
    EventGrid[Cuadrícula de Eventos] --> Functions[Funciones] --> Pipeline[Canalización de IA]
```

---

## 🔐 Mejores Prácticas de Seguridad

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Optimización de Costos

| Estrategia | Ahorros |
|----------|---------|
| Escalar a cero (Container Apps) | 60-80% |
| Usar niveles por consumo para desarrollo | 50-70% |
| Escalado programado | 30-50% |
| Capacidad reservada | 20-40% |

```bash
# Establecer alertas de presupuesto
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configuración de Monitoreo

```bash
# Transmitir registros
azd monitor --logs

# Verificar Application Insights
azd monitor --overview

# Ver métricas
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 7: Solución de Problemas](../chapter-07-troubleshooting/README.md) |
| **Curso Completo** | [Inicio del Curso](../../README.md) |

---

## 📖 Recursos Relacionados

- [Guía de Agentes de IA](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluciones Multi-Agente](../chapter-05-multi-agent/README.md)
- [Ejemplo de Microservicios](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->