# Capítulo 3: Configuración y Autenticación

**📚 Curso**: [AZD para Principiantes](../../README.md) | **⏱️ Duración**: 90-150 minutos incluyendo práctica de integración | **⭐ Complejidad**: Intermedio

---

## Descripción general

Este capítulo cubre la configuración del entorno, patrones de autenticación y mejores prácticas de seguridad para despliegues con Azure Developer CLI.

> Objetivo de revisión de comandos y configuración: `azd 1.37.2` (noviembre de 2026). No se realizó aprovisionamiento en vivo de Azure durante la revisión.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Dominará la jerarquía de configuración de AZD
- Gestionará múltiples entornos (dev, staging, prod)
- Implementará autenticación segura con identidades administradas
- Configurará ajustes específicos por entorno

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Guía de Configuración](configuration.md) | Configuración y gestión del entorno | 30 min |
| 2 | [Autenticación y Seguridad](authsecurity.md) | Patrones de identidad administrada y RBAC | 30 min |

---

## 🚀 Inicio Rápido

Ejecute desde la raíz de una **aplicación azd ya inicializada**, no desde el repositorio del curso. Use nombres de entorno no usados si ya existen.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` es ilustrativo: afecta la infraestructura solo si su plantilla lo consume explícitamente. Los valores ordinarios `azd env set` se guardan localmente en texto plano; no son almacenamiento seguro de secretos.

---

## 🔧 Jerarquía de Configuración

Mantenga tres superficies de configuración separadas: preferencias globales (`azd config`), estructura del proyecto (`azure.yaml`) y valores por entorno (`azd env`). Las banderas solo sobrescriben los ajustes que realmente soportan; no hay una superposición universal de variables de entorno arbitrarias sobre `azure.yaml` o Bicep.

---

## 🔐 Mejores Prácticas de Seguridad

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 2: Desarrollo de IA](../chapter-02-ai-development/README.md) |
| **Siguiente** | [Capítulo 4: Infraestructura](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos Relacionados

- [Verificaciones Previas al Despliegue](../chapter-06-pre-deployment/README.md)
- [Resolución de Problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->