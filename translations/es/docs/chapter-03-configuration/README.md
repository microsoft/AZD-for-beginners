# Capítulo 3: Configuración y Autenticación

**📚 Curso**: [AZD para principiantes](../../README.md) | **⏱️ Duración**: 45-60 minutos | **⭐ Complejidad**: Intermedio

---

## Overview

This chapter covers environment configuration, authentication patterns, and security best practices for Azure Developer CLI deployments.

## Learning Objectives

By completing this chapter, you will:
- Dominar la jerarquía de configuración de AZD
- Gestionar múltiples entornos (dev, staging, prod)
- Implementar autenticación segura con identidades administradas
- Configurar ajustes específicos del entorno

---

## 📚 Lessons

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Guía de configuración](configuration.md) | Configuración y gestión del entorno | 30 min |
| 2 | [Autenticación y seguridad](authsecurity.md) | Patrones de identidad administrada y RBAC | 30 min |

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

AZD aplica configuraciones en este orden (lo posterior anula a lo anterior):

1. **Default values** (built into templates)
2. **azure.yaml** (configuración del proyecto)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 Buenas prácticas de seguridad

```bash
# Usar identidad administrada (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Comprobar el estado de autenticación
azd auth whoami
az account show

# Volver a autenticarse si es necesario
azd auth login
az login
```

---

## 🔗 Navegación

| Direction | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 2: Desarrollo de IA](../chapter-02-ai-development/README.md) |
| **Siguiente** | [Capítulo 4: Infraestructura](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos relacionados

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/README.md)
- [Solución de problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->