# Capítulo 7: Solución de Problemas y Depuración

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo te ayuda a diagnosticar y resolver problemas comunes al trabajar con Azure Developer CLI. Desde fallos en despliegues hasta problemas específicos de IA.

> Validado con `azd 1.27.1` en julio de 2026.

## Objetivos de Aprendizaje

Al completar este capítulo, podrás:
- Diagnosticar fallos comunes en despliegues con AZD
- Depurar problemas de autenticación y permisos
- Resolver problemas de conectividad con servicios de IA
- Usar Azure Portal y CLI para la solución de problemas

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Problemas Comunes](common-issues.md) | Problemas frecuentemente encontrados | 30 min |
| 2 | [Guía de Depuración](debugging.md) | Estrategias paso a paso para depurar | 45 min |
| 3 | [Solución de Problemas en IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Soluciones Rápidas

### Problemas de Autenticación
```bash
# Requerido para los flujos de trabajo de AZD
azd auth login

# Opcional si también estás usando comandos de Azure CLI directamente
az login

azd auth status
```

### Fallos en el Provisionamiento
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflictos de Recursos
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Cuota Excedida
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referencia de Códigos de Error

| Error | Causa | Solución |
|-------|-------|----------|
| `AuthenticationError` | No ha iniciado sesión | `azd auth login` |
| `ResourceNotFound` | Recurso faltante | Verificar nombres de recursos |
| `QuotaExceeded` | Límites de suscripción | Solicitar aumento de cuota |
| `InvalidTemplate` | Error de sintaxis Bicep | `az bicep build` |
| `Conflict` | El recurso existe | Usar nombre nuevo o eliminar |
| `Forbidden` | Permisos insuficientes | Revisar roles RBAC |

---

## 🔄 Restablecer y Recuperar

```bash
# Reinicio suave (mantener recursos, redeplegar código)
azd deploy --force

# Reinicio completo (eliminar todo, empezar de nuevo)
azd down --force --purge
azd up
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 6: Pre-Despliegue](../chapter-06-pre-deployment/README.md) |
| **Siguiente** | [Capítulo 8: Producción](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Cheques Pre-Despliegue](../chapter-06-pre-deployment/preflight-checks.md)
- [Guía de Configuración](../chapter-03-configuration/configuration.md)
- [Incidencias de AZD en GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->