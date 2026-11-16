# Capítulo 7: Solución de Problemas y Depuración

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Descripción General

Este capítulo te ayuda a diagnosticar y resolver problemas comunes al trabajar con Azure Developer CLI. Desde fallos en el despliegue hasta problemas específicos de IA.

> Orientación de comandos revisada según la referencia liberada `azd 1.37.2`. No se ejecutaron despliegues en la nube. Reemplaza los nombres y IDs de recursos de ejemplo antes de usar los comandos.

## Objetivos de Aprendizaje

Al completar este capítulo, podrás:
- Diagnosticar fallos comunes en despliegues AZD
- Depurar problemas de autenticación y permisos
- Resolver problemas de conectividad de servicios de IA
- Usar Azure Portal y CLI para solución de problemas

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Problemas Comunes](common-issues.md) | Problemas frecuentemente encontrados | 30 min |
| 2 | [Guía de Depuración](debugging.md) | Estrategias paso a paso para depuración | 45 min |
| 3 | [Solución de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Soluciones Rápidas

### Problemas de Autenticación
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Fallos en la Provisionación
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflictos en Recursos
Inspecciona primero los errores existentes en los recursos y despliegues. No elimines un entorno compartido o de producción para resolver un conflicto de nombres. Para un **nuevo entorno desechable**, usa un nombre único:

```bash
azd env new different-name
azd up
```

### Cuota Excedida
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Cambiar `AZURE_LOCATION` no mueve los recursos existentes y puede causar conflictos de ubicación al redeplegar.

---

## 📋 Referencia de Códigos de Error

| Error | Causa | Solución |
|-------|-------|----------|
| `AuthenticationError` | No ha iniciado sesión | `azd auth login` |
| `ResourceNotFound` | Recurso faltante | Verifica los nombres de recurso |
| `QuotaExceeded` | Límites de suscripción | Solicita aumento de cuota |
| `InvalidTemplate` | Error de sintaxis en Bicep | `az bicep build` |
| `Conflict` | Recurso existe | Usa un nombre nuevo o elimina |
| `Forbidden` | Permisos insuficientes | Verifica roles RBAC |

---

## 🔄 Restablecer y Recuperación

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

El restablecimiento completo elimina datos y puede cambiar puntos finales. Realiza una copia de seguridad primero y revisa los mensajes interactivos para eliminar. `--force --purge` es apropiado solo para entornos desechables cuando se desea eliminación irreversible.

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 6: Pre-Despliegue](../chapter-06-pre-deployment/README.md) |
| **Siguiente** | [Capítulo 8: Producción](../chapter-08-production/README.md) |

---

## 📖 Recursos Relacionados

- [Verificaciones Pre-Despliegue](../chapter-06-pre-deployment/preflight-checks.md)
- [Guía de Configuración](../chapter-03-configuration/configuration.md)
- [Problemas de AZD en GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->