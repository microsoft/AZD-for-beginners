# Capítulo 7: Resolución de problemas y depuración

**📚 Curso**: [AZD para Principiantes](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo te ayuda a diagnosticar y resolver problemas comunes al trabajar con Azure Developer CLI. Desde fallos en el despliegue hasta problemas específicos de IA.

> Validado con `azd 1.23.12` en marzo de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Diagnosticar fallos comunes en despliegues con AZD
- Depurar problemas de autenticación y permisos
- Resolver problemas de conectividad con servicios de IA
- Usar Azure Portal y la CLI para la resolución de problemas

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Problemas Comunes](common-issues.md) | Problemas que se encuentran con frecuencia | 30 min |
| 2 | [Guía de Depuración](debugging.md) | Estrategias de depuración paso a paso | 45 min |
| 3 | [Resolución de Problemas de IA](ai-troubleshooting.md) | Problemas específicos de IA | 30 min |

---

## 🚨 Soluciones rápidas

### Problemas de Autenticación
```bash
# Requerido para los flujos de trabajo de AZD
azd auth login

# Opcional si también está utilizando directamente los comandos de Azure CLI
az login

azd auth status
```

### Errores de Aprovisionamiento
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
| `InvalidTemplate` | Error de sintaxis en Bicep | `az bicep build` |
| `Conflict` | El recurso existe | Usar un nombre nuevo o eliminar |
| `Forbidden` | Permisos insuficientes | Verificar roles RBAC |

---

## 🔄 Restablecimiento y recuperación

```bash
# Reinicio suave (conservar recursos, volver a desplegar el código)
azd deploy --force

# Reinicio completo (eliminar todo, empezar desde cero)
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

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/preflight-checks.md)
- [Guía de Configuración](../chapter-03-configuration/configuration.md)
- [Problemas de AZD en GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No somos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->