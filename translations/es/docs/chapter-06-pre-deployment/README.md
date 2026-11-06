# Capítulo 6: Planificación y Validación Previa al Despliegue

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-4 horas de lectura; tiempo adicional para laboratorios adaptados | **⭐ Complejidad**: Intermedio–Avanzado

---

## Resumen

Este capítulo cubre los pasos esenciales de planificación y validación antes de desplegar su aplicación. Aprenda a evitar errores costosos con una planificación adecuada de capacidad, selección de SKU y controles previos.

> La guía de comandos fue revisada contra la referencia `azd 1.37.2` publicada. No se ejecutaron despliegues en la nube. Las lecciones más largas incluyen fragmentos ilustrativos, no proyectos completos de despliegue local.

## Objetivos de Aprendizaje

Al completar este capítulo, usted podrá:
- Ejecutar controles previos antes del despliegue
- Planificar la capacidad y estimar los requerimientos de recursos
- Seleccionar SKUs apropiados para optimización de costos
- Configurar Application Insights para monitoreo
- Comprender patrones de coordinación multi-agente y sus requisitos de despliegue

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|---------|-------------|--------|
| 1 | [Controles Previos](preflight-checks.md) | Validar la configuración antes del despliegue | 15 min |
| 2 | [Planificación de Capacidad](capacity-planning.md) | Estimar requerimientos de recursos | 20 min |
| 3 | [Selección de SKU](sku-selection.md) | Elegir niveles de precios adecuados | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurar monitoreo | 20 min |
| 5 | [Patrones de Coordinación](coordination-patterns.md) | Diseño avanzado de orquestación multi-agente | 60-75 min |

---

## 🚀 Inicio Rápido

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Lista de Verificación Previa al Despliegue

### Antes de `azd provision`

- [ ] Cuota verificada para la región
- [ ] SKUs seleccionados apropiadamente
- [ ] Estimación de costos revisada
- [ ] Convención de nombres consistente
- [ ] Seguridad/RBAC configurado

### Antes de `azd deploy`

- [ ] Variables de entorno establecidas
- [ ] Secretos en Key Vault
- [ ] Cadenas de conexión verificadas
- [ ] Controles de salud configurados

---

## 💰 Guía de Selección de SKU

| Carga de trabajo | Desarrollo | Producción |
|--------------|-------------|-------------|
| Container Apps | Consumo | Consumo o perfil dedicado de carga, basado en la carga medida |
| App Service | B1/B2 | P1v3+ |
| Modelos Azure OpenAI | Tipo de despliegue pago por uso soportado | Pago por uso o rendimiento aprovisionado; depende del modelo/región |
| Búsqueda AI | Gratis/Básico dentro de límites | Tier Básico o Estándar dimensionado para índice, réplicas y carga de consultas |

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
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->