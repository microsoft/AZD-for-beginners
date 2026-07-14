# Capítulo 6: Planificación y Validación Previa al Despliegue

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1 hora | **⭐ Complejidad**: Intermedio

---

## Visión general

Este capítulo cubre los pasos esenciales de planificación y validación antes de desplegar su aplicación. Aprenda a evitar errores costosos con una adecuada planificación de capacidad, selección de SKU y verificaciones previas al vuelo.

> Validado con `azd 1.27.1` en julio de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, usted podrá:
- Ejecutar verificaciones previas al vuelo antes del despliegue
- Planificar la capacidad y estimar los requisitos de recursos
- Seleccionar SKUs apropiados para optimización de costos
- Configurar Application Insights para monitoreo
- Entender los patrones de coordinación de equipo

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Verificaciones Previas al Vuelo](preflight-checks.md) | Validar configuración antes del despliegue | 15 min |
| 2 | [Planificación de Capacidad](capacity-planning.md) | Estimar requisitos de recursos | 20 min |
| 3 | [Selección de SKU](sku-selection.md) | Elegir niveles de precios apropiados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoreo | 20 min |
| 5 | [Patrones de Coordinación](coordination-patterns.md) | Flujos de trabajo de despliegue en equipo | 15 min |

---

## 🚀 Inicio rápido

```bash
# Comprobar las cuotas de suscripción
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

- [ ] Cuota verificada para la región
- [ ] SKUs seleccionados apropiadamente
- [ ] Presupuesto revisado
- [ ] Convención de nombres consistente
- [ ] Seguridad/RBAC configurados

### Antes de `azd deploy`

- [ ] Variables de entorno establecidas
- [ ] Secretos en Key Vault
- [ ] Cadenas de conexión verificadas
- [ ] Verificaciones de salud configuradas

---

## 💰 Guía de selección de SKU

| Carga de trabajo | Desarrollo | Producción |
|----------|-------------|------------|
| Container Apps | Consumo | Dedicado D4 |
| App Service | B1/B2 | P1v3+ |
| Modelos Microsoft Foundry | Estándar | Estándar + PTU |
| AI Search | Básico | Estándar S2+ |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 5: Multi-Agente](../chapter-05-multi-agent/README.md) |
| **Siguiente** | [Capítulo 7: Solución de problemas](../chapter-07-troubleshooting/README.md) |

---

## 📖 Recursos relacionados

- [Guía de Configuración](../chapter-03-configuration/configuration.md)
- [Guía de Despliegue](../chapter-04-infrastructure/deployment-guide.md)
- [Problemas comunes](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->