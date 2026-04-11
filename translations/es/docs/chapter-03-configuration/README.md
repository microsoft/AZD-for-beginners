# Capítulo 3: Configuración y Autenticación

**📚 Curso**: [AZD para principiantes](../../README.md) | **⏱️ Duración**: 45-60 minutos | **⭐ Complejidad**: Intermedio

---

## Descripción general

Este capítulo cubre la configuración del entorno, los patrones de autenticación y las mejores prácticas de seguridad para despliegues con Azure Developer CLI.

> Validado contra `azd 1.23.12` en marzo de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Dominar la jerarquía de configuración de AZD
- Gestionar múltiples entornos (dev, staging, prod)
- Implementar autenticación segura con identidades administradas
- Configurar la configuración específica del entorno

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Guía de configuración](configuration.md) | Configuración y gestión del entorno | 30 min |
| 2 | [Autenticación y Seguridad](authsecurity.md) | Patrones de identidad administrada y RBAC | 30 min |

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

# Ver la configuración
azd env get-values
```

---

## 🔧 Jerarquía de configuración

AZD aplica los ajustes en este orden (los posteriores anulan a los anteriores):

1. **Valores predeterminados** (incorporados en las plantillas)
2. **azure.yaml** (configuración del proyecto)
3. **Variables de entorno** (`azd env set`)
4. **Indicadores de línea de comandos** (`--location eastus`)

---

## 🔐 Mejores prácticas de seguridad

```bash
# Usar identidad administrada (recomendado)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Comprobar el estado de autenticación de AZD
azd auth status

# Opcional: verificar el contexto de Azure CLI si planea ejecutar comandos az
az account show

# Reautenticarse si es necesario
azd auth login

# Opcional: actualizar la autenticación de Azure CLI para los comandos az
az login
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 2: Desarrollo de IA](../chapter-02-ai-development/README.md) |
| **Siguiente** | [Capítulo 4: Infraestructura](../chapter-04-infrastructure/README.md) |

---

## 📖 Recursos relacionados

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/README.md)
- [Solución de problemas](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional realizada por un traductor humano. No somos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->