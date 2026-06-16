# Capítulo 3: Configuración y Autenticación

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duración**: 45-60 minutos | **⭐ Complejidad**: Intermedio

---

## Overview

Este capítulo cubre la configuración del entorno, patrones de autenticación y las mejores prácticas de seguridad para despliegues con Azure Developer CLI.

> Validado con `azd 1.25.6` en junio de 2026.

## Learning Objectives

Al completar este capítulo, podrás:
- Dominar la jerarquía de configuración de AZD
- Gestionar múltiples entornos (dev, staging, prod)
- Implementar autenticación segura con identidades administradas
- Configurar ajustes específicos por entorno

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Guía de configuración](configuration.md) | Configuración y gestión del entorno | 30 min |
| 2 | [Autenticación y seguridad](authsecurity.md) | Identidad administrada y patrones RBAC | 30 min |

---

## 🚀 Inicio rápido

```bash
# Crear múltiples entornos
azd env new dev
azd env new staging
azd env new prod

# Cambiar entre entornos
azd env select prod

# Establecer variables de entorno
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Ver configuración
azd env get-values
```

---

## 🔧 Jerarquía de configuración

AZD aplica la configuración en este orden (lo posterior sobrescribe a lo anterior):

1. **Valores predeterminados** (integrados en las plantillas)
2. **azure.yaml** (configuración del proyecto)
3. **Variables de entorno** (`azd env set`)
4. **Opciones de línea de comandos** (`--location eastus`)

---

## 🔐 Mejores prácticas de seguridad

```bash
# Usar identidad administrada (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Comprobar el estado de autenticación de AZD
azd auth status

# Opcional: verificar el contexto de Azure CLI si planeas ejecutar comandos az
az account show

# Reautenticar si es necesario
azd auth login

# Opcional: actualizar la autenticación de Azure CLI para los comandos az
az login
```

---

## 🔗 Navegación

| Direction | Chapter |
|-----------|---------|
| **Anterior** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **Siguiente** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos relacionados

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/README.md)
- [Solución de problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->