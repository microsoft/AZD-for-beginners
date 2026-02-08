# Capítulo 6: Planificación y Validación previas al despliegue

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1 hora | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo cubre pasos esenciales de planificación y validación antes de desplegar tu aplicación. Aprende a evitar errores costosos con una planificación de capacidad adecuada, selección de SKU y comprobaciones previas.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Ejecutar comprobaciones previas antes del despliegue
- Planificar la capacidad y estimar los requisitos de recursos
- Seleccionar SKUs apropiados para optimizar costos
- Configurar Application Insights para el monitoreo
- Entender los patrones de coordinación del equipo

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Comprobaciones previas](preflight-checks.md) | Validar la configuración antes del despliegue | 15 min |
| 2 | [Planificación de capacidad](capacity-planning.md) | Estimar los requisitos de recursos | 20 min |
| 3 | [Selección de SKU](sku-selection.md) | Elegir niveles de precios apropiados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoreo | 20 min |
| 5 | [Patrones de coordinación](coordination-patterns.md) | Flujos de trabajo de despliegue del equipo | 15 min |

---

## 🚀 Inicio rápido

```bash
# Comprobar cuotas de suscripción
az vm list-usage --location eastus --output table

# Vista previa del despliegue (no se crean recursos)
azd provision --preview

# Validar sintaxis de Bicep
az bicep build --file infra/main.bicep

# Comprobar configuración del entorno
azd env get-values
```

---

## ☑️ Lista de verificación previa al despliegue

### Antes de `azd provision`

- [ ] Cuota verificada para la región
- [ ] SKUs seleccionados adecuadamente
- [ ] Estimación de costos revisada
- [ ] Convención de nombres consistente
- [ ] Seguridad/RBAC configurados

### Antes de `azd deploy`

- [ ] Variables de entorno configuradas
- [ ] Secretos en Key Vault
- [ ] Cadenas de conexión verificadas
- [ ] Comprobaciones de estado configuradas

---

## 💰 Guía de selección de SKU

| Carga de trabajo | Desarrollo | Producción |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Siguiente** | [Capítulo 7: Solución de problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos relacionados

- [Guía de configuración](../chapter-03-configuration/configuration.md)
- [Guía de despliegue](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas comunes](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido mediante el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que se derive del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->