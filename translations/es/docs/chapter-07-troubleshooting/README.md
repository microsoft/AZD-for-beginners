# Capítulo 7: Solución de problemas y depuración

**📚 Curso**: [AZD para principiantes](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Descripción general

Este capítulo te ayuda a diagnosticar y resolver problemas comunes al trabajar con Azure Developer CLI. Desde fallas de despliegue hasta problemas específicos de IA.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Diagnosticar fallas comunes de despliegue de AZD
- Depurar problemas de autenticación y permisos
- Resolver problemas de conectividad de servicios de IA
- Usar Azure Portal y CLI para la solución de problemas

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Problemas comunes](common-issues.md) | Problemas frecuentes | 30 min |
| 2 | [Guía de depuración](debugging.md) | Estrategias de depuración paso a paso | 45 min |
| 3 | [Solución de problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Soluciones rápidas

### Problemas de autenticación
```bash
azd auth login
az login
azd auth whoami
```

### Fallas de aprovisionamiento
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflictos de recursos
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Cuota excedida
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referencia de códigos de error

| Error | Causa | Solución |
|-------|-------|----------|
| `AuthenticationError` | No ha iniciado sesión | `azd auth login` |
| `ResourceNotFound` | Recurso faltante | Verificar los nombres de los recursos |
| `QuotaExceeded` | Límites de suscripción | Solicitar aumento de cuota |
| `InvalidTemplate` | Error de sintaxis en Bicep | `az bicep build` |
| `Conflict` | El recurso existe | Usar un nombre nuevo o eliminar |
| `Forbidden` | Permisos insuficientes | Verificar roles RBAC |

---

## 🔄 Restablecimiento y recuperación

```bash
# Reinicio suave (conservar recursos, volver a desplegar el código)
azd deploy --force

# Reinicio completo (eliminar todo, empezar de cero)
azd down --force --purge
azd up
```

---

## 🔗 Navegación

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Capítulo 6: Pre-despliegue](../chapter-06-pre-deployment/README.md) |
| **Next** | [Capítulo 8: Producción](../chapter-08-production/README.md) |

---

## 📖 Recursos relacionados

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/preflight-checks.md)
- [Guía de configuración](../chapter-03-configuration/configuration.md)
- [Problemas de AZD en GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido mediante el servicio de traducción por IA Co-op Translator (https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas que se deriven del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->