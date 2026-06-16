# Capítulo 6: Planificación y Validación Pre-Despliegue

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hora | **⭐ Complexity**: Intermedio

---

## Descripción general

Este capítulo cubre pasos esenciales de planificación y validación antes de desplegar tu aplicación. Aprende a evitar errores costosos con una planificación adecuada de capacidad, selección de SKU y comprobaciones previas al despliegue.

> Validado con `azd 1.25.6` en junio de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Ejecutar comprobaciones previas al despliegue
- Planificar la capacidad y estimar los requisitos de recursos
- Seleccionar SKUs apropiados para optimizar costos
- Configurar Application Insights para la supervisión
- Entender patrones de coordinación del equipo

---

## 📚 Lessons

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Validar la configuración antes del despliegue | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimar los requisitos de recursos | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Elegir niveles de precios apropiados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar la supervisión | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Flujos de trabajo de despliegue del equipo | 15 min |

---

## 🚀 Inicio rápido

```bash
# Comprobar cuotas de suscripción
az vm list-usage --location eastus --output table

# Vista previa del despliegue (no se crean recursos)
azd provision --preview

# Validar la sintaxis de Bicep
az bicep build --file infra/main.bicep

# Comprobar la configuración del entorno
azd env get-values
```

---

## ☑️ Lista de verificación previa al despliegue

### Antes de `azd provision`

- [ ] Cuotas verificadas para la región
- [ ] SKUs seleccionados apropiadamente
- [ ] Estimación de costos revisada
- [ ] Convención de nombres consistente
- [ ] Seguridad/RBAC configurados

### Antes de `azd deploy`

- [ ] Variables de entorno configuradas
- [ ] Secretos en Key Vault
- [ ] Cadenas de conexión verificadas
- [ ] Comprobaciones de salud configuradas

---

## 💰 Guía de selección de SKU

| Carga de trabajo | Desarrollo | Producción |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Siguiente** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos relacionados

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->