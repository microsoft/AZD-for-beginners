# Capítulo 7: Resolución de Problemas y Depuración

**📚 Course**: [AZD para Principiantes](../../README.md) | **⏱️ Duration**: 1-1.5 horas | **⭐ Complexity**: Intermedio

---

## Resumen

Este capítulo te ayudará a diagnosticar y resolver problemas comunes al trabajar con Azure Developer CLI. Desde fallos de despliegue hasta problemas específicos de IA.

> Validado con `azd 1.25.6` en junio de 2026.

## Objetivos de Aprendizaje

Al completar este capítulo, podrás:
- Diagnosticar fallos comunes de despliegue de AZD
- Depurar problemas de autenticación y permisos
- Resolver problemas de conectividad con servicios de IA
- Usar Azure Portal y la CLI para la resolución de problemas

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Problemas Comunes](common-issues.md) | Problemas frecuentes | 30 min |
| 2 | [Guía de Depuración](debugging.md) | Estrategias de depuración paso a paso | 45 min |
| 3 | [Resolución de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Soluciones Rápidas

### Problemas de Autenticación
```bash
# Requerido para los flujos de trabajo de AZD
azd auth login

# Opcional si también utiliza comandos de Azure CLI directamente
az login

azd auth status
```

### Fallas de Aprovisionamiento
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
| `ResourceNotFound` | Recurso no encontrado | Compruebe los nombres de los recursos |
| `QuotaExceeded` | Límites de suscripción | Solicitar aumento de cuota |
| `InvalidTemplate` | Error de sintaxis de Bicep | `az bicep build` |
| `Conflict` | El recurso existe | Use un nombre nuevo o elimínelo |
| `Forbidden` | Permisos insuficientes | Compruebe los roles de RBAC |

---

## 🔄 Restablecimiento y Recuperación

```bash
# Restablecimiento suave (mantener los recursos, volver a desplegar el código)
azd deploy --force

# Restablecimiento completo (eliminar todo, empezar de cero)
azd down --force --purge
azd up
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Previous** | [Capítulo 6: Pre-despliegue](../chapter-06-pre-deployment/README.md) |
| **Next** | [Capítulo 8: Producción](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Comprobaciones Previas al Despliegue](../chapter-06-pre-deployment/preflight-checks.md)
- [Guía de Configuración](../chapter-03-configuration/configuration.md)
- [Problemas de AZD en GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->