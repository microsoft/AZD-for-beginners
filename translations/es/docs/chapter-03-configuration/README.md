# Capítulo 3: Configuración y Autenticación

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 45-60 minutos | **⭐ Complejidad**: Intermedio

---

## Descripción general

Este capítulo cubre la configuración del entorno, patrones de autenticación y mejores prácticas de seguridad para despliegues con Azure Developer CLI.

> Validado con `azd 1.27.1` en julio de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Dominará la jerarquía de configuración de AZD
- Gestionará múltiples entornos (desarrollo, staging, producción)
- Implementará autenticación segura con identidades administradas
- Configurará ajustes específicos para cada entorno

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Guía de Configuración](configuration.md) | Configuración y gestión del entorno | 30 min |
| 2 | [Autenticación y Seguridad](authsecurity.md) | Patrones de identidad administrada y RBAC | 30 min |

---

## 🚀 Inicio Rápido

```bash
# Crear múltiples entornos
azd env new dev
azd env new staging
azd env new prod

# Cambiar entornos
azd env select prod

# Establecer variables de entorno
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Ver configuración
azd env get-values
```

---

## 🔧 Jerarquía de Configuración

AZD aplica configuraciones en este orden (los ajustes posteriores sobreescriben a los anteriores):

1. **Valores predeterminados** (integrados en las plantillas)
2. **azure.yaml** (configuración del proyecto)
3. **Variables de entorno** (`azd env set`)
4. **Flags de línea de comandos** (`--location eastus`)

---

## 🔐 Mejores Prácticas de Seguridad

```bash
# Usar identidad administrada (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Verificar el estado de autenticación de AZD
azd auth status

# Opcional: verificar el contexto de Azure CLI si planeas ejecutar comandos az
az account show

# Reautenticar si es necesario
azd auth login

# Opcional: actualizar la autenticación de Azure CLI para comandos az
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