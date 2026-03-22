# Capítulo 6: Planificación y Validación Previa al Despliegue

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1 hora | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo cubre los pasos esenciales de planificación y validación antes de desplegar tu aplicación. Aprende a evitar errores costosos con una planificación adecuada de capacidad, selección de SKU y verificaciones previas.

## Objetivos de Aprendizaje

Al completar este capítulo, podrás:
- Ejecutar verificaciones previas antes del despliegue
- Planificar capacidad y estimar los requisitos de recursos
- Seleccionar SKU apropiados para optimización de costos
- Configurar Application Insights para monitoreo
- Entender patrones de coordinación de equipo

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|---------|-------------|--------|
| 1 | [Verificaciones Previas](preflight-checks.md) | Validar configuración antes del despliegue | 15 min |
| 2 | [Planificación de Capacidad](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Selección de SKU](sku-selection.md) | Elegir niveles de precios apropiados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoreo | 20 min |
| 5 | [Patrones de Coordinación](coordination-patterns.md) | Flujos de trabajo en equipo para despliegue | 15 min |

---

## 🚀 Inicio Rápido

```bash
# Comprobar cuotas de suscripción
az vm list-usage --location eastus --output table

# Vista previa de la implementación (no se crean recursos)
azd provision --preview

# Validar la sintaxis de Bicep
az bicep build --file infra/main.bicep

# Comprobar la configuración del entorno
azd env get-values
```

---

## ☑️ Lista de Verificación Previa al Despliegue

### Antes de `azd provision`

- [ ] Cuota verificada para la región
- [ ] SKU seleccionados adecuadamente
- [ ] Estimación de costos revisada
- [ ] Convención de nombres consistente
- [ ] Seguridad/RBAC configurados

### Antes de `azd deploy`

- [ ] Variables de entorno configuradas
- [ ] Secretos en Key Vault
- [ ] Cadenas de conexión verificadas
- [ ] Chequeos de estado configurados

---

## 💰 Guía de Selección de SKU

| Carga de trabajo | Desarrollo | Producción |
|------------------|------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|----------|
| **Anterior** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Siguiente** | [Capítulo 7: Resolución de Problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos Relacionados

- [Guía de Configuración](../chapter-03-configuration/configuration.md)
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas Comunes](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No somos responsables de ningún malentendido o interpretación errónea derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->